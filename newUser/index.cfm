<cfinclude template="qry_newID.cfm">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>New User</title>
<script type="text/javascript" src="../javascript/jquery1.4.js" ></script>
<script type="text/javascript" src="../javascript/jquery.form.js"></script>
<script type="text/javascript" src="../javascript/Jeditable.js"></script>
<link type="text/css" href="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.css" rel="stylesheet" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.min.js"></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/ckeditor/adapters/jquery.js"></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery.CRM.js"></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery.jWizard.min.js"></script>

<!---<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/Tag_dragon/jquery.jeditable.TagDragon.js"></script>

<script type="text/javascript" src="../javascript/Tag_dragon/jquery.tagdragon.min.js"></script>--->

<link href="../styles/indexV2.css" rel="stylesheet" type="text/css">
<style type="text/css">
#area_newUser{ width:950px; margin: 40px auto 0px auto }
/* 	height: 422px; */

.listDetails{color:#666}
.listUrl{color:#999}
#suggestCompanies, #suggestLabels{ height:160px; overflow:auto}

#suggestBranch {height: 380px; overflow:auto}
#newUser_user, #newUser_search_result, #newUser_phone {height:330px; overflow:auto}
#newUser_email {height:70px; overflow:auto}
#companyActions{ display:none}
#company_search, #aka_company, #dsp_selectedCompany {display: none;}
#companyColumForm{margin:0px}
.listMenu li.listParent{padding-top:8px; padding-bottom:8px }
.institutes{background-color:#ffffd6}
.accademic{background-color:#e7f6ff}
.countries{background-color:#f6f6f6}
.parentCompany{ background-color:#1eb436; color:#fff}
.listNoResult{background-color:#ffede7; color:#a61010}
#AKA_companyButton, #button_saveBranch{display:none}
.duplicate{color:#ff0000; border-color:#F00}
.jw-steps-wrap{padding:0px}
</style>
<script type="text/javascript">
$(document).ready(function() {
	newUser();
	var newUserPath = "newUserBranch"
});

function newUser(){
		<!---$('#area_newUser').html($loading).load("../newUserBranch/dsp_form.cfm", {'userID': <cfoutput>#userID#</cfoutput>});
	
	$('#area_newUser').load("../newUser/qry_newID.cfm", function(data){
		$('#area_newUser').html($loading);
		$('#area_newUser').load("../newUser/dsp_form.cfm", {'userID': #userID#});
	});--->
}
</script>
</head>

<body>
<cfinclude template="../nav/testNav2009V2.cfm">

<div id="area_newUser">
<cfinclude template="dsp_form.cfm">
</div>
<cfinclude template="../_display/dsp_footer.cfm">
