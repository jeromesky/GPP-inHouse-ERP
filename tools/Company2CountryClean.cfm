<cfparam default="a" name="url.searchLetter">
<cfset searchString = "CONSULATE, MINISTERE, CABINET, MINISERO, ENERGIE, CONSULTORIA, CONSULADO, UNIVERSIDADE, UNIVERSITY, UNIVERSIDAD, HIGH COMMISSION, COMMISSION, INSTITUT, INSTITUTE, INSTITUTO, UNIVERSITE, UNIVERSIDADE, UNIVERSITY, ASSOCIATION, ASSOCIACAO, ASSOCIAÇÃO, ASSOCIATION, ASSOCIAION, ASSOCIACAO, Associacao, ASSOCIATED, EMBASSY, TRADE & INVESTMENT, TRADE & INDUSTRY, UNITED NATIONS, TRADE & DEVELOPMENT, TRADE COMMISSION, AGENCY, TRADE & DEVELOPMENT AGENCY, TRADE COUNCIL, TRADE, INDUSTRY & EMPLOYMENT, TRADEX, MINISTRY, TRADE & INDUSTRY, TRADE CENTRE, TRADE & INVESTMENT, STATE TRADE, CAPITAL & TRADE RESOURCES, UNITED NATIONS, INDUSTRY & TRADE, TRADING - COTRADE, TRADE COMÉRCIO INTERNACIONAL, Trade and Industry, TRADE MISSION, Trade & Finance, DEPARTMENT, AGENCIA, NACIONAL, National, AGENCIES, AGENCE, AGENTE, MINES COMMISSION, AGÊNCIA,">

<cfquery datasource="#gpp#" name="qryComapnies">
SELECT  TOP 20
       dbo.tblIndividual.countryID, dbo.tblCompany.strCompany_Name, dbo.tblCompany.IngCompany_ID, dbo.tblCompany.lngHoldingCompany_ID, 
                      dbo.tblIndividual.IngIndividual_ID, dbo.tblIndividual.strFirst_Name, dbo.tblIndividual.strSurname, dbo.tblIndividual.strCity, 
                      dbo.tblIndividual.strStreet_Adress, dbo.tblIndividual.strPostal_Adress, dbo.Countries.countryNameEN
FROM         dbo.tblCompany INNER JOIN

                      dbo.tblIndividual ON dbo.tblCompany.IngCompany_ID = dbo.tblIndividual.lngCompany_ID INNER JOIN

                      dbo.Countries ON dbo.tblIndividual.countryID = dbo.Countries.countryID

WHERE     
1=1 AND
	tblCompany.strCompany_Name LIKE '#url.searchLetter#%' AND
   	tblCompany.strCompany_Name LIKE '%CONSULATE%'  
OR	tblCompany.strCompany_Name LIKE '%MINISTERE%' 
OR	tblCompany.strCompany_Name LIKE '%CABINET%' 
OR	tblCompany.strCompany_Name LIKE '%MINISERO%' 
OR	tblCompany.strCompany_Name LIKE '%ENERGIE%' 
OR	tblCompany.strCompany_Name LIKE '%CONSULTORIA%'   
OR	tblCompany.strCompany_Name LIKE '%CONSULADO%' 
OR	tblCompany.strCompany_Name LIKE '%UNIVERSIDADE%' 
OR	tblCompany.strCompany_Name LIKE '%UNIVERSITY%' 
OR	tblCompany.strCompany_Name LIKE '%UNIVERSIDAD%' 
OR	tblCompany.strCompany_Name LIKE '%HIGH COMMISSION%' 
OR	tblCompany.strCompany_Name LIKE '%COMMISSION%' 
OR	tblCompany.strCompany_Name LIKE '%INSTITUT%' 
OR	tblCompany.strCompany_Name LIKE '%INSTITUTE%' 
OR	tblCompany.strCompany_Name LIKE '%INSTITUTO%' 

OR	tblCompany.strCompany_Name LIKE '%ASSOCIATION%'  
OR	tblCompany.strCompany_Name LIKE '%ASSOCIACAO%'  
OR	tblCompany.strCompany_Name LIKE '%ASSOCIAÇÃO%'  
OR	tblCompany.strCompany_Name LIKE '%ASSOCIATION%'  
OR	tblCompany.strCompany_Name LIKE '%ASSOCIAION%' 
OR	tblCompany.strCompany_Name LIKE '%ASSOCIACAO%'   
OR	tblCompany.strCompany_Name LIKE '%Associacao%' 
OR	tblCompany.strCompany_Name LIKE '%ASSOCIATED%'   
OR	tblCompany.strCompany_Name LIKE '%EMBASSY%' 
<!---OR	tblCompany.strCompany_Name LIKE '%TRADE & INVESTMENT%' 
OR	tblCompany.strCompany_Name LIKE '%TRADE & INDUSTRY%' 
OR	tblCompany.strCompany_Name LIKE '%UNITED NATIONS%' 
OR	tblCompany.strCompany_Name LIKE '%TRADE & DEVELOPMENT%' 
OR	tblCompany.strCompany_Name LIKE '%TRADE COMMISSION%' 
OR	tblCompany.strCompany_Name LIKE '%AGENCY%' 
OR	tblCompany.strCompany_Name LIKE '%TRADE & DEVELOPMENT AGENCY%' 
OR	tblCompany.strCompany_Name LIKE '%TRADE COUNCIL%' 
OR	tblCompany.strCompany_Name LIKE '%TRADE%' INDUSTRY & EMPLOYMENT%' 
OR	tblCompany.strCompany_Name LIKE '%TRADEX%' 
OR	tblCompany.strCompany_Name LIKE '%MINISTRY%' 
OR	tblCompany.strCompany_Name LIKE '% TRADE & INDUSTRY%' 
OR	tblCompany.strCompany_Name LIKE '%TRADE CENTRE%' 
OR	tblCompany.strCompany_Name LIKE '%TRADE & INVESTMENT%' 
OR	tblCompany.strCompany_Name LIKE '%STATE TRADE%' 
OR	tblCompany.strCompany_Name LIKE '%CAPITAL & TRADE RESOURCES%' 
OR	tblCompany.strCompany_Name LIKE '%UNITED NATIONS%' 
OR	tblCompany.strCompany_Name LIKE '%INDUSTRY & TRADE%' 
OR	tblCompany.strCompany_Name LIKE '%TRADING - COTRADE%' 
OR	tblCompany.strCompany_Name LIKE '%TRADE COMÉRCIO INTERNACIONAL%' 
OR	tblCompany.strCompany_Name LIKE '%Trade and Industry%' 
OR	tblCompany.strCompany_Name LIKE '%TRADE MISSION%' 
OR	tblCompany.strCompany_Name LIKE '%Trade & Finance%' 
OR	tblCompany.strCompany_Name LIKE '%DEPARTMENT%' 
OR	tblCompany.strCompany_Name LIKE '%AGENCIA%' 
OR	tblCompany.strCompany_Name LIKE '%NACIONAL%' 
OR	tblCompany.strCompany_Name LIKE '%National%' 
OR	tblCompany.strCompany_Name LIKE '%AGENCIES%' 
OR	tblCompany.strCompany_Name LIKE '%AGENCE%' 
OR	tblCompany.strCompany_Name LIKE '%AGENTE%' 
OR	tblCompany.strCompany_Name LIKE '%MINES COMMISSION%' 
OR	tblCompany.strCompany_Name LIKE '%AGÊNCIA%' --->

</cfquery>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
</head>

<body>
<cfdump var="#qryComapnies#">
</body>
</html>