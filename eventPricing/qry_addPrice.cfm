
<cfsilent>
<cfloop collection="#form#" item="items">
	<cfif items EQ "FIELDNAMES" OR items EQ "EVENTCURRENCYLABEL" OR items EQ "PARENTID">
	<cfelse>
    
    <cfif form[items] NEQ "">
        <cfquery datasource="#gpp#" >
        INSERT INTO eventPrices (
                                                [eventPriceValue]
                                                ,[eventID]
                                                ,[eventPriceDateApplied]
                                                ,[eventParentID]
                                                ,[eventCurrencyLabel]
                                                )
        VALUES ( 
                        <cfqueryparam cfsqltype="cf_sql_decimal" value="#form[items]#">
                        ,<cfqueryparam cfsqltype="cf_sql_char" value="#items#">
                        ,<cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
                        ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.parentID#">
                        ,<cfqueryparam cfsqltype="cf_sql_char" value="#form.eventCurrencyLabel#">
                        )
        </cfquery>
	</cfif>
    </cfif>
</cfloop>
</cfsilent>
<cfinclude template="dsp_selectedPrices.cfm">