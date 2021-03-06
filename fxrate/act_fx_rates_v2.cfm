<cfparam name="url.site" default="http://www.ecb.europa.eu">
<cfparam name="url.dir" default="stats/eurofxref">
<cfparam name="url.page" default="eurofxref-daily.xml">

<cfparam name="FXrates.recordcount" default="0">

<cfquery datasource='#mainDSN#' name='FXrates'>
	SELECT 
    	1
    FROM 
    	exchangeRates
    WHERE 
    	RateYear = #val(dateformat(now(),'YYYY'))#
	AND
    	RateMonth = #val(dateformat(now(),'MM'))#
	AND
    	RateDay = #val(dateformat(now(),'DD'))#;
</cfquery>

<cfif FXrates.recordcount EQ 0>

<!---	<cftry> --->

		<cfhttp url="#url.site#/#url.dir#/#url.page#" method="GET" resolveurl="No" useragent="Mozilla/5.0 (Danger hiptop 3.4; U; AvantGo 3.2)"></cfhttp>

		<cfscript>
            fxrate.date = dateformat(now(), 'YYYY-MM-DD');
            fxrate.dateYear = Val(Dateformat(now(), 'YYYY'));
            fxrate.dateMonth = Val(Dateformat(now(), 'MM'));
            fxrate.dateDay = Val(Dateformat(now(), 'DD'));
        
            source =XMLParse(cfhttp.FileContent);
            dig = source['gesmes:Envelope'].cube.cube;

            //--- collect value 
            EUR = 1;           
            AUD = dig.cube[18].XmlAttributes.rate;
            USD = dig.cube[1].XmlAttributes.rate;
            ZAR = dig.cube[33].XmlAttributes.rate;
            GBP = dig.cube[6].XmlAttributes.rate;
            
            //-- convert from euro value to uk pound
            xchangeRatio = 1/GBP;
            
            fxrate.AUD = numberformat(AUD*xchangeRatio, '99.9999');
            fxrate.EUR = numberformat(EUR*xchangeRatio, '99.9999');
            fxrate.USD = numberformat(USD*xchangeRatio, '99.9999');
            fxrate.ZAR = numberformat(ZAR*xchangeRatio, '99.9999');
            fxrate.GBP = numberformat(GBP*xchangeRatio, '99.____');
        </cfscript>
        
          <!--- collect the oil price --->
         <cfscript>
                fxrate.crudeUSprice ="";
          </cfscript>
        
        <cfquery datasource="#mainDSN#" name="insertData">
            INSERT INTO 
                exchangeRates (
                    RateDate, 
                    RateYear,
                    RateMonth,
                    RateDay,
                    RateAUD,
                    RateEUR,
                    RateUSD,
                    RateZAR,
                    crudeUSprice
            )
            VALUES (
                    '#fxrate.date#',
                    '#fxrate.dateYear#',
                    '#fxrate.dateMonth#',
                    '#fxrate.dateDay#',
                    '#fxrate.aud#',
                    '#fxrate.eur#',
                    '#fxrate.usd#',
                    '#fxrate.zar#',
                    '#fxrate.crudeUSprice#'
            );
        </cfquery>
<!---
        <cfcatch type="any">
        Error: Refer to internal note regarding this page and usage.
        </cfcatch>
    
    </cftry> --->

</cfif>