<script type="text/javascript">
 $(document).ready(function() {
 		$("#area_newUserList").load("../user_registrations/dsp_registerList.cfm");
 });
 </script>

<div id="area_newUserList" style="height:560px; overflow:auto;  background-color:#FFF4F4"></div>
<fieldset id="area_newUserEdit" style=" overflow:auto; background-color:#FFF4F4"></fieldset>
 
<!--- 		function loadNewUser(userID) {
			$("#area_newUserEdit").load("../user_registrations/dsp_newUserCheck.cfm", {"userID" : userID });
			//$("#venueList").css({ "height" : "100px"});
			$('#area_newUserList').animate({ height: 80}, 500);
			$('#area_newUserEdit').animate({ height: 480}, 500);
		}--->
	
<!---		function deleteNewUser(userID) {
			$("#venueList").load("../venues/dsp_venueList.cfm", {'userID' : userID });
		}
		
		///FUNCTIONS FOR ROLLOVER ROW--->
<!---$('.update-current-field').live("click", function(){
		
		var get_field 			= $(this).attr("name");
		var get_data 			= $("#"+get_field).val();
		
		var get_fieldTitle	= $(this).attr("title");
		var get_fieldValue 	= $("#"+get_fieldTitle).val();
		var get_newUserID	= $("#NewUserID").val();
		
		//alert( get_fieldTitle + ' : ' + get_fieldValue + ':: ' + get_field + ': ' + get_data );
		
		if ( typeof( window[ 'userID' ] ) == "undefined" ) {
			//not exists
			alert("you first need to search a current user before you can update from this record");
		} else {
					//exists
					if (get_fieldTitle == 0  ){
						alert("this is no id");
							
							$.post("../user_edit/Update_Individual.cfm" , {'id' : get_newUserID, 'fieldname': get_field, 'value' : get_data } , function() {  $("."+get_field).html(get_data);  } );
					}else if (get_fieldTitle != 0){
								alert("this is id");
							
							$.post("../user_edit/Update_Individual.cfm" , {'id' : get_newUserID, 'fieldname': get_field, 'value' : get_data } , function() {  $("."+get_fieldTitle).html(get_fieldValue);  } );
					}
		}
	
});--->