<cfinclude template="../application.cfm">
<script type="text/javascript">
 $(document).ready(function() {
			$('form').submit(function() { 
					var recordID = <cfoutput>#form.id#</cfoutput>;

					$(this).ajaxSubmit({ clearForm: false ,
												success: function(returnedRecord){
																			$('#button_Cancel_'+ recordID).removeClass('blueBut').addClass('display');
																			$('#button_Activate_'+ recordID).removeClass('display').addClass('blueBut');
																			$('#event_'+ recordID ).css( 'background-color' , 'ffe49b' );
                                      $("#modalExternal").dialog("close");
																		}
												}); 
					return false; 
			}); 
});
</script>

<form action="../User_Edit/conference_Cancell.cfm" method="post" id="cancellationForm" >
<textarea id='Cancel_Reason' name="Cancel_Reason" style='width:220px; height:60px'></textarea>
<input  value="Submit" type="submit">
<button>SAVE</button><cfoutput>
<input type="hidden" name="id"  value="#form.id#" /> 
<input type="hidden" name="invoiceID" value="#form.secondaryid#" />
</cfoutput></form>