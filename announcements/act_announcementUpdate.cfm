<cfdump var="#form#">

<!--- insert validiate here for duplicated names --->
<cfquery name="qry_announcementUpdate" datasource="#mainDSN#"> 
  UPDATE
    gpp.dbo.announcements
  SET
     	ANNOUNCEMENTBODY = '#form.ANNOUNCEMENTBODYHTML#',	
     	ANNOUNCEMENTEXPIRY = '#form.ANNOUNCEMENTEXPIRY#',	 	
     	ANNOUNCEMENTFREETEXTA = '#form.ANNOUNCEMENTBODYTXT#',	 	
     	ANNOUNCEMENTFREETEXTB = '#form.ANNOUNCEMENTBODYTXT#',	 	
     	ANNOUNCEMENTFROMDOMAIN = '#form.DOMAINID#',	 	
     	ANNOUNCEMENTFROMPERSON = '#form.ANNOUNCEMENTFROMPERSON#',	 	
     	ANNOUNCEMENTFROMSIGNATURE = '#form.ANNOUNCEMENTFROMSIGNATURE#',	 	
     	ANNOUNCEMENTNAME  = '#form.ANNOUNCEMENTNAME#',	 	
     	ANNOUNCEMENTSUBJECT = '#form.ANNOUNCEMENTSUBJECT#',	 	
     	ANNOUNCEMENTTYPE = '#form.ANNOUNCEMENTTYPE#',	 	
      DATEUPDATED = getdate(), 	
      EVENTID = '#form.EVENTID#',
      STAFFIDUPDATED = '#SESSION.user_ID#',
      TEMPLATEID = '#form.TEMPLATEID#'
  WHERE
    announcementID = #form.ID#;
</cfquery>