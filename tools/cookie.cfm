<!---<cfcookie name="GPPsettings" value="{'regions': '2,4,5,6', 'lastv': #now()#, 'v': 1.1, 'smd': 0, 'pid': 29781}" expires="never" domain=".globalpacific-partners.com" />
<cfcookie name='GPPsettings' value='{"COLUMNS":["regions","lastv", "v", "smd", "pid"], "DATA":[ [1.0,"2,4,5,6"],[2.0,"#now()#"],[3.0,"1.1"],[4.0,"0"],[5.0,"297781"]]}' expires='never' domain='.globalpacific-partners.com' />--->


<cfcookie name='GPPsettings' value='{"COLUMNS":["regions","lastv", "v", "smd", "pid"], "DATA":[ "2,4,5,6","#now()#","1.1","0","297781"]}' expires='never' domain='.globalpacific-partners.com' />





<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Untitled Document</title>
</head>

<body>

<cfif isDefined("cookie.GPPsettings")>

<cfoutput>
	
    <cfset cData = DeserializeJSON(cookie.GPPsettings)>
    
	
    <cfdump var="#cData#">
    
    
    <cfloop index="i" from="1" to="#ArrayLen(cData.DATA)#">
    
    #cData.COLUMNS[i]#: #cData.DATA[i]#<br>
    
    </cfloop>
  
	<!---
	Outlook: #cfData.DATA[i][fcstIdx][j].WEATHER#<br>
	<cfdump var="#cookie.GPPsettings#">
	Region:  #listGetAt(cookie.GPPsettings, 2, ":") listGetAt(cookie.GPPsettings, 2, ":")#<br />
	LastVisit: #listGetAt(cookie.GPPsettings, 2, ":")#<br />
    Version: #listGetAt(cookie.GPPsettings, 3, ":")#<br />
    smd: #listGetAt(cookie.GPPsettings, 4, ":")#<br />
    portalID: #listGetAt(cookie.GPPsettings, 5, ":")#<br />
	
	<cfset s = DeserializeJSON(cookie.GPPsettings)>
	<cfloop index="i" list="#cookie.petro21settings#" delimiters=",">
    	#i#<br />
    </cfloop>--->
</cfoutput>
</cfif>
</body>
</html>


