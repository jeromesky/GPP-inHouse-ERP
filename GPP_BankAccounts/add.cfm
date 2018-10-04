<cfinclude template="../Application.cfm">


<cfif parameterexists(form.bankID)>
            <cfquery datasource="#gpp#"  >
                UPDATE bankAccounts
                SET
                companyName = <cfqueryparam value="#form.companyName#" >,
                bankName  = <cfqueryparam value="#form.bankName#" >,
                AccountNumber = <cfqueryparam value="#form.AccountNumber#" >,
                Vat = <cfqueryparam value="#form.Vat#" >,
                IBAN = <cfqueryparam value="#form.IBAN#" >,
                BIC = <cfqueryparam value="#form.BIC#" >,
                BranchCode = <cfqueryparam value="#form.BranchCode#" >,
                RegistrationNo = <cfqueryparam value="#form.RegistrationNo#" >,
                city = <cfqueryparam value="#form.city#" >,
                Zip = <cfqueryparam value="#form.Zip#" >, 
                Country = <cfqueryparam value="#form.Country#" >, 
                Address = <cfqueryparam value="#form.Address#" >,
            
                VATValue = <cfqueryparam value="#form.VATValue#" >, 
                name = <cfqueryparam value="#form.name#" > ,
                currency = <cfqueryparam value="#form.currency#" >,
                c_address	= <cfqueryparam cfsqltype="cf_sql_char" value="#form.c_address#" >,
              	c_country = <cfqueryparam cfsqltype="cf_sql_char" value="#form.c_country#" >,
              	c_city = <cfqueryparam cfsqltype="cf_sql_char" value="#form.c_city#" >,
              	c_zip = <cfqueryparam cfsqltype="cf_sql_char" value="#form.c_zip#" >,
                bankBeneficiary = <cfqueryparam cfsqltype="cf_sql_char" value="#form.bankBeneficiary#">
                WHERE 
                	bankID 	= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.bankID#">    
            </cfquery>
<cfelse>
			<cfquery datasource="#gpp#"  name="get" >
            INSERT INTO bankAccounts (VATValue)
            VALUES ('0')
            SELECT @@IDENTITY AS bankID
			</cfquery>
            <cfquery datasource="#gpp#"  >
                UPDATE bankAccounts
                SET
                companyName = <cfqueryparam value="#form.companyName#" >,
                bankName  = <cfqueryparam value="#form.bankName#" >,
                AccountNumber = <cfqueryparam value="#form.AccountNumber#" >,
                Vat = <cfqueryparam value="#form.Vat#" >,
                IBAN = <cfqueryparam value="#form.IBAN#" >,
                BIC = <cfqueryparam value="#form.BIC#" >,
                BranchCode = <cfqueryparam value="#form.BranchCode#" >,
                RegistrationNo = <cfqueryparam value="#form.RegistrationNo#" >,
                city = <cfqueryparam value="#form.city#" >,
                Zip = <cfqueryparam value="#form.Zip#" >, 
                Country = <cfqueryparam value="#form.Country#" >, 
                Address = <cfqueryparam value="#form.Address#" >,
            
                VATValue = <cfqueryparam value="#form.VATValue#" >, 
                name = <cfqueryparam value="#form.name#" > ,
                currency = <cfqueryparam value="#form.currency#" >,
                bankBeneficiary = <cfqueryparam cfsqltype="cf_sql_char" value="#form.bankBeneficiary#">
                WHERE bankID 	= <cfqueryparam cfsqltype="cf_sql_integer" value="#get.bankID#">    
            </cfquery>
</cfif>