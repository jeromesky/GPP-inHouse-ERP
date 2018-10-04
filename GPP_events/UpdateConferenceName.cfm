<cfinclude template="../application.cfm">
	
    <cfquery datasource="#gpp#" name="getevents">
 		UPDATE  tblAnnual_Conf
    	SET strConference_Name = <cfqueryparam value="#form.strConference_Name#" >
        WHERE IngConference_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>
<cfoutput>
#form.strConference_Name#
</cfoutput>