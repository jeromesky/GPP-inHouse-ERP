

<cfdump var="#form#">

<!---
<cfquery datasource="#gpp#">
SELECT
      [changeLogDate] #now()#
      ,[staffID] 		= Session.gpp_userid
      ,[tableName] 	= "companies"
      ,[tableID]		= contains(ID, string)
      ,[valueNew]	= value
      ,[valueOld]		= oldvalue
FROM
		[changeLogs]

</cfquery>--->