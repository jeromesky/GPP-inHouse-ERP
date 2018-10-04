<cfswitch expression="#fusebox.fuseAction#">
	<cfcase value="home">
    	<cfinclude template="qry_search.cfm">
		<cfinclude template="dsp_search.cfm">
	</cfcase>
	<cfcase value="results">
    	<cfinclude template="qry_results.cfm">
		<cfinclude template="dsp_results.cfm">
	</cfcase>
	<cfcase value="xls">
    	<cfinclude template="qry_results.cfm">
		<cfinclude template="dsp_results.cfm">
	</cfcase>
	<cfdefaultcase>
		<cf_defaultcase>
	</cfdefaultcase>
</cfswitch>