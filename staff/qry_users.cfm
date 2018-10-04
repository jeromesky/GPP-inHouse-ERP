<cfparam name="form.staffID" default="0">

<cfquery datasource="#gpp#" name="qryStaff" cachedwithin="#CreateTimeSpan(0, 0, 0, 15)#">
SELECT 
	   [staffID]
      ,[staffName]
      ,[emailPublic]
      ,[emailPrivate]
      ,[staffUsername]
      ,[staffPassword]
      ,[staffType]
      ,[staffPossition]
      ,[staffMobile]
      ,[staffContactReason]
      ,[cityID]
      ,[countryID]
      ,[GPP_UserID]
      ,[staffPhone]
      ,[active]
      ,[CityNameEN]
      ,[countryNameEN]
      ,[active]
FROM 
		[CRM_staff]
<cfif form.staffID NEQ 0>        
WHERE [staffID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.staffID#">
</cfif>
</cfquery>