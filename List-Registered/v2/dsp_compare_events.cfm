<cfquery datasource="#gpp#" name="qry_listevents" maxrows="50" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
    select top 100 IngConference_ID, strConference_Name
    from [dbo].[tblAnnual_Conf]
    where lngCon_ID in (
        select top 10 IngCon_ID
        from [dbo].[tblConference]
        where weekDate > '2013-01-01 00:00:00'
    )
   	AND (antype = 'event' OR antype = 'eb' OR antype = 'din')
	order by strConference_Name	
</cfquery>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Event Checks</title>
</head>

<body>
<cfoutput query="qry_listevents">
<a href="http://www.petro21.com/my-office/list-registered/v2/?fa=list-checker&id=#IngConference_ID#&168">#strConference_Name#</a><br /></cfoutput>

</body>
</html>