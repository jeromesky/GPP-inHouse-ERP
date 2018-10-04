<cfquery datasource="GPP" name="qryList">
SELECT     TOP (10) dbo.tblIndividual.dtmCaptured, dbo.tblIndividual.dtmUpdated, dbo.companyAKA.AKA_companyID, dbo.companyAKA.companyID, 
                      dbo.companyAKA.AKA_companyName, dbo.companyAKA.AKA_companyURL, dbo.companyAKA.active, dbo.companyAKA.updated, 
                      dbo.companyAKA.valid, dbo.companyAKA.valid AS Expr1, 
                      ( SELECT TOP 1  dbo.tblGlopacHistory.UserDateNum FROM dbo.tblGlopacHistory WHERE dbo.tblIndividual.IngIndividual_ID = dbo.tblGlopacHistory.RecordWorked ORDER BY dbo.tblGlopacHistory.RecIDX DESC ) AS lastUpdate
FROM         dbo.tblIndividual INNER JOIN
                      dbo.companyAKA ON dbo.tblIndividual.AKA_companyID = dbo.companyAKA.AKA_companyID
where 
	active = 1 
and 
	(companyID is null or companyID = '' or companyID = 0)
and 
	valid = -1
order by 
	aka_companyName
</cfquery>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Petro21</title>
<style type="text/css">
body{font-family:Verdana, Geneva, sans-serif; font-size:12px}
td{border-bottom:1px solid #CCC; padding:5px}
.capture{background-color:#EBEBEB}
.updated{background-color:#E0ECFF}
</style>
</head>

<body>
<table border="0">
	<tr>
    	<td class="capture">label</td>
        <td class="capture">date capture</td>
        <td class="capture">last update</td>
        <td class="capture">date updated</td>
        <td class="capture">url</td>
	</tr>
	<cfoutput query="qryList">
	<tr>
    	<td>#qryList.AKA_COMPANYNAME#</td>
        <td class="capture">#dateFormat(qryList.DTMCAPTURED, "dd mmmm  yyyy")#</td>
        <td class="updated"><cfif qryList.lastUpdate NEQ "">#DateFormat(CreateDate(left(qryList.lastUpdate, 4),  left(right(qryList.lastUpdate, 4), 2), right(qryList.lastUpdate, 2)), "dd mmm yyyy")#</cfif></td>
        <td>#dateFormat(qryList.DTMUPDATED, "dd mmmm  yyyy")#</td>
      
        
        <td>#qryList.AKA_COMPANYURL#</td>
	</tr></cfoutput>
</table>
</body>
</html>