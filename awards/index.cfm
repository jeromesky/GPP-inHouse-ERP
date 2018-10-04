<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<script type='text/JavaScript' src='../javascript/scw.js'></script>
<script type="text/javascript" src="../javascript/jquery.js" ></script>
<script type="text/javascript" src="../javascript/jquery.form.js"  ></script>
<script type="text/javascript" src="../Javascript/jeditable.js" ></script>
<script language="javascript">
// prepare the form when the DOM is ready 
$(document).ready(function() { 
    var options = { 
        success:   loadTheStuff,   // target element(s) to be updated with server response 
        clearForm: true        // clear all form fields after successful submit 
    };  
    $('#addhotel').submit(function() { 
		$(this).ajaxSubmit(options); 
		//$("#reviewarea").load("awardList.cfm");
		return false; 
		
    }); 
	
	function loadTheStuff(data){
			$("#reviewarea").html(data);
			$("#formArea").load("awardForm.cfm");
	}
});  
</script>

    <script type="text/javascript">
		function HotelForm() {
			$("#formArea").load("awardForm.cfm");
		}
		function editHotel(id) {
			$("#formArea").load("awardForm.cfm?edit="+id+"");
		}
	
		function HotelLoad() {
			$("#reviewarea").load("AwardList.cfm");
		}
	
		function deleteHotel(id) {
			$("#reviewarea").load("AwardList.cfm?delete="+id+"");
		}
	</script>

<link href="../styles/styles.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
input{width:220px; border:1px solid #999999}
textarea{width:220px; border:1px solid #999999}
select{width:220px; border:1px solid #999999}
-->
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Petro21.com</title>
</head>

<body onload="javascript:HotelLoad();javascript:HotelForm();">
<cfinclude template="../nav/testNav2009V2.cfm">
<div id="header"> </div>
<div id="outer">
	<div id="iner">
        <div class="sectionHeader">Add a New Award</div>
    <div style="margin:2px 0 15px 0 ; border-bottom:1px dotted #336699"></div>
    
<form action="awardList.cfm" method="post" id="addhotel">  
<div id="formArea"> 

</div>
</form>
    <div style="height:20px;"></div>
 <div class="sectionHeader"> Award List</div>
    <div style="margin:2px 0 15px 0 ; border-bottom:1px dotted #336699"></div>    
<form action="" method="post" >
      <div id="reviewarea" style="height:300px; overflow:auto">

     </div>   
 </form>
	</div>
</div>    
   
</body>
</html>