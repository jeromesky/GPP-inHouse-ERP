<cfquery name="qAddClient" datasource="#ds#">
	insert into fuseAds_Clients
	(vchClientName, vchContact, vchContactPhone, vchContactEmail, chClientStatus)
	values
	('#ClientName#', '#Contact#', '#Phone#', '#Email#', '#Status#')
</cfquery>
