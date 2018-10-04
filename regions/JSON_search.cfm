<cfset start = "[" >
<cfset end = "]" >
<cfset content = "">
<cfset contentString = "">

<cfif len(url.term) GTE 3 >
		<cfset cleanString = URLDecode(url.term) >

            <cfquery datasource="#gpp#" name="qryRegions" >
            SELECT 
            		[RegionID]
                    ,[RegionName]
  			FROM 
  					[regions]
            WHERE
            		[RegionName] LIKE '%#cleanString#%'  
                    AND
                    [CountryID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.countryID#">
            ORDER 
            		BY RegionName
            </cfquery>
            
            
            		<cfif qryRegions.recordcount GTE 1 >
                    <cfloop query="qryRegions">
                    <cfset contentString = '{ "label": "#trim(qryRegions.RegionName)#", "regionName" : "#trim(qryRegions.RegionName)#", "regionID": "#trim(qryRegions.RegionID)#" }' >
                    <cfset content = ListAppend(content, contentString, ",") >
                    </cfloop>
                    <cfset content = ListAppend(content, '{ "label": "#cleanString# is not on our region list- type it in to create it", "regionName" : "#cleanString#", "regionID": "0"}' , ',') >
                    <cfset fullReturn = start & content & end >
                    <cfoutput>#fullReturn#</cfoutput>
                    
            <cfelse>
            		<cfoutput>[{ "label": "#cleanString# is not on our contact list - click here to creat Contact", "regionName" : "#cleanString#", "regionID": "0" }]</cfoutput>
            
            </cfif>
<cfelse>

<cfoutput>[{ "label": "no letters where detected for the search", "regionName" : "#cleanString#", "regionID" : "0"}]</cfoutput>
</cfif>