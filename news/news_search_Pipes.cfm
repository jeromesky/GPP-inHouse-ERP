<cfinclude template="../Application.cfm">
<cftry>
<cfsetting requesttimeout="10000">

<cfparam default="neg" name="url.testing">

<cfif url.testing EQ 'postive'>

	<cfparam default="10" name="form.newsletterid">
	<cfparam default="african oil" name="form.searchString">
	<cfparam default="10" name="url.ID">
	<cfparam default="african oil" name="url.q">
	<cfscript>
		form.newsletterid = url.ID;
		form.searchString = url.q;
	</cfscript>

</cfif>

<cfif NOT parameterexists(form.searchid)>
  <cfparam name="form.searchid" default="#RandRange(100, 999)#">
</cfif>

<cfif NOT parameterexists(form.numrecords)>
  <cfparam name="form.numrecords" default="10">
</cfif>

<cfset searchStringHL = "<span class=newsHilight>#form.searchString#</span>">



<cfset maxDate =  #dateAdd("d", -form.maxdisplay, now() )# >

<cfset QueryString = #Replace(urlencodedformat(form.searchString)," ","+","ALL")#>
<cfinclude template="GFeeed.cfm">

<cfset headerToCheck = "">


<cfset showCount = 1>
				<cfoutput>
                
                <table id="searchTitle_#form.searchid#" border="0" cellspacing="0" cellpadding="5" width="100%" >
                  <tr>
                    <td colspan="4" class="newsHeader">
                    	<div class="headerTitle"> #form.searchString# </div>
                        <div class="headerButton">
                        	<span>&nbsp;</span>
                            <span>&nbsp;</span>
                        </div>
                    </td>
                  </tr>
                  <cfif newsResult.recordcount LT 1>
                    <!--- see if no result and add count to search title --->
                    <cfquery name="get" datasource="#dsnP21#">
                        UPDATE 
                            MoreOverTitles
                        SET 
                            noResult = ( noResult + 1 )
                        WHERE
                            newsName = <cfqueryparam value="#form.searchString#"> 
                        AND 
                            toplevel = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.newsletterid#">
                     </cfquery>
                  </cfif>
                  <cfloop query="newsResult">
                          <cfif showCount LTE 10>
                          <!---<cfset headline = replace(newsResult.headline,  form.searchString, searchStringHL, "ALL")>--->
                          
                            <tr id="row_#form.searchid##newsResult.currentRow#" bgcolor="###iif(currentrow MOD 2,DE('ffffff'),DE('f1f5fa'))#">
                              <td class="newsTitle" id="title#form.searchid##newsResult.currentRow#"><a href="#newsResult.url#" target="_blank">#reReplace(newsResult.headline,  form.searchString, searchStringHL, "ALL")#</a></td>
                               <td class="newsSource">#newsResult.source#</td>
                              <td class="newsDate">#dateFormat(newsResult.harvest_time, "dd mmm")#</td>
                             <!---<td class="newsSelect"><a href="javascript:add_article(#form.searchid##newsResult.currentRow#, #form.newsletterid#, '#URLEncodedFormat(newsResult.url)#', '#URLEncodedFormat(newsResult.headline)#', '#URLEncodedFormat(newsResult.source)#', '#dateFormat(newsResult.harvest_time, "dd-mmmm-yyyy")#' , '#URLEncodedFormat(content)#' , '#URLEncodedFormat(newsResult.img)#');"><img src="../img/tickBox.jpg" border="0" /></a></td>--->
                             <td class="newsSelect">
                             	<form action="Add_news.cfm" method="post" id="#form.searchid##newsResult.currentRow#"  >
								<table border="0" >
                                	<tr>
                                    	<td>
                                        <button>+</button>
                                         <input type="hidden" name="url" id="url" value="#URLEncodedFormat(newsResult.url)#" />
                                          <input type="hidden" name="headline_text" id="headline_text" value="#URLEncodedFormat(newsResult.headline)#" />
                                          <input type="hidden" name="source" id="source" value="#URLEncodedFormat(newsResult.source)#" />
                                          <input type="hidden" name="harvest_time" id="harvest_time" value="#dateFormat(newsResult.harvest_time, 'dd-mmmm-yyyy')#" />
                                          <input type="hidden" name="content" id="content" value="#URLEncodedFormat(content)#" />
                                          <input type="hidden" name="img" id="img" value="#URLEncodedFormat(newsResult.img)#" />
                                          <!---<input type="hidden" name="news_cat" id="news_cat" value="#form.newsletterid#" />--->
                                          <input type="hidden" name="searchid" id="searchid" value="#form.searchid#" />
                                        </td>
                                        <td>
                                        <cfinclude template="newsletterMenu.cfm">
                                        </td>
                                    </tr>
                               </table></form>
                             </td>
                            </tr>
                           
                            <cfset showCount = showCount + 1>
                            <cfset headerToCheck = "#newsResult.headline#">
                            <cfelseif showCount GT 10>
                          </cfif>
                          
                  </cfloop>
                </table>
</cfoutput>

<cfcatch type="any">

</cfcatch>
</cftry>
<!---<cfset cleanString = "united%20states%20Oil">
"http://pipes.yahoo.com/pipes/pipe.run?_id=d272646d311544f730ebf48fc314cd2c&_render=rss&g=#cleanString#&y=#cleanString#"
<cfhttp method="GET" url="http://news.google.com/news?q=#cleanString#&output=rss" useragent="Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3 "></cfhttp>

<cfif cfhttp.fileContent is not "Connection Failure">
<cfset newsQueryResult = TranslateRSSItems(cfhttp.FileContent)>
</cfif>
<cfset feed = feedToQuery("http://news.google.com/news?q=#cleanString#&output=rss") />
<cfset newsQueryResult = feed.query />
<cfset feed = feedToQuery("http://news.google.com/news?q=#cleanString#&output=rss") />
<cfset newsQueryResult = feed.query />
--->

<!---<CFWDDX action="WDDX2CFML" input="#CFHTTP.FileContent#" output="newsQueryResult">--->
<!---<cfquery name="newsletters" datasource="#gpp#">
	SELECT 
    	numrecordsSearch, 
        searchBackdays,
        numrecordsDisplay  
	FROM 
    	newsletters
    WHERE 
    	newsletterid = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.newsletterid#"> 
</cfquery>--->
<!--- </cfif><cfif  newsResult.headline NEQ headerToCheck>--->
 <!---<cfif DateCompare( maxDate, newsResult.harvest_time, "d") EQ 0 OR DateCompare( maxDate, newsResult.harvest_time, "d") EQ -1>--->