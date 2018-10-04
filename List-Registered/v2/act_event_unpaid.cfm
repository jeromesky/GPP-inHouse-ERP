<!--- aow: http://www.petro21.com/my-office/List-Registered/v2/act_event_unpaid.cfm --->
<cfset tickBegin = GetTickCount()>
<cfsetting showdebugoutput="yes" requesttimeout="5577">

<cfquery datasource="#gpp#" name="qry_unpaid">
	SELECT DISTINCT 
		user_id as UserID,
		Upper(title) AS title,
		Upper(name) AS name,
		Upper(surname) AS surname,
		Upper(company) AS company,
		eventID,
        email,
		paid,
		dbo.tblInvoiceDetails.costTotal as totalcost,
		comment
	FROM dbo.VIEW_Conference_Attendence_list LEFT OUTER JOIN dbo.tblInvoiceDetails ON dbo.VIEW_Conference_Attendence_list.invoiceID = dbo.tblInvoiceDetails.INVRecIDX
	WHERE 
		(paid != 'YES' OR paid IS NULL)
		AND [lngconference_id] IN (765,766,767,768) 
		AND (chkdelegate = 1)
		AND (active = 1)
		AND ((chkcancelled != 1) OR (ChkCancelled IS NULL))
	GROUP BY 
		title,
		name,
		surname,
		company,
        email,
		user_id,
        eventID,
		dbo.tblInvoiceDetails.costTotal,
		paid, 
		invoiceNo,
		comment
	ORDER BY 
		company,
		surname,
		name;
</cfquery>

<cfquery dbtype="query" name="qry_unpaid1">
    SELECT
		userID, title, name, surname, company, email, '' as paid, '' as totalcost, '' as comment
    FROM 
        qry_unpaid
    GROUP BY 
        userID, title, name, surname, company, email
	ORDER BY 
		company,
		surname,
		name;        
</cfquery>

<cfscript>
	//Create new spreadsheet
	sObj=SpreadsheetNew();
	//add 1st row & style in new spreadsheet
	SpreadsheetAddRow(sObj, "USERID,TITLE,NAME,SURNAME,COMPANY,Email,PAYMENT,COST,COMMENTS");
	SpreadsheetFormatRow(sObj, {bold=TRUE, alignment="center"}, 1);
	//Add Qry 2 new spreadsheet + make column wide enough for image
	SpreadsheetAddRows(sObj, qry_unpaid1);
</cfscript>
    
    <cfloop query="qry_unpaid1">
    
    	<cfset therow = qry_unpaid1.currentRow+1>

        <cfquery dbtype="query" name="qry_unpaid2" maxrows="4">
            SELECT
                paid, totalcost, comment
            FROM 
                qry_unpaid
            WHERE 
                userID = #qry_unpaid1.userID#
            GROUP BY
            	paid, totalcost, comment
            ORDER BY
            	eventID;
        </cfquery>

        <cfscript>
            var.eventXpaid = ValueList(qry_unpaid2.paid);
            var.eventXcost = ValueList(qry_unpaid2.totalcost);
            var.eventXcomment = ValueList(qry_unpaid2.comment);

            SpreadsheetSetCellValue(sObj,var.eventXpaid,therow,7);
            SpreadsheetSetCellValue(sObj,var.eventXcost,therow,8);
            SpreadsheetSetCellValue(sObj,var.eventXcomment,therow,9);			
        </cfscript>

    </cfloop>

<cfspreadsheet action="write" filename="unpaid_report_AOW.xls" name="sObj" sheetname="unpaid" overwrite=true format="html" />

<a href="unpaid_report_AOW.xls">unpaid_report_AOW.xls</a>.<br>

<hr>
<cfset tickEnd = GetTickCount()>
<cfset loopTime = tickEnd - tickBegin>
<cfoutput>time: #loopTime# milliseconds</cfoutput>