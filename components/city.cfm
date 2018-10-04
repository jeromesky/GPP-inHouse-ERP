<cfparam name="attributes.cityName" default="" type="string">
<cfparam name="attributes.cityID" default="0" type="integer">

<script type="text/javascript">
$('#strCity').autocomplete({
	source: function(request, response) {
			$.ajax({
			url: "../components/JSON_CitiesUI.cfm",
			dataType: "json",
			data: { term : request.term, countryID : $('#country_ID').val() },
			success: function(data) { response(data); }
			});
		},
	minLength: 3,
	select:function( event, ui ) {
		$('#cityID').val(ui.item.cityid);
	},
	open: function() {
		$( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
	},
	close: function() {
		$( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
	},
	change:function(event, ui) { 
		$('#strCity').val(ui.item.cityname); 
	}
});
</script>

<b>City</b>
<i class="NoFormat">
<input type="text" maxlength="50" id="strCity" name="strCity" value="#attributes.cityName#">
<input type="hidden" name="cityID" id="cityID" value="#attributes.cityID#" />
</i>