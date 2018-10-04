    <cfinclude template="../application.cfm">
<cfquery datasource="#gpp#" name="get">
 	select  *
	from CRM_Invoice_User_cancelations
	WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#" >
</cfquery>
<script type="text/javascript">
$(document).ready(function(){

$(".INVCancelledNo, .RefundAmount").editable("Update_Invoice.cfm", { 
				indicator : '<img src="../img/indicator.gif">',
				type   	: "text",
				width		:  180,
				height	: 25,
				style		: 'display: inline',
				onblur 	: 'submit',
				submitdata : function(value) {
					var fieldname = $(this).attr("class");
					var oldvalue = this.revert;
						if ( fieldname  == 'INVCancelledNo' ){
								$(".InvCanDateNum").html(JavaDateToday);
						}else if ( fieldname == 'RefundAmount'  ){
								$(".InvRefundDateNum").html(JavaDateToday);
						}
					//$("#pinBoardArea").append(oldvalue + "<br />");
					return {"fieldname": fieldname, "oldValue" : oldvalue };
				 }
			  });

$(".InvCanDateNum, .InvRefundDateNum").editable("Update_Invoice.cfm", { 
				indicator : '<img src="../img/indicator.gif">',
				type      : 'ui_datepicker',
				style  	: "inherit",
				onblur 	: 'submit',
				submitdata : function(value, settings) {
						var fieldname = $(this).attr("class");
						var oldvalue = this.revert;
						return {"fieldname": fieldname, "oldValue" : oldvalue };
				}
});

$(".InvRefundComment").editable("Update_Invoice.cfm", { 
				indicator : '<img src="../img/indicator.gif">',
				type   	: "textarea",
				width		:  180,
				height	: 50,
				style		: 'display: inline',
				onblur 	: 'submit',
				submitdata : function(value, settings) {
						var oldvalue = this.revert;
						return {"fieldname": "InvRefundComment", "oldValue" : oldvalue };
				}
});
});
</script>
<cfoutput><b>Cancel No</b>
<i class="INVCancelledNo" id="#get.id#">#get.INVCancelledNo#</i>
  
<b>Cancel Date</b>
<i class="InvCanDateNum" id="#get.id#">#DateFormat(get.InvCanDateNum, "dd mmm yyyy")#</i>

<b>Refund amount</b>
    <i class="RefundAmount" id="#get.id#">#NumberFormat(trim(get.RefundAmount), "99999.99")#</i>
  
<b>Refund Date</b>
    <i class="InvRefundDateNum" id="#get.id#">#DateFormat(get.InvRefundDateNum, "dd mmm yyyy")#</i>
  
<b>Refund Comment</b>
    <i class="InvRefundComment" id="#get.id#">#get.InvRefundComment#</i></cfoutput>

<!---$(".RefundAmount").editable("Update_Invoice.cfm?fieldname=RefundAmount", { 
				indicator : '<img src="../img/indicator.gif">',
				type   	: "text",
				width		:  180,
				height	: 25,
				style  	: "inherit",
				onblur 	: 'submit',
				callback : function(value) {
					$(".InvRefundDateNum").html(JavaDateToday);
				 }
			  });
	$(".InvRefundDateNum").editable("Update_Invoice.cfm?fieldname=InvRefundDateNum", { 
				id   		: 'id',
				name 	: 'InvRefundDateNum',
				indicator : '<img src="../img/indicator.gif">',
				type   	: "text",
				width		:  180,
				height	: 25,
				style  	: "inherit",
				onblur 	: 'submit',
			  });
	$(".INVCancelledNo").editable("Update_Invoice.cfm?fieldname=INVCancelledNo", { 
				id   		: 'id',
				name 	: 'INVCancelledNo',
				indicator : '<img src="../img/indicator.gif">',
				type   	: "text",
				width		:  180,
				height	: 25,
				style  	: "inherit",
				onblur 	: 'submit',
				callback : function(value) {
					$(".InvCanDateNum").html(JavaDateToday);
				 }
			  });--->