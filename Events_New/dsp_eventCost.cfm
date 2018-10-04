<cfinclude template="qry_eventCost.cfm">

<fieldset>
        	<legend>Event Cost information</legend>  
<form action="qry_eventCost_save.cfm" method="post">
<span>Event Currency</span> 
<i class="NoFormat" >
<select name="eventCurrencyLabel" id="eventCurrencyLabel">
		<option value="USD">USD</option>
        <option value="GBP">GBP</option>
         <option value="ZAR">ZAR</option>
          <option value="AUD">AUD</option>
        <option value="EUR">EUR</option>
</select>
<input type="hidden" name="eventid" id="eventid" value="<cfoutput>#form.eventid#</cfoutput>">
</i>

<span>Event Cost</span> 
<i class="NoFormat" ><input type="text" name="eventPriceValue" id="eventPriceValue"></i>
         
              
<span>Discount percent</span> 
<i class="NoFormat" ><input type="text" name="eventPricePercent" id="eventPricePercent">  </i>


<span>Discount End Date</span> 
<i class="NoFormat" ><input type="text" name="eventPricePercentDate" id="eventPricePercentDate"></i>

<span></span> 
<i class="NoFormat" ><button>Add New Price</button></i>
</form>
</fieldset>


<fieldset>
        	<legend>Event Price List</legend> 


</fieldset>