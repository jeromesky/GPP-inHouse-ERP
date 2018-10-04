<cfparam name="#url.id#" default="0" type="numeric">
<cfquery name=qry_event_edit datasource="#dsnP21#">
   SELECT *
   FROM tblAnnual_Conf
   WHERE webid = #url.id#
   ORDER BY event_expire asc
</cfquery>