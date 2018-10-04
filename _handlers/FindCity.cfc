<cfcomponent>
	<cffunction name="FindCity" access="public" returntype="numeric">
		<cfargument name="cityID" required="yes" type="numeric" default="0" />
		<cfargument name="strCity" required="yes" type="string" default="0" />
		<cfargument name="Country_ID" required="yes" type="numeric" default="0" />
		<cfset gpp = 'GPP'> 
        <cfset contactAdmin = 'jerome@glopac-partners.com; jason@glopac-partners.com' >
        
		<cfif arguments.cityID EQ 0 OR arguments.cityID EQ -1 AND arguments.strCity EQ "">

			<cfscript>
                cityID = 0;
      		</cfscript>

		<cfelseif cityID EQ 0 OR cityID EQ -1 AND strCity NEQ "">
        <!--- if a new City this is Double check --->

			<!--- Check if city exists --->
			<cfquery datasource="#gpp#" name="city_check">
				SELECT  
					[cityID],
					[CityNameEN]
                FROM
                	Cities
                WHERE
                	CityNameEN = <cfqueryparam cfsqltype="cf_sql_char" value="#trim(strCity)#"> 
                AND
                    CountryID =  <cfqueryparam cfsqltype="cf_sql_integer" value="#Country_ID#">
			</cfquery>

			<cfif city_check.recordcount EQ 0>

			<!--- if a new City Add to the table --->
			<cfquery datasource="#gpp#" name="get_cityID">
            	INSERT INTO 
                	Cities (
                    	CountryID, 
                        CityNameEN, 
                        active
                        )
                 VALUES(
					<cfqueryparam cfsqltype="cf_sql_integer" value="#country_id#">,
                    <cfqueryparam cfsqltype="cf_sql_char" value="#left(strCity, 50)#">,
                    <cfqueryparam cfsqltype="cf_sql_integer" value="0">
						)
				SELECT @@IDENTITY AS cityID
			</cfquery>

			<cfmail to="#contactAdmin#" from="web@petro21.com" subject="new city added">
            	City: #strCity#<br />
            	Added by: #Session.username#
            </cfmail>

			<cfscript>
				cityID = get_cityID.cityID;
			</cfscript> 

			<cfelseif city_check.recordcount EQ 1>
			<!--- if the city exists set the city id --->

			<cfscript>
				cityID = city_check.cityID;
			</cfscript>

			<cfelseif city_check.recordcount GT 1>
            <!--- if more then 1 record found error send email --->

				<!--- if more then 1, set the ID to the 1st record --->
                <cfscript>
					cityID = city_check.cityID;
				</cfscript>

                <cfmail to="#contactAdmin#" from="web@petro21.com" subject="city added with miltible records found">
                	Using #cgi.PATH_INFO##cgi.SCRIPT_NAME# :<br /><br />
                    <cfloop query="city_check">
                    #city_check.cityID# - #city_check.CityNameEN#<br />
                    </cfloop>
                </cfmail>
        	</cfif>
		</cfif>
        <cfreturn cityID>
	</cffunction>
</cfcomponent>