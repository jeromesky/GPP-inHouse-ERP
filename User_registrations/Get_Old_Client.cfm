<cfinclude template="../application.cfm">
<cfquery datasource="#gpp#" name="get">
 	select tblIndividual.Title, tblIndividual.strFirst_Name, tblIndividual.strSurname, tblIndividual.strDesignation, tblIndividual.strStreet_Adress, tblIndividual.strPostal_Adress, tblIndividual.strCity, tblIndividual.CountryName, tblIndividual.strEmail, tblCompany.strCompany_Name, tblIndividual.dtmCaptured, tblIndividual.dtmUpdated
	from tblIndividual
    LEFT JOIN tblCompany
    ON  tblIndividual.lngCompany_ID  = tblCompany. IngCompany_ID
	WHERE tblIndividual.IngIndividual_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
	
</cfquery>

<cfoutput>
<strong>Capture</strong> #DateFormat(get.dtmCaptured, "dd mm yyyy")#<br />
<strong>Updated</strong> #DateFormat(get.dtmUpdated, "dd mm yyyy")#<br />

<strong>Position</strong>: #get.strDesignation#<br />
<strong>Email</strong>: #get.strEmail#<br /><br />

<strong>Company</strong>: #get.strCompany_Name# <br /><br />

<strong>City</strong>: #get.strCity#<br />
<strong>Coutry</strong>: #get.CountryName#<br />
<strong>Address</strong>: #get.strStreet_Adress# <br />
<strong>Postal</strong>: #get.strPostal_Adress# 
</cfoutput>