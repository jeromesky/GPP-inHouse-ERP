<cfinclude template="qry_areas.cfm">
<div class="c2" style="width:132px">
<cfloop query="qry_areas" startrow="1" endrow="#(qry_areas.recordcount /2)#"  ><cfoutput><label><input type="checkbox" name="areaID" value="#qry_areas.areaID#" <cfif listFind(url.areaID, qry_areas.areaID)>checked="checked"</cfif>>#qry_areas.areaName#</label></cfoutput></cfloop>
</div>
<div class="c2" style="width:132px">
<cfloop query="qry_areas" startrow="#(qry_areas.recordcount /2 +1)#" endrow="#qry_areas.recordcount#"  ><cfoutput><label><input type="checkbox" name="areaID" value="#qry_areas.areaID#" <cfif listFind(url.areaID, qry_areas.areaID)>checked="checked"</cfif>>#qry_areas.areaName#</label></cfoutput></cfloop>
</div>