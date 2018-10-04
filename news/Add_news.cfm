<cfinclude template="../Application.cfm">

<!--- Calculate the expire date --->
      <cfset dateExp = #dateFormat(datenow + 1, "YYYY/MM/DD")#>
      <cfscript>
	  	content =  replace(form.content, '>', 'font size=', 'ALL');	
		content =  replace(content, '-1', '', 'ALL');	
		content =  replace(content, '"', '', 'ALL');
		content =  replace(content, '"', '', 'ALL');
		content =  replace(content, '/fontbr /font size=', '', 'ALL');
		content =  replace(content, 'size=', '', 'ALL');	
	  
	  
	  
		</cfscript>
      <!--- Accessing Database --->
      <cfquery datasource="#gpp#" name="news">
        Insert news(
	    newsUrl, 
        newsHeadline, 
	    newsSource, 
   	    newsHarvest, 
	    newsExpire, 
        newsletterID, 
	    addedDate,
        newsDescription,
        newsImg
	    )
        Values(
	   <cfqueryparam value="#left(trim(form.url), 300)#" maxlength="300">,
       <cfqueryparam cfsqltype="cf_sql_longvarchar" value="#left(URLDecode(form.headline_text),400)#" maxlength="400" >, 
	   <cfqueryparam  value="#left(trim(URLDecode(form.source)),70)#" maxlength="70">,
	   <cfqueryparam cfsqltype="cf_sql_date" value="#form.harvest_time#" >,
	   <cfqueryparam cfsqltype="cf_sql_date" value="#dateExp#" >,
       <cfqueryparam cfsqltype="cf_sql_integer" value="#form.news_cat#" >,
	   <cfqueryparam cfsqltype="cf_sql_date" value="#now()#" >,
       <cfqueryparam cfsqltype="cf_sql_char" value="#Left(URLDecode(content), 550)#" maxlength="550">,
       <cfqueryparam cfsqltype="cf_sql_char" value="#left(form.img, 150)#" maxlength="150">
              )
       SELECT @@IDENTITY AS id
     </cfquery>
     
     
     <cfquery datasource="#dsnP21#">
     	UPDATE MoreOverTitles
        	SET 
            articleClickCount = (articleClickCount + 1)
        WHERE
        	[id] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.searchid#">
     </cfquery>
     
     <cfoutput>#news.id#</cfoutput>