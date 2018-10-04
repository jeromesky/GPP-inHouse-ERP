<cfinclude template="qry_DelegateCount.cfm">
<style type="text/css">
div {font-family:Verdana, Arial, Helvetica, sans-serif; font-size:12px; }
.widgit_InvoiceUnpaid ul { margin:0px; padding:5px 0 5px 15px; list-style-type:none; border-bottom:1px dotted #dddddd; }
.widgit_InvoiceUnpaid ul:hover { background-color:#EEF9FF}
.widgit_InvoiceUnpaid li { margin:0px; padding:0px; list-style-type:none}
.widgit_InvoiceUnpaid li:first-child { color:#333333}
.widgit_InvoiceUnpaid h4 { width:100%; border-bottom:1px dotted #999999; margin:20px 0 0px 0; color:#000000; padding:0 0 0 15px; font-weight:normal; cursor:pointer}
.widgit_InvoiceUnpaid div {margin:2px 0px; padding:2px; background-color:#FEFEFE}
.widgit_InvoiceUnpaid .column1 { float:left; width:150px; display:block}
</style>
<ul class="listMenu">
<cfoutput query="getEventList">
<li><a id="#getEventList.eventID#">#getEventList.eventName# #getEventList.eventYear#</a></li></cfoutput>
</ul>