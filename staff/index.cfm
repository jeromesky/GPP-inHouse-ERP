<!---<script type='text/JavaScript' src='../javascript/scw.js'></script>
<script type="text/javascript" src="../javascript/jquery.js"></script>
<script type="text/javascript" src="../javascript/jquery.form.js"></script>
<script type="text/javascript" src="../Javascript/jeditable.js"></script>--->
<script language="javascript">
// prepare the form when the DOM is ready 
$(document).ready(function() { 
    var options = { 
        success: function(){ loadStaffList(); loadStaffForm(0) }  
    };  
    $('#adduser').submit(function() { 
		$(this).ajaxSubmit(options); 
		loadStaffList();
		return false; 
    }); 
		loadStaffList();
});
		function ussersLoad(id) {
			$("#reviewarea").load("../staff/users.cfm?edite="+id+"");
		}
		function usserform() {
			$("#inputarea").load("../staff/userForm.cfm");
		}
		function deleteusser(id) {
			$("#reviewarea").load("../staff/users.cfm?delete="+id+"");
		}
		function edituser(id) {
			$("#inputarea").load("../staff/userForm.cfm?edit="+id+"");
		}
		function loadStaffList(){
				loadPageToPlaceHolder({ url:'../staff/dsp_staffList.cfm', placeHolder:'staffList', textareaID:'no', Args: {}  });
		}
		function loadStaffForm(staffID){
				loadPageToPlaceHolder({ url:'../staff/dsp_staffForm.cfm', placeHolder:'staffForm', textareaID:'no', Args: {"staffID": staffID} });
		}
</script>
<form method="post" action="../staff/qry_userAdd.cfm" id="adduser">
<div class="c5 ui-widget ui-widget-content podForm" id="staffForm" style="height:400px; overflow:auto"></div>
</form>    
 
<div id="staffList" class="c5 ui-widget ui-widget-content podBgFade" style="height:400px; overflow:auto">
</div>