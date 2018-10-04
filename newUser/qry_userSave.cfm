<cftry>
<cfparam name="form.AKA_companyID" default="0">
<cfparam name="form.companyID" default="0">
<cfset companyID = #form.companyID#>

<!--- CHECK to see if two company ids are returned --->
<cfif ListLen(companyID, ",") GT 1>
	<cfmail to="jerome@glopac.com; jason@glopac.com" from="web@petro21.com" subject="possible error: save new user page two company IDs found" type="html">#companyID#</cfmail>
	<cfif listFind(companyID, 0, ",") NEQ 0 >
        <cfset companyID = ListDeleteAt(companyID, listFind(companyID, 0, ",") , ",")>
	</cfif>
	<cfif listFind(companyID, 0, ",") NEQ 0>
        <cfset companyID = ListDeleteAt(companyID, listFind(companyID, 0, ",") , ",")>
	</cfif>	

</cfif>

<cfif form.userID EQ "">

    <cfquery datasource="#gpp#" name="qryLastNewID">
        SELECT TOP 1 
            [IngIndividual_ID]
        FROM 
            [tblindividual]
        WHERE 
        	[staffIDAdded] = #session.gpp_id#
       AND
       		[dtmCaptured] = <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
        ORDER BY  
        	IngIndividual_ID DESC 
    </cfquery>
    
    <cfset form.userID = #qryLastNewID.IngIndividual_ID# >
</cfif>

<!---<cfif parameterexists(form.companyID) AND form.companyID EQ 0 >--->
<cfif companyID EQ 0>
	<cfinclude template="../Companies/qry_company_Update.cfm">        
</cfif>

<cfif parameterexists(form.aka_companyName) AND form.aka_companyName NEQ "">
	<cfinclude template="../companyLabels/qry_addLabel.cfm">        
</cfif>

<!--- SET BRANCH --->
<cfif parameterexists(form.branchID) and form.branchID NEQ 0>
	<!--- place holder --->	
<cfelseif parameterexists(form.branchID) and form.branchID EQ 0>
	<cfinclude template="../Branches/qry_branch_Save.cfm">
<cfelse>
	<cfset form.branchID = 0>
</cfif>

<cfquery datasource="#gpp#" name="get_new">
	UPDATE
		tblindividual
	SET
    	prefixID		= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.prefixID#">,
        strFirst_Name 	= <cfqueryparam cfsqltype="cf_sql_char" value="#left(form.username, 100)#">,
        strSurname	  	= <cfqueryparam cfsqltype="cf_sql_char" value="#left(form.userSurname, 100)#">,
        strDesignation 	= <cfqueryparam cfsqltype="cf_sql_char" value="#left(form.strDesignation, 100)#">,
        userMidlename	= <cfqueryparam cfsqltype="cf_sql_char" value="#left(form.userMidlename, 100)#">,
        status			= <cfif parameterexists(form.Flagged) AND form.Flagged EQ 1><cfqueryparam cfsqltype="cf_sql_integer" value="2"> <cfelse> <cfqueryparam cfsqltype="cf_sql_char" value="C"></cfif> ,
        duplicate		= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.duplicate#">,
        CapBy 			= <cfqueryparam cfsqltype="cf_sql_char" value="#session.username#">,
        staffIDAdded 	= <cfqueryparam cfsqltype="cf_sql_integer" value="#session.gpp_id#">,
        branchID		= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.branchID#">,
        lngCompany_ID 	= <cfqueryparam cfsqltype="cf_sql_char" value="0">,
        AKA_companyID 	= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.aka_companyID#">,
        companyID		= <cfqueryparam cfsqltype="cf_sql_integer" value="#companyID#">,
		<cfif parameterexists(form.AreaCodeTel)>
            ph_code	= <cfqueryparam   value="#left(form.AreaCodeTel, 10)#">,</cfif>
 		<cfif parameterexists(form.strPhDirect_No)>
            ph_no	= <cfqueryparam   value="#left(form.strPhDirect_No, 50)#">,</cfif>
 		<cfif parameterexists(form.AreaCodeTelAlt)>
            ph_CodeAlt = <cfqueryparam   value="#left(form.AreaCodeTelAlt, 10)#">,</cfif>
 		<cfif parameterexists(form.strPhAlt1_No)>
            ph_NoAlt = <cfqueryparam   value="#left(form.strPhAlt1_No, 50)#">,</cfif>
 		<cfif parameterexists(form.AreaCodeFax)>
            fax_code	= <cfqueryparam cfsqltype="cf_sql_char" value="#left(form.AreaCodeFax, 10)#">,</cfif>
 <cfif parameterexists(form.strFaxDirect_No)>
            fax_no	= <cfqueryparam cfsqltype="cf_sql_char" value="#left(form.strFaxDirect_No, 50)#">,</cfif>
 <cfif parameterexists(form.AreaCodeFaxAlt)>
            fax_codeAlt	= <cfqueryparam cfsqltype="cf_sql_char" value="#left(form.AreaCodeFaxAlt, 10)#">,</cfif>
 <cfif parameterexists(form.strFaxAlt1_No)>
            fax_noAlt	= <cfqueryparam cfsqltype="cf_sql_char" value="#left(form.strFaxAlt1_No, 50)#">,</cfif>
 <cfif parameterexists(form.strMobile_No)>
            MobileNo	= <cfqueryparam cfsqltype="cf_sql_char" value="#left(form.strMobile_No, 50)#">,</cfif>
 <cfif parameterexists(form.userPhoNumbInt)>
            ph_intNo	= <cfqueryparam cfsqltype="cf_sql_char" value="#left(form.userPhoNumbInt, 25)#">,</cfif>
            countryID		= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.country_id#">,
 <cfif parameterexists(form.strEmail)>            
            strEmail 		= <cfqueryparam cfsqltype="cf_sql_char" value="#left(form.strEmail, 50)#">,</cfif>
           	dtmCaptured 	= <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">,
           	active			= <cfif parameterexists(form.Flagged) AND form.Flagged EQ 1><cfqueryparam cfsqltype="cf_sql_integer" value="2"> <cfelse> <cfqueryparam cfsqltype="cf_sql_integer" value="1"></cfif>
    	WHERE
        	[IngIndividual_ID] = <cfqueryparam cfsqltype="cf_sql_char" value="#form.userID#">
    </cfquery>
    
<!--- ADD NEW USER TO THE CONTACT TABLE --->

	<cfquery datasource="#gpp#">
    	INSERT INTO contacts
        	(
            	userID
              ,ContactType
        	)
        VALUES
        	(
        		<cfqueryparam cfsqltype="cf_sql_char" value="#form.userID#"> 
        		,<cfqueryparam cfsqltype="cf_sql_integer" value="307">  
             )
     </cfquery>
 
<cfcatch type="any">

	<cfmail to="jerome@glopac.com; jason@glopac.com" from="web@petro21.com" subject="possible error: save new user page" type="html">
        <cfdump var="#session#" label="session">
        <cfdump var="#form#" label="form">
        <cfdump var="#cfcatch#" label="catch">
    </cfmail>

</cfcatch>
</cftry>