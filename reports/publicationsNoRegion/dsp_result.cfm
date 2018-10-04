<div id="total" style="background-color:#CCC; padding:10px 10px 8px 15px">
Total: <cfoutput>#qryResult.recordcount#</cfoutput>
</div>   
<!--- <cfdump var="#qryResult#"> --->
 
 <table width="100%">
 <cfoutput query="qryResult">
 	<tr>
        <td>#qryResult.branchName#</td>
        <td>#qryResult.contactName#</td>
        <td>#qryResult.contactEmail#</td>
        <cfif url.publicationURL EQ 1>
        <td>#qryResult.publicationURL#</td>
        </cfif>
        <cfif url.branchUserName EQ 1>
        <td>#qryResult.branchUserName#</td>
        </cfif>
        <cfif url.branchPassword EQ 1>
        <td>#qryResult.branchPassword#</td>
        </cfif>
   </tr></cfoutput>
</table>
       