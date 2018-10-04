<cfinclude template="../Application.cfm">

<cfset cleanList = replace(form.list, "logos_supporter[]=", "", "All") >
<cfset recleanList = replace(cleanList, "&", ",", "All") >



<cfquery datasource="#dsnP21#" >
	UPDATE events
    SET 
    logos_supporter = '#recleanList#'
    , last_updated = <cfqueryparam cfsqltype="cf_sql_date" value="#now()#" >
    WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventid#">
</cfquery>





<cfoutput>Logos oreder saved <br />#recleanList#</cfoutput>

