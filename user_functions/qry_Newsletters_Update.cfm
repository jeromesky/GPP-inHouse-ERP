<!--- update unsub --->
<cfset editedField = "newsletter" >
<cfif form.value EQ 0>

  <cfquery datasource="#gpp#">
    UPDATE subscriptions 
    SET
        [subDateEnd] 		= <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">,
        [subActive] 		= 0,
		[subscriptionType] 	= 1
    WHERE 
        userID 	= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userid#"> 
    AND 
      newsletterID	= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.newsletterID#">
  </cfquery>

</cfif>

<!--- add/update sub --->
<cfif form.value EQ 1>

	<!--- try to find record to update --->
    <cfquery datasource="#gpp#" name="findRecord">
      SELECT TOP 1
          subscriptionID 
      FROM
          subscriptions 
      WHERE 
          userID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userid#"> 
		  AND 
          newsletterID	= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.newsletterID#">
		  AND
		  [subscriptionType] = 1
    </cfquery>
    
    <!--- IF FIND UPDATE --->
    <cfif findRecord.recordcount GT 0>

      <cfquery datasource="#gpp#">
        UPDATE subscriptions 
        SET
            [subDate] = <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">,
            [subActive]	= 1,
			[subscriptionType] = 1
        WHERE 
            subscriptionID = <cfqueryparam cfsqltype="cf_sql_integer" value="#findRecord.subscriptionID#">
      </cfquery>

    <cfelse>
    
      <!--- if none, Add --->
      <cfquery datasource="#gpp#">
        INSERT INTO subscriptions 
            (userID
            ,newsletterID
            ,subDate
            ,subActive
			,subscriptionType
            )
        VALUES
            (<cfqueryparam cfsqltype="cf_sql_integer" value="#form.userid#">
            ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.newsletterID#">
            ,<cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
            ,1
			,1
            )
      </cfquery>
    </cfif>
</cfif>
<cfinclude template="../components/qry_userUpdate.cfm">

<!--- Check data --->
<cfquery datasource="#gpp#" name="CheckRecord">
SELECT 
    subscriptionID
    ,subActive
FROM
    subscriptions 
WHERE 
    userID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userid#"> 
	AND 
    newsletterID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.newsletterID#">
	AND
	[subscriptionType] = 1
</cfquery>

<cfif form.value EQ CheckRecord.subActive >
    <cfset updated = "successful">
<cfelse>
   	<cfset updated = "error">
</cfif>
<cfoutput>update: #updated#</cfoutput>