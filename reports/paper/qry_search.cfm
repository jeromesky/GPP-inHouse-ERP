<cfquery datasource="#dsnP21#" name="get_Events">
	SELECT 
		eventId, 
    		eventCode, 
    		eventName 
	FROM 
		GPP.dbo.CRM_Events;
</cfquery>

<cf_querysim>
get_ListFormat
listID,listName
0|FULL
1|FULL with Comments
2|Speakers
3|Rego Cards
4|Name Badges*
5|Postal Labels
6|Past year
7|Past 2 years
8|Past 5 years
</cf_querysim>

<cf_querysim>
get_OutputFormat
outputID,outputName
0|web-html
1|XLS
2|PDF
3|CSV
</cf_querysim>