<cfparam name="url.countryID" default="0">
<cfset start = "[" >
<cfset end = "]" >
<cfset content = "">
<cfset contentString = "">

<cfif len(url.term) GTE 0 >
		<cfset cleanString = URLDecode(url.term) >
            <cfquery datasource="#gpp#" name="qryVenue" >
            SELECT 
            		 [venueID]
            		,[VenueName]
                    ,[country]
                    ,[city]
  			FROM 
  					[CRM_Venues]
            WHERE
            		[VenueName] LIKE '%#cleanString#%'
                    <cfif url.countryID NEQ 0>
                    AND
                    [countryID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.countryID#">
                    </cfif>
            ORDER 
            		BY [VenueName]
            </cfquery>
		  <cfif qryVenue.recordcount GTE 1 >
                  <cfloop query="qryVenue">
					  <cfset contentString = '{ "label": "#trim(qryVenue.VenueName)# #trim(qryVenue.city)# #trim(qryVenue.country)#", "venueID" : "#trim(qryVenue.venueID)#"}' >
                      <cfset content = ListAppend(content, contentString, ",") >
                  </cfloop>
                  
                  <cfset fullReturn = start & content & end >
                  <cfoutput>#fullReturn#</cfoutput>
                  
          <cfelse>
                  <cfoutput>[{ "label": "#cleanString# is not on our venue list", "venueID" :0 }]</cfoutput>
          
          </cfif>
<cfelse>

<cfoutput>[{ "label": "no letters where detected for the search",  "venueID" : 0 }]</cfoutput>
</cfif>