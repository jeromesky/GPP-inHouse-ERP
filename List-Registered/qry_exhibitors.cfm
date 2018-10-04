<cfparam name=url.ID default="472,473,474">

<cfquery datasource="#gpp#" name="qry_exhibitors">   
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
        	[eventId] IN (#url.ID#) 
        AND (
          chkExhibitor = 1   
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