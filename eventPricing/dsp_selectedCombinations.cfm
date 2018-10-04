<cfinclude template="qry_selectedCombinations.cfm">


<table  border="0" class="table-grid" width="100%">
<cfoutput query="qryPriceCombinations" group="eventPriceDateApplied">
<tr>
	<td colspan="3">on the: <strong>#dateFormat(qryPriceCombinations.eventPriceDateApplied, "dd.mmm.yyyy")#</strong></td>
</tr>
<cfoutput>
<tr>
	<td><cfinclude template="qry_eventsFromList.cfm"></td>
    <td> price set to: <strong>#qryPriceCombinations.eventPriceValue#</strong></td>
    <td><a href="#qryPriceCombinations.eventPriceID#">delete</a></td>
</tr>
</cfoutput></cfoutput>
<tr>
    <td></td>
    <td></td>
</tr>
</table><!----

<div class="tableContainer">
<cfloop query="qryPriceCombinations">
	<div class="tableRow">
    		<div class="tableColData"><cfinclude template="qry_eventsFromList.cfm"></div>
    		<div class="tableColData">#qryPriceCombinations.eventPriceValue#</div>
            <div class="tableColData">#dateFormat(qryPriceCombinations.eventPriceDateApplied, "dd.mmm.yyyy")#</div>
    </div></cfloop>
</div></cfoutput>--->