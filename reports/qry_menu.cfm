<cfinclude template="qry_links.cfm">

<cfoutput query="qryLinks" group="Group" >
<h2>#qryLinks.Group#</h2>
<div>
<ul class="listMenu">
	<cfoutput><li><a href="../reports/?fa=#qryLinks.Link#">#qryLinks.Name#</a></li></cfoutput>
</ul>
</div>
</cfoutput>