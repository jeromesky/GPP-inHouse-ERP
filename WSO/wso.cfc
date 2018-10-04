<cfcomponent>

	<cffunction name="getContent">
		<cfargument name="id" type="numeric">
		
        <cfquery datasource="#dsnP21#" name="qryData">
		SELECT id, wso_name, wso_currency, wso_cost, wso_descr FROM events WHERE id = #arguments.id#
		</cfquery> 
		<cfsavecontent variable="out">
			<cfoutput>
			<h3>#qryData.wso_name#</h3>
			<p>#qryData.wso_descr# #qryData.wso_currency# #qryData.wso_cost#</p><br><br>
			#now()#
			</cfoutput>
		</cfsavecontent>
		<cfreturn out>
	</cffunction>
    
</cfcomponent>