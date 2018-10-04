<cfquery name="qAddUser" datasource="#ds#">
	insert into fuseAds_users
	(vchUsername, vchPassword, iUserLevel, iClientID)
	values
	('#Username#', '#Password#', 2, #qGetClientID.ClientID#)
</cfquery>