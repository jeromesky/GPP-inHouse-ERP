<cfinclude template="../application.cfm">
<!----<cftry>--->
<cfquery datasource="#dsnP21#" name="get">
 	select id,  title, name, surname, hposition AS position, company, country, city, gemail, transdate
	from Registrations
    WHERE eventid LIKE '%#form.event#%' 
<!---	WHERE  CONTAINS ( eventid, #form.event#  ) > 0--->
order by surname, name
</cfquery>
<cfif get.recordCount eq 0 >
No result found
</cfif>

<table width="100%" border="0" cellspacing="1" cellpadding="4">
	<tr>
    	<td colspan="8">found <cfoutput>#get.recordcount#</cfoutput></td>
    </tr>
<cfoutput query="get">
      <tr onMouseOver="style.backgroundColor='##D8E2F9';style.cursor='hand'" onMouseOut="style.backgroundColor='##ffffff';"  id="rec_#get.id#">
        <td class="searchResultGrid">#get.title#  #get.name#  #get.surname# &nbsp;</td>
        <td  class="searchResultGrid">#get.position#&nbsp;</td>
        <td  class="searchResultGrid">#get.company#&nbsp;</td>
        <td  class="searchResultGrid">#get.country#&nbsp; </td>
        <td  class="searchResultGrid">#get.city#&nbsp;</td>
        <td  class="searchResultGrid"> #get.gemail#&nbsp; </td>
        <td  class="searchResultGrid">#get.transdate#</td>
        <td  class="searchResultGrid"><a href="javascript:deleteRec(#get.id#);">Delete</a></td>
      </tr>
 </cfoutput>
    </table>

<!---<cfoutput query="get">
	
 <cfif get.company EQ "">	
			var options = {
					script:"../New_User/company_Suggest.cfm?json=true&",
					varname:"input",
					json:true,
					minchars: 5,
					timeout: 5500,
					delay: 100,
					callback: function (obj) { document.getElementById('lngCompany_ID_#get.id#').value = obj.id; }
				};
				var as_json = new AutoSuggest('SearchCompany_#get.id#', options);	
</cfif>
</cfoutput>

<cfcatch type="any">
<cfoutput>#cfcatch.Detail#<br>
#cfcatch.Message#<br>
#cfcatch.Type#
</cfoutput>
</cfcatch>
</cftry>--->