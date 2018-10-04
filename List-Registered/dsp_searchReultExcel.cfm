<table width="100%" border="0" cellspacing="1" cellpadding="4" id="tableClientSearchResult">
	<tr>
		<td colspan="8" bgcolor="#FAFAFA"><cfif get.recordCount eq 0>No results found
		<cfelse> Found <cfif get.recordCount gte 100>+</cfif><cfoutput>#get.recordcount#</cfoutput> Record<cfif get.recordCount gt 1>s</cfif> <cfif get.recordCount gte 100>- Too many results, please Narrow your search.</cfif></cfif></td>
	</tr><cfif get.recordCount neq 0>
    <tr style="background-color:#CCC">
    	<td></td>
        <td>Title&nbsp;Name&nbsp;Surname</td>
        <td>Position&nbsp;</td>
        <td>Company&nbsp;</td>
        <td>Email&nbsp;</td>
        <td>Phone&nbsp;</td>
        <td>Fax&nbsp;</td>
        <td>Address&nbsp;</td>
        <td>City&nbsp;</td>
        <td>Zip&nbsp;</td>
        <td>country&nbsp;</td>
	</tr></cfif>
<cfoutput query="get"><tr valign="top" onMouseOver="style.backgroundColor='##DEF';style.cursor='hand'" onMouseOut="style.backgroundColor='##ffffff';" onclick="javascript:loadTabs(#get.id#);">
       <td<cfif get.active EQ 1> bgcolor='##9E9'</cfif>><cfswitch expression="#get.active#">
            <cfcase value="0">A</cfcase>
           <cfcase value="1">C</cfcase>
        	</cfswitch></td>
        <td>#get.title# #get.name# #get.surname#</td>
        <td>#get.position#</td>
        <td>#get.label#</td>
        <td>#get.strEmail#</td>
        <td>#get.ph_Code# #get.ph_No#</td>
        <td>#get.fax_Code# #get.fax_No#</td>
        <td>#get.streetAddress#</td>
        <td>#get.CityNameEN#</td>
        <td>#get.StreetCode#</td>
        <td>#get.countryNameEN#</td>
	</tr></cfoutput>
</table>