<cfinclude template="../Application.cfm">

<cfquery datasource="stats" name="getdates">
	SELECT  DISTINCT opendate
    FROM counter 
	WHERE company = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.company#"> AND event = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.eventid#">
    ORDER BY opendate
</cfquery>

<cfchart chartwidth="700" >
	<cfchartseries type="bar" paintstyle="shade" seriescolor="##58bd49"   >
    	<cfloop query="getdates">									
			<cfquery datasource="stats" name="get">
			SELECT  CAST(FLOOR( CAST( opendate AS FLOAT ) )AS DATETIME)
			FROM counter 
			WHERE opendate = '#getdates.opendate#' AND company = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.company#"> AND event = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.eventid#">
			</cfquery>
			<cfchartdata item="#Dateformat(getdates.opendate, "dd.mm.yy")#" value="#get.recordcount#">
       </cfloop>                                     
	</cfchartseries>
</cfchart>
                               