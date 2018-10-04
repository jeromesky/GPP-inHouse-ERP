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
        <td>Country&nbsp;</td>
        <td>City&nbsp;</td>
        <td>Email&nbsp;</td>
        <td>Record&nbsp;ID</td>
	</tr></cfif>
<cfoutput query="get"><tr valign="top" onMouseOver="style.backgroundColor='##DEF';style.cursor='hand'" onMouseOut="style.backgroundColor='##ffffff';" onclick="javascript:loadTabs(#get.id#);">
       <td<cfif get.active EQ 1> bgcolor='##9E9'</cfif>><cfswitch expression="#get.active#">
            <cfcase value="0">A</cfcase>
           <cfcase value="1">C</cfcase>
        	</cfswitch></td>
        <td>#get.title# #get.name# #get.surname#</td>
        <td>#get.position#</td>
        <td>#get.label#</td>
        <td>#replace(get.country, ' ', '&nbsp;')#</td>
        <td>#get.city#</td>
        <td>#get.strEmail#</td>
        <td>#get.id#</td>
	</tr></cfoutput>
</table>