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

<!---<cfoutput>#var.zzzz#</cfoutput>---

<cfquery datasource="#gpp#" name="qry_listMaster">
SELECT
    distinct user_id
   , upper(title) As title
   , upper(name) as name
   , upper(surname) as surname
   , upper(company) as company
   , upper(possition) as job
   , lngConference_ID as eventID
   , chkSpeaker
   , chkGuest
   , chkModerator
   , chkExhibitor
   , chkPress
   , chkDelegate 
FROM
    [VIEW_Conference_Attendence_list] 
WHERE
    [lngConference_ID] IN (#var.zzzz#) 
AND ( 
	chkSpeaker = 1 OR 
    chkGuest = 1 OR 
    chkDelegate = 1 OR 
    chkModerator = 1 OR 
    chkPress = 1
    ) 
AND (active =1) 
AND (ChkCancelled != 1 or ChkCancelled is Null)
GROUP BY
    title
   , name
   , surname
   , company
   , possition
   , lngConference_ID
   , user_Id
   , chkSpeaker
   , chkGuest
   , chkModerator
   , chkExhibitor
   , chkPress
   , chkDelegate 
ORDER BY
    company
   , surname
   , name
   , lngConference_ID;
</cfquery> --->

<cfquery datasource="#gpp#" name="qry_listMaster">

SELECT distinct 
	upper(tblIndividual.strFirst_Name) AS name, 
	upper(tblIndividual.strSurname) AS surname, 
	upper(companyAKA.AKA_companyName) AS company, 
	---eventID,
		STUFF((SELECT ',' + cast(s.eventID as varchar) FROM bookings s WHERE s.delegateUserID = bookings.delegateUserID AND eventID in (795,798) 
		ORDER BY eventID FOR XML PATH('')),1,1,'') AS eventID,
	bookings.delegateUserID as UserID,
	---lower(strEmail) as Email,
	namePrefix.namePrefixLabel AS title, 
	upper(tblIndividual.strDesignation) AS job, 
	
	---	(SELECT TOP 1 filename FROM files WHERE (filetable = 'tblIndividual') AND (filepurposeid = 175) AND (filetableid = bookings.delegateUserID) 
	---	ORDER BY fileID DESC) AS photo
	--- bookingType, 
	---	STUFF((SELECT ',' + cast(s.bookingType as varchar) FROM bookings s WHERE s.delegateUserID = bookings.delegateUserID AND eventID in (795,798) 
	---	ORDER BY eventID FOR XML PATH('')),1,1,'') AS bookingType
	'eol' AS eol

FROM            dbo.branch RIGHT OUTER JOIN
                         dbo.tblIndividual ON dbo.branch.branchID = dbo.tblIndividual.branchID RIGHT OUTER JOIN
                         dbo.bookings ON dbo.tblIndividual.IngIndividual_ID = dbo.bookings.delegateUserID LEFT OUTER JOIN
                         dbo.companyAKA ON dbo.tblIndividual.AKA_companyID = dbo.companyAKA.AKA_companyID LEFT OUTER JOIN
                         dbo.namePrefix ON dbo.tblIndividual.prefixID = dbo.namePrefix.namePrefixID

WHERE 
	1=1
	AND 
		eventID in (#var.zzzz#)
	AND 
		bookings.cancelledDate is null
	AND 
		tblIndividual.strSurname is not null
     AND
        tblIndividual.strSurname != 'Golborne'    
	--AND
	--	bookingType = 6
		---eg. 6 press

ORDER BY 
	---eventID, 
	---bookingType,
	company, 
	surname, 
	name
</cfquery>