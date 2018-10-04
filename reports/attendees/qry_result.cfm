<cfparam name="url.AttendType" default="1">
<cfparam name="url.eventID" default="0">
<cfparam  name="url.Title" default="0">
<cfparam  name="url.email"  default="0" >
<cfparam  name="url.invoiceNo" default="0">
<cfparam  name="url.phone" default="0">
<cfparam  name="url.fax" default="0">
<cfparam  name="url.chkCompGuest" default="0">
<cfparam  name="url.comment" default="0">
<cfparam  name="url.email_sec" default="0">
<cfparam  name="url.Comment_Public" default="0">
<cfparam  name="url.mobile" default="0">
<cfparam  name="url.address" default="0">
<cfparam  name="url.city" default="0">
<cfparam  name="url.country" default="0">
<cfparam  name="url.zip" default="0">
<cfparam  name="url.paid" default="*">
<cfparam  name="url.attend" default="*">
<cfparam  name="url.total" default="1">
<cfparam  name="url.AttendType" default="1">
<cfparam  name="url.dsp_type" default="0">



<cfquery datasource="#gpp#" name="qryResult">
SELECT 
		[attendType]
      ,[invoiceNo]
      ,[paid]
      ,[invoiceComment]
      ,[userTitle]
      ,[userEmail]
      ,[userSecrEmail]
      ,[userMobil]
      ,[userName]
      ,[userSurname]
      ,[userPhone]
      ,[postCity]
      ,[PostalCode]
      ,[postCountry]
      ,[streetCity]
      ,[StreetCode]
      ,[streetCountry]
      ,[address]
      ,[userCompanyName]
      ,[userPossition]
  FROM 
  	[CRM_Reports_attendee]
  WHERE
  	[eventID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.eventID#">
    AND 
    [attendType] IN (<cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#url.AttendType#">)
    
    <cfif url.attend NEQ "*">
    AND
    [registrationCancel] #url.attend#
    </cfif>
    
    <cfif url.paid NEQ "*">
     AND 
     paid = <cfif url.paid EQ "no">'NO' OR paid IS NULL <cfelse>'YES'</cfif>
     </cfif>
     ORDER BY userCompanyName
</cfquery>

<cfscript>
	eventCfc			= createObject("component", "Officecfc.eventName");
	eventName		= #eventCfc.eventName(url.eventID)#;
</cfscript>