<cfparam name=url.ID default="600">

<cfquery datasource="#gpp#" name="qry_regos">    
  SELECT distinct  
           *,
           title+' '+name+' '+surname AS FullName
        FROM 
        	[VIEW_Conference_Attendence_list]
        WHERE 
        	[lngConference_ID] IN (#url.ID#) 
        AND (
          1=1 
          OR chkSpeaker = 1  
          OR chkGuest = 1  
          OR chkDelegate = 1  
          OR chkModerator = 1  
          OR chkExhibitor = 1  
          OR chkPress = 1 
         )
<!---        AND
         (status LIKE '%C%')--->
        AND
         (ChkCancelled != 1)
        ORDER BY 
                  company, surname, lngConference_ID
</cfquery>