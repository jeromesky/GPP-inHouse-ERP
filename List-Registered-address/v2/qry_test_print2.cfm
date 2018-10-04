<!--- aow: http://www.petro21.com/my-office/List-Registered/v2/?fa=badges2&n=1&dID=687&sID=686&eID=689&fID=688 --->
<!--- asow: http://www.petro21.com/my-office/List-Registered/v2/?fa=badges2&n=1&sID=547&eID=546 --->

<cfparam name=url.dID default="0" type="numeric">
<cfparam name=url.eID default="0" type="numeric">
<cfparam name=url.fID default="0" type="numeric">
<cfparam name=url.sID default="0" type="numeric">

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
	
	// events string  for db
	var.zzzz = "#url.dID#,#url.sID#,#url.eID#,#url.fID#";
</cfscript>

<cfoutput>#var.zzzz#</cfoutput>

<cfquery datasource="#gpp#" name="qry_print">
SELECT   distinct
          user_id,
           upper(title) As title, 
    upper(name) as name,	
    upper(surname) as surname, 
    upper(company) as company, 
    upper(possition) as job,
    lngConference_ID as eventID,
    chkSpeaker,
    chkGuest,	
    chkModerator,
    chkExhibitor,
    chkPress,
    chkDelegate
        FROM 
        	[VIEW_Conference_Attendence_list]
        WHERE 
        	[lngConference_ID] IN (#var.zzzz#) 
        AND (
          chkSpeaker = 1 OR 
          chkGuest = 1 OR 
          chkDelegate = 1 OR 
          chkModerator = 1  
         )
        AND
         (active =1)
        AND
         (ChkCancelled != 1)
GROUP BY 
         title, 
    name,	
    surname, 
    company, 
    possition,
    lngConference_ID,
    user_Id,
        chkSpeaker,
    chkGuest,	
    chkModerator,
    chkExhibitor,
    chkPress,
    chkDelegate
        ORDER BY 
         company, surname, lngConference_ID
</cfquery>

<cfquery datasource="#gpp#" name="qry_events">
SELECT top 3
CASE 
	WHEN event_name <> ''
    THEN event_name
    ELSE strConference_Name
 END AS eventName , 
  IngConference_ID AS eventID
FROM tblAnnual_Conf
WHERE IngConference_ID IN (#var.zzzz#) 
ORDER BY IngConference_ID 
</cfquery>