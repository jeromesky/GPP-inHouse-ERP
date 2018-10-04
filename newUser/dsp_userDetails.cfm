<script type="text/javascript">

$(document).ready(function() { 	
	//$(".numeric").numeric();
	$('#userName').tbHinter({text: 'no data', class: 'greyText'});//hint namer input
	$('#userSurname').tbHinter({text: 'no data', class: 'greyText'});
	$("[title]").tooltip();


	$('#userSurname').live('focusout', function(){
		var searchUser 	= $("#userName").val() + ' ' + $(this).val();
		$.post("dsp_data.cfm", {"username": searchUser }, function(data){  $("#newUser_search_result").html(data); });
	});
	
	$("#titleSearch").autocomplete({
		source: "../prefix/JSON_prefix_UI.cfm",
		minLength: 1,	
		select:function( event, ui ) { 
				$("#prefixID").val(ui.item.id);
			},
		search: function(event, ui) { 
				$(this).removeClass( "ui-corner-all" ).addClass("ui-corner-top").addClass( "ui-autocomplete-loading");
	
			},
		focus: function(event, ui) { 
				$(this).removeClass("ui-corner-top").removeClass( "ui-autocomplete-loading").addClass( "ui-corner-all" );
			}
	});
});
	
	function searchResult(){
		$("#newUser_search_result").addClass('duplicate');	
	}
		
</script>
<cfoutput>
<div class="clear"></div>

<div class="c4">    
	<div id="newUser_user" class="ui-corner-top ui-widget ui-widget-content  podForm">
	<fieldset>
		<legend  class="ui-corner-all">User Name</legend>
		<cfif session.userright EQ 4>
        <input type="hidden" name="Flagged" id="Flagged" value="1" />
        </cfif>
        <input type="hidden" name="duplicate" id="duplicate" value="0" />

		<div id="hidden">
        
        <b>Title</b>
      	<i class="NoFormat"><input type="text" id="titleSearch" name="title" class="ui-corner-all" /></i> 
			<input type="hidden" name="prefixID" id="prefixID" value="0" />
        
        <b>Name</b>
        <i class="NoFormat"><input type="text" id="userName" maxlength="100" name="userName" class="ui-corner-all" /></i>
        
        <b>Middle Name</b>
        <i class="NoFormat"><input type="text" maxlength="100" name="userMidlename" class="ui-corner-all" /></i>
        
        <b>Surname</b> 
        <i class="NoFormat"><input type="text" id="userSurname" maxlength="100" name="userSurname" class="ui-corner-all" /></i>
        
        <b>Position</b>
        <i class="NoFormat">
        	<input type="text" maxlength="100" name="strDesignation" class="ui-corner-all" />
        </i>
	</fieldset>
    <fieldset>
		<legend class="ui-corner-all">Email contacts</legend>
		<b>Main </b> 
		<i class="NoFormat fieldarea">
        	<input type="text" name="strEmail" id="strEmail" maxlength="50" class="ui-corner-all" />
        </i>
	</fieldset>
    </div>
</div>

<div class="c4">
	    
    <div id="newUser_phone" class="ui-corner-top  ui-widget ui-widget-content  podForm">
    <cf_country_search countryName="" countryID="0" randomID="#randomID#">
	<fieldset>
		<legend class="ui-corner-all">Phone contacts</legend>
        <b>Direct</b>
        <i class="NoFormat" ><input type="text" class="countryCode ui-corner-all" id="countryCode" name="countryCode" disabled="disabled" maxlength="30" style="width:45px"/>
            <input type="text" id="AreaCodeTel" name="AreaCodeTel" class="ui-corner-all numeric" maxlength="30" style="width:45px"/> 
            <input type="text" id="strPhDirect_No" name="strPhDirect_No" style="width:95px" class="ui-corner-all numeric"/>
        </i> 
        <b>Alternate</b>
        <i class="NoFormat"><input type="text" class="countryCode ui-corner-all numeric" disabled="disabled" maxlength="30" style="width:45px"/> 
            <input type="text" id="AreaCodeTelAlt" name="AreaCodeTelAlt" class="ui-corner-all numeric" maxlength="30" style="width:45px"/>
            <input type="text" id="strPhAlt1_No" name="strPhAlt1_No" style="width:95px" class="ui-corner-all numeric" /> 
        </i>
        <b>Mobile</b>
        <i class="NoFormat"><input type="text" name="strMobile_No" id="strMobile_No" maxlength="50" class="ui-corner-all numeric" /></i>
        
        <b>International</b>
        <i class="NoFormat"><input type="text" name="userPhoNumbInt" id="userPhoNumbInt" maxlength="50" class="ui-corner-all numeric" /></i>
    </fieldset>
    <fieldset>
	  <legend class="ui-corner-all">Fax contacts</legend>
	  <b>Dirrect</b>
	  <i class="NoFormat">
            <input maxlength="10" style="width:45px" type="TEXT" class="countryCode ui-corner-all numeric" disabled="disabled" />
            <input maxlength="10" style="width:45px" type="TEXT" id="AreaCodeFax" name="AreaCodeFax" class="ui-corner-all numeric" />
            <input type="text" id="strFaxDirect_No" name="strFaxDirect_No" maxlength="40" style="width:95px" class="ui-corner-all numeric" />
      </i>
          
        <b>Alternate</b>
        <i class="NoFormat">
            <input maxlength="10" style="width:45px" type="text" class="countryCode ui-corner-all numeric" disabled="disabled" /> 
            <input maxlength="30" style="width:45px" type="text" id="AreaCodeFaxAlt" name="AreaCodeFaxAlt" class="ui-corner-all numeric" />
            <input type="text" id="strFaxAlt1_No" name="strFaxAlt1_No" style="width:95px"class="ui-corner-all numeric" > 
        </i> 
     </fieldset>
    </div>
    
</div>
<div class="c3">    
	<div id="newUser_search_result" class="ui-corner-top ui-widget ui-widget-content podForm">
    </div>
</div>
</cfoutput>
	<!---	
	
	<cfif session.userright EQ 4>
		$('#hidden').css({"visibility" : 'hidden' });	
</cfif><b>Alternate </b> 
		<i class="NoFormat fieldarea">
        	<input type="text" name="strEmail_Alt" id="strEmail_Alt" maxlength="50" class="ui-corner-all" />
        </i>--->
		<!---		$( "###randomID#searchUser" ).autocomplete({
				source: "../components/JSON_User_search.cfm",
				minLength: 4,
				change: function( event, ui ) {
						},
				select:function( event, ui ) {
						if(ui.item.userid == 0 || ui.item.userid == 1 ){
								//$('##next_button').css({"visibility" : 'visible' });	
							}
							if(ui.item.userid == 1 ){
								$('##duplicate').val(1);
							}
							
							$('##hidden').css({"visibility" : 'visible' });
							$('##userName').val(ui.item.name);
							$('##userSurname').val(ui.item.surname); 
							//$('##userid').val(ui.item.userid);
					},
				search: function(event, ui) { 
						$(this).removeClass( "ui-corner-all" ).addClass("ui-corner-top").addClass( "ui-autocomplete-loading");

		 			},
		 		focus: function(event, ui) { 
		 				$(this).removeClass("ui-corner-top").removeClass( "ui-autocomplete-loading").addClass( "ui-corner-all" );
		  			}
			});--->