<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>www.petro21.com</title>
</head>

<body>

<cfquery datasource="#dsnP21#" name="get">
SELECT  id, emailaddr 
FROM email_news 
where no_email = 0
</cfquery>

<cfloop query="get">
	<cfif find("@", get.emailaddr) >
		<cfset  domain = "*@" & Right(get.emailaddr, (len(get.emailaddr) - find("@", get.emailaddr) )) >
			<cfquery datasource="inport" >
    			INSERT INTO whitelist(email)
        		VALUES('#domain#')
    		</cfquery>
		<cfoutput >#domain#</cfoutput><br />
	<cfelse>
    **** some error <cfoutput >#get.emailaddr#</cfoutput> ****<br />
    </cfif>
</cfloop>

<!---
    <cftry>
	<cfcatch type="any">
    </cfcatch>
	****  some error    ****<br />
	</cftry>
--->
</body>
</html>
