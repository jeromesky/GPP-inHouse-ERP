<cfquery datasource="#gpp#" name="qryComapnies">
USE GPP
select top 50 *
from dbo.companyAKA
where AKA_companyURL in (
select top 3 AKA_companyURL
from dbo.companyAKA
where companyID is null
and len(AKA_companyURL) > 5
and AKA_companyURL NOT IN('http://www.qualitynet.net', 'http://www.rediffmail.com', 'http://www.allgreen.com.sg', 'http://www.ace-ins.com')
group by AKA_companyURL
having COUNT(AKA_companyURL) = 3
)
and [active] = 1
order by AKA_companyURL, AKA_companyName
</cfquery>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>p21</title>
</head>

<body>
<table border="0">
<cfoutput query="qryComapnies">
    <tr>
    	<td>#qryComapnies.AKA_companyName#</td>
        <td>#qryComapnies.AKA_companyURL#</td>
     </tr></cfoutput>
</table>
</body>
</html>