<cfquery datasource="#gpp#" name="get_List" >
SELECT TOP 30
		IngSource_Code_ID AS id
        ,strSource_Code_Description AS directoryName
        ,strSource_Code AS directoryCode
        ,DirectoryDate
        ,DirectorySource
FROM 
		tblSource_Code
ORDER
		BY IngSource_Code_ID DESC
</cfquery>
