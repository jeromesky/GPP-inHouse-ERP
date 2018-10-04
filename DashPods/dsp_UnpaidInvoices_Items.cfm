<cfquery name="getUnpaidInvoices" datasource="#gpp#">
  SELECT 
    * 
  FROM
    CRM_Invoices_UnpaidList
  WHERE 
    eventID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventid#">
</cfquery>
 <script type="text/javascript">
<!---$(document).ready(function(){  });

					$('.widgit_InvoiceUnpaid ul').qtip({
						content: {
						url: '../User_Edit/Invoices_details.cfm',
						data: { id: $(this).attr('id')  }, // $(this).attr('id')   function(){ var get_id =  $(this).attr("id"); return(get_id); }
						method: 'post'
						},
						show: { 
						when: 'click', 
						solo: true // Only show one tooltip at a time
						 },
						hide: 'unfocus',
						
						style: { padding: 5, background: '#ffffff', color: 'black', border: { width: 1, radius: 2}, name: 'dark', tip: 'leftMiddle',  },
						 position: {
							  corner: {
								 target: 'topRight',
								 tooltip: 'leftMiddle'
							  }
						   }
					});--->
</script>
<div class="dashPod_resultCount">Unpaid: <span><cfoutput>#getUnpaidInvoices.recordcount#</cfoutput></span></div>
<cfoutput query="getUnpaidInvoices">
<ul id="#getUnpaidInvoices.invoiceID#">
    <li>#getUnpaidInvoices.ContactName#</li>
    <li>#getUnpaidInvoices.Company#</li>
    <li>Invoice : #getUnpaidInvoices.InvoiceNo_LNK#</li>
</ul>
</cfoutput>