<cfset gpp = "GPP">
<cfset dsnP21 = "petro21">

<cfif parameterexists(form.oldID) and parameterexists(form.newID)>
        <cfquery datasource="#gpp#" name="qryNew">
        UPDATE  
            [tblAnnual_Conf]
        SET
            [webID]  = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.oldID#">
        WHERE
            [IngConference_ID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.newID#">
        </cfquery>
</cfif>
<!---<cfdump var="#form#">--->
<cflocation url="#HTTP_REFERER#?#cgi.QUERY_STRING#" addtoken="no">