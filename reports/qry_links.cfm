<cfset qryLinks = queryNew("name, Link, Group")> 
<cfset newrow = queryaddrow(qryLinks, 9)> 
 
<cfset temp = querysetcell(qryLinks, "name", "Event Attendees", 1)> 
<cfset temp = querysetcell(qryLinks, "Link", "attendee", 1)> 
<cfset temp = querysetcell(qryLinks, "Group", "events", 1)> 

<cfset temp = querysetcell(qryLinks, "name", "Mailing list ", 2)> 
<cfset temp = querysetcell(qryLinks, "Link", "mailing", 2)> 
<cfset temp = querysetcell(qryLinks, "Group", "mailing", 2)> 

<cfset temp = querysetcell(qryLinks, "name", "mailing other", 3)> 
<cfset temp = querysetcell(qryLinks, "Link", "mailing", 3)> 
<cfset temp = querysetcell(qryLinks, "Group", "mailing", 3)> 

<cfset temp = querysetcell(qryLinks, "name", "Publications By Region", 4)> 
<cfset temp = querysetcell(qryLinks, "Link", "publicationsByRegion", 4)> 
<cfset temp = querysetcell(qryLinks, "Group", "publications", 4)>

<cfset temp = querysetcell(qryLinks, "name", "Publications By Event", 5)> 
<cfset temp = querysetcell(qryLinks, "Link", "publicationsByEvent", 5)> 
<cfset temp = querysetcell(qryLinks, "Group", "publications", 5)> 

<cfset temp = querysetcell(qryLinks, "name", "Publications without Regions", 6)> 
<cfset temp = querysetcell(qryLinks, "Link", "publicationsNoRegion", 6)> 
<cfset temp = querysetcell(qryLinks, "Group", "publications", 6)> 

<cfset temp = querysetcell(qryLinks, "name", "Publications Tasks Progress", 7)> 
<cfset temp = querysetcell(qryLinks, "Link", "publicationsTasks", 7)> 
<cfset temp = querysetcell(qryLinks, "Group", "publications", 7)> 

<cfset temp = querysetcell(qryLinks, "name", "Sponsorships for events", 8)> 
<cfset temp = querysetcell(qryLinks, "Link", "contractsByEvent", 8)> 
<cfset temp = querysetcell(qryLinks, "Group", "contracts", 8)> 

<cfset temp = querysetcell(qryLinks, "name", "Exhibitors for events", 9)> 
<cfset temp = querysetcell(qryLinks, "Link", "exhibitorByEvent", 9)> 
<cfset temp = querysetcell(qryLinks, "Group", "contracts", 9)> 