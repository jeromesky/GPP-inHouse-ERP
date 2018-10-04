<!--- ADD THE BANNER --->
<cfif parameterexists(form.value) AND form.value EQ 0>

<cfquery datasource="#dsnP21#" >
    DELETE 
    FROM   
    	banners2Newsletter 
    WHERE  
    	newsletterid 	= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.newsletterid#">  
        AND bannerID 	= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.bannerid#"> 
        AND bannerType 	= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.bannerType#">
    </cfquery>
 </cfif>
 
<!--- REMOVE THE BANNER --->
<cfif parameterexists(form.value) AND form.value EQ 1>

<cfquery datasource="#dsnP21#" >
    INSERT INTO    
		banners2Newsletter 
			(
              newsletterid,
              bannerID,
              bannerType
			)
    VALUES
            (
                <cfqueryparam cfsqltype="cf_sql_integer" value="#form.newsletterid#">,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#form.bannerid#">,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#form.bannerType#">
            )
    </cfquery>
</cfif>

<cfif parameterexists(form.order)>

<!---<cfset fields = ListDeleteAt(form.FIELDNAMES, listlen(form.FIELDNAMES))>
<cfset data = ListDeleteAt(FIELDNAMES, listlen(form.FIELDNAMES))>--->

<cfloop collection="#form#" item="var">
	<cfif #var# EQ "order" OR #var# EQ "FIELDNAMES"> 
	<cfelse>
		<cfquery datasource="#dsnP21#" >
			UPDATE  
            	banners2Newsletter    
			SET 
				bannerOrder = <cfqueryparam cfsqltype="cf_sql_integer" value="#form[var]#">
			WHERE 
            	banners2NewsletterID = <cfqueryparam cfsqltype="cf_sql_integer" value="#var#">
		</cfquery>
         <!--- <cfoutput> #var# = #form[var]#<br /></cfoutput>--->
	 </cfif>
</cfloop>	
        
<!---<cfset fooo = ListDeleteAt(form.FIELDNAMES, listlen(form.FIELDNAMES))>
<cfloop list="#fooo#" index="var">
<cfset whereValue = replace(var, 'id-', '')>
<cfset setValue = evaluate("#var#")>
<!---  <cfquery datasource="#dsnP21#">
        UPDATE
            banners2Newsletter
        SET
            bannerOrder = #setValue#
        WHERE
            banners2NewsletterID = #whereValue#
    </cfquery>--->
<cfdump var="#whereValue#">
<cfdump var="#setValue#">
</cfloop>--->
</cfif>