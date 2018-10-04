
<cfquery datasource="GPP" name="qryUser">
	select country, strStreet_Adress, strPostal_Adress, userEmail, position, id, name, surname, strEmail_Alt,
    (select count(*) from tblConference_Registration  WHERE  tblConference_Registration.lngIndividual_ID = CRM_Individual_Details.id) AS conf
	from 
 		[CRM_Individual_Details]
	WHERE aka_companyID  = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.aka_companyID#"> 

</cfquery>

<cfoutput query="qryUser">	
<b>#qryUser.userEmail# // #qryUser.strEmail_Alt#</b><br>
<b>name: </b>#qryUser.name# #qryUser.surname# <br>
<b>possition</b>: #qryUser.position#<br>
#qryUser.country#, #qryUser.strStreet_Adress#, <br>#qryUser.strPostal_Adress#<br />
<b>conference:</b>  #qryUser.conf# <br />
<b>userid</b> #qryUser.id#
<cfif qryUser.conf EQ 0><br />
<b>deleteUser</b> <input type="checkbox" class="deleteUser" value="#qryUser.id#" />
</cfif>
<hr /></cfoutput>