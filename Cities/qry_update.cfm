<cfif parameterexists(form.newcountryid)>
    <cfquery datasource="#gpp#">
        UPDATE 
        	tblIndividual
        SET		
             countryid 		= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.newcountryid#">
        WHERE   
            IngIndividual_ID = <cfqueryparam cfsqltype="cf_sql_integer"  value="#form.IngIndividual_ID#">
    </cfquery>
<cfelse>

	<cfif form.cityID EQ -1>

	  <cfif form.strCity EQ "none">
		  <cfset cityID =   "-1" > 
          <cfparam name="form.strCity" default="no details - city - db">
       <cfelse>
          <cfquery datasource="#gpp#" name="get_cityID">
          	INSERT INTO Cities (CountryID, CityNameEN, active)
          	VALUES(
          <cfqueryparam cfsqltype="cf_sql_integer" value="#form.countryid#">
          ,<cfqueryparam cfsqltype="cf_sql_char" value="#left(form.strCity, 50)#">
          ,<cfqueryparam cfsqltype="cf_sql_integer" value="0">
          )
          	SELECT @@IDENTITY AS cityID
          </cfquery>
          <cfset cityID = #get_cityID.cityID#>   
          <cfmail to="#contactAdmin#" from="web@petro21.com" subject="new city added">
          By: #Session.staffName#<br />City: #form.strCity#<br />countryID: #form.countryid#
          </cfmail>
    </cfif>               
	</cfif>
            <cfset cityID = form.cityID>
        <cfquery name="get" datasource="#gpp#">
            SELECT  strCity, CountryName, IngIndividual_ID
            FROM         tblIndividual
            WHERE     (STATUS = 'C') AND (cityID IS NULL) 
            AND countryid = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.countryid#">
            AND strCity  = <cfqueryparam cfsqltype="cf_sql_char" value="#form.OldstrCity#">
        </cfquery>

        <cfset updateList = ValueList(get.IngIndividual_ID, ",") >

        <cfloop query="get">
                <cfquery  datasource="#gpp#">
                UPDATE  tblIndividual
                SET		
                     cityID = <cfqueryparam cfsqltype="cf_sql_integer" value="#cityID#">
                     <cfif parameterexists(form.Updatecity)>
                    ,strCity = <cfqueryparam cfsqltype="cf_sql_char" value="#form.strCity#">
                    </cfif>
                    <cfif parameterexists(form.neibourhood)>
                    ,neibourhood = <cfqueryparam cfsqltype="cf_sql_integer" value="1">
                    </cfif>
                WHERE   
                    IngIndividual_ID IN (<cfqueryparam cfsqltype="cf_sql_integer"  value="#get.IngIndividual_ID#">)
                </cfquery>
        </cfloop>
        <cfoutput>#get.recordcount# records updated</cfoutput>
</cfif>