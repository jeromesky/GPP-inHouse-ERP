<cftry>
<cfquery datasource="#gpp#" name="qryEvents">
SELECT  IngConference_ID AS eventID, event_Name AS eventName, year(eventDateEnd) AS eventYear, event_type
FROM   
	tblAnnual_Conf
WHERE 
	[event_type] IN ('event', 'eb', 'ps', 'gr') 
    AND
    YEAR(event_expire) 	 = datepart(YEAR, GETDATE())
   	AND  
    IngConference_ID NOT IN (902,921)
ORDER by 
	eventDateEnd desc
</cfquery>
<cfoutput>
<ul class="listMenu">
<cfloop query="qryEvents">
	<li class="paddingLeft10"><a href="javascript:loadEconference(#qryEvents.eventID#);">#qryEvents.eventName# #qryEvents.eventYear#</a></li></cfloop>
</ul></cfoutput>


<cfcatch type="any">

	<cfdump var="#cfcatch#">
</cfcatch></cftry>


<!---SELECT  IngConference_ID AS eventId, event_Name AS eventName, year(eventDateEnd) AS eventYear, event_type
FROM   tblAnnual_Conf
WHERE 
	[event_type] IN ('event', 'eb', 'ps') 
    AND
    YEAR(event_expire) 	 = datepart(YEAR, GETDATE())
 <!--- ---  AND
   --- [event_expire] 		<= DATEADD(day, -10, getdate())
--- AND
   --- [live] = 1--->
   AND  IngConference_ID NOT IN (902,921)
ORDER by eventDateEnd desc--->