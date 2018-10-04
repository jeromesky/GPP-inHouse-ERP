<cfinclude template="../Application.cfm">

<cfif parameterexists(form.speakerid)>

<cfquery datasource="#dsnP21#">
INSERT INTO speakers_program (clientid, eventid, groupby, speaker)
VALUES(#form.speakerid#, #form.id#, #form.groupby#, 0)
</cfquery>


<!---
<cfquery datasource="#dsnP21#">
    	UPDATE events SET program = <cfqueryparam cfsqltype="cf_sql_date" value="#now()#"> WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
    </cfquery>--->
</cfif>


<cfloop collection="#form#" item="fname"><cfoutput>#fname#=#form[fname]#, </cfoutput></cfloop>