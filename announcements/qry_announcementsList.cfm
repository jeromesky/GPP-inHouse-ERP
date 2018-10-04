<cfparam name="var.past"default=0>

<cfif var.past EQ '0'>
  <cfset switch = '>='>
<cfelse>
  <cfset switch = '<='>
</cfif>

<cfquery name="qryAnnouncementsList" datasource="#mainDSN#"> 
    SELECT
        announcements.announcementID, 
        announcements.announcementName, 
        announcements.announcementSubject, 
        announcements.announcementExpiry, 
        announcements.announcementType, 
        announcements.templateID, 
        announcements.announcementAttachments, 
        announcements.eventID, 
        announcements.DateAdded, 
        announcements.DateUpdated,
        gpp.dbo.CRM_Events.eventName,
        petro21.dbo.GPPusers.name as StaffIDupdated, 
        userCreateID.name AS StaffIDcreated
    FROM
        GPP.dbo.announcements INNER JOIN
        petro21.dbo.GPPusers AS userCreateID ON GPP.dbo.announcements.StaffIDcreated = userCreateID.id LEFT OUTER JOIN
        petro21.dbo.GPPusers ON GPP.dbo.announcements.StaffIDupdated = petro21.dbo.GPPusers.id LEFT OUTER JOIN
        GPP.dbo.CRM_Events ON GPP.dbo.announcements.eventID = GPP.dbo.CRM_Events.eventId
    WHERE
      announcementExpiry #switch# getdate()
    ORDER BY
      announcementExpiry, 
      eventID, 
      announcementName
</cfquery>
