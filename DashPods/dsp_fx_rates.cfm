<!---<cfscript>
function Yesterday() {
return DateAdd("d",-1,Now());
}
</cfscript>

<cfquery datasource="#mainDSN#" name='FXrates' maxrows="1" cachedWithin="#CreateTimeSpan(1,0,0,0)#">
	SELECT 
		RATEAUD,
    	RATEUSD,
        RATEEUR,
        RATEZAR,
		crudeUSprice
    FROM 
    	exchangeRates
    WHERE 
    	RateYear = #val(dateformat(Now(),'YYYY'))#
	AND
    	RateMonth = #val(dateformat(Now(),'MM'))#
	AND
    	RateDay = #val(dateformat(Now(),'DD'))#
</cfquery>

<cfif FXrates.RecordCount EQ 0>

	<cfquery datasource="#mainDSN#" name='FXrates' maxrows="1" cachedWithin="#CreateTimeSpan(1,0,0,0)#">
		SELECT 
			RATEAUD,
	    	RATEUSD,
	        RATEEUR,
	        RATEZAR,
			crudeUSprice
	    FROM 
	    	exchangeRates
	    WHERE 
	    	RateYear = #val(dateformat(Yesterday(),'YYYY'))#
		AND
	    	RateMonth = #val(dateformat(Yesterday(),'MM'))#
		AND
	    	RateDay = #val(dateformat(Yesterday(),'DD'))#
	</cfquery>

</cfif>

<!---<cfdump var="#FXrates#">--->

<cfscript>
	value = FXrates.crudeUSprice;
	exchange = 1/FXrates.RATEUSD;
	exchange = 1/exchange;
	fx = value/exchange;
	price.aud = 'A$ #numberformat(fx*FXrates.RATEaud)#.00';
	price.gbp = '&pound; #numberformat(fx)#.00';
	price.eur = '&euro; #numberformat(fx*FXrates.RATEeur)#.00';
	price.usd = '$ #numberformat(value)#.00';
	price.zar = 'R #numberformat(fx*FXrates.RATEzar)#.00';
	price.crudeUSprice ='$ #value#';
</cfscript>
<cfoutput>
<table width="100%" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <tr>
    <td>BRENT</td>
    <td>#price.crudeUSprice#</td>
  </tr>
    <td width="40">AUD</td>
    <td>#price.aud#</td>
  </tr>
  <tr>
    <td>GBP</td>
    <td>#price.gbp#</td>
  </tr>
  <tr>
    <td>EURO</td>
    <td>#price.eur#</td>
  </tr>
  <tr>
    <td>USD</td>
    <td>#price.usd#</td>
  </tr>
  <tr>
    <td>RAND</td>
    <td>#price.zar#</td>
  </tr>
</table>
</cfoutput>--->
<cfinclude template="../fxrate/dsp_fx_rates.cfm">
<ul class="listMenu">
<cfloop collection="#price#" item="key"><cfoutput>
	<li>#key# : #price[key]#</li>
</cfoutput></cfloop></ul>
<!---<cfdump var="#price#">--->