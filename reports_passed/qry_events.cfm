<cfquery datasource="#dsnP21#" name="get_Events">
	SELECT 
		eventId, 
    		eventCode, 
    		eventName 
	FROM 
		GPP.dbo.CRM_Events;
</cfquery>