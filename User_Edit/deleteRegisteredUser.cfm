<cfsilent>
<!---- FIND AKA_COMPANYID AND COMPANYID ---->
 <cfquery datasource="#gpp#" name="qryUser" >
 	SELECT TOP 1
    	[companyID]
        ,[AKA_companyID]
    FROM
    	[CRM_users]
    WHERE
    	[userID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.DeleteID#">
 </cfquery>
 <!--- DELETE USER FROM INDIVIDUAL TABLE --->
<cfquery datasource="#gpp#" >
 	DELETE FROM  tblIndividual 
	WHERE IngIndividual_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.DeleteID#">
</cfquery>

<!---<cfquery datasource="#gpp#" >
 	DELETE FROM  tblIndOptions 
	WHERE lngIndividual_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.DeleteID#">
</cfquery>--->

<!--- DELETE FROM NEWSLETTERS --->
<cfquery datasource="#gpp#">
 	DELETE FROM  subscriptions 
	WHERE 
	userid = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.DeleteID#">
	AND
	[subscriptionType] = 1
</cfquery>
<!--- DELETE FROM SECTORS --->
        <cfquery datasource="#gpp#" >
            DELETE
            FROM
            	user2sector
           WHERE
				userid = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.DeleteID#">
</cfquery>
<!--- DELETE FROM Areas --->
<cfquery datasource="#gpp#" >
            DELETE
            FROM
            	user2area
           WHERE
				userID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.DeleteID#">
</cfquery>
<!--- DELETE FROM contacts --->
<cfquery datasource="#gpp#" >
            DELETE
            FROM
            	contacts
           WHERE
				userID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.DeleteID#">
</cfquery>

</cfsilent>