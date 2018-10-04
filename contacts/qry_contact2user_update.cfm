<cfif parameterexists(form.value) AND form.value EQ 1>

   <cfquery datasource="#gpp#" name="qrySelected">
    SELECT userID
    FROM
      user2contact
    WHERE
      userid = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userID#">
    AND 
      contactID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.contactID#">
  </cfquery>

		<cfif qrySelected.recordcount EQ 0>
        
                  <cfquery datasource="#gpp#">
                  INSERT INTO 
                    user2contact (
                      userID, 
                      contactID 
                      )  
                    VALUES
                    (
                    <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userID#">,
                    <cfqueryparam cfsqltype="cf_sql_integer" value="#form.contactID#">
                    )
                  </cfquery>
     </cfif>
 
<cfelseif parameterexists(form.value) AND form.value EQ 0>

          <cfquery datasource="#gpp#">
            DELETE
            FROM
              user2contact
            WHERE
              userid = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userID#">
            AND 
              contactID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.contactID#">
          </cfquery>

</cfif>