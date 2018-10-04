<cfif get.recordCount eq 0>No results found<cfelse> Found <cfif get.recordCount gte 1000>+</cfif><cfoutput>#get.recordcount#</cfoutput> Record<cfif get.recordCount gt 1>s</cfif> <cfif get.recordCount gt 1000>- Too many results, please narrow your search.</cfif></cfif>

<table width="100%" border="0" cellspacing="1" cellpadding="4" id="tableClientSearchResult" class="sortable">
<cfif get.recordCount neq 0><thead>
    <tr style="background-color:#CCC">
    	<th></th>
        <th>Title&nbsp;Name&nbsp;Surname</th>
        <th>Position&nbsp;</th>
        <th>Company&nbsp;</th>
        <th>Country&nbsp;</th>
        <th>City&nbsp;</th>
        <th>Email&nbsp;</th>
        <th>Record&nbsp;ID</th>
	</tr></thead></cfif>
<cfoutput query="get"><tr valign="top" onMouseOver="style.backgroundColor='##DEF';style.cursor='hand'" onMouseOut="style.backgroundColor='##ffffff';" 
<cfif get.active NEQ 10>onclick="javascript:loadTabs(#get.id#);"<cfelseif get.active EQ 10>onclick="javascript:loadContactUsers(#get.id#);"</cfif>>
     <td bgcolor='<cfif get.active EQ 1>##9E9<cfelseif get.active EQ 10>##009edf</cfif>'><cfswitch expression="#get.active#">
          <cfcase value="0">A</cfcase>
         <cfcase value="1">C</cfcase>
          <cfcase value="10">cont</cfcase>
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