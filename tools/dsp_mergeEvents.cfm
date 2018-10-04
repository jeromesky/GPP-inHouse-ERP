<cfset gpp = "GPP">
<cfset dsnP21 = "petro21">
<cfquery datasource="#gpp#" name="qryNew">
select   webID, IngConference_ID, strConference_Name, event_name, event_type, AnType, IngConference_ID AS eventID
from tblAnnual_Conf

WHERE
 event_type NOT IN ('week', 'spon', 'exh', 'din') 
and (webID = 0) 
and (strConference_Name NOT LIKE '%CXL%')
order by strConference_Name 
</cfquery>

<cfquery datasource="#dsnP21#" name="qryOld">
SELECT event_name, id, id_gpp, event_year
FROM events
WHERE  

 event_type NOT IN ('week') 
 AND (event_name IS NOT  NULL or event_name <> '')
 order by event_name 
</cfquery>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
<style type="text/css">
select { font-size:14px; width:550px }
fieldset {width:600px; margin-bottom:20px}

</style>
</head>

<body>
<form action="qry_mergeEvents.cfm" method="post">
<fieldset>
	<legend>event to match</legend>
		total to clear: <cfoutput>#qryNew.recordcount#</cfoutput>
        <hr />
        <select name="newID">
			<cfoutput query="qryNew">
                <option value="#qryNew.eventID#">#qryNew.event_name# (#qryNew.strConference_Name#) ((#qryNew.IngConference_ID#)) webid: #qryNew.webID#</option>
             </cfoutput>
        </select>
 
</fieldset>

<fieldset>
	<legend>From here </legend>
    
        <select name="oldID" multiple="multiple" size="20">
            <cfoutput query="qryOld">
                <option value="#qryOld.id#" >#qryOld.event_name# (#qryOld.event_year#) ((#qryOld.id_gpp#)) </option>
             </cfoutput>
        </select>
</fieldset>

<fieldset>
	<legend>....</legend>
    
    <button>Merge event</button>
</fieldset>
</form>
</body>
</html>