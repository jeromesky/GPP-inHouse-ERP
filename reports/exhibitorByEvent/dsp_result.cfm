<!--- <div id="total" style="background-color:#CCC; padding:10px 10px 8px 15px">
Total: <cfoutput>#qryResult.recordcount#</cfoutput>
</div>   
<cfdump var="#qryResult#"> --->
 
 <table width="100%" style="font-family:Arial, Helvetica, sans-serif; color:#666; font-size:12px">
 <cfoutput query="qryResult">
 	<tr>
        <td>#qryResult.AKA_companyName#</td>
        <td>#currencyCode# #numberFormat(contractCost, "---------")#</td>
        <td>#qryResult.contactName#</td>
        <td>#qryResult.contactEmail#</td>
        <td>#companyBios#</td>
   </tr></cfoutput>
</table>
       