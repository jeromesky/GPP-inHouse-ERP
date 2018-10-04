<cfif parameterexists(url.delete)>
	<cfquery datasource="#dsnP21#">
    DELETE FROM bookreview WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.delete#">
    </cfquery>
</cfif>


<cfquery datasource="#dsnP21#" name="get">SELECT id, title, source FROM bookreview WHERE bookid = #url.id# </cfquery>    
      <div class="sectionHeader">Current Books &amp; Reviews</div>
      <div style="margin:2px 0 15px 0 ; border-bottom:1px dotted #336699"></div> 

     <div  style="clear:right; float:left; width:800px; height:400px; overflow:auto">


<cfoutput query="get">
<div style="border-bottom:1px dotted ##CCCCCC; padding:3px">
	<div><a href="play.cfm?id=#get.id#" id="video#get.id#" onClick="return hs.htmlExpand(this, { contentId: 'video', objectType: 'iframe',		objectWidth: 430, objectHeight: 380} )" class="highslide" style="text-decoration:none">#title#</a></div>
    <div style="clear:both; float:left; width:720px;">#source#</div>
    <div style="clear:right; float:left; width:24px"><a href="javascript:listDelete(#get.id#, #url.id#);"><img src="../img/new_delete.gif" border="0" /></a></div>
        <div class="clear"></div>
</div>
</cfoutput>
        </div>