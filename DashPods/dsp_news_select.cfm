<cfscript>
	thisDay		= dayOfWeek(now());
	nextDay 	= dayOfWeek(dateAdd("d", 1, now()));
</cfscript>

<cfquery datasource="#gpp#" name="qryNewsletters" cachedwithin="#CreateTimeSpan(0,1,0,0)#">
    SELECT     
    	 [sendTime]
        ,[newsletterName]
        ,[newsletterid]
        ,[live]
        ,[sendDay]
    FROM
    	[newsletters]
    WHERE     
    	sendDay LIKE '%#thisDay#%' OR sendDay LIKE '%#nextDay#%'
    ORDER BY 
		[sendDay], [sendTime]
 </cfquery>
 
 <cfquery name="qryNewsToday" dbtype="query">
    SELECT     
    	 [sendTime]
        ,[newsletterName]
        ,[newsletterid]
        ,[live]
    FROM
    	[qryNewsletters]
    WHERE     
    	(sendDay LIKE '%#thisDay#%')
    ORDER BY 
		[sendTime]
 </cfquery>
 
  <cfquery name="qryNewsNextToday" dbtype="query">
    SELECT     
    	 [sendTime]
        ,[newsletterName]
        ,[newsletterid]
        ,[live]
    FROM
    	[qryNewsletters]
    WHERE     
    	(sendDay LIKE '%#nextDay#%')
    ORDER BY 
		[sendTime]
 </cfquery>


<div class="ui-corner-top ui-helper-clearfix podHeader" style="color:#fff; background-color:#40bd36 !important"><spam class="ui-dialog-title">Daily News Selection (not yet active)</spam></div>
                <div class="ui-corner-bottom marginBottom15 ui-widget ui-widget-content podForm" id="dashPod_Invoice"> 
                <ul class="listMenu">
                <h4>News for today</h4>
            <cfoutput query="qryNewsToday">
              <li class="menu_event"><a href="../../my-officex/news/?fa=select&newsletterID=#newsletterid#">#newsletterName#</a></li></cfoutput>
              <h4>News for <cfoutput>#dayofWeekAsString(dayOfWeek(DateAdd("d", 1, now())))#</cfoutput></h4>
              <cfoutput query="qryNewsNextToday">
              <li class="menu_event"><a href="../../my-officex/news/?fa=select&newsletterID=#newsletterid#">#newsletterName#</a></li></cfoutput>
              </ul>
</div>