<cfsilent>
<cfinclude template="../Application.cfm">
<cfquery datasource="#gpp#" >

UPDATE tblIndividual_WEB
SET  

<cfif parameterexists(form.strFirst_Name)>
	strFirst_Name = '#form.strFirst_Name#'
</cfif>

<cfif parameterexists(form.strSurname)>
	strSurname = '#form.strSurname#'
</cfif>

<cfif parameterexists(form.strDesignation)>
	strDesignation = '#form.strDesignation#'
</cfif>

<cfif parameterexists(form.strCity)>
	strCity = '#form.strCity#'
</cfif>

<cfif parameterexists(form.Title)>
	Title = '#form.Title#'
</cfif>
<cfif parameterexists(form.strEmail)>
	strEmail = '#form.strEmail#'
</cfif>
<cfif parameterexists(form.strStreet_Adress)>
	strStreet_Adress = <cfqueryparam value="#form.strStreet_Adress#" >
</cfif>
<cfif parameterexists(form.tel)>
	strPhDirect_No = <cfqueryparam value="#form.tel#" >
</cfif>
<cfif parameterexists(form.fax)>
	strFaxDirect_No = <cfqueryparam value="#form.fax#" >
</cfif>
<cfif parameterexists(form.CountryName)>
	CountryName = <cfqueryparam value="#form.CountryName#" >
</cfif>
<cfif parameterexists(form.strEmail_Alt)>
	strEmail_Alt = <cfqueryparam value="#left(form.strEmail_Alt, 50)#" >
</cfif>
<cfif parameterexists(form.strSecretary_Email)>
	strSecretary_Email = <cfqueryparam value="#left(form.strSecretary_Email, 50)#" >
</cfif>
<cfif parameterexists(form.strPostal_Adress)>
	strPostal_Adress = <cfqueryparam value="#form.strPostal_Adress#" >
</cfif>

<cfif parameterexists(form.intCode)>
	intCode = <cfqueryparam value="#form.intCode#" >
</cfif>


Where RecID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#" >
</cfquery>
</cfsilent>

<cfoutput>
<cfif parameterexists(form.intCode)>#form.intCode#</cfif>
<cfif parameterexists(form.strPostal_Adress)>#form.strPostal_Adress#</cfif>
<cfif parameterexists(form.strSecretary_Email)> #left(form.strSecretary_Email, 50)#</cfif>
<cfif parameterexists(form.strEmail_Alt)>#left(form.strEmail_Alt, 50)#</cfif>
<cfif parameterexists(form.CountryName)>
	#form.CountryName#
</cfif>
<cfif parameterexists(form.tel)>
	#form.tel#
</cfif>
<cfif parameterexists(form.fax)>
	#form.fax#
</cfif>
<cfif parameterexists(form.strStreet_Adress)>
	#form.strStreet_Adress#
</cfif>
<cfif parameterexists(form.strEmail)>
	#form.strEmail#
</cfif>
<cfif parameterexists(form.strFirst_Name)>
	#form.strFirst_Name#
</cfif>
<cfif parameterexists(form.strSurname)>
	#form.strSurname#
</cfif>
<cfif parameterexists(form.strDesignation)>
#form.strDesignation#
</cfif>
<cfif parameterexists(form.strCity)>
#form.strCity#
</cfif>
<cfif parameterexists(form.Title)>
#form.Title#
</cfif>
</cfoutput>