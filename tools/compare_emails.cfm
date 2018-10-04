<cfquery datasource="stats" name="curr">
SELECT id, name, surname, emailaddr 
FROM inport
</cfquery>

<cfloop query="curr" >
<cfquery datasource="petro21" name="check">
SELECT id 
FROM email_news
WHERE emailaddr = <CFQUERYPARAM Value="#curr.emailaddr#">
</cfquery>
<cfif check.recordcount GTE 1 >
	<!---<cfquery datasource="petro21" name="edit">
	UPDATE email_news
	set IntGen = 0
	WHERE id = <CFQUERYPARAM Value="#check.id#">
	</cfquery>
	<cfquery datasource="stats">
	DELETE 
	FROM inport
	WHERE id = <CFQUERYPARAM Value="#curr.id#">
	</cfquery>--->
<cfelse>
	<cfquery datasource="petro21" name="edit">
	INSERT INTO 
		email_news ( name, surname, emailaddr, PAs, PL, PAr, pa, PE, no_email, via_form, intMe, intWo, intAf, IntAs, IntGen,   date )
    VALUES(<CFQUERYPARAM Value="#curr.name#">, <CFQUERYPARAM Value="#curr.surname#">, <CFQUERYPARAM Value="#Lcase(curr.emailaddr)#">, 1, 1, 1,1, 1, 1, 0, 1, 1, 1, 1, 0, <CFQUERYPARAM Value="#now()#" cfsqltype="CF_SQL_TIMESTAMP">)
	</cfquery>
	<cfquery datasource="stats">
	DELETE 
	FROM inport
	WHERE id = <CFQUERYPARAM Value="#curr.id#">
	</cfquery>
</cfif>
</cfloop>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>.</title>
</head>

<body>
</body>
</html>
