<cfparam default="495" name="form.eventid">
<cfinclude template="../contract/qry_sponsorTypes.cfm">

<script type="text/javascript">
$(document).ready(function() { 	
	///////////////Contact suggest 
		$('#search_user').tagdragon({
								'field':'userName',
								'url':'../components/JSON_search_contact.cfm',
								'charMin' : 4, 
								'cache' : true,
								'max' : 100,
								onSelectItem: function(val) { 
								},
								onSelectedItem: function(val) {  
									$('#contactID').val(val.userid);
								},
								//show the loading gif
								onLoadList: function() { $('#processUser').html("<img src=../img/indicator.gif>"); },
								//remove gif
								onLoadedList: function() { $('#processUser').html("");}
		});	
});
</script>
<cfoutput>
<b>Select Contact</b>
<i class="NoFormat"><div  id="search_user" class="tagbox"><input type="text" id="userName" maxlength="100" name="userName" size="31"></div><input type="hidden" name="contactID" id="contactID" value="0"></i>

<b>Sponsor Type</b>
<i class="NoFormat">
	<select name="sponsorTypeID" id="sponsorTypeID">
    	<cfloop query="get_sponsorType">
        	<option value="#get_sponsorType.sponsorTypeID#">#get_sponsorType.sponsorTypeName#</option>
        </cfloop>
    </select>
</i>

<b>Cost</b>
<i class="NoFormat"><input type="text" name="sponsorCost" id="sponsorCost" ></i>

<b>Comment</b>
<i class="NoFormat"><textarea name="sponsorComment" id="sponsorComment"></textarea></i>

<b></b>
<i class="NoFormat"><button>Add</button><input type="hidden" name="eventID" id="eventID" value="#form.eventID#"></i>

</cfoutput>