<cfsilent>
<cfset mylist = #form.get# >

<cfloop list="#mylist#" index="i" delimiters=",">
<cfquery datasource="stats" name="get">
DELETE FROM job
WHERE datesent = '#i#'

</cfquery>

<cfquery datasource="stats">
Delete FROM host
WHERE referer = '#i#' OR referer = ':'
</cfquery>

<cfquery datasource="stats">
Delete FROM downloads
WHERE event = '#i#' 
</cfquery>
</cfloop>
<cflocation url="getdelete.cfm">

</cfsilent>