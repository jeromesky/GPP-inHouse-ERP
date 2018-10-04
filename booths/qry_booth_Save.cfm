

<cfset boothID = form.boothID>

<!---<cfif form.boothID EQ 0>
	<cfquery name="new_contract" datasource="#gpp#">
        INSERT INTO [booths] (boothDateAdded,  staffIDAdded, sponsorID)
        VALUES (<cfqueryparam cfsqltype="cf_sql_date" value="#now()#">,  <cfqueryparam cfsqltype="cf_sql_integer" value="#session.gpp_id#">, <cfqueryparam cfsqltype="cf_sql_integer" value="#form.sponsorID#">)
        SELECT @@IDENTITY AS boothID
	</cfquery>
    <cfset boothID = new_contract.boothID>
</cfif>--->


<cfquery datasource="#gpp#">
UPDATE  [booths]
SET 
        <!---sponsorID			= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.sponsorID#">--->
        boothLabel			= <cfqueryparam cfsqltype="cf_sql_char" value="#form.boothLabel#">
        ,boothSize			= <cfqueryparam cfsqltype="cf_sql_char" value="#form.boothSize#">
        ,boothLocation		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.boothLocation#">
        ,bookedDated		= <cfqueryparam cfsqltype="cf_sql_date" value="#form.bookedDated#">
        ,boothFloor			= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.boothFloor#">
        ,boothComments	= <cfqueryparam cfsqltype="cf_sql_char" value="#form.boothComments#">
        <!---,fileID					=  <cfqueryparam cfsqltype="cf_sql_integer" value="#form.sponsorID#">--->
        ,[boothStatusExternalID]	= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.boothStatusExternalID#">
        ,[boothStatusInternalID]	= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.boothStatusInternalID#">
WHERE 
		[boothID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#boothID#">
</cfquery>
