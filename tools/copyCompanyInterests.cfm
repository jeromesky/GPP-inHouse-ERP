<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>.</title>
</head>

<body>
<cfquery datasource="petro21" name="getInt">
SELECT interest, id 
FROM logos
WHERE interest <> '';
</cfquery>

<cfloop query="getInt">
	<cfloop index="i" from="1" to="#listlen(getInt.interest,",")#">
    	     	<cfquery datasource="petro21" >
     			Insert INTO companyInterests (companyid, interestid)
     			Values(<CFQUERYPARAM Value="#getInt.id#">, <CFQUERYPARAM Value="#listgetat(getInt.interest, i, ",")#">)
     		</cfquery>
    </cfloop>
</cfloop>
</body>
</html>
