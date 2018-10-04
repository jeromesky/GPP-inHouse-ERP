<cfquery datasource="#gpp#" name="delete_lostrecords">
          DELETE
          FROM tblindividual
          WHERE strFirst_Name IS NULL
          AND userMidlename IS NULL
          AND strSurname IS NULL
          AND lngCompany_ID = 0
          AND strEmail IS NULL
          AND strStreet_Adress ='no details - street address - db'
          AND strPostal_Adress ='no details - street address - db'
          AND dtmCaptured < dateadd(day,-1,getdate())
      <!---    order by IngIndividual_ID desc--->
</cfquery>

<cfquery datasource="#gpp#" name="qryNewUser">
    INSERT INTO
        tblindividual
        (
         status
        ,CapBy
        ,staffIDAdded
        ,dtmCaptured
        ,password )
    VALUES
        (
         <cfqueryparam cfsqltype="cf_sql_integer" value="2">
         ,<cfqueryparam cfsqltype="cf_sql_char" value="#session.username#">
         ,<cfqueryparam cfsqltype="cf_sql_integer" value="#session.gpp_id#">
         ,<cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
         ,<cfqueryparam cfsqltype="cf_sql_char" value="gpp#RandRange(2011, 8044)#">
         )
    SELECT @@IDENTITY AS id
</cfquery>
    
<cfquery datasource="#gpp#">
    INSERT INTO tblIndOptions(lngIndividual_ID)
    VALUES(<cfqueryparam cfsqltype="cf_sql_integer" value="#qryNewUser.id#">)
</cfquery>

<cfset userID = #qryNewUser.id#>
<cfset form.userID = #qryNewUser.id#>
<!---<cfoutput>#qryNewUser.id#</cfoutput>--->