<cfoutput>
<script type="text/javascript">
$(document).ready(function(){
	    $( ".accordion" ).accordion(accordionDefault, {active: false}); //collapsible: false
	  $(".numeric").numeric();
	  
	  $("##reportMenuLink").click(function(){
		  $("##reportSearchContent").toggle("fast");
		  });
	  
	  $('form').submit(function() { 
				$("##reportResult").html($loading);
		});
});

</script>
 <style type="text/css">
	table{font-size:12px}
	td{padding:4px 4px; border-bottom:1px dotted ##aaaaaa}
	##header{background-color:##dfdfdf; padding:10px 10px 8px 15px}
	##reportResult{}
	##reportSearchColumn{position: absolute; top:40px;left:600px; width:322px;}
	##reportSearchContent{ margin:0 4px 0 4px}
	##reportMenuLink{ background-image:url(http://www.petro21.com/my-office/_img/Reports-Menue-Tab.png); height:16px; margin-bottom:1px }
	
</style>
</cfoutput>