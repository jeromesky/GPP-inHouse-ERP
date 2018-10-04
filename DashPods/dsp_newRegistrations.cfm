<cfinclude template="../dashpods/qry_newRegistrations.cfm">
<style type="text/css">
div {font-family:Verdana, Arial, Helvetica, sans-serif; font-size:11px; color:#666666}
.widgit_InvoiceUnpaid ul { margin:0px; padding:5px 0 5px 5px; list-style-type:none; border-bottom:1px dotted #dddddd; }
.widgit_InvoiceUnpaid ul:hover { background-color:#EEF9FF}
.widgit_InvoiceUnpaid li { margin:0px; padding:0px; list-style-type:none}
.widgit_InvoiceUnpaid li:first-child { color:#333333}
.widgit_InvoiceUnpaid h4 { width:100%; border-bottom:1px dotted #999999; margin:1px 0 0px 0; color:#000000; padding:0 0 0 5px; font-weight:normal; cursor:pointer}
.widgit_InvoiceUnpaid div {margin:1px 0px; padding:1px; background-color:#FEFEFE}
</style>
<div class="widgit_InvoiceUnpaid">
<cfoutput>
<div class="dashPod_resultCount">top <span><cfoutput>#qryNewRegistrations.recordcount#</cfoutput></span> new regitrations</div>
<cfloop query="qryNewRegistrations">
<ul>
    <li>#Ucase(qryNewRegistrations.userName)#</li>
    <li>#qryNewRegistrations.companyName#</li>
    <li> #qryNewRegistrations.eventName#</li>
    <li>Registered on: #dateFormat(qryNewRegistrations.insertdate, "dd.mmm.yyyy")#</li>
</ul></cfloop>
</cfoutput>
</div>