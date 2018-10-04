<cfif parameterexists(form.action) AND form.action EQ "add">

  <cfquery datasource="#gpp#" >
  INSERT INTO 
    user2sector (
      userID, 
      sectorid 
      )  
    VALUES
    (
    <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userid#">,
    <cfqueryparam cfsqltype="cf_sql_integer" value="#form.sectorid#">
    )
  </cfquery>
 
<cfelseif parameterexists(form.action) AND form.action EQ "delete">

  <cfquery datasource="#gpp#" name="get_selected">
    DELETE
    FROM
      user2sector
    WHERE
      userid = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userid#">
    AND 
      sectorid = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.sectorid#">
  </cfquery>

</cfif>