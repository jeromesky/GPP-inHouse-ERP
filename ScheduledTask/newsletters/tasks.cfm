<cfinclude template="../Application.cfm">

<!---<cfmail to="#contactAdmin#" FROM="web@petro21.com" SUBJECT="ping #cgi.SCRIPT_NAME# step 1 of 2">newsletterID :</cfmail>--->

<cfquery name="qryNewsletters" datasource="#gpp#" cachedwithin="#CreateTimeSpan(0, 0, 0, 1)#">
  SELECT
    [sendDay]
    ,[sendTime]
    ,[newsletterID]
  FROM
    [newsletters]
  WHERE
    live = 1
  AND	
    sendDay LIKE '%#DayOfWeek(now())#%' 
  AND
    sendTime = #Hour(now())#<!------>
</cfquery>
<!---<cfdump var="#qryNewsletters#"><cfabort>--->

<!---<cfmail to="#contactAdmin#" FROM="web@petro21.com" SUBJECT="ping newsletterID #qryNewsletters.newsletterID# :#cgi.SCRIPT_NAME# step 2 of 2">
newsletterID : #qryNewsletters.newsletterID#</cfmail>--->

<!---
<cfif qryNewsletters.recordcount GT 0>
    <cflocation url="Genarate_NewLetter_Content.cfm?newsletterID=#qryNewsletters.newsletterID#">
</cfif>--->