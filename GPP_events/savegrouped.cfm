<cfinclude template="../application.cfm">
<cfquery datasource="#gpp#" name="getevent">
 	UPDATE  tblAnnual_Conf
     SET
     lngCon_ID = <cfqueryparam value="#form.weekid#">,
      merge = 1
    WHERE   IngConference_ID IN (#form.conferenceid#) 
</cfquery>
<cfoutput>
#form.weekid# #form.conferenceid#
</cfoutput>