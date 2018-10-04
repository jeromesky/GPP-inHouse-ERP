<cfinclude template="qry_topRatedNewsArticles.cfm">
<div class=" ui-corner-top ui-helper-clearfix podHeader" style="color:#fff; background-color:#C33 !important"><spam class="ui-dialog-title">Top clicked News Articles</spam></div>
<div class="ui-corner-bottom marginBottom15 ui-widget ui-widget-content podLinks">
    <ul class="listMenu">
        <cfoutput query="qryTopRatedNewsArticles">
        <li>(#newsClickCount#) - <strong>#newsHeadline#</strong></li></cfoutput>
    </ul>
</div>