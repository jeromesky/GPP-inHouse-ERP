<cfquery datasource="#gpp#" name="qry">
SELECT distinct
title,
name,
surname,
company,
possition,
case min(eventId) when 472 then 'white'
else 'yellow'
END
FROM
[VIEW_Conference_Attendence_list]
WHERE
[eventId] IN (472,473,474)
AND(
chkSpeaker= 1 OR
chkGuest=1 OR
chkDelegate=1 OR
chkModerator=1
)
AND
(status LIKE '%C%')
AND
(ChkCancelled!=1)
GROUP BY
title,
name,
surname,
company,
possition

 </cfquery>
 
<CFHEADER NAME="Content-Disposition" VALUE="inline; filename=Badges_#dateformat(now(), "yyyy-mm-dd")#.xls">
<CFCONTENT TYPE="application/vnd.msexcel">
<!--- CREATE EXCEL FOR BADGES --->
    <cftable query ="get"  HTMLTable colheaders>
    <cfcol text = "#Ucase(get.name)#">
    <cfcol text = "#ucase(get.name)# #ucase(get.surname)#">
<!---    <cfcol text="#ucase(ReplaceNoCase(qry_conf.possition, '&AMP;', '&'))#">
--->    <cfcol text = "#Ucase(get.company)#">
	<!---<cfcol text = "#color#">--->
    </cftable>
</CFCONTENT>