<cfinclude template="../Application.cfm" >
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>p21</title>
</head>

<body>
<cfquery datasource="#gppServer#" name="get" >
SELECT     dbo.tblIndividual.IngIndividual_ID AS id
FROM         dbo.tblIndividual INNER JOIN
                      dbo.tblIndOptions ON dbo.tblIndividual.IngIndividual_ID = dbo.tblIndOptions.lngIndividual_ID
WHERE     (dbo.tblIndividual.STATUS = N'C') AND (dbo.tblIndividual.CountryName LIKE N'Angola' OR dbo.tblIndividual.CountryName LIKE N'Botswana'  OR dbo.tblIndividual.CountryName LIKE N'Burundi' OR dbo.tblIndividual.CountryName LIKE N'Comoros' OR dbo.tblIndividual.CountryName LIKE N'Congo' OR dbo.tblIndividual.CountryName LIKE N'Gabon' 
OR dbo.tblIndividual.CountryName LIKE N'Lesotho' 
OR dbo.tblIndividual.CountryName LIKE N'Kenya' 
OR dbo.tblIndividual.CountryName LIKE N'Madagascar' 
OR dbo.tblIndividual.CountryName LIKE N'Mocambique' 
OR dbo.tblIndividual.CountryName LIKE N'Namibia' 
OR dbo.tblIndividual.CountryName LIKE N'Rwanda' 
OR dbo.tblIndividual.CountryName LIKE N'Seychelles' 
OR dbo.tblIndividual.CountryName LIKE N'South Africa' 
OR dbo.tblIndividual.CountryName LIKE N'Swaziland' 
OR dbo.tblIndividual.CountryName LIKE N'Tanzania' 
OR dbo.tblIndividual.CountryName LIKE N'Uganda' 
OR dbo.tblIndividual.CountryName LIKE N'Zambia' 
OR dbo.tblIndividual.CountryName LIKE N'Zimbabwe' 
OR dbo.tblIndividual.CountryName LIKE N'REPUBLIC OF CONGO' 
OR dbo.tblIndividual.CountryName LIKE N'REPUBLIQUE DU CONGO' )

</cfquery>
<cfloop query="get">

	<cfquery datasource="#gppServer#">
     UPDATE tblIndOptions
     SET 
     chkSAENews = 1,
     chkWebIntSAE  = 1
     WHERE lngIndividual_ID = #get.id#
    </cfquery>

</cfloop>
<cfoutput>#get.recordcount#</cfoutput>
</body>
</html>
<!---
   dbo.tblIndividual.strFirst_Name AS name, dbo.tblIndividual.strSurname AS surname, dbo.tblIndividual.strEmail AS email, 
                      dbo.tblIndividual.chkEmail AS NoEmail, dbo.tblIndividual.STATUS, dbo.tblIndividual.IngIndividual_ID AS id, dbo.tblIndOptions.chkWebIntAdvertising, 
                      dbo.tblIndOptions.chkWebIntGen, dbo.tblIndOptions.chkWebIntEu, dbo.tblIndOptions.chkWebIntNa, dbo.tblIndOptions.chkWebIntLa, 
                      dbo.tblIndOptions.chkWebIntNaf, dbo.tblIndOptions.chkWebIntAs, dbo.tblIndOptions.chkWebIntMe, dbo.tblIndOptions.chkWebIntAf, 
                      dbo.tblIndOptions.chkWebIntWo, dbo.tblIndividual.strSecretary_Email AS emailSecretary, dbo.tblIndividual.strEmail_Alt AS emailSecond, 
                      dbo.tblIndividual.CountryName AS country, dbo.tblIndOptions.chkWebIntSAE --->