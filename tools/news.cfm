
<cfscript>

UaObj 	= createObject("component", "Officecfc.agents");
var.userAgent = UaObj.browserAgents();

var.rsz = 5;
var.QueryString = 'chevron';
var.feed = 'http://news.google.co.uk/news?pz=1&cf=all&ned=en_gb&geo=australia&as_qdr=d&hl=en&q';

</cfscript>

<!---<cfhttp url="#var.feed#=#var.QueryString#&output=rss" method="GET" resolveUrl="false" useragent="#var.userAgent#" />--->

<cffeed action="read" source="#var.feed#=#var.QueryString#&output=rss" query="entries" properties="info">


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Untitled Document</title>
</head>

<body>
<cfoutput query="entries">
#title#  //#PUBLISHEDDATE#<br />
</cfoutput>
<!---<cfdump var="#entries#">--->
</body>
</html>