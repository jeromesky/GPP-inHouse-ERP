<cfparam name="url.id" type="integer" default="1">

<cfset newsletter.id = url.id>

<cfquery name="NewsletterOptions" datasource="#gpp#">
SELECT
	newsletterid, 
    newsletterName AS newsletter, 
	numrecordsSearch AS numrecords,
    sendDay, 
    sendTime,  
    numrecordsSearch, 
    numrecordsDisplay, 
    newsletterName, 
    live, 
    searchBackdays, 
    newsletterFrequency
FROM 
	newsletters
where 
	newsletterID = <cfqueryparam cfsqltype="cf_sql_integer" value="#newsletter.id#">  
</cfquery>

<!---<cfscript>
	daysToAdd = NewsletterOptions.sendDay - dayOfWeek;
	if (daysToAdd) 

</cfscript>

<cfset newsletterBackDate =  dateAdd("d",  NewsletterOptions.sendDay,  now() )>--->

<!--- get data titles --->
<cfquery name="get" datasource="#dsnP21#">
select id, newsName, noResult 
from MoreOverTitles
where toplevel = <cfqueryparam cfsqltype="cf_sql_integer" value="#newsletter.id#"> 
</cfquery><!------>

<!---<cfset arrNum = 1>
<cfset arrFind = ArrayNew(1)>

<cfloop query="get">
	<cfset arrFind[#arrNum#] = #get.newsName#>
	<cfset arrNum = arrNum + 1>
</cfloop>--->

<!---<cfset SearchList = valuelist(get.newsName, ",") >--->

<cfset counterloop=1>

<!---<cfquery name="newslettersList" datasource="#gpp#">
SELECT 
  newsletterID, sendDay, sendTime, numrecordsSearch, numrecordsDisplay, newsletterName, live, searchBackdays   
FROM newsletters
</cfquery>--->

<cfquery name="SelectedNewsletter" dbtype="query">
SELECT 
	sendDay, 
    newsletterID, 
    sendTime, 
    numrecordsSearch, 
    numrecordsDisplay, 
    newsletterName, 
    live, 
    searchBackdays  
FROM NewsletterOptions 
WHERE newsletterID = <cfqueryparam cfsqltype="cf_sql_integer" value="#NewsletterOptions.newsletterid#">
</cfquery>