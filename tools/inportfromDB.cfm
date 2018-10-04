<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>.</title>
</head>
<body>
<cfset addednumber = 0 >
<cfquery datasource="inport" name="get">
Select * FROM inport;
</cfquery>

<cfloop query="get">
<cfquery datasource="petro21" name="check">
	SELECT emailaddr 
	FROM email_news 
	WHERE emailaddr = <CFQUERYPARAM Value="#get.emailaddr#">
</cfquery>

	<cfif check.recordcount GTE 1 >
	<cfelse>
		<cfquery datasource="petro21" name="put">
			INSERT INTO email_news(emailaddr, pe,par,pl,pas,pa,no_email,via_form,html,intme,intwo,intaf,intas,intgen, intla, inteu, date)
			VALUES(<CFQUERYPARAM Value="#get.emailaddr#">, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, <CFQUERYPARAM Value="#now()#" cfsqltype="CF_SQL_TIMESTAMP">)
		</cfquery>
        <cfset addednumber = addednumber + 1 >
	</cfif>
</cfloop>
<cfoutput>#addednumber#</cfoutput>
</body>
</html>
