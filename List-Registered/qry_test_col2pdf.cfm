<!--- <cfquery datasource="#gpp#" name="qry_conf">
	SELECT distinct 
    title, 
    name,	
    surname, 
    company, 
    possition, 
    SUBSTRING(company,1,1) AS FirstLetter
	FROM 
    VIEW_Conference_Attendence_list
	where 
    eventID in (495, 496, 497, 498)
	order by  
    company, surname
</cfquery> --->

<cfquery datasource="#gpp#" name="qry_conf">    
  SELECT distinct  
           title, 
    name,	
    surname, 
    company, 
    possition, 
    SUBSTRING(company,1,1) AS FirstLetter
        FROM 
        	[VIEW_Conference_Attendence_list]
        WHERE 
        	[eventId] IN (472, 473, 474) 
        AND (
          1=1 OR chkSpeaker = 1  OR chkGuest = 1  OR chkDelegate = 1  OR chkModerator = 1  OR chkExhibitor = 1  OR chkPress = 1 
         )
        AND
         (status LIKE '%C%' )
        AND
         (ChkCancelled != 1)
        ORDER BY 
         company
</cfquery>

<!--- removed:  OR chkSponsor = 1 --->

<cfparam name="url.pgnum" default="yes">
<cfparam name="url.count" default="no">
<cfparam name="url.printdate" default="yes">
<cfparam name="url.surnamehighlight" default="no">
<cfparam name="url.firstlettergroup" default="no">
<cfparam name="url.indent" default="0"> 