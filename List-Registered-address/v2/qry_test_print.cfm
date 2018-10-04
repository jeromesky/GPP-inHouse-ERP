<cfparam name=url.ID default="600">

<cfquery datasource="#gpp#" name="qry_print">   
SELECT   distinct
          user_id,
           upper(title) As title, 
    upper(name) as name,	
    upper(surname) as surname, 
    upper(company) as company, 
    upper(possition) as job,
    eventid
        FROM 
        	[VIEW_Conference_Attendence_list]
        WHERE 
        	[lngConference_ID] IN (#url.ID#) 
        AND (
          chkSpeaker = 1 OR 
          chkGuest = 1 OR 
          chkDelegate = 1 OR 
          chkModerator = 1  
         )
        AND
         (active = 1)
        AND
         (ChkCancelled != 1)
GROUP BY 
         title, 
    name,	
    surname, 
    company, 
    possition,
    eventid,
    user_Id
        ORDER BY 
         company, surname, eventid desc
</cfquery>

<!--- (status LIKE '%C%') --->