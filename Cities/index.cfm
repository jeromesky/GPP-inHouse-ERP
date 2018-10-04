<script type="text/javascript">
$(document).ready(function(){
	nextCity;
	$('#areaCheckCity').load('../cities/dsp_list.cfm');	
});

function nextCity(data){
	$('#areaCheckCity').load('../cities/dsp_list.cfm');
	$('#updateMessage').html(data);
}

function nextRecord(city){
	$('#areaCheckCity').load('../cities/dsp_list.cfm', { 'exclude' : city});
}

function doWhenSaving(){
	$('#submit').css({"display" : "none"});
	$('#message').html("<img src=../img/ajax-loadBar.gif>");
}
</script>
<div id="updateMessage"></div>
<div style="height:550px; overflow:auto" id="areaCheckCity"></div>