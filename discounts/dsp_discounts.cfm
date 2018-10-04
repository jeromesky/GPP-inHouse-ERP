
<cfinclude template="qry_discounts.cfm">

<cfoutput query="qryDiscounts">
	<div id="discount#qryDiscounts.eventPriceID#" class="row"  onClick="javascript:deletDiscount(#qryDiscounts.eventPriceID#);" >
        <div class="percent">#qryDiscounts.eventPricePercent# %</div>
        <div class="endDate">#dateFormat(qryDiscounts.eventPricePercentDate, "dd.mm.yy")#</div>
        <div class="dateAdded">#dateFormat(qryDiscounts.eventPriceDateApplied, "dd.mm.yy")#</div>
    </div></cfoutput>