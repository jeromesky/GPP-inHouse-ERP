<cfset gpp = "GPP">
<cfparam name='url.searching' default='desc'>
<cfquery name="qryTotal" datasource="#gpp#">
   SELECT count(*) AS total
FROM
    dbo.tblIndividual 
WHERE
    (dbo.tblIndividual.branchID IN (-13,-113, -12,-112, -11,-111, -10)) 
AND 
	(dbo.tblIndividual.active = 1) 
AND 
	(dbo.tblIndividual.chkMail <> 1) 
AND 
	dbo.tblIndividual.companyID NOT IN (0) 
</cfquery>

<cfquery name="qryCompany" datasource="#gpp#">
   SELECT TOP 1
    dbo.tblIndividual.companyID
FROM
    dbo.tblIndividual INNER JOIN dbo.Countries 
    ON dbo.tblIndividual.countryID = dbo.Countries.countryID INNER JOIN dbo.companies 
    ON dbo.tblIndividual.companyID = dbo.companies.companyID 
WHERE
    (dbo.tblIndividual.branchID IN (-13,-113, -12,-112, -11,-111, -10)) 
AND 
	(dbo.tblIndividual.active = 1) 
AND 
	(dbo.tblIndividual.chkMail <> 1) 
AND 
	dbo.tblIndividual.companyID NOT IN (0) 
AND 
	dbo.companies.companyName  NOT Like '- %'<!------>
GROUP BY
    dbo.tblIndividual.companyID 
   , dbo.companies.companyName 
ORDER BY
    dbo.companies.companyName #url.searching#<!------>
</cfquery>

<cfquery name="qryUserAddress" datasource="#gpp#">
SELECT     TOP (100) dbo.companyAKA.AKA_companyName, dbo.companies.companyName, dbo.tblIndividual.strStreet_Adress, 
                      dbo.tblIndividual.strPostal_Adress, dbo.tblIndividual.intCode, dbo.Countries.countryNameEN, dbo.Cities.CityNameEN, dbo.tblIndividual.Addr_State, 
                      dbo.tblIndividual.__chkCore_Client, dbo.tblIndividual.strFirst_Name, dbo.tblIndividual.strSurname, dbo.tblIndividual.IngIndividual_ID AS userID, 
                      dbo.tblIndividual.countryID, 
                      CASE WHEN dbo.tblIndividual.AreaCodeTelSwitch <> '' THEN dbo.tblIndividual.AreaCodeTelSwitch ELSE dbo.tblIndividual.strPhSwitchboard_Code END AS
                       AreaCodeTelSwitch, dbo.tblIndividual.strPhSwitchboard_No, 
                      CASE WHEN dbo.tblIndividual.AreaCodeFaxSwitch <> '' THEN dbo.tblIndividual.AreaCodeFaxSwitch ELSE dbo.tblIndividual.strFaxSwitchboard_Code END
                       AS AreaCodeFaxSwitch, dbo.tblIndividual.strFaxSwitchBoard_No, dbo.Countries.countryPhoneCode, dbo.tblIndividual.companyID, 
                      dbo.tblIndividual.countryID AS Expr1, dbo.tblIndividual.cityID, dbo.tblIndividual.chkMail, dbo.tblCompany.strCompany_Name
FROM         dbo.companies INNER JOIN
                      dbo.tblIndividual ON dbo.companies.companyID = dbo.tblIndividual.companyID INNER JOIN
                      dbo.companyAKA ON dbo.tblIndividual.AKA_companyID = dbo.companyAKA.AKA_companyID LEFT OUTER JOIN
                      dbo.tblCompany ON dbo.tblIndividual.lngCompany_ID = dbo.tblCompany.IngCompany_ID LEFT OUTER JOIN
                      dbo.Cities ON dbo.tblIndividual.cityID = dbo.Cities.CityId LEFT OUTER JOIN
                      dbo.Countries ON dbo.tblIndividual.countryID = dbo.Countries.countryID
WHERE 
   dbo.tblIndividual.companyID = #qryCompany.CompanyID#
  AND
<!---    dbo.tblIndividual.countryID = #url.searchingCountryID#
    AND--->
    dbo.tblIndividual.active = 1
    AND 
	(dbo.tblIndividual.chkMail <> 1) 
    AND
        (dbo.tblIndividual.branchID IN (-13,-113, -12,-112, -11,-111, -10)) 
  and dbo.tblIndividual.companyID not in (0)
ORDER BY dbo.tblIndividual.strStreet_Adress DESC
</cfquery>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>.</title>
<style type="text/css">
body{font-family:Arial, Helvetica, sans-serif; font-size:12px}
.user{ clear:both; left:0px; width:600px; float:left; padding:10px; margin-bottom:10px}
#action{ padding:10px;  }
.labe{clear:both; float:left; width:100px; margin:2px 0px; color:#666; font-size:11px; padding-left:10px; margin-right:10px; }
.data{float:left;  margin-left:10px; margin:2px 0px; width:420px; padding-left:10px}
.dataNew{float:left;  margin-left:10px; margin:5px 0px; width:200px}
.ticker { float:left; width:20px}
.ticker input{ float:left}
hr{clear:both; color:#CCC; background-color:#CCC; border:1px dotted #CCC; height:1px; margin:4px 0px}
.country, .city {color:#666}
.address { }
#col1{clear:both; float:left; width:630px;  }
#col2{float:left; width:400px;  }
.seconRow {background-color:#eff9ff}
.ui-widget-content{ background:none none none none none}
input[type="text"], input[type="textarea"], textarea{ width:220px}
.streetaddress{ background-color:#bca1d0}
.postaladdress{ background-color:#58a90f}
.areaCode{ background-color:#e0e0e0}
.phoneCode{ background-color:#c5c4c4}
.streetAddress:first-letter, .postalAddress:first-letter {
  text-transform: uppercase;
}
</style>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery1.4.js" ></script>
<link type="text/css" href="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.css" rel="stylesheet" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.min.js"></script>
</head>

<body>
<cfoutput >(#qryTotal.total#)</cfoutput>

<div id="col1">
	<cfoutput query="qryUserAddress">
<div class="user ui-corner-all ui-widget ui-widget-content">
  <span class="labe ui-corner-all ui-widget ui-widget-content">Name</span> 
  <span class="data">
  		<span class="address">#Lcase(qryUserAddress.strFirst_Name)# </span>
  </span>
   <span class="labe ui-corner-all ui-widget ui-widget-content">sureName</span> 
  <span class="data">
  		<span class="address">#Lcase(qryUserAddress.strSurname)#</span>
  </span>
        <span class="labe ui-corner-all ui-widget ui-widget-content">Original company</span> 
  <span class="data">
  		<span class="address">#Lcase(qryUserAddress.strCompany_Name)#</span>
  </span> 
      <span class="labe ui-corner-all ui-widget ui-widget-content">company</span> 
  <span class="data">
  		<span class="address">#Lcase(qryUserAddress.companyName)#</span>
  </span> 
     <span class="labe ui-corner-all ui-widget ui-widget-content">label</span> 
  <span class="data">
  		<span class="address">#Lcase(qryUserAddress.AKA_companyName)#</span>
  </span>
	<hr />
	     <span class="labe ui-corner-all ui-widget ui-widget-content">to this company</span> 
  <span class="data">
  		<span class="address">
         <b>search</b>
            <i class="NoFormat"><cf_companies_search open="4" random="#RandRange(2011, 6044)#" idName="newCompanyID"></i>
            <input type="hidden" id="newCompanyID">
        </span>
  </span>

</div>
</cfoutput>
</div>
</body>
</html>