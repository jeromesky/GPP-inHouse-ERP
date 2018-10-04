<cfquery datasource="#gpp#" name="qryMifration">
  SELECT COUNT(profileID) AS total
  FROM 
  		[PM_profiles_migration]
  WHERE 
  		[p_active] = 1
  	AND
        [userID] > 0
    AND
    	[p_source] = 'migration'
    AND 
    	[p_approved] IS NULL
</cfquery>