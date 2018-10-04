<cfsetting enablecfoutputonly="yes">
<cfinclude template="qry_results.cfm">

<cfswitch expression="#form.output_format#">
	<cfcase value=".htm">
	<cfoutput>
    		htm- debug info below<hr>

		<cfdump var="#form#">
		<cfdump var="#qry_results#" top="50">
    
    		</cfoutput>
    	</cfcase>
	<cfcase value=".xls">
   	 	<cfinclude template="dsp_results_xls.cfm">
    	</cfcase>
	<cfcase value=".pdf">
    		PDF - coming soon    
    	</cfcase>
	<cfcase value=".sql">
    		SQL - coming soon<br>
	</cfcase>
</cfswitch>