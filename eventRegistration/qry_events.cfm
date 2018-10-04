<cfquery datasource="#dsnp21#" name="qryEventGroups">
 	SELECT  
    	[id]
        ,groupby AS name
	FROM 
    	[groupby]
    ORDER BY
    	[name]
</cfquery>