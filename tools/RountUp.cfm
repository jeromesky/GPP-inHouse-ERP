<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>www.petro21.com</title>
</head>

<body>
<cfset numrecordsDisplay = 15 >
<cfif numrecordsDisplay mod 2 is 0 >
  <!--- The number is even.--->
<cfset countPerColumn = numrecordsDisplay  \ 2 >
<cfelse>
<!---  The number is odd.--->
<cfset countPerColumn = (Round((numrecordsDisplay \ 2 )) +1) >
</cfif>

<cfoutput>#countPerColumn#</cfoutput>

</body>
</html>