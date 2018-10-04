<cfinclude template="qry_users.cfm">

	<table border="0" cellpadding="3" cellspacing="0">
    	<tr>
        	<td class="header">user</td>
            <td class="header">comany</td>
            <td class="header">street address</td>
            <td class="header">postal address</td>
            <td class="header">zip</td>
            <td class="header">city</td>
            <td class="header">country</td>
            
         </tr>
        <cfoutput query="qry_users">
        <tr id="rowNoPost_#qry_users.userID#"  onMouseOver="style.backgroundColor='##DEF';style.cursor='hand'" onMouseOut="style.backgroundColor='##ffffff';" onclick="javascript:noPost(#qry_users.userID#);">
        	<td class="user">#qry_users.strFirst_Name #</td>
            <td class="comapny">#qry_users.companyName#</td>
            <td>#qry_users.strStreet_Adress#</td>
            <td>#qry_users.strPostal_Adress#</td>
            <td>#qry_users.zip#</td>
            <td class="comapny">#qry_users.city#</td>
            <td class="comapny">#qry_users.country#</td>
         </tr>
         </cfoutput>
    </table>