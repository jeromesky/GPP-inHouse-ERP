<cfparam name="eventID" default="-100">

<cfquery name="get_Contact2Staff" datasource="#gpp#" >
  SELECT TOP 1000 
                    [contactTypeDescription]
                  ,[contact2staffID]
                  ,[eventID]
                  ,[StaffName]
              FROM 
                    [CRM_staff2event]
  WHERE [eventID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#eventid#">
  ORDER BY
    StaffName, contactTypeDescription
</cfquery>

<cfquery name="get_Staff" datasource="#gpp#">
SELECT TOP 100 
		[staffID]
      ,[staffName]
  FROM 
  		[CRM_staff]
  ORDER BY 
      [staffName]
</cfquery>

<cfquery name="get_contactType" datasource="#gpp#">
SELECT TOP 100 
		[typeLabel] AS contactTypeDescription
      ,[typeID] AS contactTypeID
  FROM 
  		[Types]
  WHERE 
  		[typegroup] = <cfqueryparam cfsqltype="cf_sql_char" value="staff_Contact"> 
  ORDER BY
      typeLabel
</cfquery>