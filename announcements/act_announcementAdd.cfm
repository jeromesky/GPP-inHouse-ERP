<cfquery name="check" datasource="#mainDSN#">
  SELECT 1
  FROM 
    GPP.dbo.[announcements]
  WHERE
    announcementName = '#form.announcementName#'
  AND
    announcementSubject = '#announcementSubject#'
  AND 
    eventID = #form.eventID#
  AND
    1 = 1;
</cfquery>

<cfif check.recordcount EQ 0>

<cfquery name="create_announcement.cfm" datasource="#mainDSN#"> 
  INSERT INTO 
    GPP.dbo.[announcements]
           ([announcementName]
           ,[announcementSubject]
           ,[announcementExpiry]
           ,[announcementType]
           ,[eventID]
           ,[StaffIDcreated])
     VALUES
           (
           '#form.announcementName#',
           '#form.announcementSubject#',
           '#form.announcementExpiryDate#',
           #form.announcementType#,
           #form.eventID#,
           #Session.user_id#)
</cfquery>

</cfif>
