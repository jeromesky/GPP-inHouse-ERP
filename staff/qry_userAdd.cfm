<!---<cfinclude template="../Application.cfm">
<cfif parameterexists(form.id)>
	<cfquery datasource="#dsnP21#">
    	UPDATE GPPusers
        SET
        name		= '#form.name#', 
        email		= '#form.email#', 
        tel			= '#form.tel#', 
        username	= '#form.username#', 
        password	= '#form.password#', 
        usertype	= '#form.usertype#', 
        mobile		= '#form.mobile#',
        Possition	= '#form.Possition#',
        contactReason	= '#form.contactReason#'
        WHERE id 	= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
    </cfquery>
<cfelse>  
	<cfquery datasource="#dsnP21#">
		INSERT INTO gppusers(name, email, tel, username, password, usertype, Possition, mobile, contactReason)
		VALUES('#form.name#', '#form.email#', '#form.tel#', '#form.username#', '#form.password#', '#form.usertype#', '#form.Possition#','#form.mobile#', '#form.contactReason#')
	</cfquery>
</cfif>--->

<cfif form.staffID EQ 0>
	<cfquery datasource="#gpp#" name="add">
    	INSERT INTO staff (staffName)
        VALUES (<cfqueryparam cfsqltype="cf_sql_char" value="#form.staffName#">)
    	SELECT @@IDENTITY AS staffID
    </cfquery>
	<cfset form.staffID = #add.staffID#>
</cfif>

<cfquery datasource="#gpp#">
    UPDATE 
    	staff
    SET
       [staffName]				= <cfqueryparam cfsqltype="cf_sql_char" value="#form.staffName#">
      <!---,[emailPublic]		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.emailPublic#">--->
      ,[emailPrivate]			= <cfqueryparam cfsqltype="cf_sql_char" value="#form.emailPrivate#">
      ,[staffUsername]			= <cfqueryparam cfsqltype="cf_sql_char" value="#form.staffUsername#">
      ,[staffPassword]			= <cfqueryparam cfsqltype="cf_sql_char" value="#form.staffPassword#">
      ,[staffType]				= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.staffType#">
      ,[staffPossition]			= <cfqueryparam cfsqltype="cf_sql_char" value="#form.staffPossition#">
      ,[staffMobile]			= <cfqueryparam cfsqltype="cf_sql_char" value="#form.staffMobile#">
      ,[staffContactReason]		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.staffContactReason#">
      ,[cityID]					= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.cityID#">
      ,[countryID]				= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.countryID#">
      ,[staffPhone]				= <cfqueryparam cfsqltype="cf_sql_char" value="#form.staffPhone#">
      ,[active]					= <cfif parameterexists(form.active)>1<cfelse>0</cfif>
    WHERE
        [staffID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.staffID#">
</cfquery>