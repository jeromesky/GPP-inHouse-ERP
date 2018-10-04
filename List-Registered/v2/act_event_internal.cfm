<!--- aow: http://localhost/_2/reports/events/act_event_internal.cfm?sID=767&eID=765&fID=766 --->
<!--- din: http://localhost/_2/reports/events/act_event_internal.cfm?dID=768 --->
<cfset tickBegin = GetTickCount()>
<cfsetting requesttimeout="6789">

<cfparam name="url.foto" default="off" type="string">
<cfparam name='url.dID' default="0" type="numeric">
<cfparam name='url.eID' default="0" type="numeric">
<cfparam name='url.fID' default="0" type="numeric">
<cfparam name='url.sID' default="0" type="numeric">
<cfparam name='url.d' default="din">
<cfparam name='url.e' default="event">
<cfparam name='url.f' default="forum">
<cfparam name='url.s' default="sb">
<cfparam name='var.sheetName' default="AOW">
<cfparam name='var.fotos' default=0 type="integer">
<cfparam name='var.sansfotos' default=0 type="integer">
<cfif url.dID EQ 768>
	<cfset var.sheetName = 'Dinner'>
</cfif>

<cfscript>
	// 2 events - var.defs = url.dID+url.eID+url.fID+url.sID;	
	var.de = url.dID+url.eID;
	var.df = url.dID+url.fID;
	var.ds = url.dID+url.sID;
	var.ef = url.eID+url.fID;
	var.es = url.eID+url.sID;
	var.fs = url.fID+url.sID;

	// 3 events - var.defs = url.dID+url.eID+url.fID+url.sID;
	var.efs = url.eID+url.fID+url.sID;
	var.dfs = url.dID+url.fID+url.sID;
	var.des = url.dID+url.eID+url.sID;
	var.def = url.dID+url.eID+url.fID;
	
	// all events count value
	var.tttt = url.dID+url.eID+url.fID+url.sID;
	// events string for db
	var.zzzz = "#url.dID#,#url.sID#,#url.eID#,#url.fID#";
</cfscript>

<cfquery datasource="#gpp#" name="qry_print">
	SELECT DISTINCT 
		user_id as UserID,
		Upper(title) AS title,
		Upper(name) AS name,
		Upper(surname) AS surname,
		Upper(company) AS company,
		Upper(possition) AS jobtitle,
		lngconference_id AS eventID,
			(SELECT TOP 1 filename 
			FROM dbo.files 
			WHERE (filetable = 'tblIndividual') 
			AND (filepurposeid = 175) 
			AND (filetableid = dbo.view_conference_attendence_list.user_id) 
			ORDER BY fileID DESC
			) AS photo,  
		menuChoice,
	CASE
		WHEN chkspeaker = 1 THEN 'Speaker'
		WHEN chkguest = 1 THEN 'Guest'
		WHEN chkmoderator = 1 THEN 'Moderator'
		WHEN chkexhibitor = 1 THEN 'Exhibitor'
		WHEN chkpress = 1 THEN 'Press'
		WHEN chkdelegate = 1 THEN 'Delegate'
		ELSE 'Error Please Check'
	END as AttendanceType,
    	paid,
        comment
	FROM [view_conference_attendence_list]
	WHERE 
		[lngconference_id] IN (#var.zzzz#) 
		AND (
			chkspeaker = 1
			OR chkguest = 1
			OR chkdelegate = 1
			OR chkmoderator = 1
			OR chkpress = 1
			OR chkexhibitor = 1)
		AND (active = 1)
		AND (chkcancelled != 1)
	GROUP BY 
		title,
		name,
		surname,
		company,
		possition,
		lngconference_id,
		user_id,
		menuChoice,
		chkspeaker,
		chkguest,
		chkmoderator,
		chkexhibitor,
		chkpress,
		chkdelegate,
        paid, 
        comment
	ORDER BY 
		company,
		surname,
		name,
		lngconference_id
</cfquery>

    <cfquery dbtype="query" name="qry_print1">
        SELECT
            distinct userID, title, name, surname, company, jobtitle, photo, '' AS mon, '' As Tue, '' as Wed, '' AS paid, '' AS comments
        FROM 
            qry_print
     GROUP BY 
            company,
            surname,
            name,
            title,
            photo,
            jobtitle,
            userid
    </cfquery>
    
    <cfloop query="qry_print1">
		
        <cfquery dbtype="query" name="qry_print2">
            SELECT
                eventID, AttendanceType, paid, comment
            FROM 
                qry_print
            WHERE 
                userID = #qry_print1.userID#
            ORDER BY
                eventID;
        </cfquery>

        <cfscript>
			var.eventIDlist = ValueList(qry_print2.eventID);
            var.attendanceType = ValueList(qry_print2.AttendanceType);
            var.attendancePaid = ValueList(qry_print2.paid);
            var.attendanceComment = ValueList(qry_print2.comment);
			foo = QuerySetCell(qry_print1, 'paid', var.attendancePaid, qry_print1.currentRow);
			foo = QuerySetCell(qry_print1, 'comments', var.attendanceComment, qry_print1.currentRow);
		</cfscript>	
        <cfif ListContains(var.eventIDlist,767)>
			<cfscript>
                wordvalue = ListContains(var.eventIDlist,767);
                wordvalue = ListGetAt(var.AttendanceType, wordvalue);
                foo = QuerySetCell(qry_print1, 'mon', wordvalue, qry_print1.currentRow);
            </cfscript>
        </cfif>
        <cfif ListContains(var.eventIDlist,766)>
			<cfscript>
                wordvalue = ListContains(var.eventIDlist,766);
                wordvalue = ListGetAt(var.AttendanceType, wordvalue);
                foo = QuerySetCell(qry_print1, 'tue', wordvalue, qry_print1.currentRow);
            </cfscript>
        </cfif>  
        <cfif ListContains(var.eventIDlist,765)>
            <cfscript>
                wordvalue = ListContains(var.eventIDlist,765);
                wordvalue = ListGetAt(var.AttendanceType, wordvalue);
				foo = QuerySetCell(qry_print1, 'wed', wordvalue, qry_print1.currentRow);
            </cfscript>
        </cfif>
    </cfloop>

 <!---  <cfdump var="#qry_print1#" expand="false" top="10">
<cfdump var="#qry_print#" expand="false" top="10"> --->
	
	<style>
		td {
			font-family: Arial, Helvetica, sans-serif;
			font-size:10pt;
			}
		img {
			font-size: xx-small;
			border: 0px;
		}
		hr {width:50%}
		.text-rotation {
			display: block; 
			-webkit-transform: rotate(-90deg); 
			-moz-transform: rotate(-90deg);
			font-size: 8pt;
			font-weight: bold;
			width:20px;
			top:60px;
			}
	img {
		width:46px;
		height:59px;
	}
	.name{
		font-size: 14px;
    padding-left: 5px;
	}
	.title{
		 color: #999999;
    font-size: 12px;
	padding-left: 5px;
	}
	</style>

<table cellpadding="1" width="100%">
<cfoutput query="qry_print1" group="company">
<tr><td colspan=5 bgcolor="lightgray"><font size='4'> #company#</font></td></tr>
<cfoutput><tr>
<td rowspan=2  width="48"><img src="http://petro21.com/_files/client/#photo#" <cfif #len(qry_print1.photo)# EQ 0> alt="Request Photo" <cfelse> </cfif>  /></td>
<td rowspan=2 width=20 <cfif #len(qry_print1.mon)# NEQ 0>bgcolor='gold'</cfif>><div class="text-rotation">#mon#</div></td>
<td rowspan=2 width=20 <cfif #len(qry_print1.tue)# NEQ 0>bgcolor='lightgreen'</cfif>><div class="text-rotation">#tue#</div></td>
<td rowspan=2 width=20 <cfif #len(qry_print1.wed)# NEQ 0>bgcolor='lightblue'</cfif>><div class="text-rotation">#wed#</div></td>
<td class="name">#title# #name# <b>#surname#</b></td></tr>
<tr><td class="title">#jobtitle#</td></tr>
</cfoutput></cfoutput>
</table>

<cfset tickEnd = GetTickCount()><cfset loopTime = tickEnd - tickBegin>
<cfoutput>time: #loopTime# milliseconds</cfoutput>