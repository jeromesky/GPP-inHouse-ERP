<cfinclude template="../Application.cfm">
<!--- get the template details --->
<cftry>
<cfquery name="get_event" DATASOURCE="#gpp#"  cachedWithin=#CreateTimeSpan(0,0,30,0)# >
   	SELECT 
    	tblAnnual_Conf.webid AS id
        ,tblAnnual_Conf.event_name
        ,DAY(tblAnnual_Conf.event_expire) AS event_days 
        ,MONTH(tblAnnual_Conf.event_expire) AS event_month
        ,YEAR(tblAnnual_Conf.event_expire) AS event_year
        ,tblAnnual_Conf.groupby 
   		,tblAnnual_Conf.event_loc_city AS city
        ,tblAnnual_Conf.event_loc_country AS country
        ,tblAnnual_Conf.ColorD
        ,tblAnnual_Conf.ColorL
        ,tblAnnual_Conf.Slogan 
   		,tblAnnual_Conf.sloganSub
        ,venues.VenueName AS hotelname
FROM        
    	tblAnnual_Conf RIGHT OUTER JOIN
        venues ON venues.venueID = tblAnnual_Conf.hotel
WHERE  
    	tblAnnual_Conf.IngConference_ID = #getjob.eventid#   
</cfquery>

<!---SELECT     dbo.tblAnnual_Conf.groupby, dbo.tblAnnual_Conf.event_name, YEAR(dbo.tblAnnual_Conf.event_expire) AS event_year, 
                      DAY(dbo.tblAnnual_Conf.event_expire) AS event_days, dbo.tblAnnual_Conf.event_type, MONTH(dbo.tblAnnual_Conf.event_expire) AS event_month, 
                      dbo.tblAnnual_Conf.event_loc_country AS country, dbo.tblAnnual_Conf.event_loc_city AS city, dbo.tblAnnual_Conf.event_expire, 
                      gpp.dbo.tblAnnual_Conf.id, dbo.tblAnnual_Conf.preRegistration, dbo.tblAnnual_Conf.timereg, dbo.tblAnnual_Conf.timestart, 
                      dbo.tblAnnual_Conf.filesAvailableDate, dbo.tblAnnual_Conf.AttendFormDate, dbo.tblAnnual_Conf.venuRoom, dbo.tblAnnual_Conf.boothTimeRemove, 
                      dbo.tblAnnual_Conf.boothDateRemove, dbo.tblAnnual_Conf.boothTimeSetup, dbo.tblAnnual_Conf.boothDateSetup, 
                      dbo.tblAnnual_Conf.preRegistrationDate, dbo.tblAnnual_Conf.preRegistrationTime, dbo.tblAnnual_Conf.IngConference_ID AS id_gpp, 
                      dbo.venues.VenueName AS hotelname, dbo.venues.venuePhone AS tel, dbo.venues.venueAddress AS address
FROM         dbo.tblAnnual_Conf RIGHT OUTER JOIN
                      dbo.venues ON dbo.venues.venueID = dbo.tblAnnual_Conf.hotel--->
                      
<cfif getjob.eventExact NEQ 1>
<cfquery name="get_event" DATASOURCE="#gpp#" cachedWithin=#CreateTimeSpan(0,0,30,0)#>     
SELECT 
        tblAnnual_Conf.webid AS id
        ,tblAnnual_Conf.event_name
        ,DAY(tblAnnual_Conf.event_expire) AS event_days 
        ,MONTH(tblAnnual_Conf.event_expire) AS event_month
        ,YEAR(tblAnnual_Conf.event_expire) AS event_year
        ,tblAnnual_Conf.event_loc_city AS city
        ,tblAnnual_Conf.event_loc_country AS country
        ,tblAnnual_Conf.ColorD
        ,tblAnnual_Conf.ColorL
        ,tblAnnual_Conf.Slogan
        ,tblAnnual_Conf.sloganSub
        ,venues.VenueName AS hotelname
FROM        
    	tblAnnual_Conf RIGHT OUTER JOIN
        venues ON venues.venueID = tblAnnual_Conf.hotel     
WHERE  
		tblAnnual_Conf.groupby = #get_event.groupby# 
        AND YEAR(tblAnnual_Conf.event_expire) = #get_event.event_year# 
        AND tblAnnual_Conf.event_type = 'week' 
</cfquery>
</cfif>

<cfoutput><font color="###get_event.ColorD#" style="font-size: x-large;">#get_event.event_name#</font><br>
<span style="font-size: medium;">#get_event.event_days# #monthAsString(get_event.event_month)# #get_event.event_year#, #get_event.hotelname#, #get_event.city#, #get_event.country#</span><br><br>
 
<span style="font-size:14px">#get_event.Slogan# <br >
#get_event.sloganSub#</span>
</cfoutput>
<cfcatch type="any">
 <cfmail to="#contactAdmin#"  FROM="web@glopac.com" SUBJECT="error on #CGI.SERVER_NAME# - #CGI.PATH_INFO#" type="html"><cfoutput>error message: #cfcatch.Message# <br>error Details: #cfcatch.Detail# <br>error in:  #cfcatch.Type# <br> error Native|:<cfif parameterexists(cfcatch.NativeErrorCode)> #cfcatch.NativeErrorCode#</cfif> <br>
 SQL state:<cfif parameterexists(cfcatch.SQLState)>  #cfcatch.SQLState#</cfif><br> 
 Root cause: <cfif parameterexists(cfcatch.RootCause)>#cfcatch.RootCause#</cfif>
 <br >#cgi.script_name#</cfoutput></cfmail>
 
</cfcatch>
</cftry>