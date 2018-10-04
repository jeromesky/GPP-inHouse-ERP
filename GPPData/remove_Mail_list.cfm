<cfinclude template="../Application.cfm">
<!---<cfinclude template="../tools/checkVPN.cfm" >--->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Petro21</title>
<script src="../../js/livevalidation.js" type="text/javascript"></script>
<script type="text/javascript" src="../javascript/jquery.js" ></script>
<script type="text/javascript" src="../javascript/jquery.form.js"  ></script>
<script type="text/javascript" src="../Javascript/jeditable.js" ></script>
<script type="text/javascript" src="../javascript/interface.js" ></script>
<script type="text/javascript" src="../javascript/bsn.AutoSuggest/bsn.AutoSuggest_c_2.0.js"></script>
<link rel="stylesheet" href="../javascript/bsn.AutoSuggest/css/autosuggest_inquisitor.css" type="text/css" media="screen" charset="utf-8" />
<link href="../styles/styles.css" rel="stylesheet" type="text/css" />
<script language="javascript">
// prepare the form when the DOM is ready 
$(document).ready(function() { 

	    var options = { 
        //target:        '#output',
		success: showResponse,
		clearForm: true
    };  
    $('#removeMail').submit(function() { 
		$(this).ajaxSubmit(options); 
		return false; 
    }); 
});  

function showResponse(data){
$("#output").append(data).fadeIn("slow");

}
</script>
<style type="text/css">
.LV_validation_message{
	padding:0 0 0 18px;
    margin:0 0 0 5px;
}

.LV_valid {
    color:#00CC00;
	background-image:url(../../img/ok_tick.gif);
	background-repeat:no-repeat;
}
	
.LV_invalid {
    color:#CC0000;
	background-image:url(../../img/erro_crossr.gif);
	background-repeat:no-repeat;
}
    
.LV_valid_field,
input.LV_valid_field:hover, 
input.LV_valid_field:active,
textarea.LV_valid_field:hover, 
textarea.LV_valid_field:active {
    border: 1px solid #BDBDBD;
}
    
.LV_invalid_field, 
input.LV_invalid_field:hover, 
input.LV_invalid_field:active,
textarea.LV_invalid_field:hover, 
textarea.LV_invalid_field:active {
    border: 1px solid #CC0000;
}
</style>

</head>

<body>
<cfinclude template="../nav/testNav2009V2.cfm">
<div id="header">GPP datamase management:  -- <span class="header_title"></span></div>
<div id="outer">
	<div id="iner">
 <table border="0" cellpadding="15" cellspacing="4" width="100%">
 	<tr>
    	<td width="640" bgcolor="#C90900"><div id="areaSpeakerForm" style="color:#FFFFFF">Remove User from Mailing list</div>
		</td>
      <td bgcolor="#D8E2F9" valign="top">     </td>
   </tr>
   <tr>
   	<td colspan="2" bgcolor="#F2F2F2">
    <form action="remove_Mail_action.cfm" method="post" id="removeMail">
    <div class="labelarea">Name </div><div class="fieldarea"><input type="text" name="searchfield" id="searchfield" style="width:600px" />   </div>
     <div class="labelarea"></div>
     <div class="labelarea">Mark as archived</div><div class="fieldarea">  <input type="checkbox" name="archive" id="archive" value="ok"  /></div>
     <div class="fieldarea">  <input type="text" style="width:50px" name="chkMail" id="chkMail" /></div>
     <div class="labelarea" style="height:20px"></div>
      <div class="labelarea"> </div><div class="fieldarea"><button type="submit">Remove </button></div>
    </form> 
    </td>
  </tr>
     <tr>
   	<td colspan="2" bgcolor="#F2F2F2"><div id="output"></div> 
    </td>
    </tr>
</table>
</div>
</div>
<script type="text/javascript">
				var chkMail = new LiveValidation('chkMail');
				chkMail.add( Validate.Presence );
				
				var searchfield = new LiveValidation('searchfield');
				searchfield.add( Validate.Presence );

          var automaticOnSubmit = form.onsubmit;
          form.onsubmit = function(){
	          var valid = automaticOnSubmit();
	          if(valid)alert('The form is valid!');
            return false;
          }
</script>
<script type="text/javascript">
	var options = {
		script:"Suggest_user.cfm?json=true&",
		varname:"input",
		json:true,
		minchars: 4,
		timeout: 8500,
		delay: 100,
		callback: function (obj) { document.getElementById('chkMail').value = obj.id; }
	};
	var as_json = new AutoSuggest('searchfield', options);
</script>
</body>
</html>