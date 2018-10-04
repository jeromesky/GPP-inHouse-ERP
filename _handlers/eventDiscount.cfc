<cfcomponent>

	<cffunction name="bookingEventDiscount" access="public" returntype="numeric">
		<cfargument name="eventIDsIN" type="string" required="yes" default=""/>
        
        <cfscript>
			gpp = 'gpp';
            returningDiscount = 0;
		</cfscript>

		<cfquery datasource="#gpp#" name="qryEvent">
        	SELECT TOP 1 
            	[eventID]
            FROM
            	PM_events
            WHERE eventID IN (<cfqueryparam cfsqltype="cf_sql_integer" value="#eventIDsIN#" list="yes">) 
            AND event_type = 'event'
        </cfquery>

        <cfif qryEvent.recordcount EQ 0>

            <cfset returningDiscount = 0 >

        <cfelse>
        
            <cfquery datasource="#gpp#" name="qryDiscount">
                SELECT TOP 1
                    [eventPricePercent] AS discountValue
                FROM         
                    [eventPrices]
                WHERE
                    [eventPricePercentDate] >= <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
                 AND
                    [eventID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#qryEvent.eventID#">
                ORDER BY 
                    [eventPriceID] DESC
            </cfquery>
            
            <cfscript>
		
				if (qryDiscount.recordcount GT 0){
					returningDiscount = qryDiscount.discountValue;
				} else {
					
					returningDiscount = 0;
				}
			</cfscript>

        </cfif>

    	<cfreturn returningDiscount>
	</cffunction>

</cfcomponent>

<!---
<cfset returningDiscount = qryDiscount.discountValue>
<cfscript>
			if (qryDiscount.recordcount GT 0){
				returningDiscount = qryDiscount.discountValue;
			} else {
				returningDiscount = 0;
			}
		</cfscript>
<cfif qryDiscount.recordcount GT 0>
	<cfset returnDiscount = qryDiscount.discountValue>
<cfelse>
	<cfset returnDiscount = 0>
</cfif>
<cfqueryparam cfsqltype="cf_sql_date" value="#dateAdd('d', -1, now())#">
<cfscript>
		
			if (qryDiscount.recordcount GT 0){
				returnDiscount = qryDiscount.discountValue;
			} else {
				returningDiscount = 0;
			}
			
			if (qryDiscount.recordcount NEQ 1){
				qryDiscount.discountValue = 0;
			}

			if (qryDiscount.recordcount EQ 0){
				returningDiscount = 0;
			} else if (qryDiscount.recordcount GT 0){
				returnDiscount = qryDiscount.discountValue;
			} else{
				returningDiscount = 0;
			}
		</cfscript>--->