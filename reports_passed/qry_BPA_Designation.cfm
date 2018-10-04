<cfquery datasource="#gpp#" name="get_BPADesignation">
	SELECT
		id,
		data 
	FROM 
		GPP.dbo.CRM_BPA_Designation;
</cfquery>