<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Global Pacific & Partners DASHBOARD</title>
<script type="text/javascript" src="../javascript/jquery1.4.js"></script>
<!---<script type="text/javascript" src="../javascript/jquery1.4.js"></script>--->
<script type="text/javascript" src="../javascript/jquery.form.js"></script>
<script type="text/javascript" src="../javascript/Jeditable.js"></script>
<script type="text/javascript" src="../javascript/interface.js"></script>
 <script type="text/javascript" src="../javascript/jqprint.js"></script>
<script type="text/javascript" src="../javascript/jquery.maskedinput.js"></script>
<script type="text/javascript" src="../javascript/jquery.jeditable.masked.js"></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery.charcounter.js"></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery.jeditable.charcounter.js"></script>
<link type="text/css" href="http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/jquery-ui-1.7.2.custom.css" rel="stylesheet" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/jquery-ui-1.7.2.custom.min.js"></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/jquery.jeditable.UIdatepicker.js"></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/Tag_dragon/jquery.jeditable.TagDragon.js"></script>

<!---<script type="text/javascript" src="../Javascript/tiny_mce/jscripts/tiny_mce/tiny_mce.js"></script>--->
<script type="text/javascript" src="../javascript/livevalidation.js"></script>
<script type="text/javascript" src="../javascript/Tag_dragon/jquery.tagdragon.min.js"></script>
<link rel="stylesheet" type="text/css" href="../javascript/Tag_dragon/tagDragon.css" />

<link rel="stylesheet" type="text/css" href="../javascript/Vtip/vtip.css" />
<link href="../styles/index.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
 //////////////////////MODAL EXTERNAL CONTENT 
 		function ExternalModalOpen(URLToLoad, id, otherid, width, height, title){		
					$("#modalExternal").dialog("open");
					$("#modalExternal").load(URLToLoad, {id:id, secondaryid: otherid }).dialog( {
					 		'modal' : true,
							'title' : title, 
							forcePlaceholderSize: true , 
							height : height, 
							width : width
							
							//buttons: {	OK: function() {	$(this).dialog('close');	 , Cancel: function() {	$(this).dialog('close');	}, }
							});		
			}	
			
 ////////MODAL Pop UP CONTENT 
 		function OpenPopUp(URLToLoad, id, companyid, width, height, title ){
					var get_company_id = $('#lngCompany_ID').val();	
					$("#modalPopUp").dialog("open");
					$("#modalPopUp").load(URLToLoad, {id: get_company_id, "companyid": companyid}).dialog({ forcePlaceholderSize: true , 'title' : title ,  height : height,  width : width });		
			}		
			
$(document).ready(function() {			
			ExternalModalOpen('../--New_User/index.cfm', 0, 0, 900, 520, 'Add a new User to the system');
});
</script>
</head>

<body>
<a href="http://www.petro21.com/my-office/logout.cfm" class="blueButXL">Log Out</a>
<div id="modalExternal"></div>
<div id="modalPopUp"></div>
</body>
</html>