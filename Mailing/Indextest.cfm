<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Petro21</title>
<link href="../styles/styles.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../javascript/jquery.js" ></script>
<script type="text/javascript" src="../javascript/jquery.form.js"  ></script>
<script type="text/javascript" src="../javascript/interface.js" ></script>
<script language="javascript">
function loadconfiguration() {
		$("#areaConfigure").fadeIn("slow").load("configure_1.cfm", {step:"1"}, "");
}
function loadregions(id) {
		$("#areaConfigure").fadeIn("slow").load("configure_1.cfm", {step:"region", id:id});
}
function loadcontract(id) {
		$("#areaConfigure").fadeIn("slow").load("configure_1.cfm", {step:"contra", id:id});
}
function loadEvent(id) {
		$("#areaConfigure").fadeIn("slow").load("configure_1.cfm", {step:"event", id:id});
}

$(document).ready(function() { 

	//save user search
    var options = { 
        target:        '#areaConfigure',
		success:       showResponse,
		clearForm: true
    };  
    $('#configure').submit(function() { 
		$(this).ajaxSubmit(options);
		return false; 
    });
<!---	
    var options = { 
        target:        '#arearegion',
		success:       showResponse,
		clearForm: true
    };  
    $('#region').submit(function() { 
		$(this).ajaxSubmit(options);
		return false; 
    });	--->
	
function showResponse(responseText, statusText)  { 
	$("#areaConfigure").fadeIn("slow").load("menu.cfm", { id:responseText});
} 
	
	});
</script>
</head>

<body>
<cfinclude template="../nav/testNav2009V2.cfm">
<div id="header">Create Emails: -- <span class="header_title">Make template manage email outs</span></div>
<div id="outer">
	<div id="iner">
	  <table border="0" cellpadding="15" cellspacing="4" width="100%">
        <tr>
          <td width="640" bgcolor="#C90900"><div style=" margin:2px; border:1px solid #FF6600; width:250px; background-color:#CCFF33; padding:8px; clear:both; float:left">
          <a href="javascript:loadconfiguration();">Create Email Configure Sending Options</a></div>
          <div style=" margin:2px; border:1px solid #FF6600; width:120px; background-color:#CCFF33; padding:8px; clear:right; float:left">Load Email Template</div></td>
        </tr>
        <tr>
          <td  bgcolor="#D8E2F9"><div id="areaMenu"></div>
          <form id="configure" name="name" method="post" action="configure_1.cfm"><div id="areaConfigure"></div></form>
          <form id="region" name="name" method="post" action="configure_1.cfm"><div id="arearegion"></div></form> 
          </td>
        </tr>
        <tr>
          <td bgcolor="#F2F2F2"></td>
        </tr>
      </table>
    </div>
</div>
</body>
</html>