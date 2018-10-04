<cfcomponent>
	<cffunction name="xchange" access="public" returntype="string">
		<cfargument name="amountIN" type="numeric" required="yes" default="1000"/>
		<cfargument name="currencyIN" type="string" required="yes" default="USD"/>    
		<cfargument name="currencyOUT" type="string" required="yes" default="GBP"/>
        	<cfset mainDSN = 'gpp'>
     
        <!--- Today --->
        <cfquery datasource="#mainDSN#" name='FXrates' maxrows="1">
            SELECT 
                RATEAUD,
                RATEUSD,
                RATEEUR,
                RATEZAR
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
            
            <!--- yesterday --->
            <cfquery datasource="#mainDSN#" name='FXrates' maxrows="1">
                SELECT 
                    RATEAUD,
                    RATEUSD,
                    RATEEUR,
                    RATEZAR
                FROM 
                    exchangeRates
                WHERE 
                    RateYear = #val(dateformat(DateAdd("d",-1,Now()),'YYYY'))#
                AND
                    RateMonth = #val(dateformat(DateAdd("d",-1,Now()),'MM'))#
                AND
                    RateDay = #val(dateformat(DateAdd("d",-1,Now()),'DD'))#
            </cfquery>

            <!--- lastest record --->
            <cfif FXrates.RecordCount EQ 0>
            
            <cfquery datasource="#mainDSN#" name='FXrates' maxrows="1">
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
        
        <!--- convert incoming to GBP / GBP is default therefore 1 --->
        <cfswitch expression="#currencyIN#">

        	<cfcase value="AUD">
            	<cfscript>
					value = amountIN/FXrates.RATEAUD;
            	</cfscript>
            </cfcase>
 
        	<cfcase value="USD">
            	<cfscript>
					value = amountIN/FXrates.RATEUSD;				
            	</cfscript>
            </cfcase>

            <cfcase value="EUR">
            	<cfscript>
					value = amountIN/FXrates.RATEEUR;
            	</cfscript>
            </cfcase>
            
            <cfcase value="ZAR">
            	<cfscript>
					value = amountIN/FXrates.RATEZAR;
            	</cfscript>
            </cfcase>
 
            <cfcase value="GBP">
            	<cfscript>
					value = amountIN;
            	</cfscript>
            </cfcase>

        </cfswitch>
        
        <!--- convert out going from GBP --->
        <cfswitch expression="#currencyOUT#">

        	<cfcase value="AUD">
            	<cfscript>
					amountOUT = value*FXrates.RATEAUD;
            	</cfscript>
            </cfcase>
 
        	<cfcase value="USD">
            	<cfscript>
					amountOUT = value*FXrates.RATEUSD;		
            	</cfscript>
            </cfcase>

            <cfcase value="EUR">
            	<cfscript>
					amountOUT = value*FXrates.RATEEUR;
            	</cfscript>
            </cfcase>
            
            <cfcase value="ZAR">
            	<cfscript>
					amountOUT = value*FXrates.RATEZAR;
            	</cfscript>
            </cfcase>
            
            <cfcase value="GBP">
            	<cfscript>
					amountOUT = value;
            	</cfscript>
            </cfcase>
 
            <cfdefaultcase>
            	<cfscript>
					amountOUT = value;
            	</cfscript>
            </cfdefaultcase>

        </cfswitch>
        
		<cfreturn amountOUT>
	</cffunction>
    
    <cffunction name="legal" access="public" returntype="string">
    	<cfset statement ="The currency rate used is the last closing session value">
 		<cfreturn statement>
	</cffunction>
    
</cfcomponent>