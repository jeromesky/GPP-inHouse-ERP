<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>

<script>
$(document).ready(function(){
	$("#countryID").change(function(){
			var format = $("input").val();
			$('#content').html(" Loading data........");
			
			if ($("input:checked").val() == 'excel'){
					var country	= $(this).val();
					var format	= $("input:checked").val();
					var str 			= 'List_by_country_check_qry.cfm?countryID=' + country + '&format=' + format;
					window.location = str
			} else {
			
				$.get('List_by_country_check_qry.cfm', {"countryID":  $(this).val() , "format" : $("input:checked").val() },   function(data) {
				  $('#content').html(data);
				});
			}
	});
});
</script>
<style type="text/css">
body{padding:0px; margin:0px}
table{font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#333}

#header{
	border-bottom:1px solid #F7F7F7;
	padding:10px 5px 15px 5px;
}
#content{
	border-top:1px solid #DFDFDF;
	padding-top:15px;}
</style>
</head>

<body>
<div style="background-color:#F7F7D4;">
<div id="header">
	<cf_country_dropDown  random="2323" fieldName="countryID" countryID="0">
    <label> <input type="radio" name="format" value="sreen" checked="checked" /> screen </label>
    <label> <input type="radio" name="format" value="excel" /> excel </label>

</div></div>

<div id="content"></div>
</body>
</html>