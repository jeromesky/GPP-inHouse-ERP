<cfif parameterexists(form.oldID) AND parameterexists(form.newID) AND form.newID NEQ "" AND  form.oldID NEQ "">

<cfquery name="get_exhibitors" datasource="#gpp#">
  UPDATE 
      tblConference_Registration
  SET
      lngIndividual_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.newID#">
  WHERE 
      [lngIndividual_ID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.oldID#"> 
</cfquery>

<cfquery name="get_exhibitors" datasource="#gpp#">
  UPDATE 
      tblInvoiceDetails
  SET
      IND_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.newID#">
  WHERE 
      [IND_ID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.oldID#">
</cfquery>
  <table  border="0" cellspacing="5" cellpadding="0">
  <tr>
      <td>Two records now merged</td>
  </tr>
  </table>
</cfif>
