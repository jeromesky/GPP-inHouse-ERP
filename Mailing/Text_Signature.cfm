<cfinclude template="../Application.cfm">
<!--- get the template details -------------------------------->

<cfif getjob.signature NEQ 0> 

<cftry>
<cfset form.staffID = #getjob.signature# >
<cfinclude template="../staff/qry_users.cfm">
<!---<cfquery name="get_Signature" DATASOURCE="#dsnP21#" cachedWithin=#CreateTimeSpan(0,0,30,0)#>
   	SELECT name, email, city , tel, possition
	FROM GPPusers
	WHERE id = #getjob.signature# 
</cfquery>--->

<cfoutput><br ><br >
<b>#qryStaff.staffName#</b><br >
#qryStaff.staffPossition# - #qryStaff.CityNameEN#<br >
Global Pacific & Partners<br >
<a href="mailto:#qryStaff.emailPublic#">#qryStaff.emailPublic#</a><br >

Tel: #qryStaff.staffPhone#

</cfoutput>
<cfcatch type="any">
 <cfmail to="#contactAdmin#"  FROM="web@glopac.com" SUBJECT="error on #CGI.SERVER_NAME# - #CGI.PATH_INFO#" type="html"><cfoutput>error message: #cfcatch.Message# <br>error Details: #cfcatch.Detail# <br>error in:  #cfcatch.Type# <br> error Native|:<cfif parameterexists(cfcatch.NativeErrorCode)> #cfcatch.NativeErrorCode#</cfif> <br>
 SQL state:<cfif parameterexists(cfcatch.SQLState)>  #cfcatch.SQLState#</cfif><br> 
 Root cause: <cfif parameterexists(cfcatch.RootCause)>#cfcatch.RootCause#</cfif>
 <br >#cgi.script_name#</cfoutput>
 </cfmail>
 
</cfcatch>
</cftry>

</cfif>