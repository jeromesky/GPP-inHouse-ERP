<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="../javascript/jquery1.4.js" ></script>
<script type="text/javascript" src="../javascript/jquery.form.js"  ></script>
<script type="text/javascript" src="../javascript/Tag_dragon/jquery.tagdragon.min.js"></script>
<link rel="stylesheet" type="text/css" href="../javascript/Tag_dragon/tagDragon.css" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
<script type="text/javascript">
$(document).ready(function(){

	//$('#searchCompany').submit(function() {
		//$(this).ajaxSubmit({ success: loadSearch,  	clearForm: false    	}); 
		//	return false; 
	//});
	
	$('#CompanySearch').tagdragon({
					'field':'companyname',
					'url':'../tools/JSON_Company_List_search.cfm',
					'charMin' : 1, 
					'cache' : true,
					'max' : 20,
							onSelectItem: function(val) { 
										$('#companyAddress_List').load("../tools/Brache_address_List.cfm", {"companyid": val.companyid});
						}
			});
});

</script>
<style type="text/css">
#tableList{}
td{border-bottom:1px solid #CCCCCC; border-right:1px solid #CCCCCC}
</style>
</head>

<body>
<!---<form id="searchCompany" method="post"></form>--->
<table border="0">
	<tr>
    	<td><div id="CompanySearch" class="tagbox" style="float:left; width:180px"><input type="text" id="companyname"  /></div></td>
        <td>do not do the (INDEPENDENT) company</td>
    </tr>
</table>
<div id="companyAddress_List" style="border:1px solid #666666; margin-top:10px"></div>

TEMP_branch_address

</body>
</html>