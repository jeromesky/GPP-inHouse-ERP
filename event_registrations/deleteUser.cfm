<cfinclude template="../application.cfm"> 
<!--- remove the transaction from display --->
<cfif url.action EQ 0 >
<cfquery datasource="#dsnP21#"  >
SET ANSI_WARNINGS OFF
 
	UPDATE "Registrations"
	SET approved = '1'
	WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.id#">
SET ANSI_WARNINGS ON
</cfquery>
</cfif>

<!--- remove transaction and add events to user --->
<cfif url.action EQ 1 >

		<CFQUERY datasource="#dsnP21#"   name="findit">
		select userid, EconfData from userinfo
		where userid =  <cfqueryparam cfsqltype="cf_sql_integer" value="#url.userid#">
		</cfquery>
		
	<cfif findit.userid EQ "">
			<CFQUERY datasource="#dsnP21#"   name="put">
			Insert into userinfo(userid, EconfData)
			values('#url.userid#','#url.eventid#')
			</cfquery>
	<cfelse>
			<!--- <cfset added = findit.EconfData & "," & form.eventid > --->	
			<CFQUERY datasource="#dsnP21#"   name="put">
			UPDATE userinfo
			Set EconfData = '#findit.EconfData & "," & url.eventid#'
			Where userid = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.userid#">
			</cfquery>
	</cfif>
	<cfquery datasource="#dsnP21#"  >
	SET ANSI_WARNINGS OFF
 
	UPDATE "Registrations"
	SET approved = '1'
	WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.id#">
	SET ANSI_WARNINGS ON
	</cfquery>		
</cfif>
<!--- delete record --->
<CFLOCATION URL="registration.cfm?display=card">
