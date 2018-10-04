<cfquery datasource="#gpp#" name="get" >
 	select  *
	from CRM_Invoice_User_details
	WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>
 
<cfif get.InvoiceNo_LNK NEQ "">
<cfquery datasource="#gpp#" name="qryInvoices" >
    SELECT
         [filename]
        ,[invoiceID]
    FROM
    	[invoicesPassed]
    WHERE
    	[invoiceNumber] =  <cfqueryparam cfsqltype="cf_sql_char" value="#get.InvoiceNo_LNK#">
</cfquery>
</cfif>
               
<script type="text/javascript">
$(document).ready(function(){
	
	var invoice = {};
	invoice.invoiceID = <cfoutput>#form.id#;
	invoice.parentID =  #get.parentID#;</cfoutput>
	
	$('#invoiceSent').live("click", function(){

	var get_Invoice_Sent		= $(this).attr("checked") ? $(this).val() : 0
			if(get_Invoice_Sent == 1 ){
				//alert("this is 1");
				$.post("Update_Invoice.cfm", {id : <cfoutput>#form.id#</cfoutput>, Invoice_Sent : JavaDateToday, fieldname:"Invoice_Sent_Date",  "value" : JavaDateToday});
				$('.Invoice_Sent_Date').html(JavaDateToday);
				$('#invoiceSent').css({'display' : 'none'});
			}else{
				//alert("this is on 0f");
				$.post("../user_edit/Update_Invoice.cfm?fieldname=Invoice_Sent_Date", {id : <cfoutput>#form.id#</cfoutput>, Invoice_Sent : 0 });
			}
}); 

$('#invoiceProcessPayment').change(function(){

	var get_invoiceProcessPayment	= $(this).attr("checked") ? $(this).val() : 0
			if(get_invoiceProcessPayment == 1 ){
				//alert("this is 1");
				$.post("Update_Invoice.cfm", {id : <cfoutput>#form.id#</cfoutput>, invoiceProcessPayment : JavaDateToday,  fieldname:"invoiceProcessPayment",   "value" : JavaDateToday});
				$('.invoiceProcessPayment').html(JavaDateToday);
				$('#invoiceProcessPayment').css({'display' : 'none'});
			}else{
				//alert("this is on 0f");
				$.post("Update_Invoice.cfm?fieldname=invoiceProcessPayment", {id : <cfoutput>#form.id#</cfoutput>, invoiceProcessPayment : 0 });
			}
});  

$(".GPP_bankAccount").editable("Update_Invoice.cfm", { 
			indicator : '<img src="../img/indicator.gif">',
			loadurl 	: '../components/JSON_BankAccount.cfm',
			type   	: "select",
			width		:  180,
			onblur 	: 'submit',
			style: 'display: inline',
			submitdata : function() {
			  		return { "fieldname": "GPP_bankAccount",};
			}
  	});

$(".InvoiceNo_LNK, .InvPDBankNumber, .discountValue, .cost, .costDiscount, .costVat, .costTotal, totalGBP").editable("Update_Invoice.cfm", { 
				type   	: "text",
				width		:180,
				height	: 25,
				style		: 'display: inline',
				onblur 	: 'submit',
				indicator : '<img src="../img/indicator.gif">',
				submitdata : function(value, settings) {
									var fieldname = $(this).attr("class");
									var oldvalue = this.revert;
									//$("#pinBoardArea").append(oldvalue + "<br />");
       								return {"fieldname": fieldname, "oldValue" : oldvalue };
   								}
});
	
$(".INVComments, .Comment_Public, .Comment_Paid_Status").editable("Update_Invoice.cfm", { 
				indicator: '<img src="../img/indicator.gif">',
				type   	: "textarea",
				width		: 180,
				height	: 50,
				style		: 'display: inline',
				onblur 	: 'submit',
				submitdata : function(value, settings) {
									var fieldname = $(this).attr("class");
									var oldvalue = this.revert;
									//$("#pinBoardArea").append(oldvalue + "<br />");
       								return {"fieldname": fieldname, "oldValue" : oldvalue };
   				}
});			  
			  
//invoice paid
$(".InvoicePaid").editable("Update_Invoice.cfm", { 
	indicator : '<img src="../img/indicator.gif">',
    data   : "{'NO' : 'NO','YES' : 'YES'  }",
    width		:  180,
	type   : "select",
    style  : "inherit",
	onblur : 'submit',
	submitdata : function() {
      return { fieldname : 'InvoicePaid' };
    },
	callback : function(value) {
		$(".invPDDateNum").html(JavaDateToday);
     }

  });
  
 $(".invPDDateNum").editable("Update_Invoice.cfm", { 
				indicator : '<img src="../img/indicator.gif">',
				type      : 'ui_datepicker',
				style  	: "inherit",
				onblur 	: 'submit',
				submitdata : function() {
      					return { fieldname : 'invPDDateNum' };
    			}
}); 

 $(".Invoice_Sent_Date").editable("Update_Invoice.cfm", { 
				indicator : '<img src="../img/indicator.gif">',
				type      : 'ui_datepicker',
				style  	: "inherit",
				onblur 	: 'submit',
				submitdata : function() {
      					return { fieldname : 'Invoice_Sent_Date' };
    			}
}); 

 $(".invoiceProcessPayment").editable("Update_Invoice.cfm", { 
				indicator : '<img src="../img/indicator.gif">',
				type      : 'ui_datepicker',
				style  	: "inherit",
				onblur 	: 'submit',
				submitdata : function(value, settings) {
						var fieldname = $(this).attr("class");
						var oldvalue = this.revert;
      					return { "fieldname" : fieldname, "oldValue" : oldvalue };
    			}
}); 
 
});

function openInvoiceModal(){
	var invoiceNumber = $(".InvoiceNo_LNK").html();
	
	if ( invoiceNumber.length == 1){
		alert("Please first add the invoice number: " + invoiceNumber.length);
	}else{
		openWindow({ url:'../InvoicesPassed/Upload_invoice.cfm', param: {'invoiceNumber': invoiceNumber, 'eventID':<cfoutput> #get.parentID#</cfoutput>}, Args:{  title : 'Upload Invoice contacts', height:300, width:400, modal:false}});
	}
}

//openWindow({ url:'../InvoicesPassed/Upload_invoice.cfm', param: {'invoiceNumber': '#get.InvoiceNo_LNK#', 'eventID':#get.parentID#}, Args:{  title : 'Upload Invoice contacts', height:300, width:400, modal:false}})
</script>
<style type="text/css">
.mini_Info { font-size:10px; color:#CC0033}
</style>
<cfoutput><table width="340" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td height="10"></td>
    <td></td>
  </tr>
  <tr>
    <td>Event</td>
    <td width="185">#get.event#</td>
  </tr>
  <tr>
    <td>Invoice sent</td>
    <td><cfif get.Invoice_Sent_Date  EQ "" ><input type="checkbox" name="Invoice_Sent_Date" id="invoiceSent" value="1" /></cfif> <b class="Invoice_Sent_Date" id="#get.id#"><cfif get.Invoice_Sent_Date NEQ "" > #dateFormat(get.Invoice_Sent_Date, "dd mmm yyyy")# </cfif></b> </td>
  </tr>
  <tr>
    <td>Processing Payment</td>
    <td><cfif get.invoiceProcessPayment  EQ ""  ><input type="checkbox" name="invoiceProcessPayment" id="invoiceProcessPayment" value="1" /></cfif> <b class="invoiceProcessPayment" id="#get.id#"><cfif get.invoiceProcessPayment NEQ "" > #dateFormat(get.invoiceProcessPayment, "dd mmm yyyy")# </cfif></b> </td>
  </tr>
  <tr>
    <td>Invoice Paid</td>
    <td><i class="InvoicePaid" id="#get.id#"><cfif get.InvoicePaid eq 1>Yes<cfelse>No</cfif></i></td>
  </tr>
  <tr>
    <td>Paid date</td>
    <td><i class="invPDDateNum" id="#get.id#">#DateFormat(get.invPDDateNum, "dd mmm yyyy")#</i></td>
  </tr>
  <tr>
    <td>Invoice No</td>
    <td><i class="InvoiceNo_LNK" id="#get.id#">#get.InvoiceNo_LNK#</i></td>
  </tr>
  <tr>
    <td>Load Invoice</td>
    <td valign="top">
    	<button class="ui-corner-all" onclick="javascript:openInvoiceModal();">Load Invoice</button>
    <!---<a href="javascript:ExternalModalOpen('../user_edit/Upload_invoice.cfm', #get.id#, 0000, 400, 300);" class="blueBut" >Load</a>---></td>
  </tr>
<cfif get.InvoiceNo_LNK NEQ "">
  <tr>
  		<td colspan="2" style="padding:10px" id="dspInvoices">
        <div style="background-color:##EDFFFF">
        <cfloop query="qryInvoices">
            	<a href="../InvoicesPassed/act_download.cfm?invoiceID=#qryInvoices.invoiceID#" target="_blank">#qryInvoices.filename#</a><br />
  			</cfloop></div>
   </td>	
</tr></cfif>
  <tr>
    <td>Discount</td>
    <td  valign="top">
    	<i class="discountValue" id="#get.id#">#get.discountValue#</i>
    </td>
  </tr>
    <tr>
    <td>Cost</td>
    <td valign="top">
    	<i class="cost" id="#get.id#">#get.cost#</i>
    </td>
  </tr>
      <tr>
    <td>cost Discount</td>
    <td valign="top">
    	<i class="costDiscount" id="#get.id#">#get.costDiscount#</i>
    </td>
  </tr>
       <tr>
    <td>cost Vat</td>
    <td valign="top">
    	<i class="costVat" id="#get.id#">#get.costVat#</i>
    </td>
  </tr>
       <tr>
    <td>Total #get.currency#</td>
    <td valign="top">
    	<i class="costTotal" id="#get.id#">#get.costTotal#</i>
    </td>
  </tr>
         <tr>
    <td>Total GBP</td>
    <td valign="top">
    	<i class="totalGBP" id="#get.id#">#get.totalGBP#</i>
    </td>
  </tr>
  <tr>
    <td>Bank</td>
    <td valign="top"><i class="GPP_bankAccount" id="#get.id#"><cfif get.bankName NEQ "">#get.bankName#<cfelse>#get.InvPDBank#</cfif></i></td><!--- ><cfif parameterexists(get.bankName) ><cfif get.bankName NEQ "">#get.bankName#<cfelse>#get.InvPDBank#</cfif><cfelse>#get.InvPDBank#</cfif>--->
  </tr>
  <tr>
    <td>Ref  No</td>
    <td valign="top"><i class="InvPDBankNumber" id="#get.id#">#get.InvPDBankNumber#</i></td>
  </tr>
  <tr>
    <td>Invoice Comment <em class="mini_Info">(for GPP only)</em></td>
    <td valign="top"><i class="INVComments" id="#get.id#">#get.INVComments#</i></td>
  </tr>
  <tr>
    <td>General Comment</td>
    <td valign="top"><i class="Comment_Public" id="#get.id#">#get.Comment_Public#</i></td>
  </tr>
  <tr>
    <td>Paid Status Comment<em class="mini_Info"> (public view)</em></td>
    <td><i class="Comment_Paid_Status" id="#get.id#">#get.Comment_Paid_Status#</i></td>
  </tr>
</table></cfoutput>

<!---$(".INVComments").editable("Update_Invoice.cfm?fieldname=INVComments", { 
				id   		: 'id',
				name 	: 'INVComments',
				indicator : '<img src="../img/indicator.gif">',
				type   	: "textarea",
				width		:  180,
				height	: 50,
				style  	: "inherit",
				onblur 	: 'submit',
			  });
	$(".Comment_Public").editable("Update_Invoice.cfm?fieldname=Comment_Public", { 
				id   		: 'id',
				name 	: 'Comment_Public',
				indicator : '<img src="../img/indicator.gif">',
				type   	: "textarea",
				width		:  180,
				height	: 50,
				style  	: "inherit",
				onblur 	: 'submit',
			  });
	$(".Comment_Paid_Status").editable("Update_Invoice.cfm?fieldname=Comment_Paid_Status", { 
				id   		: 'id',
				name 	: 'Comment_Paid_Status',
				indicator : '<img src="../img/indicator.gif">',
				type   	: "textarea",
				width		:  180,
				height	: 50,
				style  	: "inherit",
				onblur 	: 'submit',
			  });
			  
	$(".InvoiceNo_LNK").editable("Update_Invoice.cfm?fieldname=InvoiceNo_LNK", { 
				id   		: 'id',
				name 	: 'InvoiceNo_LNK',
				indicator : '<img src="../img/indicator.gif">',
				type   	: "text",
				width		:  180,
				height	: 25,
				style  	: "inherit",
				onblur 	: 'submit',
			  });
	$(".InvPDBankNumber").editable("Update_Invoice.cfm?fieldname=InvPDBankNumber", { 
				id   		: 'id',
				name 	: 'InvPDBankNumber',
				indicator : '<img src="../img/indicator.gif">',
				type   	: "text",
				width		:  180,
				height	: 25,
				style  	: "inherit",
				onblur 	: 'submit',
			  });
			  --->