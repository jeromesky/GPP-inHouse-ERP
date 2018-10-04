<CFINCLUDE template="../Application.cfm">

<cfset start = "{ results: [" >
<cfset end = "] }" >
<cfset content = "" >
<cfset contentString = "" >

<cfquery datasource="#gpp#" name="get" >
SELECT     	tblIndividual.IngIndividual_ID AS ID,
					tblIndividual.strFirst_Name AS name,
					tblIndividual.strSurname AS surname, 
                    tblIndividual.strEmail AS email, 
                    tblIndividual.strCity AS city, 
                    tblIndividual.CountryName AS country, 
                    tblIndividual.chkMail, 
                    tblIndividual.STATUS, 
                    tblCompany.strCompany_Name AS company
FROM          tblIndividual

INNER JOIN  tblCompany ON tblIndividual.lngCompany_ID = tblCompany.IngCompany_ID

WHERE    (tblIndividual.strFirst_Name LIKE '%#url.input#%'  OR tblIndividual.strSurname LIKE  '%#url.input#%')  AND  (tblIndividual.chkMail <> 1 AND tblIndividual.STATUS =  'C' )

ORDER BY tblIndividual.strSurname DESC

</cfquery>

<cfloop query="get">
<cfquery datasource="#gpp#" name="getC" >SELECT IngClient_Conf_ID FROM tblConference_Registration WHERE lngIndividual_ID = #get.id# </cfquery>
<cfset contentString = "{ id: '#get.ID#', value: '#get.name# #get.surname# &nbsp;&nbsp;--  #get.company#', info: '#get.email#  \n #get.city#  #get.country#   \n conference:  #getC.recordcount# '  }" >
<cfset content = ListAppend(content, contentString, ",") >
</cfloop>
<cfset fullReturn = start & content & end >
<cfoutput>#fullReturn#</cfoutput>







<!--- #get.totlalConf#

<!---
IF (SELECT lngIndividual_ID FROM tblConference_Registration WHERE lngIndividual_ID =   ) > 0

   
ELSE


END
http://www.ianywhere.com/developer/product_manuals/sqlanywhere/0902/en/html/dbrfen9/00000432.htm--->

GROUP BY 
					tblIndividual.IngIndividual_ID,
                    tblIndividual.strFirst_Name, 
					tblIndividual.strSurname, 
                    tblIndividual.strEmail, 
                    tblIndividual.strCity, 
                    tblIndividual.CountryName, 
                    tblIndividual.STATUS, 
                    tblCompany.strCompany_Name,
                    tblIndividual.chkMail
--->
<!---SELECT IngIndividual_ID AS ID,  strFirst_Name + ' ' + strSurname AS fullName ,  strCity  + ', ' + CountryName AS place
FROM tblIndividual
WHERE strFirst_Name LIKE '%#url.input#%'  OR strSurname LIKE  '%#url.input#%'  
SELECT     tblIndividual.IngIndividual_ID AS ID
				 tblIndividual.strFirst_Name,
                 tblIndividual.strSurname, 
                 tblIndividual.strEmail, 
                 tblIndividual.strStreet_Adress, 
                    tblIndividual.strCity,
                    tblIndividual.CountryName, 
                    tblIndividual.chkMail, 
                     Count(tblConference_Registration.IngClient_Conf_ID) AS confTotal         
                      
FROM         tblIndividual INNER JOIN
                    tblConference_Registration 
                   ON tblIndividual.IngIndividual_ID =  tblConference_Registration.lngIndividual_ID

GROUP BY
					tblIndividual.IngIndividual_ID, 
				 	tblIndividual.strFirst_Name,
                    tblIndividual.strSurname, 
                  	tblIndividual.strEmail, 
                    tblIndividual.strStreet_Adress, 
                    tblIndividual.strCity,
                    tblIndividual.CountryName, 
                    tblIndividual.chkMail
  
WHERE    tblIndividual.strFirst_Name LIKE '%#url.input#%'  OR tblIndividual.strSurname LIKE  '%#url.input#%'  AND  (tblIndividual.chkMail <> 1)


SELECT     tblIndividual.IngIndividual_ID AS ID,
					tblIndividual.strFirst_Name AS name,
                    tblIndividual.strSurname AS surname,
                    tblIndividual.strEmail AS email, 
                      tblIndividual.strStreet_Adress AS address,
                      tblIndividual.strCity AS city,
                      tblIndividual.CountryName AS country,
                      tblIndividual.chkMail, 
                       tblIndividual.STATUS,
                      
                      COUNT(tblConference_Registration.IngClient_Conf_ID) AS totlalConf


FROM     tblIndividual     INNER JOIN
                tblConference_Registration
                ON  tblIndividual.IngIndividual_ID = tblConference_Registration.lngIndividual_ID

WHERE     tblIndividual.strFirst_Name LIKE '%#url.input#%'  OR tblIndividual.strSurname LIKE  '%#url.input#%'  AND (tblIndividual.chkMail <> 1 AND tblIndividual.STATUS = 'C')

GROUP BY tblIndividual.IngIndividual_ID,
					tblIndividual.strFirst_Name, 
                    tblIndividual.strSurname, 
                    tblIndividual.strEmail, 
                      tblIndividual.strStreet_Adress,
                       tblIndividual.strCity, 
                       tblIndividual.CountryName,
                       tblIndividual.chkMail,
                        tblIndividual.STATUS
						
INNER JOIN  tblIndividual ON tblConference_Registration.lngIndividual_ID = tblIndividual.IngIndividual_ID	
COUNT(tblConference_Registration.IngClient_Conf_ID) AS totlalConf,					
						--->