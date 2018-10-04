<cfparam name=url.dID default="0" type="numeric">
<cfparam name=url.eID default="0" type="numeric">
<cfparam name=url.fID default="0" type="numeric">
<cfparam name=url.sID default="0" type="numeric">
<cfparam name=url.ten default="Event" type="string">

<cfparam name=url.d default="din">
<cfparam name=url.e default="event">
<cfparam name=url.f default="forum">
<cfparam name=url.s default="sb">

<cfscript>
	// 2 events
	//var.defs = url.dID+url.eID+url.fID+url.sID;	
	var.de = url.dID+url.eID;
	var.df = url.dID+url.fID;
	var.ds = url.dID+url.sID;
	var.ef = url.eID+url.fID;
	var.es = url.eID+url.sID;
	var.fs = url.fID+url.sID;

	// 3 events
	//var.defs = url.dID+url.eID+url.fID+url.sID;
	var.efs = url.eID+url.fID+url.sID;
	var.dfs = url.dID+url.fID+url.sID;
	var.des = url.dID+url.eID+url.sID;
	var.def = url.dID+url.eID+url.fID;
	
	// all events
	var.tttt = url.dID+url.eID+url.fID+url.sID;
	
	// events string for db
	var.zzzz = "#url.dID#,#url.sID#,#url.eID#,#url.fID#";
</cfscript>

<cfquery datasource="gpp" name="qry_regos">
    SELECT distinct 
    	bookings.delegateUserID as UserID,
        upper(tblIndividual.strFirst_Name) AS name, 
        upper(tblIndividual.strSurname) AS surname, 
        upper(tblIndividual.strDesignation) AS jobtitle, 
        upper(companyAKA.AKA_companyName) AS company, 
        lower(strEmail) as Email,
            bookings.[bookingComment],
            bookings.[status],
            bookings.[payment],
           bookingType,
        bookingTypeText =
        CASE WHEN bookings.bookingType = 1 
           THEN 'Delegates'
           WHEN bookingType = 2 
           THEN 'Speaker'
           WHEN bookingType = 3 
           THEN 'Guest'
           WHEN bookingType = 4 
           THEN 'Moderator'
           WHEN bookingType = 5 
           THEN 'Exhibitor'
           WHEN bookingType = 6 
           THEN 'PRESS'
           ELSE 'error' END,
           bookings.paymentPackageID,
     dbo.invoices.invoiceStatus, 
     dbo.invoices.invoiceNumber,
     (select top 1 F.event_name from CRM_events F where F.eventID = bookings.eventID) as eventName
    
    FROM           
    
    invoices RIGHT OUTER JOIN
    dbo.bookings ON dbo.invoices.bookingREF = dbo.bookings.bookingReference LEFT OUTER JOIN
    dbo.branch RIGHT OUTER JOIN
    dbo.tblIndividual ON dbo.branch.branchID = dbo.tblIndividual.branchID ON dbo.bookings.delegateUserID = dbo.tblIndividual.IngIndividual_ID LEFT OUTER JOIN
    dbo.companyAKA ON dbo.tblIndividual.AKA_companyID = dbo.companyAKA.AKA_companyID LEFT OUTER JOIN
    dbo.namePrefix ON dbo.tblIndividual.prefixID = dbo.namePrefix.namePrefixID
    
    WHERE 
            (invoices.currentInvoice is Null or invoices.currentInvoice = 0)
        AND 
            eventID in (#var.zzzz#)
        AND 
            bookings.cancelledDate is null
        AND 
            tblIndividual.strSurname is not null
 
    ORDER BY 
        company, 
        surname, 
        name,
        eventName
</cfquery>

<CFHEADER NAME="Content-Disposition" VALUE="inline; filename=regos_#dateformat(now(), "yyyy-mm-dd")#-#randrange(1,99)#.xls">
<CFCONTENT TYPE="application/vnd.msexcel">

<table border="0">
<tr>
<th width='250px'>Name</th>
<th width='600px'>Position</th>
<th width='600px'>Company</th>
<th width='280px'>Email</th>
<th width='100px'>Payment</th> 
<th width='300px'>Comments</th> 
<th width='500px'>Event Names</th>
</tr>
<cfoutput query="qry_regos" group="userID"><tr>
<td>#name# #surname#</td>
<td>#jobtitle#</td>
<td>#company#</td>
<td>#email#</td>
<td><cfif invoiceStatus EQ 1>YES</cfif>  <cfif paymentPackageID GT 0>Yes Contract</cfif> <cfif bookingType GT 1>N/A</cfif></td>
<td>#bookingTypeText# - #invoiceNumber#: #bookingComment#</td> 
<td><cfoutput> - #eventName#</cfoutput></td>
</tr></cfoutput>
</table>
<!--- 560px / 792px --->


<!----
<cfheader name="content-disposition" value="filename=regos.doc" />
<cfcontent type="application/msword">

<cfset therow= 0>

<table border="1px single black" width="560px" style="font-family:Arial, Helvetica, sans-serif; font-size:9px" cellpadding="10">
<tr><cfoutput query="qry_regos" group="userID"><cfset therow = therow + 1>
<td width="270px" height="215px" border="1px single black">
<center><strong style="font-size:12px">19<sup>th</sup> Western Africa Oil, Gas &amp; Energy 2013</strong><br><br></center>
Name : #name# #surname#<br>
Position : #jobtitle# <br>
Company : #Company# <br>
Email : #email# <br><br>
<b>#ucase(bookingTypeText)#</b><br><br>

<strong>Paid Status : <cfif bookingType GT 1>N/A <cfelse><cfif invoiceStatus EQ 1 OR paymentPackageID GT 0><font color="green">YES</font> <CFELSE><font color="red">NO</font></cfif></cfif></strong><br><br>

Comments : #invoiceNumber# #bookingComment#<br><br>
Event/s : <cfoutput>#eventName#<br></cfoutput><br>
Signature : 
<hr color="##8D7C6F" width="90%" align="right">
<center><img src="http://petro21.com/_img/logos/regos.jpg" width=161 height=24 hspace="120" vspace="8"></center></td>
<!--- heres your kicker --->

<cfif therow MOD 2 EQ 0 OR therow EQ RecordCount></tr><tr></cfif>
<!---<cfif therow NEQ RecordCount><tr></cfif>--->
</cfoutput>
</tr>
</table> --->