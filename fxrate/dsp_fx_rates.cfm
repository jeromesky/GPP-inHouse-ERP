<cfparam name=url.value default=1000>

<cfscript>
function Yesterday() {
return DateAdd("d",-1,Now());
}
</cfscript>

<cfquery datasource="#gpp#" name='FXrates' maxrows="1">
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

	<cfquery datasource="#gpp#" name='FXrates' maxrows="1">
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
	
	            <!--- lastest record --->
            <cfif FXrates.RecordCount EQ 0>
            
            <cfquery datasource="#gpp#" name='FXrates' maxrows="1">
                SELECT 
                    RATEAUD,
                    RATEUSD,
                    RATEEUR,
                    RATEZAR
                FROM 
                    exchangeRates
                ORDER BY
                    exchangeRateID desc
            </cfquery>
            
            <!--- alerts --->         
            
            </cfif>

</cfif>

<!---<cfdump var="#FXrates#">--->

<cfscript>
  value = url.value;
	//value = FXrates.crudeUSprice;
	exchange = 1/FXrates.RATEUSD;
	exchange = 1/exchange;
	fx = value/exchange;
	price.aud = 'A$ #numberformat(ceiling(fx*FXrates.RATEaud))#.00';
	price.gbp = '&pound; #numberformat(ceiling(fx))#.00';
	price.eur = '&euro; #numberformat(ceiling(fx*FXrates.RATEeur))#.00';
	price.usd = '$ #numberformat(value)#.00';
	price.zar = 'R #numberformat(ceiling(fx*FXrates.RATEzar))#.00';
	price.crudeUSprice = value;
</cfscript>

<!---<cfdump var="#price#">--->