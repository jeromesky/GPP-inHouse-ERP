<table width="100%">
 <cfoutput query="qryResult" group="userCompanyName">
	<tr>
    	<td colspan="2" class="company">#Ucase(qryResult.userCompanyName)#</td>
    </tr>
    <cfoutput>
 	<tr>
    	<cfif url.Title EQ 1>
    	<td>#qryResult.userTitle#</td>
        </cfif>
        <td>#qryResult.userName# #qryResult.userSurname#</td>
        <td>#qryResult.userPossition#</td>
        <cfif url.email EQ 1>
        <td>#qryResult.userEmail#</td>
        </cfif>
        <cfif url.email_sec EQ 1>
        <td>#qryResult.userSecrEmail#</td>
        </cfif>
        <cfif url.address EQ 1>
        <td>#qryResult.address#</td>
        </cfif>
        <cfif url.city EQ 1>
        <td>#qryResult.streetCity# #qryResult.postCity#</td>
        </cfif>
        <cfif url.zip EQ 1>
        <td>#qryResult.StreetCode# #qryResult.PostalCode#</td>
        </cfif>
        <cfif url.country EQ 1>
        <td>#qryResult.streetCountry# #qryResult.postCountry#</td>
        </cfif>
        <cfif url.phone EQ 1>
        <td>#qryResult.userPhone#</td>
        </cfif>
        <cfif url.mobile EQ 1>
        <td>#qryResult.userMobil#</td>
        </cfif>
        <cfif url.paid EQ 1>
        <td>#qryResult.paid#</td>
        </cfif>
        <cfif url.invoiceNo EQ 1>
        <td>#qryResult.invoiceNo#</td>
        </cfif>
        <cfif url.Comment_Public EQ 1>
        <td>#qryResult.invoiceComment#</td>
        </cfif>
   </tr></cfoutput></cfoutput>
</table>
        