<cfinclude template="qry_selectedNews.cfm">
<script type="text/javascript">
	var addcounter = <cfoutput>#get_Selected_News.recordcount#</cfoutput>;
</script>


<div id="podSelectedNews" class="ui-corner-all marginBottom15  podForm podBgFade ui-widget ui-widget-content  ">
<div class="index">
            <sup class="displayLabel">font size</sup>			
            <sup class="displayData "><span class="fontSizer cursorPointer" id="large">bigger</span> || <span class="fontSizer cursorPointer" id="small">small</span></sup>
            <sup class="displayLabel"><a href="#top">top of page</a></sup>
  <div class="clear"></div>
 </div>
 
<!---<strong style="font-size:12px">Select News for <cfoutput>#NewsletterOptions.newsletter#</cfoutput></strong>--->

  <div class="" style="background-color:#990000; padding:6px; margin:10px 0px">
  	<span style="color:#fff">News Selected Count <span id="counter"><cfoutput>#get_Selected_News.recordcount#</cfoutput></span></span>
  </div>


    <div id="selectNews">
		<cfoutput query="get_Selected_News">
        	<div class="selectedNewsResult" id="Colleted_#get_Selected_News.news_item_id#" onClick="javascript:deleteColected(#get_Selected_News.news_item_id#);" onMouseOver="this.className='selectedNewsResultOn'" onMouseOut="this.className='selectedNewsResult'">
            		#get_Selected_News.news_item_headline_text# <span>(#dateFormat(get_Selected_News.news_item_added, "dd.mm")#)</span>
            </div></cfoutput>
     </div>
</div>