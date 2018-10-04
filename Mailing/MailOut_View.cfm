<cfinclude template="../Application.cfm">

<CFQUERY DATASOURCE="#dsnP21#" name="getjob">
SELECT 
  MailOut_configuration.*, 
  MailOut_template.filename
FROM 
  MailOut_configuration
LEFT JOIN MailOut_template
ON MailOut_configuration.template = MailOut_template.id
WHERE 
  MailOut_configuration.id = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.emailid#">
</CFQUERY>

<!--- GET the id number of the conference --->
<cfif getjob.sponsor EQ 1 OR getjob.research EQ 1 OR getjob.press EQ 1 OR getjob.exhibitor EQ 1 OR getjob.moderator EQ 1 OR getjob.guest EQ 1 OR getjob.speaker EQ 1 OR getjob.delegate EQ 1>
        <cfquery datasource="#dsnP21#" name="geteventidGPP" > 
        SELECT id_gpp 
        FROM events 
        WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#getjob.eventid#">
        </cfquery>
		<cfset selectEvent = #geteventidGPP.id_gpp#>
</cfif>

<cfparam default="name" name="sendlist.name">
<cfparam default="surname" name="sendlist.surname">

<cfif getjob.template NEQ 0 >
	<cfset sendlist.id = 'previewOnly'>
  <cfinclude  template="../../petro21/post/templates/#getjob.filename#">
<cfelse>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Petro21.com</title>
</head>
<body>

<cfoutput>#getjob.content#</cfoutput>

</body>
</html></cfif>