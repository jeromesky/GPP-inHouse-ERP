<cfset gpp = "GPP">
<cfparam name='url.searching' default='b'>

<cfquery name="qryAlpha" datasource="#gpp#">
  SELECT
    upper(substring(dbo.companies.companyName,1,1)) as alpha,
    count(*) as count
  FROM
    dbo.tblIndividual 
  LEFT JOIN 
    dbo.companies 
        ON dbo.tblIndividual.companyID = dbo.companies.companyID
  WHERE
  (dbo.tblIndividual.branchID < -10 and dbo.tblIndividual.branchID > -100)
  and
   dbo.tblIndividual.active = 1
  and dbo.tblIndividual.chkMail <> 1
  group by substring(dbo.companies.companyName,1,1)
  order by (substring(dbo.companies.companyName,1,1))
</cfquery>

<cfquery name="qryAlphaChoose" datasource="#gpp#">
SELECT top 1  
  dbo.tblIndividual.companyID
FROM   dbo.companies INNER JOIN
    dbo.tblIndividual ON dbo.companies.companyID = dbo.tblIndividual.companyID INNER JOIN
    dbo.companyAKA ON dbo.tblIndividual.AKA_companyID = dbo.companyAKA.AKA_companyID LEFT OUTER JOIN
    dbo.Cities ON dbo.tblIndividual.cityID = dbo.Cities.CityId LEFT OUTER JOIN
    dbo.Countries ON dbo.tblIndividual.countryID = dbo.Countries.countryID
WHERE  
	( dbo.tblIndividual.branchID < -10 and dbo.tblIndividual.branchID > -100)
	AND 
    dbo.companyAKA.AKA_companyName like '#url.searching#' + '%'
    AND
   dbo.tblIndividual.active = 1
   AND
   dbo.tblIndividual.chkMail <> 1
ORDER BY 
  dbo.tblIndividual.strStreet_Adress DESC
</cfquery>

<cfquery name="qryUserAddress" datasource="#gpp#">
SELECT    
  dbo.companyAKA.AKA_companyName
  , dbo.companies.companyName
  , dbo.tblIndividual.strStreet_Adress
  , dbo.tblIndividual.strPostal_Adress
  ,dbo.tblIndividual.intCode
  , dbo.Countries.countryNameEN
  , dbo.Cities.CityNameEN
  , dbo.tblIndividual.Addr_State
  , dbo.tblIndividual.strFirst_Name
  , dbo.tblIndividual.strSurname
  , dbo.tblIndividual.strDesignation
  , dbo.tblIndividual.IngIndividual_ID AS userID
  , dbo.tblIndividual.branchID
  , dbo.tblIndividual.strEmail
FROM   dbo.companies INNER JOIN
    dbo.tblIndividual ON dbo.companies.companyID = dbo.tblIndividual.companyID INNER JOIN
    dbo.companyAKA ON dbo.tblIndividual.AKA_companyID = dbo.companyAKA.AKA_companyID LEFT OUTER JOIN
    dbo.Cities ON dbo.tblIndividual.cityID = dbo.Cities.CityId LEFT OUTER JOIN
    dbo.Countries ON dbo.tblIndividual.countryID = dbo.Countries.countryID
WHERE  
	( dbo.tblIndividual.branchID < -10 and dbo.tblIndividual.branchID > -100)
	AND 
    dbo.tblIndividual.companyID = #qryAlphaChoose.companyID#
    AND
   dbo.tblIndividual.active = 1
   AND
   dbo.tblIndividual.chkMail <> 1
ORDER BY dbo.tblIndividual.strStreet_Adress, dbo.tblIndividual.strPostal_Adress
</cfquery>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery1.4.js" ></script>
<link type="text/css" href="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.css" rel="stylesheet" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>B's Todo list</title>
<style type="text/css">
body{font-family:Arial, Helvetica, sans-serif; font-size:14px}
td{border-bottom:1px solid #CCC; padding:4px 2px}
.hover{background-color:#DEF}

</style>
<script type="text/javascript">
$(document).ready(function() { 	

	$('tr').hover(
        function () {
            $(this).addClass('hover');
        },
        function () {
            $(this).removeClass('hover');
        }
    );

});
</script>
</head>

<body>
<cfoutput query="qryAlpha" group="alpha">
| <a style="text-decoration: none;" href="?searching=#alpha#">#alpha#<cfif url.searching EQ alpha>:<b>#count#</b></cfif></a></cfoutput>
<hr>

<form action="qry_address2Select.cfm" method="post">
<table>
<tr style="text-align:center; background-color:#CCC">
 <th>name</th>
 <th>position</th>
 <th>email</th>
 <th>company</th>
 <th>label</th>
 <th>street</th>
 <th>postal</th>
 <th>city</th>
 <th>country</th>
 <th>zip</th>
 <th><button>save</button></th>
 </tr>
 <cfoutput query="qryUserAddress"><tr>
 <td>#qryUserAddress.strFirst_Name# #qryUserAddress.strSurname#</td>
 <td>#qryUserAddress.strDesignation#</td>
 <td>#qryUserAddress.strEmail#</td>
 <td>#qryUserAddress.companyName#</td>
 <td>#qryUserAddress.AKA_companyName#</td>
 <td><cfif Find('no details', qryUserAddress.strStreet_Adress)><font color="##888"></cfif>#qryUserAddress.strStreet_Adress#</font></td>
 <td><cfif Find('no details', qryUserAddress.strPostal_Adress)><font color="##888"></cfif>#qryUserAddress.strPostal_Adress#</font></td>
 <td>#qryUserAddress.CityNameEN#</td>
 <td>#qryUserAddress.countryNameEN#</td>
 <td>#qryUserAddress.intCode#</td> 
 <td align='center'><input type="checkbox" name="userID" value="#qryUserAddress.userID#" />
 		<input type="hidden" name="#qryUserAddress.userID#" value="#qryUserAddress.branchID#" /></td>
</tr></cfoutput>
<tr>
	<td colspan="11" style="text-align:right; background-color:#CCC"><button>save</button></td>
</tr>
</table>
<input type="hidden" name="allUserID" value="<cfoutput>#ValueList(qryUserAddress.userID ,',')#</cfoutput>" />
<input type="hidden" name="searching" value="<cfoutput>#url.searching#</cfoutput>" />
</form>
</body>
</html>