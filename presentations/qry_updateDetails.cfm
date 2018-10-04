
<cfif parameterexists(form.eventID)>
	<cfsilent>
    <cfquery datasource="#gpp#" name="get">
        UPDATE
            [CRM_events]
        SET  
            [presentationCost] = <cfqueryparam cfsqltype="cf_sql_decimal" value="#form.presentationCost#" scale="2" >
            ,[presentationCurrency] = <cfqueryparam cfsqltype="cf_sql_char" value="#form.presentationCurrency#" >
        WHERE 
            [eventID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventID#">
    </cfquery>
    </cfsilent>
    Changes saved
</cfif>