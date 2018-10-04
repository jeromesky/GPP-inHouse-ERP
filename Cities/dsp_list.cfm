<cfinclude template="../cities/qry_list.cfm">
<script type="text/javascript">
	$(document).ready(function() { 	
	$('#search_City').tagdragon({
		'field':'strCity',
		'url':'../components/JSON_Cities.cfm',
		'postData' : {'countryid' :  <cfoutput>#get.countryid#</cfoutput> },
		'charMin' : 3, 
		'cache' : true,
		'max' : 100,
		onSelectItem: function(val) { 
				$('#cityID').val(val.cityid); 
		},
		onSelectedItem: function(val) { 
				$('#strCity').val(val.cityname);
				}
		});
			$('#search_Country').tagdragon({
		'field':'CountryName',
		//'url':'../components/JSON_country_TagDragon.cfm',
		'url':'../components/JSON_country_table.cfm',
		'charMin' : 3, 
		'cache' : true,
		'max' : 100,
		onSelectItem: function(val) { 
			$('#newcountryid').val(val.id);
			}
		});

	$('#savecity').submit(function(){
			$(this).ajaxSubmit( {success: nextCity, beforeSubmit: doWhenSaving } );
				return false
		});						
	});
</script>
						
<cfoutput query="get"><table border="0">
		<tr>
        	<td valign="top">
            <form method="post" action="../Cities/qry_update.cfm" id="savecity"><b>Total:</b>
                <i class="NoFormat" style="border:1px solid ##CCCCCC; padding:0px 3px; margin-right:10px">#get_Total.total# 
                </i><a href="javascript:nextRecord('#get.strCity#');">GO to next record</a><br>
                <a href="http://maps.google.com" target="searchFrame">google</a> | <a href="http://en.wikipedia.org/w/index.php?title=Special%3ASearch&search=&button=" target="searchFrame">Wiki</a>
            <div class="clear"></div>
            	<fieldset>
                <legend>Old Data</legend>
            	<b>City Name</b>
                <i class="NoFormat" style=" border:1px solid ##CC6633; font-size:14px; width:160px;">#get.strCity#</i>
                <b>In Country</b>
                <i class="NoFormat">#get.CountryName#</i>
                </fieldset>
                <fieldset>
                <legend>New Data</legend>
                <b>Search Cities on system</b>
				<i class="NoFormat">
        		<div id="search_City" class="tagbox" title="" ><input type="text" maxlength="50" id="strCity" name="strCity" ></div>
                <input type="hidden" name="cityID" id="cityID" value="0" />
                <input type="hidden" name="countryid" id="countryid" value="<cfoutput>#get.countryid#</cfoutput>" />
                <input type="hidden" maxlength="50" name="OldstrCity" value="#get.strCity#">(type none if u dont have a city)</i>
                 <b>Update City field</b>
                <i class="NoFormat"><input type="checkbox" name="Updatecity" value="1" /></i>
                <b>Is Neighbourhood</b>
                <i class="NoFormat"><input type="checkbox" name="neibourhood" value="1" /></i>
                <i class="NoFormat">#get.IngIndividual_ID#<input type="submit" value="Update" id="submit"><b id="message"></b></i>
    		</fieldset>
            </form>
             <form method="post" action="../Cities/qry_update.cfm" id="updateCoutryID">
             <fieldset>
                <legend>Update Record</legend>
                <b>Current countryID</b>
				<i class="NoFormat"><cfoutput>#get.countryid#</cfoutput></i>
                <b>search country</b>
				<i class="NoFormat">
                <div id="search_Country" class="tagbox"> <input type="text" id="CountryName" name="CountryName" > </div>
        		<input type="hidden" maxlength="50" id="IngIndividual_ID" name="IngIndividual_ID" value="#get.IngIndividual_ID#" >
                </i>
                <b>New countryID</b>
				<i class="NoFormat"><input type="text" maxlength="50" id="newcountryid" name="newcountryid"></i>
                <i class="NoFormat"><input type="submit" value="Update" id="submit"><b id="message"></b></i>
    		</fieldset>
             </form>
            </td>
            <td><iframe src ="http://maps.google.com?q=#get.strCity#, #get.CountryName#" width="600" height="550" frameborder="0" scrolling="auto" name="searchFrame"><!---en.wikipedia.org/w/index.php?title=Special%3ASearch&search=&button=---></iframe></td>
       </tr>
</table></cfoutput>