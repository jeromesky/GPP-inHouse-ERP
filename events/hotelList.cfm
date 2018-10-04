<cfinclude template="../Application.cfm">
<cfquery name="venues" datasource="#gpp#">

SELECT     dbo.venues.VenueName + ',  ' + dbo.Countries.countryNameEN + ',   ' + dbo.Cities.CityNameEN AS Venue, dbo.venues.venueID
FROM         dbo.Countries INNER JOIN
                      dbo.venues ON dbo.Countries.countryID = dbo.venues.countryID INNER JOIN
                      dbo.Cities ON dbo.venues.cityID = dbo.Cities.CityId
ORDER  by CityNameEN, VenueName
</cfquery>
<!---<cfinclude template="json.cfc">--->
<cfset open = "{" >
<cfset close = "}" >
<cfset TheValues = "" >



<cfoutput query="venues">
	<cfset getVal =  "'" & #venues.venueID# & "' : '" & #trim(venues.Venue)#  & "'" >
	<cfset TheValues = ListAppend(TheValues, getVal, ",")  >
</cfoutput>
<cfset  result = open & TheValues & close >


<cfoutput>#result#</cfoutput>

