

<script language="javascript">
// prepare the form when the DOM is ready 
$(document).ready(function() { 
	$("#reviewarea").load("../hotels/hotelList.cfm");
	$("#formArea").load("../hotels/hotelForm.cfm");

    var options = { 
        success:  HotelLoad,    
        clearForm: true        // clear all form fields after successful submit 
    };  
    $('#addhotel').submit(function() { 
		$(this).ajaxSubmit(options); 
		$("#reviewarea").load("../hotels/hotelList.cfm");
		return false; 
		
    }); 
});  
</script>

    <script type="text/javascript">
		function HotelForm() {
			$("#formArea").load("../hotels/hotelForm.cfm");
		}
		function editHotel(id) {
			$("#formArea").load("../hotels/hotelForm.cfm?edit="+id+"");
		}
	
		function HotelLoad() {
			$("#reviewarea").load("../hotels/hotelList.cfm");
		}
	
		function deleteHotel(id) {
			$("#reviewarea").load("../hotels/hotelList.cfm?delete="+id+"");
		}
	</script>




<body  onload="javascript:HotelLoad();javascript:HotelForm();">



        <div class="sectionHeader">Add a New Hotel</div>
    <div style="margin:2px 0 15px 0 ; border-bottom:1px dotted #336699"></div>
    
<form action="hoteladd.cfm" method="post"  id="addhotel" enctype="multipart/form-data">  
<div id="formArea"> 

</div>
</form>
    <div style="height:20px;"></div>
 <div class="sectionHeader">Venue List</div>
    <div style="margin:2px 0 15px 0 ; border-bottom:1px dotted #336699; "></div>    

      <div id="reviewarea" style="height:180px; overflow:auto">
 
     </div>   

</body>
</html>