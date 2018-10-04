<cfcomponent>
	<cffunction name="browserAgents" access="public" returntype="string">
    <cfscript>
	 gpp = 'GPP';
	</cfscript>
    <!---<cfscript>
		agents = ArrayNew(1);  
		temp = ArrayAppend(agents,"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/534.16 (KHTML, like Gecko) Chrome/10.0.648.205 Safari/534.16");
		temp = ArrayAppend(agents,"Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.16 (KHTML, like Gecko) Chrome/10.0.648.204 Safari/534.16"); 
		temp = ArrayAppend(agents,"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/534.13 (KHTML, like Gecko) Chrome/9.0.597.98 Safari/534.13"); 
		temp = ArrayAppend(agents,"Mozilla/5.0 (Windows NT 5.1) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.696.71 Safari/534.24"); 
		temp = ArrayAppend(agents,"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.7 (KHTML, like Gecko) Chrome/16.0.912.75 Safari/535.7"); 
		temp = ArrayAppend(agents,"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/536.11 (KHTML, like Gecko) Chrome/20.0.1132.57 Safari/536.11"); 
		temp = ArrayAppend(agents,"Mozilla/5.0 (X11; CrOS armv7l 2913.260.0) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.99 Safari/537.11"); 
		temp = ArrayAppend(agents,"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.12) Gecko/20080219 Firefox/2.0.0.12 Navigator/9.0.0.6"); 
		temp = ArrayAppend(agents,"Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.1; WOW64; Trident/5.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; InfoPath.3; Creative AutoUpdate v1.40.02)");
		
		arrLen = ArrayLen(agents);
		arrRan = RandRange(1, arrLen);
		
		agent = agents[arrRan];
	</cfscript> --->
    
    <cfquery name="qry_60userAgents" datasource="#gpp#" maxrows="60" cachedWithin="#CreateTimeSpan(2, 0, 0, 0)#">
        SELECT TOP 60 referralAgent
        FROM petro21stats.[dbo].[referrals]
        WHERE referralAgent != ''
        AND referralAgent not like '%Blackberry%'
        AND referralAgent not like '%spider%'
        AND referralAgent not like '%googlebot%'
        AND referralAgent not like '%bots%'
        AND referralAgent not like '%bot%'
        AND referralAgent not like '%yahoo%'
        AND referralAgent not like '%search%'
        AND referralAgent not like '%crawl%'
        AND referralAgent not like '%beta%'
        GROUP BY referralAgent
        HAVING count(referralAgent) > 100
        ORDER BY referralAgent;
    </cfquery>
    
    <cfscript>
    	arrRan = RandRange(1, 60);
		agent 	= qry_60userAgents.referralAgent[arrRan];
    </cfscript>
	
    <cfreturn agent>
    </cffunction>
</cfcomponent>