<cfset start = "[" >
<cfset end = "]" >
<cfset content = "">
<cfset contentString = "">

<cfif form.countryID EQ "">
	<cfset cleanString = URLDecode(form.tag) >
	<cfoutput>[{ "tag": "You have not selected a country", "cityid": "0" , "cityname" : "#cleanString#" }]</cfoutput>
<cfelse>

	<cfif len(form.tag) GT 2 >
            <cfset cleanString = URLDecode(form.tag) >
    
            <cfquery datasource="#gpp#" name="get">
                SELECT
                          [CityId]
                          ,[CountryID]
                          ,[CityNameEN]
                          ,[countryNameEN]
                          ,[RegionName]
                FROM
                        [CRM_Cities_2Country]
                WHERE
                        [CityNameEN] LIKE '#cleanString#%' AND
                        [CountryID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.countryID#">
            </cfquery>
 
            <cfif get.recordcount GT 0 >
                    <cfloop query="get">
                    <cfset contentString = '{ "tag": "#trim(get.CityNameEN)# (#trim(get.countryNameEN)# - #trim(get.RegionName)#)", "cityid": "#trim(get.CityId)#", "cityname" : "#trim(get.CityNameEN)#" }' >
                    <cfset content = ListAppend(content, contentString, ",") >
                    </cfloop>
                    <cfset content = ListAppend(content, '{ "tag": "#cleanString# is not displayed in the list above, click here to use my city", "cityid": "-1", "cityname": "#cleanString#"  }' , ',') >
                    <cfset fullReturn = start & content & end >
                    <cfoutput>#fullReturn#</cfoutput>
            <cfelse>
                    <cfoutput>[{ "tag": "#cleanString# is not displayed in the list above, click here to use my city", "cityid": "-1" , "cityname" : "#cleanString#" }]</cfoutput>
            </cfif>
    <cfelse>
            <cfoutput>[{ "tag": "you must selectt from the list", "cityid": "0" , "cityname" : "" }]</cfoutput>
    </cfif>
</cfif>