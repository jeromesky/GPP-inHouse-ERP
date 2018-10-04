<cfinclude template="../Application.cfm">
<cfif form.hotellogo NEQ "" >
<cffile action="upload" 
        filefield="Form.hotellogo" 
		destination= "G:\websites\petro21\htdocs\docs\" 
		nameconflict="makeunique">
</cfif>

<cfif parameterexists(form.id)>
<cfquery datasource="#dsnP21#"  >
	UPDATE hotels
    SET
    groupid		= '#form.groupid#',
    hotelname	= '#form.hotelname#',
    hotellink	= '#form.hotellink#',
<cfif form.hotellogo NEQ "" >
    hotellogo	= '#File.ServerFile#',
</cfif> 
    address		= '#form.address#',
    contactname	= '#form.contactname#',
    tel			= '#form.tel#',
    fax			= '#form.fax#',
    room		= '#form.room#',
    google		= '#form.google#',
    country		= '#FORM.country#',
    city		= '#form.city#',
    cityID		= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.cityID#">,
    countryID	= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.countryID#">
	WHERE id 	= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">    
</cfquery>
<cfelse>
      <cfquery datasource="#dsnP21#"  >
        INSERT INTO hotels( 
        groupid, 
        hotelname, 
        hotellink,
        hotellogo, 
        address, 
        contactname, 
        tel,
        fax,
        room, 
        google,
        country, 
        city,
        cityID,
        countryID )
        Values(
        '#form.groupid#', 
        '#form.hotelname#', 
        '#form.hotellink#', 
        <cfif form.hotellogo NEQ "" >'#File.ServerFile#'<cfelse>'defaulthotelimage.jpg'</cfif>,
        '#form.address#', 
        '#form.contactname#', 
        '#form.tel#',
        '#form.fax#',
        '#form.room#', 
        '#form.google#',
        '#FORM.country#', 
        '#form.city#',
        <cfqueryparam cfsqltype="cf_sql_integer" value="#form.cityID#">,
        <cfqueryparam cfsqltype="cf_sql_integer" value="#form.countryID#">
        )
     </cfquery>
</cfif>