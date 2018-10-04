<cfset start = "[" >
<cfset end = "]" >
<cfset content = "">
<cfset contentString = "">

<cfif url.countryID EQ "" OR url.countryID EQ 0 >
	<cfset cleanString = URLDecode(url.term) >
	<cfoutput>[{ "label": "No Country Selected, First Select Country", "cityid": "0" , "cityname" : "#cleanString#" }]</cfoutput>
<cfelse>

	<cfif len(url.term) GT 2 >
           <cfset cleanString = URLDecode(url.term)>

            <cfquery datasource="#gpp#" name="get">
            SELECT TOP 10
                      [CityId]
                      ,[CountryID]
                      ,[CityNameEN]
                      ,[countryNameEN]
                      ,[RegionName]
            FROM
                    [CRM_Cities_2Country]
            WHERE
                    [CityNameEN] LIKE '#cleanString#%' AND
                    [CountryID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.countryID#">
            </cfquery>
    
            <cfif get.recordcount GT 0 >
                    <cfloop query="get">
                    <cfset contentString = '{ "label": "#trim(get.CityNameEN)#  - (#trim(get.RegionName)#)", "cityid": "#trim(get.CityId)#", "cityname" : "#trim(get.CityNameEN)#" }' >
                    <cfset content = ListAppend(content, contentString, ",") >
                    </cfloop>
                    <cfset content = ListAppend(content, '{ "label": "#cleanString# is not displayed in the list above, click here to use my city", "cityid": "-1", "cityname": "#cleanString#"  }' , ',') >
                    <cfset fullReturn = start & content & end >
                    <cfoutput>#fullReturn#</cfoutput>
            <cfelse>
            
            		<cfquery datasource="#gpp#" name="qryCoutryCode">
            		SELECT TOP 1
                    	[countryISO2]
                    FROM
                    	[Countries]
                    WHERE
                    	countryID = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.countryID#">
					</cfquery>
                    
                    <cfhttp url="http://ws.geonames.org/search?name_startsWith=#cleanString#&country=#qryCoutryCode.countryISO2#&featureClass=P&&style=short" method="GET"  /> 

					<cfif cfhttp.fileContent is "Connection Failure">
                        <cfabort showerror="Error - Connection Failure">
                    <cfelse>

                        <cfscript>
							line = 1;
							xmlObject = xmlparse(cfhttp.filecontent); 
							myItems = XMLSearch(xmlObject, "/geonames/geoname/name");
							xmlResultTotal = arraylen(xmlObject.geonames.xmlchildren); 
						
								city = arrayNew(1);
								while (line LT xmlResultTotal)
								{
								city[line] = #myItems[line].xmltext#;
								line = IncrementValue(#line#);
								}
								city = arrayToList(city, ",");
						</cfscript>
					
							<cfloop list="#city#" index="i" delimiters=",">
								<cfset contentString = '{ "label": "#trim(i)# --(use other record if duplicates)", "cityid": "-1", "cityname" : "#trim(i)#" }' >
                                <cfset content = ListAppend(content, contentString, ",") >
							</cfloop>
                            <cfset content = ListAppend(content, '{ "label": "#cleanString# is not displayed in the list above, click here to use my city", "cityid": "-1", "cityname": "#cleanString#"  }' , ',') >
							<cfset fullReturn = start & content & end >
                            <cfoutput>#fullReturn#</cfoutput>
					</cfif>
            </cfif>
    <cfelse>
		<cfoutput>[{ "label": "you must select from the list", "cityid": "0" , "cityname" : "" }]</cfoutput>
    </cfif>
</cfif>