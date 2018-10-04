
<cfinclude template="qry_venue.cfm">
<cfscript>
 Rid = createObject("component", "Officecfc.randomID");
 randomID = Rid.randomID();
</cfscript>
<!---<script type="text/javascript">
$(document).ready(function(){
	$('#search_City').css({ "visibility" : "hidden" });
});

				$('#search_Country').tagdragon({
 						'field':'CountryName',
						'url':'../components/JSON_country_table.cfm',
						'charMin' : 3, 
						'cache' : true,
						'max' : 100,
						onSelectItem: function(val) { 
								$('#countryID').val(val.id);
								$('#search_City').css({ "visibility" : "visible" });
								},
								//show loading gif
								onLoadList: function() { $('#processCountry').html("<img src=../img/indicator.gif>"); },
								//remove gif
								onLoadedList: function() { $('#processCountry').html("");}
				});
				
						$('#search_City').tagdragon({
								'field':'strCity',
								'url':'../components/JSON_Cities.cfm',
								'postData' : {'countryid' : function(){ var get_C =  $('#countryID').val(); return(get_C); } },
								'charMin' : 3, 
								'cache' : true,
								'max' : 20,
								onSelectItem: function(val) { $('#cityID').val(val.cityid); },
								onSelectedItem: function(val) {	$('#strCity').val(val.cityname); },
								//show the loading gif
								onLoadList: function() { $('#processCity').html("<img src=../img/indicator.gif>"); },
								//remove gif
								onLoadedList: function() { $('#processCity').html("");}
						});
</script>--->
<!---<cfif parameterexists(url.edit)>
<cfquery datasource="#dsnP21#" name="get">
SELECT * FROM hotels WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.edit#">
</cfquery>--->
<cfoutput>





        <table  border="0" cellspacing="1" >
      <tr>
        <td align="right" valign="top">
        <b>Venue name</b>
<i class="NoFormat"><input type="text" name="VenueName" value="#get.VenueName#"  maxlength="45" class="ui-corner-all" /></i>

<b>Web site link</b>
<i class="NoFormat"><input  name="venueURL"  maxlength="180" value="#get.venueURL#" class="ui-corner-all" /></i>

<b>Contact name</b>
<i class="NoFormat"><input type="text" name="venueContactPerson" value="#get.venueContactPerson#" maxlength="50" class="ui-corner-all"/></i>

<b>telephone</b>
<i class="NoFormat"><input type="text" name="venuePhone" value="#get.venuePhone#" maxlength="22" class="ui-corner-all"/></i>



<b>Hotel address</b>
<i class="NoFormat"><textarea name="venueAddress" style="height:60px" class="ui-corner-all">#get.venueAddress#</textarea></i>
        
<!---<b>country</b>
<i class="NoFormat">
	<div id="search_Country" class="tagbox"> <input type="text" id="CountryName" name="CountryName" value="#get.countryNameEN#" class="ui-corner-all"/><b style="width:20px" id="processCountry"></b> </div> 
    <input type="hidden" id="countryID" name="countryID" value="#get.countryID#" />
</i>--->
<cf_country_suggest  country="#get.countryNameEN#" countryfieldname="venuCountryName"  countryID="#get.countryID#"  fieldname="countryID" random="#randomID#"><!---<cfif get.countryID EQ "">0<cfelse></cfif>--->
<cf_city_suggest  city="#get.CityNameEN#" cityfieldname="venuCityName" cityID="#get.cityID#"  fieldname="cityID" countryFieldname="countryID" random="#randomID#"> 

<!---<b>City</b>
<i class="NoFormat">	
		<div id="search_City" class="tagbox"  ><input type="text" maxlength="50" id="strCity" name="strCity" value="#get.CityNameEN#" class="ui-corner-all"> <b style="width:20px" id="processCity"></b></div><input type="hidden" name="cityID" id="cityID" value="#get.cityID#" />
</i> --->  

<b>Comment Private</b>
<i class="NoFormat"><textarea name="venueCommentPrivate" style="height:60px" class="ui-corner-all">#get.venueCommentPrivate#</textarea></i>
        </td>
        <td align="right" valign="top">
<b>venue email</b>
<i class="NoFormat"> <input type="text" name="venueEmail" value="#get.venueEmail#" maxlength="85" class="ui-corner-all" /> </i>
        
        
<b><img src="../../docs/#get.venueImage#" border="0" />hotel log</b>
<i class="NoFormat"><input type="file" name="venueImage" class="ui-corner-all"/></i>

<b>Venue Type</b>
<i class="NoFormat">
	<select name="venueTypeID" class="ui-corner-all">
           	  <option value="1" <cfif get.venueTypeID EQ 1>selected="selected" </cfif> >Hotel</option>
              <option value="2" <cfif get.venueTypeID EQ 2>selected="selected" </cfif>>Accomodadion</option>
              <option value="3" <cfif get.venueTypeID EQ 3>selected="selected" </cfif>>Conference Venue</option>
              <option value="4" <cfif get.venueTypeID EQ 4>selected="selected" </cfif>>Restaurant</option>
              <option value="5" <cfif get.venueTypeID EQ 5>selected="selected" </cfif>>Meeting Venue</option>
</select>
</i>

<b>venue Capacity</b>
<i class="NoFormat"> <input type="text" name="venueRoomCapacity" value="#get.venueRoomCapacity#" maxlength="80" class="ui-corner-all"/> numbers only</i>

<b>fax</b>
<i class="NoFormat"><input type="text" name="venueFax" value="#get.venueFax#" maxlength="22" class="ui-corner-all"/></i>

<b>Google map</b>
<i class="NoFormat"><textarea name="venueGoogleMap" style="height:60px" class="ui-corner-all">#get.venueGoogleMap#</textarea></i>

     

<b>Comment Public</b>
<i class="NoFormat"><textarea name="venueCommentPublic" style="height:60px" class="ui-corner-all">#get.venueCommentPublic#</textarea></i>

<b></b>
<i class="NoFormat"><input name="save" type="submit" value="save" /><input type="hidden" name="venueID" value="#form.venueID#"></i>
        
        </td>
      </tr>
    </table>
</cfoutput>

 