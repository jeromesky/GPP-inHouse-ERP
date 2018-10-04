
<cfquery datasource="#gpp#" name="qry_users">
SELECT TOP 20
		[strFirst_Name]
      ,[strSurname]
      ,[companyName]
      ,[strStreet_Adress]
      ,[strPostal_Adress]
      ,[country]
      ,[city]
      ,[STATUS]
      ,[chkMail]
      ,[userID]
      ,[zip]
  FROM [Temp_noPost]
WHERE
	[status] = 'C'
    AND
    [chkMail] <> 1
    AND
    (
    PATINDEX('%[0-9]%',strStreet_Adress) = 0 
    OR
    PATINDEX('%[0-9]%',strPostal_Adress) = 0
    )
 ORDER BY
 	[userID]

</cfquery>