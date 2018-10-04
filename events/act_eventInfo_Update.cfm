


<cfif form.eventInfoID EQ 1>
    <cfquery datasource="#gpp#" name="add">
        INSERT INTO [eventInfo] ([dateAdded])
        VALUES (<cfqueryparam cfsqltype="cf_sql_date" value="#now()#">)
        select @@IDENTITY AS eventInfoID
    </cfquery>
    
    <cfquery datasource="#gpp#">
        UPDATE [eventInfo]
        SET
             [eventID]					= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventID#">
            ,[parentID]				= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.parentID#">
            ,[eventInfoType]		= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventInfoType#">
            ,[eventInfoDateStart]= <cfqueryparam cfsqltype="cf_sql_date" value="#form.eventInfoDateStart#">
            ,[eventInfoDateEnd]	= <cfqueryparam cfsqltype="cf_sql_date" value="#form.eventInfoDateEnd#">
            	<cfif form.eventInfoDateStart NEQ "">
                	<cfset theTime = "#DateFormat(form.eventInfoDateStart, 'yyyy-mm-dd')# #timeFormat(form.eventInfoTimeStart, 'HH:mm')#:00.000">
            ,[eventInfoTimeStart]= '#theTime#'
            	</cfif>
				<cfif form.eventInfoDateEnd NEQ "">
                	<cfset theTime = "#DateFormat(form.eventInfoDateEnd, 'yyyy-mm-dd')# #timeFormat(form.eventInfoTimeEnd, 'HH:mm')#:00.000">
            ,[eventInfoTimeEnd]	= '#theTime#'
            	</cfif>
            ,[eventInfoLocation]	= <cfqueryparam cfsqltype="cf_sql_char" value="#form.eventInfoLocation#">
            ,[checkInDate]			= <cfqueryparam cfsqltype="cf_sql_date" value="#form.checkInDate#">
            	<cfif form.checkInDate NEQ "">
                	<cfset theTime = "#DateFormat(form.checkInDate, 'yyyy-mm-dd')# #timeFormat(form.checkInTime, 'HH:mm')#:00.000">
            ,[checkInTime]			= <cfqueryparam cfsqltype="cf_sql_date" value="#theTime#">
            	</cfif>
            ,[checlInLocation]		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.checlInLocation#">
            ,[notes]						= <cfqueryparam cfsqltype="cf_sql_char" value="#form.notes#">
            ,[dateAdded]			= <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
            ,[eventInfoTitle]		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.eventInfoTitle#">
    WHERE
            [eventInfoID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#add.eventInfoID#">
    </cfquery>

<cfelse>
    <cfquery datasource="#gpp#">
        UPDATE [eventInfo]
        SET
             [eventID]					= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventID#">
            ,[parentID]				= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.parentID#">
            ,[eventInfoType]		= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventInfoType#">
            ,[eventInfoDateStart]= <cfqueryparam cfsqltype="cf_sql_date" value="#form.eventInfoDateStart#">
            ,[eventInfoDateEnd]	= <cfqueryparam cfsqltype="cf_sql_date" value="#form.eventInfoDateEnd#">
            	<cfif form.eventInfoDateStart NEQ "">	
                	<cfset theTime = "#DateFormat(form.eventInfoDateStart, 'yyyy-mm-dd')# #timeFormat(form.eventInfoTimeStart, 'HH:mm')#:00.000">
            ,[eventInfoTimeStart]= '#theTime#'
            	</cfif>
				<cfif form.eventInfoDateEnd NEQ "">
                	<cfset theTime = "#DateFormat(form.eventInfoDateEnd, 'yyyy-mm-dd')# #timeFormat(form.eventInfoTimeEnd, 'HH:mm')#:00.000">
            ,[eventInfoTimeEnd]	= '#theTime#'
            	</cfif>
            ,[eventInfoLocation]	= <cfqueryparam cfsqltype="cf_sql_char" value="#form.eventInfoLocation#">
            ,[checkInDate]			= <cfqueryparam cfsqltype="cf_sql_date" value="#form.checkInDate#">
            	<cfif form.checkInDate NEQ "">
                	<cfset theTime = "#DateFormat(form.checkInDate, 'yyyy-mm-dd')# #timeFormat(form.checkInTime, 'HH:mm')#:00.000">
            ,[checkInTime]			= '#theTime#'
            	</cfif>
            ,[checlInLocation]		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.checlInLocation#">
            ,[notes]						= <cfqueryparam cfsqltype="cf_sql_char" value="#form.notes#">
            ,[dateAdded]			= <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
            ,[eventInfoTitle]		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.eventInfoTitle#">
    WHERE
            [eventInfoID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventInfoID#">
    </cfquery>
 </cfif>