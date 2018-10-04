<cfparam name="eventPriceType" default="2">
<cfinclude template="qry_selectedCombinations.cfm">

<cfoutput>
<table  border="0" class="table-grid" width="100%">
<cfloop query="qryPriceCombinations">
<tr>
	<td><cfinclude template="qry_eventsFromList.cfm"></td>
    <td>#dateFormat(qryPriceCombinations.eventPriceDateApplied, "dd.mmm.yyyy")#</td>
    <td>#qryPriceCombinations.eventCurrencyLabel#</td>
    <td>#qryPriceCombinations.eventPriceValue#</td>
</tr>
</cfloop>
<tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
</table>
</cfoutput>