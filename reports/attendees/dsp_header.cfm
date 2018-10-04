<cfoutput>
<script type="text/javascript">
$(document).ready(function(){
		$( ".accordion" ).accordion(accordionDefault);
		$(".numeric").numeric();
		
		  $('form').submit(function() { 
				$("##result").html($loading);
		});
});
</script>
 <style type="text/css">
	table{font-size:12px}
	td{padding:4px; }/*border-bottom:1px dotted ##aaaaaa*/
	##header{background-color:##dfdfdf; padding:10px 10px 8px 15px}
	td.company{border-bottom:1px dotted ##999; padding-top:20px; font-weight:bold }
</style>
</cfoutput>