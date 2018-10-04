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
        	[eventId] IN (472, 473, 474) 
        AND (
          chkSpeaker = 1 OR 
          chkGuest = 1 OR 
          chkDelegate = 1 OR 
          chkModerator = 1  
         )
        AND
         (status LIKE '%C%')
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