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

<!---<cfoutput>#var.zzzz#</cfoutput>--->

<cfquery datasource="#gpp#" name="qry_listMaster">
SELECT distinct
	delegateUserID as user_ID, 
	dbo.namePrefix.namePrefixLabel,
	 dbo.tblIndividual.strFirst_Name as name, 
	 dbo.tblIndividual.strSurname as surname, 
	dbo.tblIndividual.strDesignation as Job,
	dbo.companyAKA.AKA_companyName as company,
	eventID,
	CASE 
    	WHEN dbo.bookings.bookingType = 1 THEN 'Delegate' 
        WHEN dbo.bookings.bookingType = 2 THEN 'Speaker' 
        WHEN dbo.bookings.bookingType = 3 THEN 'GPP Guest'
        WHEN dbo.bookings.bookingType = 4 THEN 'Moderator' 
        WHEN dbo.bookings.bookingType = 5 THEN 'Exhibitor' 
        WHEN dbo.bookings.bookingType = 6 THEN 'Press' 
        WHEN dbo.bookings.bookingType = 0 THEN 'not defined' 
        WHEN dbo.bookings.bookingType = '' THEN 'not defined' 
    END AS bookingTypeLabel 
FROM            
	dbo.bookings LEFT OUTER JOIN
	dbo.tblIndividual ON dbo.bookings.delegateUserID = dbo.tblIndividual.IngIndividual_ID LEFT OUTER JOIN
	dbo.companyAKA ON dbo.tblIndividual.AKA_companyID = dbo.companyAKA.AKA_companyID LEFT OUTER JOIN
	dbo.namePrefix ON dbo.tblIndividual.prefixID = dbo.namePrefix.namePrefixID
WHERE eventID in (#var.zzzz#)
AND cancelID = 0
AND delegateUserID != 0

ORDER BY
    company
   , surname
   , name
   , eventID;
</cfquery>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>P21 Event Check Lists</title>
</head>
<style>
td, th {font-family:Calibri; font-size:12px;}
</style>
<body>

<table width="100%" border="0" cellpadding="2" cellspacing="1" id="TableEdit">
<tr>
<th width='15px'>&#10004;</th>
<th width='200px'>name</th>
<th width='350px'>full name</th> 
<th width='350px'>company</th>
<th width='300px'>company1</th>
<th width='100px'>events</th>
<th width='85px'>type</th>
</tr><cfset row=0>
<cfoutput query="qry_listMaster" group='user_id'><tr bgcolor="#iif(row MOD(2) eq 1,de('ffffff'),de('dadada'))#"><cfset row= row +1>
<td><input type="checkbox"></td>
<td>#trim(name)#</td>
<td>#trim(name)# #trim(surname)#</td> 
<td>#trim(company)#</td>
<td><cfif len(trim(company)) GT 26><font color="red">#company#</font><cfelse>&nbsp;</cfif></td><cfset num = 0><cfoutput><cfset num = num + eventID></cfoutput>
<td><cfif #num# EQ #var.tttt#><font color="green"><b>ALL</b>
<cfelseif #num# EQ #url.dID#><font color="orange">Dinner
<cfelseif #num# EQ #url.eID#><font color="orange">Event
<cfelseif #num# EQ #url.sID#><font color="brown">SB
<cfelseif #num# EQ #url.fID#><font color="orange">Fourm
<cfelseif #num# EQ #var.de#><font color="purple">Dinner + Event 2
<cfelseif #num# EQ #var.df#><font color="purple">Dinner + Fourm 2
<cfelseif #num# EQ #var.ds#><font color="purple">Dinner + SB 2
<cfelseif #num# EQ #var.ef#><font color="purple">Event + Fourm 2
<cfelseif #num# EQ #var.es#><font color="purple">Event + SB 2
<cfelseif #num# EQ #var.fs#><font color="purple">Fourm + SB 2
<cfelseif #num# EQ #var.efs#><font color="blue">Event + Fourm + SB 3
<cfelseif #num# EQ #var.dfs#><font color="blue">Dinner + Fourm + SB 3
<cfelseif #num# EQ #var.des#><font color="blue">Dinner + Event + SB 3
<cfelseif #num# EQ #var.def#><font color="blue">Dinner + Event + Fourm 3
<cfelse><font color="red">Combo / Error #num#</cfif></font></td>
<td>#bookingTypeLabel#</td>
</tr></cfoutput>
</table>Total: <cfoutput>#row#</cfoutput>

</body>
</html>
