<script type="text/javascript">
$(document).ready(function(){
 	///company suggest 
	$('#serach_contact').tagdragon({
		'field':'contactName',
		'url':'../components/JSON_search_Contacts.cfm',
		'charMin' : 3, 
		'cache' : true,
		'max' : 100,
		onSelectItem: function(val) { 
			<cfif (cgi.PATH_INFO&cgi.SCRIPT_NAME) EQ "/my-office/contacts/index.cfm/my-office/contacts/index.cfm">
				loadContact(val.contactID);
			<cfelse>
				if (val.contactID == 0){
					OpenPopUp('../contacts/index.cfm', 0, 0, 950, 420, 'New Contact');
				}
			</cfif>
			//add company id to hiddend field
				$('#companyID').val(val.companyID);
				$('#contactID').val(val.contactID);
				$('#contact').html(val.contact);
		},
		onSelectedItem: function(val) {$('#contactName').val(val.contactName); },
		//show the loading gif
		onLoadList: function() { $('#processContact').html("<img src=../img/indicator.gif>"); },
		//remove gif
		onLoadedList: function() { $('#processContact').html("");}
	});
});
</script>
<cfoutput><b>Contact</b>
      <i class="NoFormat">
<cfif (cgi.PATH_INFO & cgi.SCRIPT_NAME) NEQ "/my-office/contacts/index.cfm/my-office/contacts/index.cfm">
      <div id="serach_contact" class="tagbox"><input class="ui-corner-all" type="text" name="contactName" id="contactName" value="#get_contract.contactName#" /></div>
      </i><input type="hidden" id="contactID" name="contactID" value="#get_contract.contactID#" />
<cfelse>
      <div id="serach_contact" class="tagbox"><input class="ui-corner-all" type="text" name="contactName" id="contactName" value="" /></div>
      </i><input type="hidden" id="contactID" name="contactID" value="" />
</cfif><i class="field_button_container NoFormat" id="processContact"></i>
</cfoutput>