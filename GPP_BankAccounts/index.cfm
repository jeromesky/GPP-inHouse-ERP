<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<script type='text/JavaScript' src='../javascript/scw.js'></script>
<script type="text/javascript" src="../javascript/jquery.js" ></script>
<script type="text/javascript" src="../javascript/jquery.form.js"  ></script>
<script type="text/javascript" src="../Javascript/jeditable.js" ></script>
<script type="text/javascript" src="../Javascript/jquery.maskedinput.js" ></script>
<script type="text/javascript" src="../Javascript/jquery.jeditable.masked.js" ></script>
<script language="javascript">
// prepare the form when the DOM is ready 
$(document).ready(function() { 
    var options = { 
        success:  loadList,    
        clearForm: true        // clear all form fields after successful submit 
    };  
    $('#addhotel').submit(function() { 
		$(this).ajaxSubmit(options); 
		return false; 
		
    }); 
});  
</script>

    <script type="text/javascript">
		function HotelForm() {
			$("#formArea").load("form.cfm");
		}
		function edit(bankID) {
			$("#formArea").load("form.cfm", { bankID: bankID });
		}
	
		function loadList() {
			$("#reviewarea").load("banklist.cfm");
		}
	
		function deleteHotel(bankID) {
			$("#reviewarea").load("hotelList.cfm?delete="+bankID+"");
		}
	</script>


<link href="../styles/indexV2.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
input{width:220px; border:1px solid #999999}
textarea{width:220px; border:1px solid #999999}
select{width:220px; border:1px solid #999999}
-->
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>www.petro21.com</title>
</head>

<body  onload="javascript:loadList();javascript:HotelForm();">
<cfinclude template="../nav/testNav2009V2.cfm">

<div id="outer">
	<div id="iner">
        
    <div style="margin:2px 0 15px 0 ; border-bottom:1px dotted #336699"></div>
    
<form action="add.cfm" method="post"  id="addhotel" >  
<div id="formArea"> 

</div>
</form>
    <div style="height:20px;"></div>
 <div class="sectionHeader"> Bank List</div>
    <div style="margin:2px 0 15px 0 ; border-bottom:1px dotted #336699"></div>    
<form action="" method="post" >
      <div id="reviewarea">

     </div>   
 </form>
	</div>
</div>    
   
</body>
</html>