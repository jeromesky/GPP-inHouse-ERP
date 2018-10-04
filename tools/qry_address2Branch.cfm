<!---<cfdump var="#form#">--->
<cfset gpp = "GPP">
<cfset RegionID = 0>

<cfif NOT parameterexists(form.noCreate)>

			<cfif form.streetRegionName NEQ "" OR form.postalRegionName NEQ "" AND form.CountryID NEQ "" >
            
            	<cfif form.streetRegionName NEQ "">
            			<cfset RegionName = form.streetRegionName>
                <cfelseif form.postalRegionName NEQ "">
                		<cfset RegionName = form.postalRegionName>
                </cfif>

            	<cfquery datasource="#gpp#" name="qryFindRegions">
                		SELECT TOP 1 RegionID
                        FROM
                        	[regions]
                       WHERE
                       		[RegionName] = <cfqueryparam cfsqltype="cf_sql_char" value="#RegionName#">
                            AND
                            [CountryID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.CountryID#">
                </cfquery>

                <cfif qryFindRegions.recordcount EQ 0>
                		<cfquery datasource="#gpp#" name="qryAddRegion">
                				INSERT INTO 
                                	[regions] (RegionName, CountryID )
                                VALUES
                                	(
                                     <cfqueryparam cfsqltype="cf_sql_char" value="#Left(RegionName, 50)#">
                                    ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.CountryID#">
                                    )
                                SELECT @@IDENTITY as RegionID
                		</cfquery>
                    <cfset RegionID = #qryAddRegion.RegionID#>

                <cfelseif qryFindRegions.recordcount EQ 1>
                	<cfset RegionID = #qryFindRegions.RegionID#>
                
                </cfif>
            </cfif>

            <cfquery datasource="#gpp#" name="qryNewBranch">
            		INSERT INTO Branch (branchType)
                    VALUES (504)
            		SELECT @@IDENTITY as branchID
            </cfquery>
            
            <cfif len(form.postalAddress) GT 0>
            	<cfset form.postalAddress = UCase(left(form.postalAddress,1)) & Lcase(Right(form.postalAddress,Len(form.postalAddress)-1))>
            </cfif>
			<cfif len(form.streetAddress) GT 0>
            	<cfset form.streetAddress = UCase(left(form.streetAddress,1)) & Lcase(Right(form.streetAddress,Len(form.streetAddress)-1))>
            </cfif>

            <cfquery datasource="#gpp#">
                UPDATE Branch
                SET 
                   [companyID]				= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID#">
                  ,[postalAddress]			= <cfqueryparam cfsqltype="cf_sql_char" value="#form.postalAddress#">
                  ,[postalCityID]				= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.CityID#">
                  ,[PostalCode]				= <cfqueryparam cfsqltype="cf_sql_char" value="#trim(Ucase(form.PostalCode))#">
                  ,[postalCountryID]		= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.CountryID#">
                  <cfif RegionID NEQ 0>
                  ,[postalRegionID]		= <cfqueryparam cfsqltype="cf_sql_integer" value="#RegionID#">
                  </cfif>
                  ,[streetAddress]			= <cfqueryparam cfsqltype="cf_sql_char" value="#form.streetAddress#">
                  										
                  ,[streetCityID]				= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.CityID#">
                  ,[StreetCode]				= <cfqueryparam cfsqltype="cf_sql_char" value="# trim(Ucase(form.StreetCode))#">
                  ,[streetCountryID]		= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.CountryID#">
                  <cfif RegionID NEQ 0>
                  ,[streetRegionID]		= <cfqueryparam cfsqltype="cf_sql_integer" value="#RegionID#">
                  </cfif>
                  ,[branchAreaPhone]	= <cfqueryparam cfsqltype="cf_sql_char" value="#trim(form.branchAreaPhone)#">
                  ,[branchPhoneNo]		= <cfqueryparam cfsqltype="cf_sql_char" value="#trim(form.branchPhoneNo)#">
                  ,[branchAreaFax]		= <cfqueryparam cfsqltype="cf_sql_char" value="#trim(form.branchAreaFax)#">
                  ,[branchFaxNo]			= <cfqueryparam cfsqltype="cf_sql_char" value="#trim(form.branchFaxNo)#">
            
               WHERE
                    [branchID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#qryNewBranch.branchID#">
            </cfquery>

            <cfquery datasource="#gpp#" name="qryUpdateUser">
                UPDATE 
                        [tblIndividual]
                SET 
                        [branchID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#qryNewBranch.branchID#">
                WHERE 
                        [IngIndividual_ID] IN (<cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#form.userID#">)
            </cfquery>

<cfelse>

			<cfquery datasource="#gpp#" name="qryUpdateUser">
                UPDATE 
                        [tblIndividual]
                SET 
                        [branchID] =  -1
                WHERE 
                        [IngIndividual_ID] IN (<cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#form.userID#">)
     	 </cfquery>

</cfif>


<cflocation url="dsp_address.cfm?searching=#form.URLsearching#" addtoken="no">