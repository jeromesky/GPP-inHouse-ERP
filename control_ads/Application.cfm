<cfset dsntwo ="petro21">
<cfset ds = "#dsntwo#">
<!---
<cfinclude template="inc/style.css"> --->
<!--- get the forums settings --->
<cfquery name="qGetAdminSettings" datasource="#ds#">
	select * from fuseAds_Settings
</cfquery>

<CFSET DBTYPE = Trim(Lcase(qGetAdminSettings.chDBType))>

<!--- start session variables --->
<CFAPPLICATION SESSIONMANAGEMENT="Yes" NAME="Ads" SESSIONTIMEOUT="#CreateTimeSpan(0,0,30,0)#">

<!--- is the user logged in --->
<cfif CGI.PATH_INFO does not contain "signin.cfm" and CGI.SCRIPT_NAME does not contain "signin.cfm">
	<cfif IsDefined("session.userid") eq "False" or IsDefined("cookie.FuseAdsadmin") eq "False">
	<cflocation url="signin.cfm">
	</cfif>
</cfif>

<!--- If user is logged in get set USER CONSTANTS --->
<cfif isDefined("Session.userid")>
	<cfquery name="qGetUserInfo" datasource="#ds#">
		select * from fuseAds_Users
		where iUserID = #Session.userid#
	</cfquery>
	<cfset USER_USERLEVEL = #qGetUserInfo.iUserLevel#>
</cfif>