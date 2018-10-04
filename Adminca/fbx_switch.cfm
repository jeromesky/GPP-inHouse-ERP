<!--- <cfdump var="#fusebox#"><cfabort> --->

<cfswitch expression="#fusebox.fuseAction#">
  
	<cfcase value="home">
		<cfinclude template="dsp_nav_top.cfm">
		<cfinclude template="dsp_loadModal.cfm">
	</cfcase>

	
	
	<cfdefaultcase>
		<cfinclude template="dsp_loadModal.cfm">
	</cfdefaultcase>
	
</cfswitch>