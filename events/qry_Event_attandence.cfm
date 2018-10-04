  <cfset counter = 0>
  <cfset email = ""  >
  <cfset CCadress = "" >
  <cfset sentList = "">
  <cfset corespondence = #url.corespondence#>
  
<cfswitch expression="#corespondence#">
	<cfcase value="1">
    	<cfset corespondenceLabel = "Attendance Form">
        <cfset template 		= "template_attendenceForm.cfm">
        <cfset fieldUpdate		= "formsent">
    </cfcase>
    
    <cfcase value="2">
    	<cfset corespondenceLabel = "Event Presentations Access">
        <cfset template 		= "template_conferenceAccess.cfm">
        <cfset fieldUpdate		= "formsent">
    </cfcase>
    
    <cfdefaultcase>
    	<cfset corespondenceLabel = "Attendance Form">
        <cfset template 		= "template_attendenceForm.cfm">
        <cfset fieldUpdate		= "formsent">
    </cfdefaultcase>    
</cfswitch>

<cfquery datasource="#gpp#" name="qryAttendenceList">
    SELECT 		
        * 
    FROM 		
        [SITE_Mailer_SendTo_AttendingEvent]
    WHERE 		
        [EventID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventID#"> 
    <cfif url.test EQ 1>
        AND
            id IN (23720, 17736, 14492, 18286)
    <cfelseif url.test EQ 0 AND corespondence EQ 1>
       AND 
        	( #fieldUpdate# IS NULL OR formsent = '' )
    <cfelseif url.test EQ 0 AND corespondence EQ 2>
    	AND
        	(chkDelegate = 1 OR
            chkSpeaker = 1 OR
            chkModerator = 1)
    </cfif>
</cfquery>

<cfquery datasource="#gpp#" name="geteventidGPP" > 
    SELECT *
    FROM 
        SITE_Mailer_BuildEventInformation
    WHERE 
        eventID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventID#">
</cfquery>

<cfscript>
 edf = createObject("component", "Officecfc.EventDateFormatID");
 qry_eventDateFormatWeek = edf.eventDate(geteventidGPP.eventID);
</cfscript>

<cfset staffOnDay = 0 >
<cfset weekID = 0 >
<cfset theBrochure =  "">
<cfset weekName  = "">

<cfquery DATASOURCE="#gpp#" name="weekMenu" >
Select 
	webID AS id
	,event_name AS name
    ,YEAR(event_expire) AS year
    ,event_type
    ,groupby
    ,event_loc_country AS country
<!---    ,events.event_loc_city AS city--->
    ,DAY(event_expire) AS event_days
    ,Month(event_expire) AS event_month
    ,file_update AS brochure
    ,staffOnDay
    ,boothDateSetup
   ,boothTimeSetup
    ,boothDateRemove
    ,boothTimeRemove
FROM 
	[CRM_events] 
WHERE 
	[groupby] 				= #geteventidGPP.groupby# AND 
    year(event_expire) 		= #DatePart("yyyy", geteventidGPP.event_expire)#  AND 
    event_expire			> #now()#   AND
    [eventID] 		NOT IN (#form.eventID#) 
    AND
   		( event_type <> 'spon' OR  event_type  <> 'exh') 
    AND
    [live] = 1
Order 
	by event_expire
</cfquery>

<!--- GET tHE BROCHURE --->
<cfloop query="weekMenu">
	<cfif weekMenu.event_type EQ "week">
    	<cfscript>
			staffOnDay 			= weekMenu.staffOnDay;
			weekID 				= weekMenu.id;
			theBrochure 		= weekMenu.brochure;
			weekName  			= weekMenu.name;
			setUpboothTime 		= weekMenu.boothTimeSetup;
			setUpboothDate 		=  weekMenu.boothDateSetup;
			BreakDownboothTime 	= weekMenu.boothTimeRemove;
			BreakDownboothDate 	= weekMenu.boothDateRemove; 
        </cfscript>
    </cfif>
</cfloop>

<!--- GET FUNCTIONS form.eventID NEQ 0 --->
<cfparam name="form.list" default="1">
<cfparam name="form.functionID" default="1">
<cfquery datasource="#gpp#" name="qryFunction">
	SELECT  
        [functionID]
        ,[functionTrack]
        ,[functionTime]
        ,[functionDate]
        ,[functionDetails]
        ,[functionTitle]
        ,[companyName]
        ,[functionType]
        ,[companyID]
        ,[menuOptions]
        ,[parentID]
        ,[eventID]
        ,[packagesID]
        ,[functionVenue]
        ,[mediaFile]
  FROM [PM_functions]
 WHERE   
        	[eventID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventID#"> 
   ORDER BY [functionTime], [functionDate]
</cfquery>

<!---<cfinclude template="../functions/qry_function.cfm">
<cfquery DATASOURCE="#dsnP21#" name="functions">
Select *
FROM event_welcom 
WHERE eventid = #geteventidGPP.eventID#
Order by functiondate, functionTime
</cfquery>--->

<cfquery DATASOURCE="#dsnP21#" name="meals">
Select *
FROM Meal_Preference 
WHERE eventid = #geteventidGPP.eventID#
</cfquery>

<cfquery DATASOURCE="#gpp#" name="qryUpcomingEvents">
Select 
	eventID AS id
    ,event_name AS name
    ,YEAR(event_expire) AS year
    ,event_type 
    ,event_loc_country AS country
FROM 
	[CRM_events]  
WHERE  
	[event_expire] > <cfqueryparam cfsqltype="cf_sql_date" value="#now()#"> AND 
    [event_type] = <cfqueryparam value="week"> AND 
    [LIVE] = 1
Order by 
	[event_expire]
</cfquery>

<cfset form.contactTypeID = "1"> 
<cfset form.eventID = #weekID#>  

<cfquery datasource="#gpp#" name="qryInfoDates">
	SELECT TOP 3 eventInfoDateStart, eventInfoLocation, eventInfoType
    FROM
    	[eventInfo]
    WHERE	
    	[eventInfoType] IN (3,8,9)
        and
        [eventID] = #geteventidGPP.eventID#
</cfquery>

<cfquery dbtype="query" name="qrySubmitDate" maxrows="1">
	SELECT  eventInfoDateStart
    FROM
    	[qryInfoDates]
    WHERE	
    	[eventInfoType] = 8 
</cfquery>

<cfquery dbtype="query" name="qryPresentationDate" maxrows="1">
	SELECT  eventInfoDateStart
    FROM
    	[qryInfoDates]
    WHERE	
    	[eventInfoType] = 3 
</cfquery>

<cfquery dbtype="query" name="qryCheckInDate" maxrows="1">
	SELECT  eventInfoDateStart, eventInfoLocation
    FROM
    	[qryInfoDates]
    WHERE	
    	[eventInfoType] = 9
</cfquery>

<cfinclude template="../staff/qry_staff.cfm">  
<!--- GET Staff  LIST 
<cfquery DATASOURCE="#gpp#" name="contacts">
    SELECT 
      [mobile]
      ,[staffEmail]
      ,[StaffName]
    FROM 
       [CRM_staff2event]
    WHERE 
        contactTypeID = 1 AND 
        eventID = <cfqueryparam cfsqltype="cf_sql_integer" value="#weekID#">
</cfquery>--->