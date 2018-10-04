<cfquery name="check" datasource="#mainDSN#">
  SELECT 1
  FROM 
    GPP.dbo.ann_templates
  WHERE
    announcementName = '#form.templateName#'
</cfquery>

<cfif check.recordcount EQ 0>

<cfquery name="createTemplate" datasource="#mainDSN#"> 
  INSERT INTO 
    GPP.dbo.ann_templates
           ([TemplateName]
           ,[TemplateUsage]
           ,[announcementExpiry]
           ,[announcementType]
           ,[eventID]
           ,[StaffIDcreated])
     VALUES
           (
           '#form.templateName#',
           '#form.announcementSubject#',
           '#form.announcementExpiryDate#',
           #form.announcementType#,
           #form.eventID#,
           #Session.user_id#)
</cfquery>

</cfif>