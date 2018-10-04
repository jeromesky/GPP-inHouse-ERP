<cffunction name="GetHeaderValue" access="public" output="false" returntype="string">
	<cfargument name="aHeader" required="yes" type="string">
	<cfargument name="aHeaderName" required="yes" type="string">
	
	<cfset var arrHeaderValues = ArrayNew(1)>
	<cfset var cHeaderValue = "">
	
	<cfset arrHeaderValues = ListToArray(arguments.aHeader, chr(10))>
	<cfloop from="1" to="#ArrayLen(arrHeaderValues)#" index="value">
		<cfif Left(arrHeaderValues[value], Len(arguments.aHeaderName)) IS arguments.aHeaderName>
			<cfset cHeaderValue = Mid(arrHeaderValues[value], Len(arguments.aHeaderName) + 3, Len(arrHeaderValues[value]))>
			<cfbreak>
		</cfif>
	</cfloop>
	
	<cfreturn cHeaderValue>
</cffunction>

<html>
<head>
<title>.</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<form action="cfmail.cfm" method="post">
<input name="subject" type="text">
<input type="submit" name="Submit" value="Submit">
</form>
<cfif parameterexists(form.submit)>
<cfpop server="mail.glopac.com" username="web" password="mm60860202"  action="getAll" name="qMail" maxRows="5">
<cfoutput>
 	    <cfloop query="qMail">
			
 	       #qMail.subject# <br /> #qMail.from#<br /> #qMail.body#
			<!---#GetHeaderValue(qMail.header, "Content-Type")#---> 
			<br /><br />
			<!---  #qMail.header#--->
 	        <hr>
 	    </cfloop>
 	</cfoutput>
</cfif>	
</body>
</html>
<!--- #qMail.messagenumber#<br />--->