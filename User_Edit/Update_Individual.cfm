<cfif NOT parameterexists(form.FIELDNAME) OR NOT parameterexists(form.id)>
	<cfabort>
</cfif>

<cfset editedField = #form.fieldname# >
<cfset value = URLDecode(form.value)>

<!--- same value is being saved so abort --->
<cfif parameterexists(form.oldValue) AND hash(form.oldValue) EQ hash(value)>
<cfoutput>#value#</cfoutput>
<cfabort>
</cfif>

<cfif parameterexists(form.id) AND value NEQ "">

<!---check if new city--->    
	<cfif parameterexists(form.strCity) AND  value EQ -1>
			<cfscript>
                 finding = createObject("component", "my-office._handlers.FindCity");
                qry_findCity = finding.FindCity(#value#, #form.strCity#, #form.country_id# );
            </cfscript>	
            <cfset value = #qry_findCity# >
    </cfif>	
    
        <cfquery datasource="#gpp#" name="get">
                UPDATE   tblIndividual 
                SET       
					<cfif editedField EQ "Black_Listed"> 
                        Black_Listed = <cfqueryparam cfsqltype="cf_sql_bit" value="#value#">,
                        Black_Listed_Date = <cfqueryparam cfsqltype="cf_sql_date" value="#Now()#">
                    <cfelseif editedField EQ "Black_Listed_comment">          
                        Black_Listed_comment = <cfqueryparam  value="#left(value, 300)#">
                    <cfelseif isdate(value) AND len(value) GTE 8 >
                        #editedField# = <cfqueryparam cfsqltype="cf_sql_date" value="#value#">
                    <cfelseif Isnumeric(value)>
                        #editedField# = <cfqueryparam  value="#value#">
                    <cfelseif IsBoolean(value)>
                        #editedField# = <cfqueryparam cfsqltype="cf_sql_bit" value="#value#">       		                        
					<cfelse>
                        #editedField# = <cfqueryparam  value="#value#">
                	</cfif>	
                WHERE IngIndividual_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
        </cfquery>

	<cfif editedField EQ "Countryid" >
        		<cfquery datasource="#gpp#" name="qryCountry">
                	SELECT 
                    	[countryNameEN]
                    FROM
                    	[countries]
                    WHERE
                    	[countryID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#value#">
                </cfquery>
                
                <cfset value = #qryCountry.countryNameEN#>
        </cfif>
        
        <cfif editedField EQ "cityID" >
        		<cfquery datasource="#gpp#" name="qryCity">
                	SELECT 
                    	[cityNameEN]
                    FROM
                    	[cities]
                    WHERE
                    	[cityID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#value#">
                </cfquery>

                <cfset value = #qryCity.cityNameEN#>
        </cfif>

<!--- CHECK RECORD TO MAKE sure UPDATE HAS BEEN DONE CORRECTLY --->
        <cfquery datasource="#gpp#" name="CheckRecord">
                SELECT 
                    #editedField# AS valueToCheck
                FROM
                    tblIndividual 
                WHERE 
                    IngIndividual_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
        </cfquery>

		<cfif value EQ CheckRecord.valueToCheck>
                <cfset updated = "1">
        <cfelse>
                <cfset updated = "2">
        </cfif>
        
		<cfoutput>{"data" : "#value#", "status" : "#updated#"}</cfoutput>

<cfelseif parameterexists(form.id) AND value EQ "">

        <cfquery datasource="#gpp#" name="get">
                UPDATE 
                  tblIndividual
                SET  
                  <cfif Isnumeric(value)>
                    #editedField# = <cfqueryparam value="0">     
                    <cfelse >
                    #editedField# = <cfqueryparam value="">
                    </cfif>
            WHERE IngIndividual_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
        </cfquery>
</cfif>
<cfinclude template="../components/qry_userUpdate.cfm">