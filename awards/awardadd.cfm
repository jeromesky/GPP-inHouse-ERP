<cfinclude template="../Application.cfm">

<cfif parameterexists(form.id)>
<cfquery datasource="#dsnP21#">
	UPDATE awards
    SET
    awardname			= '#form.awardname#',
    conf						= '#form.conf#',
    delegation				= '#form.delegation#',
    company				= '#form.company#',
    recipient				= '#form.recipient#',
    reason					= '#form.reason#',
    eventid					= #form.eventid#,
    awardyear				= '#form.awardyear#'
	WHERE id 	= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">    
</cfquery>
<cfelse>
      <cfquery datasource="#dsnP21#">
        INSERT INTO awards( 
        awardname, 
        conf, 
        delegation,
        company, 
        recipient, 
        reason, 
        eventid,
        awardyear
 )
        Values(
        '#form.awardname#', 
        '#form.conf#', 
        '#form.delegation#', 
        '#form.company#', 
        '#form.recipient#', 
        '#form.reason#',
        #form.eventid#,
        '#form.awardyear#'
)
     </cfquery>
</cfif>