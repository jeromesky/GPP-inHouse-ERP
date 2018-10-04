<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
<link href="../styles/indexV2.css" rel="stylesheet" type="text/css">
<link href="../styles/styles.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../javascript/jquery.js"></script>
<script type="text/javascript" src="../javascript/jquery.form.js"></script>
<script type="text/javascript" src="../Javascript/jeditable.js"></script>
<script type="text/javascript" src="../javascript/interface.js"></script>
<link href="../Javascript/facebox/facebox.css" media="screen" rel="stylesheet" type="text/css"/>
<script src="../Javascript/facebox/facebox.js" type="text/javascript"></script>
<script src="../Javascript/livevalidation.js" type="text/javascript"></script>
<script type="text/javascript" src="../highslide/highslide.js"></script>
<script type="text/javascript" src="../highslide/highslide-html.js"></script>
<script type="text/javascript">    
    hs.graphicsDir = '../highslide/graphics/';
    hs.outlineType = 'rounded-white';
    hs.outlineWhileAnimating = true;
	 hs.objectLoadTime = 'after';
	 hs.preserveContent = false;
</script>

<script language="javascript">
 jQuery(document).ready(function($) {
  $('a[rel*=facebox]').facebox()
})

$(document).ready(function() { 
//save user search
    var options = { 
        target:      '#LoadAreaUser',
		clearForm: false
    };  
    $('#searchname').submit(function() { 
		$(this).ajaxSubmit(options);
		removEvents();
		return false; 
    }); 
//load users from user form
//save Events and go to form
    var options = { 
        target:      '#LoadAreaForm',
		clearForm: false
    };  
    $('#selectEventForm').submit(function() { 
		$(this).ajaxSubmit(options); 
			 removEvents();
		return false; 
    }); 

});
// remove events div
function removEvents() {
		$("#LoadAreaEvent").html("");
}
// remove usres
function removeuser() {
		$("#LoadAreaUser").html("");
		$("#LoadAreaUser").remove("");
}
// save user and go to events
function loadevents(userid) {
			//alert(userid);
			$("#LoadAreaEvent").load("conference_registration_event.cfm?userid="+userid+"", "", { }, function(){ $('#LoadAreaForm').html(''); });
			$('#LoadAreaForm').html('');
		}	
</script>
<style type="text/css">
.LV_validation_message{
	padding:0 0 0 18px;
    margin:0 0 0 5px;
}

.LV_valid {
    color:#00CC00;
	background-image:url(../img/ok_tick.gif);
	background-repeat:no-repeat;
}
	
.LV_invalid {
    color:#CC0000;
	background-image:url(../img/erro_crossr.gif);
	background-repeat:no-repeat;
}
    
.LV_valid_field,
input.LV_valid_field:hover, 
input.LV_valid_field:active,
textarea.LV_valid_field:hover, 
textarea.LV_valid_field:active {
    border: 1px solid #000000;
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
<div id="header">Create a Transactions for NetBanx:  -- <span class="header_title">-</span></div>
<div id="outer">
	<div id="iner">
 <table border="0" cellpadding="15" cellspacing="4" width="100%">
 	<tr>
    	<td width="640" bgcolor="#C90900"><div style=" background-color:#FFFFFF">
        <a href="../control_econference/newUser.cfm" id="idnewuser" onClick="return hs.htmlExpand(this, { contentId: 'newuser', objectType: 'iframe',		objectWidth: 700, objectHeight: 400} )" class="highslide"><img src="../img/home_user.gif" width="61" height="57" border="0" />Add User</a>
        </div>
        </td>
    </tr>
        <tr>
    	<td  bgcolor="#D8E2F9">
        <form id="searchname" name="name" method="post" action="conference_registration_user.cfm">
		<table width="100%"  border="0" cellspacing="4" cellpadding="4" style="color:#333333">
  <tr>
    <td width="142"><strong>Search for Clients</strong></td>
    <td width="1660">&nbsp;</td>
  </tr>
  <tr>
    <td>Search word</td>
    <td><input type="text" name="name" style="width:170px"/> 
      type any part of name or surname, dont need to type full name</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input type="submit" name="Submit" value="Next"></td>
  </tr>
</table></form>
        </td>
    </tr>
    <tr>
    	<td bgcolor="#F2F2F2">
        <form action="conference_registration_event.cfm" id="selectUserForm" method="post"><div id="LoadAreaUser"></div></form>
        <form action="conference_registration_form.cfm" id="selectEventForm" method="post"><div id="LoadAreaEvent"></div></form>
        <form action="createPaymentSend.cfm" id="selectSaveForm" method="post"><div id="LoadAreaForm"></div></form></td>
    </tr>
</table>
    </div>
</div>

<div class="highslide-html-content" id="newuser" style="width: 700px; height:400px;">
<div class="highslide-move" style="border: 0; height: 18px; padding: 2px; cursor: default"><a href="#" onClick="return hs.close(this)" class="control">Close</a></div>
					<div class="highslide-body"></div>
				</div>
<div class="highslide-html-content" id="convert" style="width: 426px; height:240px;">
<div class="highslide-move" style="border: 0; height: 18px; padding: 2px; cursor: default"><a href="#" onClick="return hs.close(this)" class="control">Close</a></div>
					<div class="highslide-body"></div>
				</div>
</body>
</html>