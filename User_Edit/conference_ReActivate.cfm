<cfinclude template="../application.cfm">
<cfsilent>
<!--- INSERT INTO CONFERENCE --->
<cfquery datasource="#gpp#" name="update_conf">
 	UPDATE 
    tblConference_Registration
  SET
		ChkCancelled = 0,
    reActivate_date		= <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">  
 	WHERE 
    IngClient_Conf_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>
</cfsilent>