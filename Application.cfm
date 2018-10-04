<!---<CFAPPLICATION NAME="secure.adminp21" SESSIONMANAGEMENT="Yes" SESSIONTIMEOUT="#CreateTimeSpan(0,4,0,0)#">--->
<cfapplication name="myoffice" sessionmanagement="yes" clientmanagement="yes" sessiontimeout="#CreateTimeSpan(0,6,0,0)#" applicationtimeout="#CreateTimeSpan(0,6,0,0)#">
<cfscript>
	// DSN
	mainDSN 	= "P21";
	dsnP21 		= "petro21";
	gpp 		= "GPP";
	application.datasource.gpp	= iif(left(cgi.HTTP_HOST, 4) eq "dev.", "'gpp.dev'", "'gpp'" ); 
	dsnDBK_admin  	= "DBK_admin";
	
	///login details for the Databank
	dsnDBK.dsn		= "DBK_admin";
	dsnDBK.usr		= "SA";
	dsnDBK.pwd		= "CapeTown15cool";

	//Maping to 
	THIS.mappings["/Officecfc"]		= "G:\websites\my-office\_handlers\_handlers\";

	//Security
	Security.AdministratorEnterprize = "jerome, jason";
	Security.AdministratorManagement = "jerome, jason, babette, duncan, amanda, sonika, tanya, jerry";
	
	// Date Settings
	datenow= CreateODBCDate(Now());
	OnYearBack = dateAdd("yyyy", -1 , now());
	FourYearBack = dateAdd("yyyy", -4 , now());
	
	// my-office variable path 
	officePath 			= "G:\websites\my-office\";
	officeServerPath 	= "G:\websites\my-officex\";
	officeWebPath 		= "http://www.petro21.com/my-officex/";
	officeWebPathLive 	= "http://www.petro21.com/my-office/";
	path.serverInternal	= "G:\websites\my-officex\";
	path.serverExternal	= "G:\websites\petro21\";
	
	///location for the databank files
	DBKfileLocation		= "G:\files\databank\";	

	// Email settings
	// Comment sort out later when better understood what is needed.
</cfscript>

<cfset contactCompany = "jerry@glopac-partners.com; babette@glopac-partners.com; duncan@glopac-partners.com; tanya@glopac-partners.com; sonika@glopac-partners.com; amanda@glopac-partners.com">
<cfset contactRego = "jerome@glopac-partners.com; babette@glopac-partners.com; jodee@glopac-partners.com; tanya@glopac-partners.com; sonika@glopac-partners.com; amanda@glopac-partners.com; jason@glopac-partners.com">
<cfset contactAdmin = "jerome@glopac-partners.com; jason@glopac-partners.com">
<cfset contactfrom = "web@petro21.com">
<cfset contactfromPersonal = "babette@glopac-partners.com">
<cfset contactAccountants = "accounts@glopac-partners.com">


<CFPARAM NAME="session.loggedin" DEFAULT="false">
<CFPARAM NAME="session.user_id" DEFAULT="0">
<cferror type="exception" template="components/cferror.cfm">

<cfif session.loggedin neq "true">
      <cfif ListLast(CGI.SCRIPT_NAME, "/") EQ "index.cfm">
      <cfelseif ListLast(CGI.SCRIPT_NAME, "/") EQ "process.cfm">
      <cfelse>
      <!--- this user is not logged in, alert user and redirect to the login.cfm page --->
      <cflocation url="http://www.petro21.com/my-office/" addtoken="no">
      <script>
		if (window != top) top.location.href = 'http://www.petro21.com/my-office/';
             //self.location="index.cfm";
      </script>
      </cfif>
</cfif>