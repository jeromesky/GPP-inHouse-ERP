<cfinclude template="../Application.cfm">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>.</title>
</head>

<body>

<cfquery name="get"  datasource="news">
select * 
from MoreOverTitles
where toplevel = 11
</cfquery>

<cfset getList = valuelist(get.newsName, ",") >
<cfloop list="#getList#" delimiters="," index="i" ><cfoutput>
 #i# ,  #getList.currentrow# <br />
</cfoutput></cfloop>


</body>
</html>
