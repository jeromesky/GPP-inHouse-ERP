<cfquery datasource="#gpp#" name="get">
SELECT
         [userName]
        ,[userID]
        ,[companyName]
        ,[AKA_companyName]
        ,[countryNameEN]
        ,[streetAddress]
        ,[postalAddress]
        ,[userDelegation]
        ,[userTel]
        ,[userFax]
        ,[useremail]
        ,[roleName]
        ,[userTelAlt]
        ,[userFaxAlt]
        ,[userMobile]
        ,[ph_IntNo]
  FROM
  			[CRM_NewUser_Review]
  WHERE
  			[userID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userid#">
</cfquery>

<!---<cfmail to="jerome@glopac.com" from="we@petro21.com" subject="new user" type="html">
<cfdump var="#get#">
</cfmail>--->