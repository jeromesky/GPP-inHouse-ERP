<cfinclude template="../Application.cfm">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Petro21.com</title>
<link href="../styles/styles.css" rel="stylesheet" type="text/css" />
<script type='text/JavaScript' src='../javascript/scw.js'></script>
<script type="text/javascript" src="../javascript/jquery.js" ></script>
<script type="text/javascript" src="../javascript/fileUpload.js"></script>
<script type="text/javascript" src="../javascript/jquery.form.js"  ></script>
<script type="text/javascript" src="../Javascript/jeditable.js" ></script>
<script type="text/javascript" src="../javascript/interface.js" ></script>
<script type="text/javascript" src="../javascript/jquery.charcounter.js"  ></script>
<script type="text/javascript" src="../javascript/jquery.jeditable.charcounter.js"  ></script>
<script type="text/javascript" src="../javascript/jquery.validate.js" ></script>
<script type="text/javascript">
$().ready(function() {
	// validate the comment form when it is submitted
	$("#formsearch").validate();
	
	// validate signup form on keyup and submit
	$("#formsearch").validate({
		rules: {numberValue: {digits: true }
		},
	})
});

</script>

<script language="javascript">
////////// /////////// /////////// /////////// /////////// /////////// /////////// /////////// SPeakers 
$(document).ready(function() { 
    var options = { 
		success: loadSpeakerDropMenu,
		clearForm: true
    };  
    $('#newSpeaker').submit(function() { 
		$(this).ajaxSubmit(options);
		return false; 
    });
});	

function Load_NewSpeakers() {
			$("#quickSpeaker").css('padding', '20').fadeIn("slow").load("../speakers/quickform.cfm");
		}
		
function UnloadSpeaker() {
			$("#speaker").css('padding', '0').fadeIn("slow").html("");
			Load_Form();
		}		
function loadSpeakerDropMenu() {
		$("#areaSpeakerList").load("../speakers/speakersDropMenu.cfm");
		$("#quickSpeaker").html("");
		}
////////// /////////// /////////// /////////// /////////// /////////// /////////// /////////// Save Conference 
$(document).ready(function() { 
    var options = { 
		success:       UnloadBar,
		clearForm: true
    };  
    $('#addColumn').submit(function() { 
		$(this).ajaxSubmit(options);
		$('#loadBar').fadeIn("slow").html("<img src=../img/ajax-loadBar.gif />");
		return false; 
    });
});	

function UnloadBar(responseText) {
			$('#loadBar').fadeIn("slow").html("");
			$('#area_List').fadeIn("slow").prepend(responseText);
		}


function Load_Form(update_id) {
			$('#areaForm').fadeIn("slow").load("form.cfm" , { update_id: update_id, update: 'do' });
		}
		
function Load_list(numberValue) {
			$('#area_List').fadeIn("slow").load("list.cfm" , { numberValue: '30' });
		}

function Delete_File(id) {
			$.post("delete.cfm", { id: id}, function(){  $("#row_"+id).animate( { backgroundColor: "#fbc7c7" }, "fast").animate({ opacity: "hide" }, "slow"); });
		}

		

		
$(document).ready(function() { 
    var options = { 
		success:       returnSearch,
		clearForm: true
    };  
    $('#formsearch').submit(function() { 
		$(this).ajaxSubmit(options);
		$('#SearchBar').fadeIn("slow").html("<img src=../img/ajax-loadBar.gif />");
		return false; 
    });
});	
function returnSearch(responseText) {
			$('#area_List').fadeIn("slow").html(responseText);
			$('#SearchBar').fadeIn("slow").html("");
		}
</script>
<style type="text/css">
<!--
.Button_acction_left{ clear:both; float:right; width:20px; height:20px; text-align:center; vertical-align:middle; border:1px solid #b4d4ff; background-color:#f7feff; margin:0 1px 0 1px }
.Button_acction_right{ clear:left; float:right; width:20px; height:20px; text-align:center; vertical-align:middle; border:1px solid #b4d4ff; background-color:#f7feff; margin:0 1px 0 1px }
.speakerclass{ :; }
-->
</style>

</head>

<body onload="javascript:Load_Form();Load_list()">
<cfinclude template="../nav/testNav2009V2.cfm">
<cfoutput>
<div id="header">The Columnist</div>
<div id="outer">
	<div id="iner">

<table border="0" cellpadding="15" cellspacing="7" width="100%" >
  <tr>
    <td width="442" valign="top" style="border-right:1px dotted ##999999">
<form action="../speakers/quickform_save.cfm" method="post" id="newSpeaker">
<div id="quickSpeaker"></div>
</form>    
<form action="Form.cfm" method="post" id="addColumn" enctype="multipart/form-data">
<div id="areaForm"></div>
</form>
 
    </td>
    <td valign="top"><form id="formsearch" name="formsearch" method="post" action="list.cfm">
 <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="170" ><select name="datecompare" ><option value=">">Newer then this date</option><option value="=">Equal to  this date</option><option value="<">Older then this date</option></select></td>
    <td width="300"><input type="text" name="submitDate" id="SearchsubmitDate" />  <img src="../img/calendar_24.gif" border="0" onClick="scwShow(scwID('SearchsubmitDate'),event,3);" /></td>
    <td width="50">OR</td>
    <td width="140">
<label ><input name="top" type="radio" value="top" /> Top </label>
<label><input name="top" type="radio" value="bottom" /> Bottom </label>
   
    </td>
    <td width="150"><input type="text" name="numberValue" id="numberValue" style="width:40px" /> 
      number</td>
    <td width="65"><button> Search</button> </td>
    <td><div id="SearchBar"></div></td>
  </tr>
</table> </form>
    <div id="area_List" style="padding:20px 0 0 0; margin:15px 0 0 0; border-top:1px dotted ##CCCCCC" >

    </div>
    </td>
  </tr>

</table>
</div>
</div>
</cfoutput>
</body>
</html>
