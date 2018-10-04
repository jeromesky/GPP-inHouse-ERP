<cfinclude template="../Application.cfm">
<CFQUERY datasource="#gpp#" Name="result">
 	SELECT 
    IngIndividual_ID AS id, 
    strFirst_Name AS name, 
    strSurname AS surname, 
    strEmail AS emailAddr 
  FROM 
    tblIndividual
 	WHERE 
    strFirst_Name LIKE '%#form.name#%' 
    OR 
    strSurname LIKE '%#form.name#%'
 	 Order By 
 	 name
 </CFQUERY>
 <div style="height:300px; overflow:auto">
 <table width="100%" border="0" cellspacing="0" cellpadding="3" style="color:#333333">
  <tr>
    <td colspan="5"><cfoutput>#result.recordcount#</cfoutput> results</td>
  </tr>
<cfoutput QUERY="result">
  <tr onMouseOver="style.backgroundColor='##c2eeff';" onMouseOut="style.backgroundColor='##F2F2F2';">
    <td>#result.name#</td>
    <td>#result.surname#</td>
    <td>#result.emailAddr#</td>
    <td width="20"><input type="checkbox" name="userid" id="userid" value="#result.id#" onClick="javascript:loadevents(#result.id#)"></td>
    <td width="40"></td>
  </tr></cfoutput>  
</table>
</div>