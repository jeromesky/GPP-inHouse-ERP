SELECT DISTINCT 
                      dbo.tblIndividual.strFirst_Name, dbo.tblIndividual.strSurname, dbo.tblIndividual.strSecretary_Email, dbo.tblIndividual.SecretaryName1, 
                      dbo.tblIndividual.strSecretary_Email2, dbo.tblIndividual.SecretaryName2, dbo.tblIndividual.companyID
FROM         dbo.tblIndividual INNER JOIN
                      dbo.tblConference_Registration ON dbo.tblIndividual.IngIndividual_ID = dbo.tblConference_Registration.lngIndividual_ID
WHERE     (dbo.tblIndividual.strSecretary_Email <> N'') OR
                      (dbo.tblIndividual.strSecretary_Email2 <> N'')