<cfif form.speakerType EQ 5 OR form.speakerType EQ 1>
	<cfset userID = #form.userID#>
<cfelse>
	<cfset userID = 0>
</cfif>

<cfquery datasource="#gpp#" name="qry_newSlot">
	INSERT INTO speakers
    	(
        	speakerType
            ,speakerUnit
            ,speakerTopic
            ,extraDetails
            ,eventID
            ,speakerDateAdded
            ,userID
        )
	VALUES
    	(
        	<cfqueryparam cfsqltype="cf_sql_integer" value="#form.speakerType#">
            ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.speakerUnit#">
            ,<cfqueryparam cfsqltype="cf_sql_char" value="#form.speakerTopic#">
            ,<cfqueryparam cfsqltype="cf_sql_char" value="#form.extraDetails#">
            ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventID#">
            ,<cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
            ,<cfqueryparam cfsqltype="cf_sql_integer" value="#userID#">
        )
      SELECT @@IDENTITY as speakerID
</cfquery>

<cfparam name="form.eventID" default="#form.eventID#" type="integer">
<cfparam name="form.speakerID" default="#qry_newSlot.speakerID#" type="integer">
<cfparam name="form.searchStatus" default="">

<cfinclude template="dsp_program.cfm">