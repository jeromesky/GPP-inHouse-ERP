

<cfquery datasource="#gpp#" name="get">
        SELECT
           [surName]
          ,[Title]
          ,[companyName]
          ,[countryNameEN]
          ,[CityNameEN]
          ,[userID]
          ,[name]
          ,[position]
          ,[email]
          ,[active]
          ,[contactID]
          ,[company]
      FROM 
        [CRM_Search_client_fromConact]
      WHERE
        [contactID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.contactID#">
</cfquery>



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
<cfoutput query="get">

<tr valign="top" onMouseOver="style.backgroundColor='##DEF';style.cursor='hand'" onMouseOut="style.backgroundColor='##ffffff';"  onclick="javascript:loadTabs(#get.userID#);" >
       <td bgcolor='<cfif get.active EQ 1>##9E9<cfelseif get.active EQ 10>##009edf</cfif>'><cfswitch expression="#get.active#">
            <cfcase value="0">A</cfcase>
           <cfcase value="1">C</cfcase>
      		<cfcase value="10">cont</cfcase>
        	</cfswitch></td>
        <td>#get.title# #get.name# #get.surname#</td>
        <td>#get.position#</td>
        <td>#get.company#</td>
        <td>#replace(get.countryNameEN, ' ', '&nbsp;')#</td>
        <td>#get.CityNameEN#</td>
        <td>#get.email#</td>
        <td>#get.userID#</td>
	</tr></cfoutput>
</table>