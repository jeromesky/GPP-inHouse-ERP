<cfset venueID = form.venueID>

<cfif form.venueID EQ 0>
		  <cfquery datasource="#gpp#" name="new">
			INSERT INTO venues(cityID)          
			VALUES (<cfqueryparam cfsqltype="cf_sql_integer" value="#venueID#">)
            SELECT @@IDENTITY AS ID
		</cfquery>
        
        
        <cfset venueID = new.ID>
</cfif>

<cfif form.venueImage NEQ "" >
<cffile action="upload" 
        filefield="Form.venueLogo" 
		destination= "G:\websites\petro21\docs\" 
		nameconflict="makeunique">
</cfif>


        <cfquery datasource="#gpp#" >
        UPDATE venues
        SET 
              countryID							= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.countryID#">
             ,cityID									=  <cfqueryparam cfsqltype="cf_sql_integer" value="#form.cityID#">
              ,VenueName						= <cfqueryparam cfsqltype="cf_sql_char" value="#form.VenueName#">
              ,venueURL							= <cfqueryparam cfsqltype="cf_sql_char" value="#form.VenueURL#">
              ,venueImage						= <cfqueryparam cfsqltype="cf_sql_char" value="#form.venueImage#">
              ,venueContactPerson		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.venueContactPerson#">
              ,venuePhone						= <cfqueryparam cfsqltype="cf_sql_char" value="#form.venuePhone#">
              ,venueFax							= <cfqueryparam cfsqltype="cf_sql_char" value="#form.venueFax#">
              ,venueAddress					= <cfqueryparam cfsqltype="cf_sql_char" value="#form.venueAddress#">
              ,venueGoogleMap				= <cfqueryparam cfsqltype="cf_sql_char" value="#form.venueGoogleMap#">
              <cfif form.venueImage NEQ "" >
              ,venueImage						= <cfqueryparam cfsqltype="cf_sql_char" value="#File.ServerFile#">
              </cfif>
              ,venueCommentPrivate		= <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.venueCommentPrivate#">
              ,venueCommentPublic		= <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.venueCommentPublic#">
              ,venueRoomCapacity		= <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.venueRoomCapacity#">
              ,venueTypeID					= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.venueTypeID#"> 
              ,venueEmail					= <cfqueryparam cfsqltype="cf_sql_char" value="#form.venueEmail#">

          WHERE 
                venueID = <cfqueryparam cfsqltype="cf_sql_integer" value="#venueID#">
        </cfquery>