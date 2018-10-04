<cfsilent>
    <cfswitch expression="#form.currency#">
    
        <cfcase value="£">
            <cfset thecurrencyIN = "GBP" >
        </cfcase>
        
        <cfcase value="$">
            <cfset thecurrencyIN = "USD" >
        </cfcase>

        <cfcase value="ZAR">
            <cfset thecurrencyIN  = "ZAR" >
        </cfcase>
        
        <cfcase value="EUR">
            <cfset thecurrencyIN = "EUR" >
        </cfcase>
        
        <cfcase value="AUD">
            <cfset thecurrencyIN = "AUD" >
        </cfcase>
    
    </cfswitch>

    <cfparam name="form.fxa" default="1000">
    <cfparam name="form.fxic" default="USD">
    <cfparam name="form.fxoc" default="GBP">
    
    <cfscript>
        amount = #form.total#;
        currencyIN = thecurrencyIN;
        currencyOUT = 'GBP';
        fx = createObject("component", "officeCfc.fx");
      	qry_fx_rate = fx.xchange(amount,'#currencyIN#','#currencyOUT#');
      	//qry_fx_rate = fx.xchange();
    </cfscript>
</cfsilent>
<cfoutput>#numberFormat(qry_fx_rate, "99999.99")#</cfoutput>