
<cfquery datasource="#gpp#" name="get_Selected_News">
SELECT  
	newsID AS news_item_id, 
    newsHeadline AS news_item_headline_text ,
    addedDate AS news_item_added
FROM 
	news
WHERE 

	<cfswitch expression="#NewsletterOptions.newsletterFrequency#" >
        <cfcase value="1">
            addedDate = <cfqueryparam cfsqltype="cf_sql_date" value="#now()#"> 
        </cfcase>
        <cfcase value="2">
            addedDate >= <cfqueryparam cfsqltype="cf_sql_date" value="#dateAdd('d', -5 ,now())#">
        </cfcase>
        <cfdefaultcase>
            addedDate = <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
        </cfdefaultcase>
	</cfswitch>

	AND 
    newsletterID = <cfqueryparam cfsqltype="cf_sql_integer" value="#newsletter.id#">
ORDER BY 
	newsID DESC
</cfquery>

