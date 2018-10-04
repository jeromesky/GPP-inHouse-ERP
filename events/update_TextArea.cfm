<cfdump var="#form#">

<cfscript>
  value='';
  editedField ='';
</cfscript>

<cfif parameterexists(form.focusOn)>
		<cfset editedField = "focusOn">
    <cfset value = URLDecode(form.focusOn)>

<cfelseif parameterexists(form.EVENT_BLURB)>
		<cfset editedField = "EVENT_BLURB">
    <cfset value = URLDecode(form.EVENT_BLURB)>

<cfelseif parameterexists(form.EVENT_BLURB_EXHIB)>
		<cfset editedField = "EVENT_BLURB_EXHIB">
    <cfset value = URLDecode(form.EVENT_BLURB_EXHIB)>

<cfelseif parameterexists(form.EVENT_BLURB_SPONSORS)>
		<cfset editedField = "EVENT_BLURB_SPONSORS">
    <cfset value = URLDecode(form.EVENT_BLURB_SPONSORS)>

</cfif>

<cfscript>
  value = Replace(value, "<p>&nbsp;</p>", " ", "ALL");
  //updateLabel = Replace(editedField, "_", " ", "ALL");
</cfscript>

<cfquery datasource="#gpp#" name="update">
    UPDATE 
      tblAnnual_Conf
    SET  
      #editedField# = <cfqueryparam cfsqltype="cf_sql_varchar" value="#value#">
    WHERE 
      webid = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>

<cfoutput>#value#</cfoutput>

<!---<cf_alertredirect AlertMessage='update has been saved' location="#cgi.HTTP_REFERER#">--->