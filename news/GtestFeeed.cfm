<cftry>
<cfset QueryString = "Canada oil">

<cfsetting enablecfoutputonly="yes">
<cfparam name="QueryString" default="oil%20&%20gas">
<cfparam name="feed" default="http://news.google.co.uk/news?pz=1&cf=all&ned=en_gb&hl=en&q">
<cfset ua ="Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2.15) Gecko/20110419 Lightning/1.0b2 Thunderbird/3.1.9">
<!---<cfset ua ="Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.10">--->
<!---<cfset qua ="Windows-RSS-Platform/2.0 (MSIE 9.0; Windows NT 6.0)">--->

<cfhttp url="#feed#=#QueryString#&output=rss" method="GET" resolveUrl="false" useragent="#ua#" /> 

<cfif cfhttp.fileContent is "Connection Failure">
    <cfdump var="#cfhttp#">
    <cfabort showerror="Error - Connection Failure">
</cfif>

<cfdump var="#cfhttp#">

<!---<cfmail to="jerome@glopac-partners.com" from="web@petro21.com" subject="news">#cfhttp.filecontent#</cfmail>--->

<cfscript>
	line = 1;
	qryResults = QueryNew("headline, url, source, harvest_time, img, content");

	XMLDoc = XMLParse(cfhttp.filecontent);
	myItems = XMLSearch(XMLDoc, "/rss/channel/item");

	while (line LTE 10)
	{
		source ="#trim(ListLast(myItems[line].title.xmltext, '-'))#";
  		title ="#trim(replace(replace(myItems[line].title.xmltext, source, ""), " -", ""))#";
		url_link = "#trim(replace(myItems[line].guid.xmltext, 'tag:news.google.com,2005:cluster=', ''))#";
		gResult = "#trim(replace(replace(myItems[line].description.xmltext, source, ""), " -", ""))#";	
		gResult = ReplaceNoCase(gResult, "<b>", "", "ALL"); 
		gResult = ReplaceNoCase(gResult, "</b>", "", "ALL"); 

		content.Start = find('6f6f6f', gResult, 10);
		content.Start = content.Start + 44;
		content.End = find('...', gResult, content.Start);
		content.Count = content.end - content.start+3;
		contentResult = mid(gResult, content.Start, content.Count);
		contentResult =  replace(contentResult, "<", "", "ALL");
		contentResult =  replace(contentResult, ">", "", "ALL");	
		contentResult =  replace(contentResult, '>', 'font size="-1"', 'ALL');	
		contentResult =  replace(contentResult, '>', '-1', 'ALL');	
		contentResult =  replace(contentResult, '"', ' ', 'ALL');	
		title		=  replace(title, "'", "-", "ALL"); 

		img.Start = find('<img', gResult);
		img.End = find('>', gResult, img.Start);

		img.Count = img.end - img.start + 1;
		imgResult = mid(gResult, img.Start, img.Count);

		img.length = len(imgResult);

		if (img.length GT 36)
		{
			imgURL = imgResult;
			imgURL = ReplaceNoCase(imgURL, '<img src="', '', "All");
			imgURL = ListGetAt(imgURL, 1, '"');
		}
		else
		{
			imgURL = '';
		}

	newRow = QueryAddRow(qryResults, 1);
    temp = QuerySetCell(qryResults, "headline", #title#, #line#);
	temp = QuerySetCell(qryResults, "content", #contentResult#, #line#);
    temp = QuerySetCell(qryResults, "url", #url_link#, #line#);
    temp = QuerySetCell(qryResults, "source", #source#, #line#);
    temp = QuerySetCell(qryResults, "harvest_time", #myItems[line].pubdate.xmltext#, #line#);
	temp = QuerySetCell(qryResults, "img", #imgURL#, #line#);

    line = IncrementValue(#line#);
	}
</cfscript>
<cfdump var="#qryResults#">

<!---
<!---<cfmail to="jerome@glopac.com" from="news@petro21.com" subject="news check" type="html">
	<cfdump var="#qryResults#">
</cfmail>--->

<cfquery dbtype="query" name="newsResult">
	SELECT 
    	* 
	FROM 
    	qryResults
	WHERE 
    	harvest_time > #maxDate#
	ORDER BY 
    	harvest_time DESC
</cfquery>--->

<cfcatch type="any">

</cfcatch>
</cftry>