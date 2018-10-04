<cfset content = "">
<cfset data = {}>
<cfset data.NAME = "Jerome">
<cfset data.LASTNAME = "Svikovsky">

<cfquery datasource="#gpp#" name="get">
	SELECT 
    	[contentHTML]
    FROM 
    	[contents]
    WHERE
    	[contentID] = 1220
</cfquery>
<cfset templateOutput = "#get.contentHTML#">

<cfloop collection="#data#" item="key">
  <cfset templateOutput = Replace(templateOutput, "${" & key & "}",data[key], "all")>
</cfloop>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
</head>

<body>
<cfoutput>
<!---#get.contentHTML#--->
<br />
#templateOutput#</cfoutput>
<br /><br />
<!---The <cfoutput>#theConference#</cfoutput>: Explorationfounded by Global Pacific &amp; Partners (London, The Hague, Nicosia, Johannesburg) and its Senior Partners (Dr Duncan Clarke, Chairman &amp; CEO, and Babette van Gessel, Group Managing Director), as a mechanism for the world oil and gas industry, to build its relationships throughout the Middle East  
The ${EVENT_NAME}: Explorationfounded on the ${THEDATE} by Global Pacific &amp; Partners (London, The Hague, Nicosia, Johannesburg) and its Senior Partners (Dr Duncan Clarke, Chairman &amp; CEO, and Babette van Gessel, Group Managing Director), as a mechanism for the world oil and gas industry, to build its relationships throughout the Middle East    --->
</body>
</html>