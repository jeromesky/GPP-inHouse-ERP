<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
</head>

<body>

Application<BR><cfdump var="#cfapplication#" label = "Application Variables"><BR>
<!---<cfapplication name="adminp21">
<cfset request.overallTotal = 0 />
<cfloop collection="#application#" item="applicationName">

<cfscript>
sessiontrackerObj= createObject("java","coldfusion.runtime.SessionTracker");
activesessions = sessiontrackerObj.getSessionCollection('#applicationName#');
nosessions=ListLen(structkeyList(activeSessions));
</cfscript>
<cfif nosessions>
<cfoutput>
<h3>Total Sessions for #applicationName#: #nosessions#</h3>
</cfoutput>
<cfif structKeyExists(url,"showSessions")><cfdump var="#activesessions#"></cfif>
</cfif>
<cfset request.overallTotal = request.overallTotal + nosessions />

</cfloop>
<h3 style="position:absolute; top:0; right:0; width:200px;">OVERALL SESSIONS:

<cfoutput>#request.overallTotal#</cfoutput></h3>--->
</body>
</html>