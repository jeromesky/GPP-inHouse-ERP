<cfparam name=url.ID default="687">

<cfquery datasource="#gpp#" name="qry_conf">    
  SELECT distinct  
           title, 
            name,	
            surname, 
            company, 
            possition, 
            SUBSTRING(company,1,1) AS FirstLetter, 
            dbo.tblAnnual_Conf.strConference_Name as confName
   FROM
dbo.VIEW_Conference_Attendence_list INNER JOIN dbo.tblAnnual_Conf ON dbo.VIEW_Conference_Attendence_list.lngConference_ID = dbo.tblAnnual_Conf.IngConference_ID 
WHERE
(dbo.VIEW_Conference_Attendence_list.lngConference_ID IN (#url.ID#)) 
AND (dbo.VIEW_Conference_Attendence_list.chkGuest = 1) 
AND (dbo.VIEW_Conference_Attendence_list.ChkCancelled <> 1 or ChkCancelled is Null)
ORDER BY
	VIEW_Conference_Attendence_list.company
</cfquery>

<cfparam name="url.pgnum" default="yes">
<cfparam name="url.count" default="no">
<cfparam name="url.printdate" default="yes">
<cfparam name="url.surnamehighlight" default="no">
<cfparam name="url.firstlettergroup" default="no">
<cfparam name="url.indent" default="0"> 