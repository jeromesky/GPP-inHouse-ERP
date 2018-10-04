<cfinclude template="../application.cfm">

<cfsilent>
<cfquery datasource="#gpp#">
 	DELETE 
    FROM tblConference_Registration 
	WHERE IngClient_Conf_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.id#">
</cfquery>
<cfquery datasource="#gpp#">
 	DELETE 
    FROM tblInvoiceDetails 
	WHERE Conf_Reg_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.id#">
</cfquery>
</cfsilent>