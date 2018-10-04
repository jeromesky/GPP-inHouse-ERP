<cfquery datasource="#gppData#" name="get" >
SELECT  [city]
      ,[state]
      ,[country]
      ,[streetAddress]
      ,[postAddress]
      ,[STATUS]
      ,[userID]
      ,[companyID]
      ,[Zip]
  FROM [TEMP_branche_address]
  WHERE companyID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID#">
  </cfquery>
<table border="0" cellpadding="2" cellspacing="0" id="tableList">
	<tr>
    	<td>Street address</td>
        <td>postall address</td>
        <td>City</td>
        <td>Zip</td>
        <td>Country</td>
        <td>merge</td>
    </tr>
<cfoutput query="get">
	<tr>
    	<td>#get.streetAddress#</td>
        <td>#get.postAddress#</td>
        <td>#get.city#</td>
        <td>#get.Zip#</td>
        <td>#get.country#</td>
        <td>X</td>
    </tr>
</cfoutput>
</table>