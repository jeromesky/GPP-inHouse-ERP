<cfinclude template="qry_UnpaidInvoices.cfm">
<style type="text/css">
div {font-family:Verdana, Arial, Helvetica, sans-serif; font-size:11px; }
.widgit_InvoiceUnpaid ul { margin:0px; padding:5px 0 5px 5px; list-style-type:none; border-bottom:1px dotted #dddddd; }
.widgit_InvoiceUnpaid ul:hover { background-color:#EEF9FF}
.widgit_InvoiceUnpaid li { margin:0px; padding:0px; list-style-type:none}
.widgit_InvoiceUnpaid li:first-child { color:#333333}
.widgit_InvoiceUnpaid h4 { width:100%; border-bottom:1px dotted #999999; margin:1px 0 0px 0; color:#000000; padding:0 0 0 5px; font-weight:normal; cursor:pointer}
.widgit_InvoiceUnpaid div {margin:1px 0px; padding:1px; background-color:#FEFEFE}
</style>
<div class="widgit_InvoiceUnpaid"><cfoutput query="getUnpaidInvoices">
<h4 id="#getUnpaidInvoices.EventID#">#getUnpaidInvoices.Conference_Name#</h4>
<div id="unpaidInvoice_#getUnpaidInvoices.EventID#"></div></cfoutput>
</div>