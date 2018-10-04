<cfquery datasource="#gpp#" name="qryResult">
SELECT distinct
[userID]
,[Title]
,[name]
,[surname]
,[possition] as position
,[company]
,[address]
,[city]
,[zip] as postCode
,[countryName] AS country
FROM 
[Temp_report_regions] 
WHERE 
areaID IN ( 2,3,4,5 )  
AND chkMail != 1
AND chkSecPost != 1
AND userID not in (
SELECT DISTINCT [userID] FROM [CRM_Reports_mailing] WHERE areaID IN ( 2,3,4,5 )  
)   

UNION

SELECT DISTINCT
(0 - [userID]) as UserID
,[userTitle] as title
,[userName] as name
,[userSurname] as surname
,[userPossition] as position
,[userCompanyName] as company
,[address]
,CASE 
WHEN switch = 'street' THEN streetCity
WHEN switch = 'postal' THEN postCity
END AS city
,CASE 
WHEN switch = 'street' THEN StreetCode
WHEN switch = 'postal' THEN postCode
END AS postCode
,CASE 
WHEN switch = 'street' THEN streetCountry
WHEN switch = 'postal' THEN postCountry
END AS country
FROM 
[CRM_Reports_mailing]
WHERE areaID IN ( 2,3,4,5 )  

ORDER BY 
company, surname, name
</cfquery>

<cfoutput>
<CFHEADER NAME="Content-Disposition" VALUE="inline; filename=eventName_#dateformat(now(), "yyyy-mm-dd")#.xls">
<CFCONTENT TYPE="application/vnd.msexcel">
		<cfoutput><div id="header">Total: #qryResult.recordCount#</div></cfoutput>
         <table width="100%">
         <cfoutput query="qryResult">
            <tr>
                <td>#qryResult.userID#</td>
                <td>#qryResult.userTitle#</td>
                <td>#qryResult.userName#</td>
                <td>#qryResult.userSurname#</td>
                <td>#qryResult.userPossition#</td>
                <td>#qryResult.userCompanyName#</td>
                 <td>#qryResult.address#</td>
                <td>#qryResult.City#</td>
                <td>#qryResult.postCode#</td>
                <td>#qryResult.Country#</td>
           </tr></cfoutput>
        </table>
       
</CFCONTENT></cfoutput>