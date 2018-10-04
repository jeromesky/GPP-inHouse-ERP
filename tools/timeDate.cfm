<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Untitled Document</title>
</head>
<cfset nowTime = '#dateFormat(now(), "yyyy-mm-dd")# #TimeFormat(now(), "HH:mm:ss")#'>
<cfset dbTime = '2013-04-09 10:39:00'>
<cfoutput>
fuldat time: #now()#<br />
date: #dateFormat(now(), "yyyy-mm-dd")#<br />
time: #TimeFormat(now(), "HH:mm:ss")#<br /><br />

#nowTime#<br />


 #dateDiff('n', dbTime, nowTime)# <br />
 
 <cfif dateDiff('n', dbTime, nowTime) gt 2>
 	its a return
 <cfelse>
 	its a now
 </cfif>
 
 

</cfoutput>

<cfmail
	to="jason@glopac.com; jerome@glopac.com"
	from="links@petro21.com"
    subject="LinkedIn"
    type="html">

<script src="//platform.linkedin.com/in.js" type="text/javascript"></script>
		<script type="IN/FollowCompany" data-id="2423140" data-counter="right"></script>
</cfmail>
<body>
</body>
</html>
