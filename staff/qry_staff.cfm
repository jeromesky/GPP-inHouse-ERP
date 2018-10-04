<cfparam default="1,2,3,4,5,6,7,8,9" name="form.contactTypeID">

<cfquery datasource="#gpp#" name="qryStaff" cachedwithin="#CreateTimeSpan(0, 0, 0, 15)#">
SELECT
		[contact2staffID]
      ,[eventID]
      ,[staffID]
      ,[staffName]
      ,[contactTypeDescription]
      ,[contactOrder]
      ,[contactTypeID]
      ,[staffEmail]
      ,[emailPublic]
      ,[mobile]
      ,[staffMobile]
      ,[staffPhone]
      ,[staff2eventID]
      ,[staffOrder]
  FROM 
  	[CRM_staff2event]
 WHERE
 	[eventID] = <cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#form.eventID#">
    AND
 	[contactTypeID] IN (<cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#form.contactTypeID#">)
 ORDER BY
 	[staffOrder] 
</cfquery>