<cfinclude template="../application.cfm">

<cfquery datasource="#gpp#" name="get">
 	DELETE 
 	FROM tblIndividual_WEB
  WHERE RecID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>
<cfquery datasource="#gpp#" name="get">
 	DELETE 
 	FROM tblIndOptions_WEB
	WHERE IND_RecID =  <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>www.petro21.com</title>
</head>

<body>
</body>
</html>