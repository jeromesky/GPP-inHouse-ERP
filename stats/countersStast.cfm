<cfinclude template="../Application.cfm">

	<cfquery datasource="stats" name="getstats">
	SELECT COUNT(COMPANY) AS clickcount
	FROM counter 
    WHERE company = #url.o#
	</cfquery>



<cfoutput query="getstats">
<ul>
	<li>#clickcount#</li>
</ul>

</cfoutput>