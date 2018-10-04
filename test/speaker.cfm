<cfquery datasource="#dsnP21#" name="qrySpeakers">
SELECT 
 [id]
      ,[name]
      ,[delegation]
      ,[email]
      ,[phone]
      ,[photo]
      ,[cv]

  FROM [speakers]
  WHERE photo <> ''
</cfquery>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
</head>

<body>

<table border="0">
	<tr>
    	<td colspan="4"><cfoutput>#qrySpeakers.recordcount#</cfoutput></td>
    </tr>
<cfoutput query="qrySpeakers"><tr>
    	<td>#qrySpeakers.name#</td>
      <td>#qrySpeakers.delegation#</td>
      <td><img src="http://www.petro21.com/_files/client/#qrySpeakers.photo#"/></td>
      <td>#qrySpeakers.cv#</td>
	</tr></cfoutput>
</table>
</body>
</html>
