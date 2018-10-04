<cfparam name="form.venueID" default="0">
<cfset venueID = form.venueID>

<!---<cfif form.venueID EQ 0>
			<cfquery datasource="#gpp#" name="get_new">
        SELECT TOP 1
                [venueID]
        FROM
        		[venues]
        ORDER 
        		BY venueID DESC
         
           	</cfquery>
            
       <cfset venueID = (get_new.venueID +1) > 		
</cfif>--->




        <cfquery datasource="#gpp#" name="get">
        SELECT 
               [countryNameEN]
              ,[CityNameEN]
              ,countryID
              ,cityID
              ,[VenueName]
              ,[venueURL]
              ,[venueImage]
              ,[venueContactPerson]
              ,[venuePhone]
              ,[venueFax]
              ,[venueAddress]
              ,[venueGoogleMap]
              ,[country]
              ,[city]
              ,[hotellogo]
              ,[venueCommentPrivate]
              ,[venueCommentPublic]
              ,[venueRoomCapacity]
              ,[venueLogo]
              ,[venueTypeID]
              ,[venueID]
              ,[venueEmail]
          FROM 
                [CRM_Venues]
          WHERE 
                [venueID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#venueID#">
        </cfquery>

<!---	<cfif get.countryID EQ "">
		<cfparam name="get.countryID" default="0"  >
    </cfif>
    
    <cfif get.cityID EQ "">
		<cfparam name="get.cityID" default="0" >
    </cfif>
	, CASE
              		WHEN countryID IS NULL
                    THEN   0
                END AS countryID
              ,CASE
              		WHEN cityID IS NULL
                    THEN  0
                END AS cityID
	--->