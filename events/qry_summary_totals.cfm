<cfparam name="#url.eventID#" default="0" type="numeric">

<cfquery datasource="#dsnP21#" name="qry_event_total_list_events">
  SELECT distinct
    strConference_Name AS eventName,
    IngConference_ID AS eventID,
    event_expire
  FROM
    tblAnnual_Conf RIGHT OUTER JOIN tblConference_Registration 
    ON dbo.tblAnnual_Conf.IngConference_ID = dbo.tblConference_Registration.lngConference_ID
  WHERE
    event_expire > getdate()
  AND
    live =1 
  ORDER BY
    event_expire desc;
</cfquery>

<cfif url.eventID LTE 400>
  <cfset url.eventID= qry_event_total_list_events.eventID[1]>
</cfif>

<cfquery datasource="#dsnP21#" name="qry_event_total">  
  SELECT
    eventName,
    count(*) AS total
  FROM 
    VIEW_Conference_Attendence_list
  WHERE 
    eventID in (#url.eventID#)
  GROUP BY 
    eventName;
</cfquery>

<cfquery datasource="#dsnP21#" name="qry_event_total_breakdown">
  select count(*)
  FROM VIEW_Conference_Attendence_list
  WHERE eventId in (472)
  AND (status = 'c')
  group by chkDelegate, chkSpeaker, chkGuest, chkModerator, chkPress
</cfquery>