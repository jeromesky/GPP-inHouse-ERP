<script type="text/javascript">
$(document).ready(function(){
	$('#mergeUser').submit(function() { 
		$(this).ajaxSubmit({success: function(data){
          $("#mergeUser").html(data);
		}
	}); 
  	return false; 
	})
});
</script>
<cfoutput><!--- show this only to Admin ---><cfif Listcontains("jerome,jason,babette,tanya,jodee", trim(Session.staffName), ",")>
<fieldset id="area_status">
  <legend>Delete User off DB</legend>
    <b>Remove Record</b> <i class="UpdatedDate"><a href="javascript:DeleteUser(#form.userid#);">Delete</a></i>
    <b>Merge records</b>
    <hr />
    <form id="mergeUser" method="post" action="../user_functions/MergeUserRegistrations.cfm">
      <table border="0" cellspacing="5" cellpadding="0">
        <tr>
          <td><input name="oldID" type="text" value="old id" style="width:50px" /></td>
          <td><input name="newID" type="text" style="width:50px" value="#form.userID#" />
              <button>Merge</button></td>
        </tr>
    </table>
  </form>
</fieldset></cfif></cfoutput>