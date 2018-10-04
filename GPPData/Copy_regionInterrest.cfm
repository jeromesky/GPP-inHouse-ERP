<cfinclude template="../Application.cfm" >
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>www.petro21.com</title>
</head>

<body>
<cfset counter = 0 >
<cfquery datasource="#gpp#" name="get">

SELECT     IngIndividual_ID, strFirst_Name AS name, strSurname AS surname, strEmail, chkMag, chkA, chkAF, chkE, chkME, chkL, chkNA, chkW 
FROM        tblIndividual
WHERE     (STATUS = 'C') AND (strEmail <> ' ' AND chkEmail <> 1)
</cfquery>

<cfloop query="get">

		<cfquery datasource="#gpp#">
        UPDATE tblIndOptions
        SET
        chkWebIntAdvertising	= 1,
        chkWebIntGen			= 1,
        chkWebIntEu				= <cfif get.chkE EQ 1 >1<cfelse>0</cfif>,
        chkWebIntNa				= <cfif get.chkNA EQ 1 >1<cfelse>0</cfif>,
        chkWebIntLa				= <cfif get.chkL EQ 1 >1<cfelse>0</cfif>,
        chkWebIntAs				=  <cfif get.chkA EQ 1 >1<cfelse>0</cfif>,
        chkWebIntMe			= <cfif get.chkME EQ 1 >1<cfelse>0</cfif>,
        chkWebIntNaf			= <cfif get.chkMag EQ 1 >1<cfelse>0</cfif>,
        chkWebIntAf				= <cfif get.chkAF EQ 1 >1<cfelse>0</cfif>,
        chkWebIntWo			=  <cfif get.chkW EQ 1 >1<cfelse>0</cfif>
        
        WHERE lngIndividual_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#get.IngIndividual_ID#"> 
</cfquery>
<cfset counter = counter +1 >
</cfloop>
<cfoutput>#counter#</cfoutput>

</body>
</html>