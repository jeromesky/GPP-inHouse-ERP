<cfparam name="url.id" default="780">

<cfquery datasource="#gpp#" name="qry_key" maxrows="4" timeout="60" cachedwithin="#CreateTimeSpan(0,0,2,0)#">
    SELECT distinct
        IngConference_ID as eventID,
        strConference_Name as eventName
    FROM [tblAnnual_Conf]
    WHERE IngConference_ID in (#url.id#);
</cfquery>

<cfquery datasource="#gpp#" name="qry_profile2do" maxrows="10" timeout="60" cachedwithin="#CreateTimeSpan(0,0,2,0)#">
	SELECT        
    	profiles.p_name as name, 
        profiles.p_lastName as surname, 
        profiles.profileID
	FROM
    	profiles INNER JOIN bookings ON profiles.profileID = bookings.profileUserID
    WHERE 
    	eventID IN (#url.id#)
    AND 
    	cancelID = 0
    AND 
    	delegateUserID = 0;
</cfquery>

<cfquery datasource="#gpp#" name="qry_compare" timeout="360" cachedwithin="#CreateTimeSpan(0,0,1,0)#">
SELECT distinct 
A.user_id as userID,
(select strFirst_name from dbo.tblIndividual where IngIndividual_ID = A.user_id) as name,
(select strSurname from dbo.tblIndividual where IngIndividual_ID = A.user_id) as surname,
<cfloop list="#url.id#" index="ccc">
(select count(user_id) FROM [VIEW_Conference_Attendence_list] WHERE [lngConference_ID] = #ccc# and user_id = A.user_id AND (ChkCancelled != 1 or ChkCancelled is Null) ) as oldReg#ccc#,
(select COUNT(delegateUserID) FROM bookings WHERE eventID = #ccc# and delegateUserID = A.user_id AND cancelID = 0) as newReg#ccc#,
(select COUNT(delegateUserID) FROM bookings WHERE eventID = #ccc# and delegateUserID = A.user_id AND cancelID = 1) as newCanxReg#ccc#,
</cfloop>
(select top 1 paid FROM VIEW_Conference_Attendence_list WHERE lngConference_ID IN (#ccc#) AND ChkCancelled != 1 and user_ID = A.user_id) AS paid,
(select top 1 payment from bookings WHERE eventID = #ccc# and delegateUserID = A.user_id) AS payment
FROM VIEW_Conference_Attendence_list A
WHERE A.lngConference_ID IN (#url.id#) 
AND A.ChkCancelled != 1

UNION

SELECT distinct 
A.delegateUserID as userID, 
(select strFirst_name from dbo.tblIndividual where IngIndividual_ID = A.delegateUserID) as name,
(select strSurname from dbo.tblIndividual where IngIndividual_ID = A.delegateUserID) as surname,
<cfloop list="#url.id#" index="ddd">
(select count(user_id) FROM [VIEW_Conference_Attendence_list] WHERE [lngConference_ID] = #ddd# and user_id = A.delegateUserID AND (ChkCancelled != 1 or ChkCancelled is Null) ) as oldReg#ddd#,
(select COUNT(delegateUserID) FROM bookings WHERE eventID = #ddd# and delegateUserID = A.delegateUserID AND cancelID = 0) as newReg#ddd#,
(select COUNT(delegateUserID) FROM bookings WHERE eventID = #ddd# and delegateUserID = A.delegateUserID AND cancelID = 1) as newCanXReg#ddd#,
</cfloop>
(select top 1 paid FROM VIEW_Conference_Attendence_list WHERE lngConference_ID IN (#ddd#) AND ChkCancelled != 1 and user_ID = A.delegateUserID) AS paid,
(select top 1 payment from bookings WHERE eventID = #ddd# and delegateUserID = A.delegateUserID) AS payment
FROM bookings A
WHERE A.eventID in (#url.id#)
AND A.cancelID = 0

order by 
	surname, name;
</cfquery>