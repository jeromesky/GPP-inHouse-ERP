<cfsetting enablecfoutputonly="yes">

<cfparam name="feed" default="http://news.google.co.uk/news?pz=1&cf=all&ned=en_gb&hl=en&q">
<cfparam name="QueryString" default="oil%20&%20gas">
<cfparam name="ua" default="Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2.15) Gecko/20110419 Lightning/1.0b2 Thunderbird/3.1.9">

<cfset Random.ua = randrange(1,10)>

<cfset QueryString = "United States oil">

<cftry>

<cfhttp url="#feed#=#QueryString#&output=rss" method="GET" resolveUrl="false" useragent="#ua#" /> 

<cfif cfhttp.fileContent is "Connection Failure">
    <cfdump var="#cfhttp#">
    <cfabort showerror="Error - Connection Failure">
</cfif>

<!--- ::debug <cfdump var="#cfhttp#" label="A" expand="no"> --->

<cfscript>
	line = 1;
	qryResults = QueryNew("headline, url, source, harvest_time, img, content");

	XMLDoc = XMLParse(cfhttp.filecontent);
	myItems = XMLSearch(XMLDoc, "/rss/channel/item");

	while (line LTE 10)
	{
		source ="#trim(ListLast(myItems[line].title.xmltext, '-'))#";
		
		title ="#trim(replace(replace(myItems[line].title.xmltext, source, ""), " -", ""))#";
		title = replace(title, "'", "-", "ALL");
		
		url_link = "#trim(replace(myItems[line].guid.xmltext, 'tag:news.google.com,2005:cluster=', ''))#";
	
		gResult = 	myItems[line].description.xmltext;
		content.Start = find('6f6f6f', gResult, 100);
		content.Start = find('<font size="-1">', gResult, content.Start);
		content.Start = content.Start +  16;
		content.Fin = find('</font>', gResult, content.Start);
		content.Count = content.fin - content.start;
		content.Text =  mid(gResult, content.Start, content.Count);
		contentResult = trim(content.Text);
		
		img.Start = find('<img', gResult);
		img.End = find('>', gResult, img.Start);
		//
		img.Count = img.end - img.start + 1;
		imgResult = mid(gResult, img.Start, img.Count);
		//
		img.length = len(imgResult);
		//
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

<!---<cfdump var="#myItems#" label="B" top="5">--->
<cfdump var="#content#" label="c"> 
<cfdump var="#gResult#" label="g"> 
<hr />
<cfoutput>#gResult#</cfoutput>

<cfdump var="#qryResults#" label="C"> 

<cfcatch type="any">
	<cfdump var="#cfcatch#">
</cfcatch>

</cftry>