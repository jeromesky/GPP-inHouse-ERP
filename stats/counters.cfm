<cfinclude template="../Application.cfm">
<!--- 
SELECT COMPANY,  DATEPART("d", opendate) AS thedate , DISTINCT opendate
DATEADD(dd, 0, DATEDIFF(dd, 0, GETDATE()))
--->
<cfquery datasource="stats" name="getgroup">
SELECT DISTINCT COMPANY
FROM counter 
</cfquery>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>www.petro21.com</title>
<script src="../javascript/jquery.js" type="text/javascript"></script>
    <script type="text/javascript">
		function loadContent(id) {
			$("#contentArea").load("countersStast.cfm?o="+id+"");
		}
	</script>
<link href="../styles/styles.css" rel="stylesheet" type="text/css">
</head>

<body>
<div id="header">Stats for maillouts</div>
<div id="outer">
	<div id="iner">
        <div class="sectionHeader">Click to view each company stats</div>
        <div style="margin:2px 0 15px 0 ; border-bottom:1px dotted #336699"></div>
	<ul>
    <cfloop query="getgroup">
    <cfquery datasource="#dsnP21#" name="getcompName">SELECT company from logos WHERE id = #getgroup.company#</cfquery>
		<li><cfoutput><a href="javascript:loadContent(#getgroup.company#);">#getcompName.COMPANY#</a></cfoutput></li>
	</cfloop>
	</ul>
        <div style="margin:2px 0 15px 0 ;"></div>
        <div class="sectionHeader">Company stats</div>
        <div style="margin:2px 0 15px 0 ; border-bottom:1px dotted #336699"></div>
        <div id="contentArea"></div>
        </div>
    </div>
</body>
</body>
</html>