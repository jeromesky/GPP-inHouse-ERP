<script type="text/javascript" >
$(document).ready(function() {	
$('#EventCancellationForm').submit(function() { 
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

<form action="../User_Edit/qry_Cancell_conference.cfm" method="post" id="EventCancellationForm" >
<textarea id='Cancel_Reason' name="Cancel_Reason" style='width:220px; height:60px'></textarea><cfoutput>
<input type="hidden" name="registrationID" value="#form.id#" /> 
<input type="hidden" name="invoiceID" value="#form.secondaryid#" /></cfoutput>
<button>Save</button>
</form>