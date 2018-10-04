 <table width="100%">
 <cfoutput query="qryResult">
 	<tr>
        <td>#qryResult.userID#</td>
        <td>#qryResult.userTitle#</td>
        <td>#qryResult.userName#</td>
        <td>#qryResult.userSurname#</td>
        <td>#qryResult.userPossition#</td>
        <td>#qryResult.userCompanyName#</td>
         <td>#qryResult.address#</td>
        <td>#qryResult.City#</td>
        <td>#qryResult.postCode#</td>
        <td>#qryResult.Country#</td>
   </tr></cfoutput>
</table>
       