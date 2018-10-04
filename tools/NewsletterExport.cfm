<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
</head>

<body>
<form method="post" action="#">
<table width="300" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>fildname</td>
    <td>fieldid</td>
  </tr>
  <tr>
    <td><input type="text" name="fieldName" id="fieldName" /></td>
    <td>
      <input type="text" name="newsletterID" id="newsletterID" />

    </td>
  </tr>

  <tr>
    <td>&nbsp;</td>
    <td><input type="submit" name="button" id="button" value="Submit" /></td>
  </tr>
</table>
    </form>
    <cfif parameterexists(form.fieldName) >

<cfquery name="get" datasource="#gppData#" timeout="100000">
SELECT 
		[id]
  FROM [SITE_Mailout_Newsletters]
  WHERE
   #form.fieldName# = 1
</cfquery>

<!---<cfdump var="#get#">--->

<cfloop query="get">
        <cfquery datasource="#gppdata#">
        INSERT INTO subscriptions 
            (userID
            ,newsletterID
            ,subDate
            ,subActive
			,subscriptionType
            )
        VALUES
            (<cfqueryparam cfsqltype="cf_sql_integer" value="#get.id#">
            ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.newsletterID#">
            ,<cfqueryparam cfsqltype="cf_sql_decimal" value="#now()#">
            ,<cfqueryparam cfsqltype="cf_sql_integer" value="1">
			,1
            )
        </cfquery>

</cfloop>

</cfif>
</body>
</html>