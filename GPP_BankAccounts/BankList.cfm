<cfinclude template="../Application.cfm">
<cfif parameterexists(form.delete)>
	<cfquery datasource="#gpp#">
	DELETE FROM bankAccounts WHERE bankID = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.delete#">
    </cfquery>


<cfelse>

            <CFQUERY datasource="#gpp#" name="get">
                SELECT *
                FROM bankAccounts
                ORDER BY name
                </CFQUERY>      
        <table width="100%" border="0" cellspacing="2" cellpadding="3">
                  <tr bgcolor="#EEEEEE" >
            <td style="border-bottom:1px solid ##EDEDED">Nick name</td>
            <td  style="border-bottom:1px solid ##EDEDED">Company name</td>
            <td style="border-bottom:1px solid ##EDEDED">Bank name</td>
                 <td  style="border-bottom:1px solid ##EDEDED">Account Number</td>
            <td  style="border-bottom:1px solid ##EDEDED">Currency</td>
            <td  style="border-bottom:1px solid ##EDEDED">address</td>

            <td width="16" style="border-bottom:1px solid ##EDEDED">&nbsp;</td>
            <td width="16" style="border-bottom:1px solid ##EDEDED"></td>
          </tr>
        <cfoutput query="get">
        
          <tr >
            <td style="border-bottom:1px solid ##EDEDED">#get.name#</td>
            <td  style="border-bottom:1px solid ##EDEDED">#get.companyName#</td>
            <td style="border-bottom:1px solid ##EDEDED">#get.bankName#</td>
            <td  style="border-bottom:1px solid ##EDEDED">#get.AccountNumber#</td>
            <td  style="border-bottom:1px solid ##EDEDED">#get.currency#</td>
            <td  style="border-bottom:1px solid ##EDEDED">#get.city#, #get.Country#</td>
            
            <td width="16" style="border-bottom:1px solid ##EDEDED"><a href="javascript:edit(#get.bankID#)"><img src="../img/new_edit.gif" border="0" /></a></td>
            <td width="16" style="border-bottom:1px solid ##EDEDED"></td>
          </tr>
         </cfoutput>
        </table>
</cfif>