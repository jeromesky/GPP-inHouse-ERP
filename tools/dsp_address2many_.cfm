<cfset gpp = "GPP">

<cfparam name='url.searching' default='desc'>
<cfparam name='url.searchingCountryID' default='0'>
<cfparam name='url.searchingCompanyID' default='0'>

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
	dbo.tblIndividual.companyID NOT IN (6003,0,7803,7804,7805,7806,7807,7808,7809,7810,7811) 
</cfquery>

<cfquery name="qryCompany" datasource="#gpp#">
   SELECT TOP 1
    dbo.tblIndividual.companyID
FROM         dbo.tblIndividual INNER JOIN
                      dbo.companies ON dbo.tblIndividual.companyID = dbo.companies.companyID LEFT OUTER JOIN
                      dbo.Countries ON dbo.tblIndividual.countryID = dbo.Countries.countryID
WHERE
    (dbo.tblIndividual.branchID IN (-13,-113, -12,-112, -11,-111, -10)) 
AND 
	(dbo.tblIndividual.active = 1) 
AND 
	(dbo.tblIndividual.chkMail <> 1) 
AND 
	dbo.tblIndividual.companyID NOT IN (6003,0,7803,7804,7805,7806,7807,7808,7809,7810,7811) 
    AND 
  (  dbo.tblIndividual.companyID IS NOT NULL OR dbo.tblIndividual.companyID <> '')
<!--- AND 
	dbo.companies.companyName  NOT Like '- %' --->
GROUP BY
    dbo.tblIndividual.companyID 
   , dbo.companies.companyName 
ORDER BY
    dbo.companies.companyName #url.searching#
</cfquery>
<!--- <cfdump var="#qryCompany#"> --->

<cfquery name="qryCompanyCountry" datasource="#gpp#">
SELECT top 100
    dbo.tblIndividual.companyID 
   , dbo.Countries.countryNameEN
   , dbo.tblIndividual.countryID  
   , dbo.companies.companyName 
FROM         dbo.tblIndividual INNER JOIN
                      dbo.companies ON dbo.tblIndividual.companyID = dbo.companies.companyID LEFT OUTER JOIN
                      dbo.Countries ON dbo.tblIndividual.countryID = dbo.Countries.countryID
WHERE
    (dbo.tblIndividual.branchID IN (-13,-113, -12,-112, -11,-111, -10)) 
AND 
	(dbo.tblIndividual.active = 1) 
AND 
	(dbo.tblIndividual.chkMail <> 1) 
AND 
	dbo.tblIndividual.companyID NOT IN (6003,0,7803,7804,7805,7806,7807,7808,7809,7810,7811)
<!---AND 
	dbo.companies.companyName  NOT Like '- %'	--->
AND
	dbo.tblIndividual.companyID = #qryCompany.CompanyID#
GROUP BY
    dbo.tblIndividual.companyID 
   , dbo.tblIndividual.countryID 
   , dbo.Countries.countryNameEN 
   , dbo.companies.companyName 
ORDER BY
    dbo.companies.companyName DESC 
   , dbo.Countries.countryNameEN DESC
</cfquery>
<!--- <cfdump var="#qryCompanyCountry#"> --->

<cfquery name="qryUserAddress" datasource="#gpp#">
SELECT top 100   
  dbo.companyAKA.AKA_companyName
  , dbo.companies.companyName
  , dbo.tblIndividual.strStreet_Adress
  , dbo.tblIndividual.strPostal_Adress
  ,dbo.tblIndividual.intCode
  , dbo.Countries.countryNameEN
  , dbo.Cities.CityNameEN
  , dbo.tblIndividual.Addr_State
  , dbo.tblIndividual.__chkCore_Client
  , dbo.tblIndividual.strFirst_Name
  , dbo.tblIndividual.strSurname
  , dbo.tblIndividual.IngIndividual_ID AS userID
  ,dbo.tblIndividual.countryID
  ,CASE WHEN dbo.tblIndividual.AreaCodeTelSwitch <> '' THEN dbo.tblIndividual.AreaCodeTelSwitch ELSE dbo.tblIndividual.strPhSwitchboard_Code END AS AreaCodeTelSwitch
  ,dbo.tblIndividual.strPhSwitchboard_No
  ,CASE WHEN dbo.tblIndividual.AreaCodeFaxSwitch <> '' THEN dbo.tblIndividual.AreaCodeFaxSwitch ELSE dbo.tblIndividual.strFaxSwitchboard_Code END AS AreaCodeFaxSwitch
  ,dbo.tblIndividual.strFaxSwitchBoard_No 
  ,dbo.Countries.countryPhoneCode
  ,dbo.tblIndividual.companyID
  ,dbo.tblIndividual.countryID
  ,dbo.tblIndividual.cityID
  ,dbo.tblIndividual.chkmail
FROM         dbo.companies INNER JOIN
                      dbo.tblIndividual ON dbo.companies.companyID = dbo.tblIndividual.companyID LEFT OUTER JOIN
                      dbo.companyAKA ON dbo.tblIndividual.AKA_companyID = dbo.companyAKA.AKA_companyID LEFT OUTER JOIN
                      dbo.Cities ON dbo.tblIndividual.cityID = dbo.Cities.CityId LEFT OUTER JOIN
                      dbo.Countries ON dbo.tblIndividual.countryID = dbo.Countries.countryID
WHERE 
   dbo.tblIndividual.companyID = #qryCompany.CompanyID#
  AND
    dbo.tblIndividual.countryID = #url.searchingCountryID#
    AND
    dbo.tblIndividual.active = 1
    AND 
	(dbo.tblIndividual.chkMail <> 1) 
    AND
        (dbo.tblIndividual.branchID IN (-13,-113, -12,-112, -11,-111, -10)) 
  and dbo.tblIndividual.companyID not in (0,7803,7804,7805,7806,7807,7808,7809,7810,7811)
ORDER BY dbo.tblIndividual.strStreet_Adress DESC
</cfquery>

<!---<cfdump var="#qryUserAddress#">--->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery1.4.js" ></script>
<link type="text/css" href="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.css" rel="stylesheet" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.min.js"></script>

<script type="text/javascript">
$(document).ready(function() { 	
	var $scrollingDiv = $("#action");
		$(window).scroll(function(){			
			$scrollingDiv.stop().animate({"marginTop": ($(window).scrollTop() - 0) + "px"}, "fast" );			
		});

		$(".moveDate").change(function(){
			var getData = $(this).val();
			var getField = $(this).attr("alt");
			
			if ( getField == 'streetCityID' || getField == 'postalCityID' || getField == 'streetCountryID' || getField == 'postalCountryID' ){
				var get_DataAlt = $(this).attr("title");
			var cleanFieldName = getField.replace('ID', '');<!---	--->
				alert(cleanFieldName + ": " + get_DataAlt );
			$("#"+cleanFieldName).html(get_DataAlt);  <!---	cleanFieldName + ": " +--->
			}
			$("#"+getField).val(getData);
		});
		
		$("#manyForm").submit(function() {
				var isChecked = $('.userID').is(':checked');
 				if ($('.userID').is(':checked') ){
						
				} else{
					alert("select a user first");
					return false	
				}
		});
});
</script>

<title>Branch Creation Interface v2</title>
</head>

<body>
 <cfoutput>total to go ( #qryTotal.total# ) (#qryCompany.companyID#)</cfoutput><hr>
<cfoutput query="qryCompanyCountry" group="CompanyName">#CompanyName#  ::<cfoutput>
<a href="?&searching=#url.searching#&searchingCompanyID=#companyID#&searchingCountryID=#countryID#">#countryNameEN#</a> - </cfoutput>
</cfoutput><hr>

<form action="../tools/qry_address2Branch2many.cfm" method="post" id="manyForm">
<div id="col1">
	
 <cfoutput query="qryUserAddress">
<div class="user ui-corner-all ui-widget ui-widget-content"<cfif currentRow Mod 2>style="background:none; background-color:##d8f0ff"</cfif>>
 
 	<span class="labe ui-corner-all ui-widget ui-widget-content"><cfif qryUserAddress.chkmail NEQ 1>user<cfelse><font color="red">USER - no post</font></cfif></span>
  <span class="data ui-corner-all ui-widget ui-widget-content">#Lcase(qryUserAddress.strFirst_Name)# #Lcase(qryUserAddress.strSurname)# (#Lcase(qryUserAddress.AKA_companyName)#) #Lcase(qryUserAddress.companyName)#</span>
  <span class="ticker">
  	<!---	<input type="hidden" name="userID" value="#qryUserAddress.userID#"/>--->
  	<input type="checkbox" name="userID" class="userID" value="#qryUserAddress.userID#" /> 
  </span>
					<hr />
  <span class="labe ui-corner-all ui-widget ui-widget-content">switch phone</span>
  <span class="data">
  		<span class="address">#qryUserAddress.countryPhoneCode# #qryUserAddress.AreaCodeTelSwitch# #qryUserAddress.strPhSwitchboard_No#</span>
  </span>
  <span class="ticker areaCode">
  		<input type="checkbox" class="moveDate" alt="branchAreaPhone" title="copy data to phone code" value="#qryUserAddress.AreaCodeTelSwitch#" />
 </span>
 <span class="ticker phoneCode">
  		<input type="checkbox" class="moveDate" alt="branchPhoneNo" title="copy data to phone number" value="#qryUserAddress.strPhSwitchboard_No#" />
 </span>
  <span class="labe ui-corner-all ui-widget ui-widget-content">switch fax</span> 
  <span class="data">
  		<span class="address">#qryUserAddress.countryPhoneCode# #qryUserAddress.AreaCodeFaxSwitch# #qryUserAddress.strFaxSwitchBoard_No#</span>
  </span>
  <span class="ticker areaCode">
  		<input type="checkbox" class="moveDate" alt="branchAreaFax" title="copy data to street field" value="#qryUserAddress.AreaCodeFaxSwitch#" />
 </span>
 <span class="ticker phoneCode">
  		<input type="checkbox" class="moveDate" alt="branchFaxNo" title="copy data to street field" value="#qryUserAddress.strFaxSwitchBoard_No#" />
 </span>
 <hr />
  <span class="labe ui-corner-all ui-widget ui-widget-content">street address</span>
  <span class="data">
  		<span class="address">#Lcase(qryUserAddress.strStreet_Adress)#</span>
  </span>
  <span class="ticker streetaddress">
  <input type="checkbox" class="moveDate" alt="streetAddress" title="copy data to street field" value="#Lcase(qryUserAddress.strStreet_Adress)#" />
 </span>
 <span class="ticker postaladdress">
 <input type="checkbox" class="moveDate" alt="postalAddress" title="copy data to postal field" value="#Lcase(qryUserAddress.strStreet_Adress)#" />
  </span>
  
  <span class="labe ui-corner-all ui-widget ui-widget-content">city</span>
  <span class="data">  
 <span class="city">#qryUserAddress.CityNameEN#</span>			
  </span>
    <span class="ticker streetaddress">
  <input type="checkbox" class="moveDate" alt="streetCityID" title="#qryUserAddress.CityNameEN#" value="#qryUserAddress.cityID#" />
 </span>
 <span class="ticker postaladdress">
 <input type="checkbox" class="moveDate" alt="postalCityID" title="#qryUserAddress.CityNameEN#" value="#qryUserAddress.cityID#" />
  </span>
  
  <span class="labe ui-corner-all ui-widget ui-widget-content">region</span>
  <span class="data">
 <span class="state">#Lcase(qryUserAddress.Addr_State)#</span>
 </span>
 <cfif qryUserAddress.countryID NEQ 253>
 <span class="ticker streetaddress">
  		<input type="checkbox" class="moveDate" alt="streetRegionName" title="copy data to region field" value="#Lcase(qryUserAddress.Addr_State)#" />
   </span>
 <span class="ticker postaladdress">
 <input type="checkbox" class="moveDate" alt="postalRegionName" title="copy data to region field" value="#Lcase(qryUserAddress.Addr_State)#" />
  </span>
  </cfif>
  
  <span class="labe ui-corner-all ui-widget ui-widget-content">zip</span>
  <span class="data">
  		<span class="zip">#qryUserAddress.intCode#</span>
  </span>
  
  <span class="ticker streetaddress">
  		<input type="checkbox" class="moveDate" alt="StreetCode" title="copy data to zip field" value="#Lcase(qryUserAddress.intCode)#" />
  </span>
 <span class="ticker postaladdress">
 <input type="checkbox" class="moveDate" alt="PostalCode" title="copy data to zip field" value="#Lcase(qryUserAddress.intCode)#" />
  </span>
 
  <span class="labe ui-corner-all ui-widget ui-widget-content">country</span>
  <span class="data">   
 <span class="country">#qryUserAddress.countryNameEN#</span>
  </span>
<!---   <span class="ticker streetaddress ">
  <input type="checkbox" class="moveDate" alt="streetCountryID" title="#qryUserAddress.countryNameEN#" value="#qryUserAddress.countryID#" />
 </span>
 <span class="ticker postaladdress">
 <input type="checkbox" class="moveDate" alt="postalCountryID" title="#qryUserAddress.countryNameEN#" value="#qryUserAddress.countryID#" />
  </span>--->
  <hr />

  <span class="labe ui-corner-all ui-widget ui-widget-content">postal address</span>
  <span class="data">
  		<span class="address">#Lcase(qryUserAddress.strPostal_Adress)#</span>
  </span>
  <span class="ticker postaladdress">
  		<input type="checkbox" class="moveDate" alt="postalAddress" title="copy data to street field" value="#Lcase(qryUserAddress.strPostal_Adress)#" />
  </span>
 <span class="ticker streetaddress">
 <input type="checkbox" class="moveDate" alt="streetAddress" title="copy data to postal field" value="#Lcase(qryUserAddress.strPostal_Adress)#" />
  </span>
  
  <span class="labe ui-corner-all ui-widget ui-widget-content">city</span>
  <span class="data">  
 <span class="city">#qryUserAddress.CityNameEN#</span>			
  </span>
      <span class="ticker postaladdress">
  <input type="checkbox" class="moveDate" alt="postalCityID" title="#qryUserAddress.CityNameEN#" value="#qryUserAddress.cityID#" />
 </span>
 <span class="ticker streetaddress">
 <input type="checkbox" class="moveDate" alt="streetCityID" title="#qryUserAddress.CityNameEN#" value="#qryUserAddress.cityID#" />
  </span>
  <span class="labe ui-corner-all ui-widget ui-widget-content">region</span>
  <span class="data">
 <span class="state">#Lcase(qryUserAddress.Addr_State)#</span>
 </span>
 <cfif qryUserAddress.countryID NEQ 253>
 <span class="ticker postaladdress">
  		<input type="checkbox" class="moveDate" alt="postalRegionName" title="copy data to region field" value="#Lcase(qryUserAddress.Addr_State)#" />
  </span>
 <span class="ticker streetaddress">
 <input type="checkbox" class="moveDate" alt="streetRegionName" title="copy data to region field" value="#Lcase(qryUserAddress.Addr_State)#" />
  </span></cfif>
  <span class="labe ui-corner-all ui-widget ui-widget-content">zip</span>
  <span class="data">
  		<span class="zip">#qryUserAddress.intCode#</span>
  </span>
  <span class="ticker postaladdress">
  		<input type="checkbox" class="moveDate" alt="PostalCode" title="copy data to zip field" value="#Lcase(qryUserAddress.intCode)#" />
  </span>
 <span class="ticker streetaddress">
 <input type="checkbox" class="moveDate" alt="StreetCode" title="copy data to zip field" value="#Lcase(qryUserAddress.intCode)#" />
  </span>
 
  <span class="labe ui-corner-all ui-widget ui-widget-content">country</span>
  <span class="data">   
 <span class="country">#qryUserAddress.countryNameEN#</span>
  </span>
 </div>
<!--- <span class="ticker postaladdress">
  <input type="checkbox" class="moveDate" alt="postalCountryID" title="#qryUserAddress.countryNameEN#" value="#qryUserAddress.countryID#" />
 </span>
 <span class="ticker streetaddress">
 <input type="checkbox" class="moveDate" alt="streetCountryID" title="#qryUserAddress.countryNameEN#" value="#qryUserAddress.countryID#" />
  </span> --->
  <div style="clear:both"></div></cfoutput>
 </div>

 <div id="col2"><cfoutput>
 <cfif url.searchingCountryID NEQ 0 AND url.searchingCompanyID NEQ 0>

  <div id="action" class=" ui-corner-all ui-widget ui-widget-content">
  </div>
 
 </cfif>
 <div id="action" class=" ui-corner-all ui-widget ui-widget-content"><!---style="background:none; background-color:##ecfff6; "--->
  <fieldset class="ui-corner-all" style=" background-color:##e0e0e0">
  <legend class="ui-corner-all" style="background-color:##e0e0e0">Switchboard details</legend>
  	<span class="labe ui-corner-all ui-widget ui-widget-content">phone</span>
 <span class="dataNew city">
 		<input maxlength="30" style="width:45px" TYPE="text" class="countryCode ui-corner-all" value="#qryUserAddress.countryPhoneCode#" disabled="disabled" /> 
 <input maxlength="6" class="ui-corner-all" style="width:45px" TYPE="text" id="branchAreaPhone" name="branchAreaPhone" />
 <input type="text" class="ui-corner-all" id="branchPhoneNo" name="branchPhoneNo" style="width:75px" maxlength="10"/>
 </span>
      <span class="labe ui-corner-all ui-widget ui-widget-content">fax</span>
 <span class="dataNew city">
 		<input maxlength="30"  style="width:45px"  TYPE="text" class="countryCode ui-corner-all" value="#qryUserAddress.countryPhoneCode#" disabled="disabled" /> 
 <input maxlength="6" class="ui-corner-all" style="width:45px"  TYPE="text"  id="branchAreaFax" name="branchAreaFax" />
 <input type="text" class="ui-corner-all" id="branchFaxNo" name="branchFaxNo" style="width:75px" maxlength="10"/>
 </span>
  </fieldset>
 	<fieldset class="ui-corner-all" style="background-color:##bca1d0">
  	<legend class="ui-corner-all" style="background-color:##bca1d0">Street details</legend>
      <span class="labe ui-corner-all ui-widget ui-widget-content">address</span>
 <span class="dataNew">
     <textarea name="streetAddress" id="streetAddress" class="ui-corner-all streetAddress" rows="4"></textarea>
 </span>
 <span class="labe ui-corner-all ui-widget ui-widget-content">city</span>
 <span class="dataNew city" id="streetCity">#qryUserAddress.CityNameEN#</span>
 	<input type="hidden" name="streetCityID" id="streetCityID" value="#qryUserAddress.cityID#" />
      <span class="labe ui-corner-all ui-widget ui-widget-content">region</span>
 <span class="dataNew">
     <input type="text" name="streetRegionName" id="streetRegionName" class="ui-corner-all" />
 </span>
 <span class="labe ui-corner-all ui-widget ui-widget-content">code/zip</span>
 <span class="dataNew">
     <input type="text" name="StreetCode" id="StreetCode" class="ui-corner-all"  />
 </span>
 <span class="labe ui-corner-all ui-widget ui-widget-content">country</span>
 <span class="dataNew city" id="streetCountry">#qryUserAddress.countryNameEN#</span>
 <input type="hidden" name="streetCountryID" id="streetCountryID" />
      </fieldset>    
 <fieldset class="ui-corner-all" style="  background-color:##58a90f">
 	<legend class="ui-corner-all" style="background-color:##58a90f">Postal details</legend>
      <span class="labe ui-corner-all ui-widget ui-widget-content">address</span>
 <span class="dataNew">
     <textarea name="postalAddress" id="postalAddress" class="ui-corner-all postalAddress" rows="4"></textarea>
 </span>
 <span class="labe ui-corner-all ui-widget ui-widget-content">city</span>
 <span class="dataNew City" id="postalCity">#qryUserAddress.CityNameEN#</span>
  <input type="hidden" name="postalCityID" id="postalCityID" value="#qryUserAddress.cityID#" />
 
      <span class="labe ui-corner-all ui-widget ui-widget-content">region</span>
 <span class="dataNew">
     <input type="text" name="postalRegionName" id="postalRegionName" class="ui-corner-all" />
 </span>
 <span class="labe ui-corner-all ui-widget ui-widget-content">code/zip</span>
 <span class="dataNew">
     <input type="text" name="PostalCode" id="PostalCode" class="ui-corner-all" />
 </span>
 <span class="labe ui-corner-all ui-widget ui-widget-content">country </span>
 <span class="dataNew city" id="postalCountry">#qryUserAddress.countryNameEN#</span>
 <input type="hidden" name="postalCountryID" id="postalCountryID" />
  </fieldset>
  <fieldset class="ui-corner-all" style="margin-top:10px; background-color:##7da1dc">
  	<span class="labe ui-corner-all ui-widget ui-widget-content">import nothing</span>
 <span class="dataNew city"><input type="checkbox" value="1" name="noCreate" /></span>
      <span class="labe"></span>
 <span class="dataNew city">
 		<button class="ui-corner-all ui-widget" id="">Create Branch Record</button>
      		<input type="hidden" name="companyID" value="#qryUserAddress.companyID#" />
     <input type="hidden" name="countryID" value="#qryUserAddress.countryID#" />
     <input type="hidden" name="URLsearching" value="#url.searching#" />
     <input type="hidden" name="URLsearchingCompanyID" value="#url.searchingCompanyID#" />
     <input type="hidden" name="URLsearchingCountryID" value="#url.searchingCountryID#" /> 
      </span>
  </fieldset></cfoutput>
			<div style="clear:both"></div>
			</div>
</div>
</form>
</body>
</html>