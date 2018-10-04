<cfquery name="getNewsletterClick" datasource="#dsnP21#">
SELECT 
	 [clicks]
    ,[title]
FROM
	DashPod_NewsletterClickCount
WHERE 
  newsletter  = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.newsleterID#">  
</cfquery>

<cfoutput query="getNewsletterClick"><ul>
    <li>#getNewsletterClick.title# [#getNewsletterClick.clicks#]</li>
</ul></cfoutput>