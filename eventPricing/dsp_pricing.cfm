<cfset  parentID = form.parentID>
<cfinclude template="qry_eventGroup.cfm">
<cfparam name="eventPriceType" default="2">
<cfoutput>

<div class="c5">
	<fieldset>
    	<legend>Add A price for events</legend>
        	<form id="EventNewPriceForm" action="../eventPricing/qry_addPrice.cfm" method="post">
            <input type="hidden" name="parentID" value="#parentID#" />
            	<b>Event Currency </b>
    			<i class="NoFormat"><cf_Select_Currency_Admin name="eventCurrencyLabel" value=""></i>
                <hr />
                	<b>Price</b>
                    <i class="NoFormat">Event name</i>
                <!---<ul class="ul-list-type-none">   --->                
                    <cfloop query="qryEventsGroup_names">
                    <b><input type="text" name="#qryEventsGroup_names.eventID#" id="" style="width:50px" /></b>
                    <i class="NoFormat">#qryEventsGroup_names.event_name#</i></cfloop>
                    
                <!---</ul>--->
                <hr />
                <b> </b>
    			<i class="NoFormat"><button >Add Price</button></i>
			</form>

		</fieldset>
</div>

<div class="c5">
	<fieldset>
    	<legend>Latest applied  costs</legend>
        	<div id="area_areaPrices">
				<cfinclude template="dsp_selectedCombinations.cfm">
        	</div>
	</fieldset>

</div></cfoutput>

