<!--- <cfdump var="#fusebox#"><cfabort> --->

<cfswitch expression="#fusebox.fuseAction#">
  
	<cfcase value="home">
		<cfinclude template="dsp_layout.cfm">
	</cfcase>
	
	<cfcase value="calendar">
		<cfinclude template="dsp_layoutCalendar.cfm">
	</cfcase>
	
	<cfdefaultcase>
		<cfinclude template="dsp_layout.cfm">
	</cfdefaultcase>
	
</cfswitch>