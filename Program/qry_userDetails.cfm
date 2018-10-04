

<cfquery datasource="#gpp#" name="qry_user">

	SELECT
    	[countryPhoneCode]
        ,[AreaCodeTel]
        ,[strPhDirect_No]
        ,[AreaCodeTelAlt]
        ,[strPhAlt1_No]
        ,[AreaCodeFax]
        ,[strFaxDirect_No]
        ,[userEmail]
        ,[strEmail_Alt]
        ,[strSecretary_Email]
        ,[strMobile_No]
    FROM
    	[CRM_Individual_Details]
    WHERE
    	[id] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userID#">

</cfquery>