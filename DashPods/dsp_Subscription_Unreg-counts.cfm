<div class="ui-corner-top ui-helper-clearfix podHeader" style="color:#fff; background-color:#fa761d !important"><spam class="ui-dialog-title">Subscribtion unregister Count</spam></div>
<div class="ui-corner-bottom marginBottom15 ui-widget ui-widget-content podLinks">
    <ul class="listMenu">
        <li>Total unregistrations (<cfoutput>#qrySubscriptionCount.recordcount#</cfoutput>)</li><cfoutput query="qrySubscriptionCount" group="subEndID">
        <li>#reasonName# <!---#["qrySt#qrySubscriptionCount.currentrow#"]total#---> <!---#["qrySt#qrySubscriptionCount.subEndID#"].total# <cfdump var="#["qrySt#qrySubscriptionCount.subEndID#"]#">---></li>
        </cfoutput>
    </ul>
</div>