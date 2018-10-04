

<script language="javascript">
// prepare the form when the DOM is ready 
$(document).ready(function() { 
	$("#venueList").load("../venues/dsp_venueList.cfm");


    $('#addhotel').submit(function() { 
		$(this).ajaxSubmit( {         success:  venueListLoad }); 
		$("#venueList").load("../venues/dsp_venueList.cfm");
		return false; 
		
    }); 
});  
</script>

    <script type="text/javascript">
		function VenueFormLoad() {
			$("#addhotel").load("../venues/dsp_venueForm.cfm");
		}
		function loadvenueForm(id) {
			$("#addhotel").load("../venues/dsp_venueForm.cfm", {"venueid" : id });
			$("#venueList").css({ "height" : "100px"});
		}
	
		function venueListLoad() {
			$("#venueList").load("../venues/dsp_venueList.cfm");
			$("#addhotel").html("");
			$("#venueList").css({ "height" : "440px"});
		}
	
		function deleteVenuel(id) {
			$("#venueList").load("../venues/dsp_venueList.cfm", {'delete' : id });
		}
	</script>





<div class="c8">

     <div class="ui-corner-all marginBottom15  ui-widget ui-widget-content  podForm podBgFade_bl">
        <fieldset>
                    <legend><a href="javascript:loadvenueForm(0);">Add a New Venue</a></legend>  
            
        <form action="../venues/qry_SaveVenue.cfm" method="post"  id="addhotel" enctype="multipart/form-data"> </form>
        </fieldset>
    </div>

     <div class="ui-corner-all marginBottom15  ui-widget ui-widget-content  podForm podBgFade">
        <fieldset>
                    <legend><a href="javascript:loadvenueForm(0);">Venue List</a></legend>
                        <div id="venueList" style="height:440px; overflow:auto"></div>   
        </fieldset>
    </div>
</div>

<!---<div class="sectionHeader"></div> <div class="sectionHeader"></div>
<div style="margin:2px 0 15px 0 ; border-bottom:1px dotted #336699"></div>--->