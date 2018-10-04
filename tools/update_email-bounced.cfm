


<cfquery datasource="#gpp#" name="qryGet">
	SELECT lngIndividual_ID AS userID, email_bounce
    FROM tblIndOptions
    WHERE email_bounce <> 0

</cfquery>

<cfloop query="qryGet">
        <cfquery datasource="#gpp#">
        
        UPDATE tblIndividual
        SET email_bounce = #qryGet.email_bounce#
        WHERE IngIndividual_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#qryGet.userID#">
        
        </cfquery>
</cfloop>