<cfsilent>
<cfinclude template="../application.cfm">
<!--- UPDATE  RECORDS --->
<cfset fieldValue = #Evaluate("form.#url.fieldname#")#>
<cfquery datasource="#gpp#">
  UPDATE 
    tblIndividual
  SET 
    #fieldname#	= <cfqueryparam value="#fieldValue#">,
    dtmUpdated = <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">,
    UpdBy	= '#Session.staffName#'
  WHERE 
    IngIndividual_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>
</cfsilent>
<cfoutput>#fieldValue#</cfoutput>