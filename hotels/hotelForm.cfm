<!---<cfinclude template="../Application.cfm">
<cfquery datasource="#dsnP21#" name="country">SELECT country FROM countries</cfquery>--->

<script type="text/javascript">

				$('#search_Country').tagdragon({
 						'field':'CountryName',
						'url':'../components/JSON_country_table.cfm',
						'charMin' : 3, 
						'cache' : true,
						'max' : 100,
						onSelectItem: function(val) { 
								$('#countryid').val(val.id);
								$('#search_City').attr('title', val.id);
								},
								//show loading gif
								onLoadList: function() { $('#processCountry').html("<img src=../img/indicator.gif>"); },
								//remove gif
								onLoadedList: function() { $('#processCountry').html("");}
				});
				
						$('#search_City').tagdragon({
								'field':'strCity',
								'url':'../components/JSON_Cities.cfm',
								'postData' : {'countryid' : function(){ var get_C =  $('#country_id').val(); return(get_C); } },
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
</script>
<cfif parameterexists(url.edit)>
<cfquery datasource="#dsnP21#" name="get">
SELECT * FROM hotels WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.edit#">
</cfquery>
<cfoutput>
<table width="800" border="0" cellspacing="1">
      <tr>
        <td width="115">Hotel name</td>
        <td width="228"><input type="text" name="hotelname" value="#get.hotelname#"  maxlength="45" /></td>
        <td width="199"><img src="../../docs/#get.hotellogo#" border="0" />hotel log</td>
        <td width="230"><input type="file" name="hotellogo" /></td>
      </tr>
      <tr>
        <td valign="top">Web site link<br /><span style="color:##990000; font-size:11px">**web link must be supplied</span></td>
        <td valign="top"><input  name="hotellink"  maxlength="80" value="#get.hotellink#" /></td>
        <td valign="top">select event week<br /><span style="color:##990000; font-size:11px">**event week must be selected</span></td>
        <td valign="top">
        		<CFQUERY datasource="#dsnP21#" name="getgroup">SELECT 	* FROM groupby</CFQUERY> 
			<select name="groupid" style="width:220px; height:60px" multiple>
            <cfloop query="getgroup"><cfoutput>
  				<option value="#getgroup.id#" <cfif getgroup.id CONTAINS get.groupid >selected</cfif>>#trim(groupby)#</option>
			</cfoutput></cfloop>
            </select>        </td>
      </tr>
      <tr>
        <td>Contact name</td>
        <td><input type="text" name="contactname" value="#get.contactname#" maxlength="50" /></td>
        <td>room for event</td>
        <td><label>
          <input type="text" name="room" value="#get.room#" maxlength="80" />
        </label></td>
      </tr>
      <tr>
        <td valign="top">telephone</td>
        <td><input type="text" name="tel" value="#get.tel#" maxlength="22" /></td>
        <td valign="top">fax</td>
        <td><input type="text" name="fax" value="#get.fax#" maxlength="22" /></td>
      </tr>
      <tr>
        <td valign="top">Hotel address</td>
        <td><textarea name="address" style="height:60px">#get.address#</textarea></td>
        <td valign="top">Google map</td>
        <td><textarea name="google" style="height:60px">#get.google#</textarea></td>
      </tr>
      <tr>
        <td>country</td>
        <td><div id="search_Country" class="tagbox"> <input type="text" id="CountryName" name="CountryName" > </div> <input type="hidden" id="countryid" name="countryid"  />#get.country#</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>City</td>
        <td><div id="search_City" class="tagbox"  ><input type="text" maxlength="50" id="strCity" name="strCity"></div><input type="hidden" name="cityID" id="cityID" value="0" />#get.city#</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>City</td>
        <td><input type="text" name="city"  maxlength="50" value="" /></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>country</td>
        <td><!---<select name="country" >
            <cfloop query="country"><cfoutput>	
                <option value="#country.country#" <cfif get.country EQ country.country >selected</cfif> >#country.country#</option>
            </cfoutput></cfloop>
            </select>---></td>
        <td>&nbsp;</td>
        <td><input name="save" type="submit" value="save" /><input type="hidden" name="id" value="#url.edit#"></td>
      </tr>
    </table>
</cfoutput>
<cfelse>
    <table width="800" border="0" cellspacing="1">
      <tr>
        <td width="115">Hotel name</td>
        <td width="228"><input type="text" name="hotelname"  maxlength="45" /></td>
        <td width="199" >hotel log</td>
        <td width="230" ><input type="file" name="hotellogo" /></td>
      </tr>
      <tr>
        <td valign="top">Web site link<br /><span style="color:##990000; font-size:11px">**web link must be supplied</span></td>
        <td valign="top"><input  name="hotellink"  maxlength="80" /></td>
        <td valign="top">select event week<br /><span style="color:##990000; font-size:11px">**event week must be selected</span></td>
        <td valign="top">
        		<CFQUERY datasource="#dsnP21#" name="getgroup">SELECT 	* FROM groupby</CFQUERY> 
		  <select name="groupid" style="width:220px; height:60px" multiple>
            <cfoutput query="getgroup">
  				<option value="#id#">#trim(groupby)#</option>
			</cfoutput>
          </select>        </td>
      </tr>
      <tr>
        <td>Contact name</td>
        <td><input type="text" name="contactname"  maxlength="50" /></td>
        <td>room for event</td>
        <td><label>
          <input type="text" name="room"  maxlength="80" />
        </label></td>
      </tr>
      <tr>
        <td valign="top">telephone</td>
        <td><input type="text" name="tel"  maxlength="22" /></td>
        <td valign="top">fax</td>
        <td><input type="text" name="fax"  maxlength="22" /></td>
      </tr>
      <tr>
        <td valign="top">Hotel address</td>
        <td><textarea name="address" style="height:60px"></textarea></td>
        <td valign="top">Google map</td>
        <td><textarea name="google" style="height:60px"></textarea></td>
      </tr>
      <tr>
        <td>Country</td>
        <td><div id="search_Country" class="tagbox"> <input type="text" id="CountryName" name="CountryName" > </div> <input type="hidden" id="countryid" name="countryid"  /></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>City</td>
        <td><div id="search_City" class="tagbox"  ><input type="text" maxlength="50" id="strCity" name="strCity"></div><input type="hidden" name="cityID" id="cityID" value="0" /></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>City</td>
        <td><input type="text" name="city"  maxlength="50" /></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>country</td>
        <td><!---<select name="country" >
            <cfoutput query="country">	
                <option value="#country.country#" >#country.country#</option>
            </cfoutput></select>---></td>
        <td>&nbsp;</td>
        <td><input name="save" type="submit" value="save" /></td>
      </tr>
    </table>
</cfif>