<cfparam name="get_user.recordcount" default="0">
<cfparam name="get_user.lock" default="someone is editing this record">
<cfparam name="get_user.companyName" default="someone is editing this record">
<cfparam name="get_user.userName" default="someone is editing this record">
<cfparam name="get_user.userEmail" default="someone is editing this record">
<cfparam name="get_user.userAddress" default="someone is editing this record">
<cfparam name="get_user.userPostal" default="someone is editing this record">
<cfparam name="get_user.UserSecretaryEmail" default="someone is editing this record">
<cfparam name="get_user.userEmailAlt" default="someone is editing this record">
<cfparam name="get_user.BPA_Designation" default="someone is editing this record">
<cfparam name="get_user.userPosition" default="someone is editing this record">
<cfparam name="get_user.UserFax" default="someone is editing this record">
<cfparam name="get_user.userTel" default="someone is editing this record">
<cfparam name="get_user.capturedDate" default="someone is editing this record">
<cfparam name="get_user.CapBy" default="someone is editing this record">
<cfparam name="get_user.strIndSource" default="someone is editing this record">
<cfparam name="get_user.intCode" default="someone is editing this record">
<cfparam name="get_user.userMobile" default="someone is editing this record">
<cfparam name="get_user.userFaxAlt" default="someone is editing this record">
<cfparam name="get_user.strPhAlt1_No" default="someone is editing this record">
<cfparam name="get_user.directoryName" default="someone is editing this record">
<cfparam name="get_user.userState" default="someone is editing this record">
<cfparam name="get_user.userIntPhone" default="someone is editing this record">
<cfparam name="get_user.userAreaCodeFaxAlt" default="someone is editing this record">
<cfparam name="get_user.userAreaCodeFax" default="someone is editing this record">
<cfparam name="get_user.userAreaCodePhoneAlt" default="someone is editing this record">
<cfparam name="get_user.userAreaCodePhone" default="someone is editing this record">
<cfparam name="get_user.companyID" default="someone is editing this record">
<cfparam name="get_user.countryNameEN" default="someone is editing this record">
<cfparam name="get_user.CityNameEN" default="someone is editing this record">
<cfparam name="get_user.countryPhoneCode" default="someone is editing this record">
<cfparam name="get_user.cityID" default="someone is editing this record">
<cfparam name="get_user.countryID" default="someone is editing this record">
<cfparam name="get_user.DirectoryDate" default="someone is editing this record">
<cfparam name="get_user.staffName" default="someone is editing this record">

    <cfquery name="get_user" datasource="#gpp#">
    SELECT 
          [companyName]
          ,[userName]
          ,[userEmail]
          ,[userAddress]
          ,[userPostal]
          ,[UserSecretaryEmail]
          ,[userEmailAlt]
          ,[BPA_Designation]
          ,[userPosition]
          ,[UserFax]
          ,[userTel]
          ,[capturedDate]
          ,[CapBy]
          ,[strIndSource]
          ,[intCode]
          ,[userMobile]
          ,[userFaxAlt]
          ,[strPhAlt1_No]
         ,[directoryName]
          ,[userState]
          ,[userIntPhone]
          ,[userAreaCodeFaxAlt]
          ,[userAreaCodeFax]
          ,[userAreaCodePhoneAlt]
          ,[userAreaCodePhone]
          ,[companyID]
          ,[countryNameEN]
          ,[CityNameEN]
          ,[countryPhoneCode]
          ,[cityID]
          ,[countryID]
          ,[DirectoryDate]
          ,[staffName]
          ,[lock]
      FROM 
            [CRM_New_User_Review]
      WHERE 
      		[userID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userID#"> AND
            [lock] 	<= GETDATE()
      </cfquery>

<cfset lockTime = #CreateDateTime(year(now()), month(now()), day(now()), hour(now()), minute(DateAdd('n', 10, now())), second(now()))#>
<cfif get_user.recordcount EQ 1 >

      <cfquery  datasource="#gpp#">
      		UPDATE 
            	[tblIndividual]
            SET 
            	[lock] = #CreateDateTime(year(now()), month(now()), day(now()), hour(now()), minute(DateAdd('n', 10, now())), second(now()))#
            WHERE
            	[IngIndividual_ID] 	= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userID#">
      </cfquery> 
 
 <cfelse>

 </cfif>