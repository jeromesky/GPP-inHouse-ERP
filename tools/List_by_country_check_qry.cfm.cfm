

<cfquery datasource="#gpp#" name="qryUsers">
SELECT     TOP (200) 
	namePrefix.namePrefixLabel
    ,companyAKA.AKA_companyName
    ,tblIndividual.strFirst_Name
    ,tblIndividual.strSurname 
    ,tblIndividual.strDesignation
    ,tblIndividual.strEmail
FROM         
	tblIndividual LEFT OUTER JOIN
    companyAKA ON tblIndividual.AKA_companyID = companyAKA.AKA_companyID LEFT OUTER JOIN
    namePrefix ON tblIndividual.prefixID = namePrefix.namePrefixID
WHERE     
	(tblIndividual.countryID = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.countryID#">) AND (tblIndividual.rec_checked IS NULL)
</cfquery>


<table border="0" width="100%">
	<cfoutput query="qryUsers">
	<tr>
    	<td>#namePrefixLabel# #strFirst_Name# #strSurname#</td>
        <td>#strDesignation#</td>
        <td>#AKA_companyName#</td>
        <td>strEmail</td>
    </tr>
    </cfoutput>
 </table>