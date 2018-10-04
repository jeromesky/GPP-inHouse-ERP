


<cfquery name="get" datasource="#dsnP21#">
SELECT     *
FROM          	hotels
ORDER BY  id
</cfquery>



<cfoutput query="get">
	
        <cfquery  datasource="#gppData#">
        INSERT INTO venues 
            (VenueName
            , venueURL
            ,venueContactPerson
            ,venuePhone
            ,venueFax
            ,venueAddress
            ,country
            ,city
            ,hotellogo)     
        VALUES
            (<cfqueryparam cfsqltype="cf_sql_char" value="#get.hotelname#">
            ,<cfqueryparam cfsqltype="cf_sql_char" value="#get.hotellink#">
            ,<cfqueryparam cfsqltype="cf_sql_char" value="#get.contactname#">
            ,<cfqueryparam cfsqltype="cf_sql_char" value="#get.tel#"> 
            ,<cfqueryparam cfsqltype="cf_sql_char" value="#get.fax#">  
            ,<cfqueryparam cfsqltype="cf_sql_char" value="#get.address#">  
            ,<cfqueryparam cfsqltype="cf_sql_char" value="#get.country#">
            ,<cfqueryparam cfsqltype="cf_sql_char" value="#get.city#">
            ,<cfqueryparam cfsqltype="cf_sql_char" value="#get.hotellogo#">)   
        </cfquery>
</cfoutput>