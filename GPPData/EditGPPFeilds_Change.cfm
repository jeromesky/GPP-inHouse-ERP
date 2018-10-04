<CFINCLUDE template="../Application.cfm">

<CFSET IDfieldName = #form.IDfieldName# >
<CFSET TableToChange = #form.TableToChange# >


<cfquery name="getList" datasource="#gpp#" >
    SELECT  #IDfieldName#, #form.field#
    FROM #TableToChange#
  WHERE  #form.field# = '#form.searchValue#'
</cfquery>
<cfset setFieldName = "#form.field#" >
<cfoutput>
<fieldset>
	<legend>Change Result </legend>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="80" height="35"><strong>Record id</strong></td>
    <td width="200"><strong>Original Value</strong></td>
    <td><strong>New Value</strong></td>
  </tr>
  <cfloop query="getList">
<!---<cftry >--->


  <cfquery  datasource="#gpp#" >
    UPDATE #TableToChange#   
    SET  
    #setFieldName# =
    	<cfif isNumeric(form.changeValue) >
        		<cfqueryparam cfsqltype="cf_sql_integer" value="#form.changeValue#" >
        <cfelse>
        		<cfqueryparam  value="#Ucase(form.changeValue)#" >
        </cfif>
   WHERE #IDfieldName# = <cfqueryparam cfsqltype="cf_sql_integer" value="#evaluate("getList.#IDfieldName#")#">  
</cfquery>
<!---<cfcatch type="any">
  <tr>
    <td colspan="3"> #cfcatch.Detail# #cfcatch.Message# #cfcatch.SQLState#</td>

  </tr>
</cfcatch>
</cftry>--->
  <tr>
    <td>#evaluate("getList.#IDfieldName#")#</td>
    <td>#form.searchValue#</td>
    <td>#Ucase(form.changeValue)#</td>
  </tr>
  </cfloop>
</table>
    
     The field Value has now been changed to #form.changeValue# on this many records

  </fieldset>

</cfoutput>