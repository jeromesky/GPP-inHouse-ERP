<cfinclude template="qry_Newsletters.cfm">

<script type="text/javascript">

$('.area_option_mail :checkbox').change(function(){

	var get_Newsletters = $(this).attr("checked") ? $(this).val() : 0
	var get_fieldName = $(this).attr("name");
			if(get_Newsletters == 1 ){
				//alert(get_fieldName);
				$.post("Update_Options.cfm", {id : <cfoutput>#form.userid#</cfoutput>, "fieldname": get_fieldName, "oldValue" : 0,  "value" : 1 });
			}else{
				//alert(get_fieldName);
				$.post("Update_Options.cfm", {id : <cfoutput>#form.userid#</cfoutput>, "fieldname": get_fieldName, "oldValue" : 1,  "value" : 0 });
			}
});
</script>


<fieldset style="width:380px; display:block; float:left" class="area_option_mail">
<legend>Newsletters</legend>
<table border="0" cellspacing="5" cellpadding="0" width="100%" >
  <tr>
    <td valign="top"><label>
      <input type="checkbox" name="chkW" value="1" <cfif get.chkW  EQ 1>  checked="checked"  </cfif> />
      <cfif ListFindNoCase( unresitered, "chkW" )>
        <em style="color:#FF0000">Petro21 Worldwide   Daily </em>
        <cfelse>
        Petro21 Worldwide   Daily
      </cfif>
      </label>
      <div style="clear:both"></div>
      <label>
      <input type="checkbox" name="chkNOCNews" value="1" <cfif get.chkNOCNews  EQ 1>  checked="checked"  </cfif> />
      <cfif ListFindNoCase( unresitered, "chkNOCNews" )>
        <em style="color:#FF0000">National Oil Companies </em>
        <cfelse>
        National Oil Companies
      </cfif>
      </label>
      <div style="clear:both"></div>
      <label>
      <input type="checkbox" name="chkPCapNews" value="1" <cfif get.chkPCapNews  EQ 1>  checked="checked"  </cfif> />
      <cfif ListFindNoCase( unresitered, "chkPCapNews" )>
        <em style="color:#FF0000">PetroCapital  Weekly </em>
        <cfelse>
        PetroCapital  Weekly
      </cfif>
      </label>
      <div style="clear:both"></div>
      <label>
      <input type="checkbox" name="chkWorldIndNews" value="1" <cfif get.chkWorldIndNews  EQ 1>  checked="checked"  </cfif> />
      <cfif ListFindNoCase( unresitered, "chkWorldIndNews" )>
        <em style="color:#FF0000">Worldwide Independents </em>
        <cfelse>
        Worldwide Independents
      </cfif>
      </label>
            <div style="clear:both"></div>
      <label>
      <input type="checkbox" name="chkCaNews" value="1" <cfif get.chkCaNews  EQ 1>  checked="checked"  </cfif> />
      <cfif ListFindNoCase( unresitered, "chkCaNews" )>
        <em style="color:#FF0000">Worldwide Independents </em>
        <cfelse>
        PetroCaribbean  Weekly
      </cfif>
      </label>
      <div style="clear:both"></div>
      <label>
      <input type="checkbox" name="chkFrontierNews" value="1" <cfif get.chkFrontierNews  EQ 1>  checked="checked"  </cfif> />
      <cfif ListFindNoCase( unresitered, "chkFrontierNews" )>
        <em style="color:#FF0000">Frontier Exploration </em>
        <cfelse>
        Frontier Exploration
      </cfif>
      </label>
      <div style="clear:both"></div>
      <label>
      <input type="checkbox" name="chkSuperNews" value="1" <cfif get.chkSuperNews  EQ 1>  checked="checked"  </cfif> />
      <cfif ListFindNoCase( unresitered, "chkSuperNews" )>
        <em style="color:#FF0000">Super-Majors Oil & Gas</em>
        <cfelse>
        Super-Majors Oil & Gas
      </cfif>
      </label>
      </label>
      <div style="clear:both"></div>
      <hr />
      <label>
      <input type="checkbox" name="chkME" value="1" <cfif get.chkME  EQ 1>  checked="checked"  </cfif> />
      <cfif ListFindNoCase( unresitered, "chkME" )>
        <em style="color:#FF0000">PetroArabian  Weekly </em>
        <cfelse>
        PetroArabian  Weekly
      </cfif>
      </label>
      <div style="clear:both"></div>
      <label>
      <input type="checkbox" name="chkIraqNews" value="1" <cfif get.chkIraqNews  EQ 1>  checked="checked"  </cfif> />
      <cfif ListFindNoCase( unresitered, "chkIraqNews" )>
        <em style="color:#FF0000">Iraq Oil, Gas & Energy</em>
        <cfelse>
        Iraq Oil, Gas & Energy
      </cfif>
      </label>
      </label>
      <div style="clear:both"></div>
      <label>
      <input type="checkbox" name="chkMedNews" value="1" <cfif get.chkMedNews  EQ 1>  checked="checked"  </cfif> />
      <cfif ListFindNoCase( unresitered, "chkMedNews" )>
        <em style="color:#FF0000">PetroMediterranean </em>
        <cfelse>
        PetroMediterranean
      </cfif>
      </label>
      <div style="clear:both"></div>
      <hr />
      <label>
      <input type="checkbox" name="chkBrazilNews" value="1" <cfif get.chkBrazilNews  EQ 1>  checked="checked"  </cfif> />
      <cfif ListFindNoCase( unresitered, "chkBrazilNews" )>
        <em style="color:#FF0000">Brazil  Oil, Gas  Weekly </em>
        <cfelse>
        Brazil  Oil, Gas  Weekly
      </cfif>
      </label>
      <div style="clear:both"></div>
      <label>
      <input type="checkbox" name="chkLA" value="1" <cfif get.chkLA  EQ 1>  checked="checked"  </cfif> />
      <cfif ListFindNoCase( unresitered, "chkLA" )>
        <em style="color:#FF0000">PetroLatino  Weekly </em>
        <cfelse>
        PetroLatino  Weekly
      </cfif>
      </label>
      <div style="clear:both"></div>
      <label>
      <input type="checkbox" name="chkUSANews" value="1" <cfif get.chkUSANews  EQ 1>  checked="checked"  </cfif> />
      <cfif ListFindNoCase( unresitered, "chkUSANews" )>
        <em style="color:#FF0000">USA Oil, Gas Weekly </em>
        <cfelse>
        USA Oil, Gas Weekly
      </cfif>
      </label>
      <div style="clear:both"></div>
      <hr />
      <label>
      <input type="checkbox" name="chkAtlanticNews" value="1" <cfif get.chkAtlanticNews  EQ 1>  checked="checked"  </cfif> />
      <cfif ListFindNoCase( unresitered, "chkAtlanticNews" )>
        <em style="color:#FF0000">Atlantic Ocean Oil & Gas </em>
        <cfelse>
        Atlantic Ocean Oil & Gas
      </cfif>
      </label>
      <div style="clear:both"></div>
      <label>
      <input type="checkbox" name="chkPetEurasNews" value="1" <cfif get.chkPetEurasNews  EQ 1>  checked="checked"  </cfif> />
      <cfif ListFindNoCase( unresitered, "chkPetEurasNews" )>
        <em style="color:#FF0000">PetroEurasia    Weekly</em>
        <cfelse>
        PetroEurasia    Weekly
      </cfif>
      </label>
      <div style="clear:both"></div>
      <label>
      <input type="checkbox" name="chkE" value="1" <cfif get.chkE  EQ 1>  checked="checked"  </cfif> />
      <cfif ListFindNoCase( unresitered, "chkE" )>
        <em style="color:#FF0000">PetroEuropa  Weekly</em>
        <cfelse>
        PetroEuropa  Weekly
      </cfif>
      </label>
      <div style="clear:both"></div></td>
    <td valign="top"><label>
      <input type="checkbox" name="chkWAENews" value="1" <cfif get.chkWAENews  EQ 1>  checked="checked"  </cfif>   />
      <cfif ListFindNoCase( unresitered, "chkWAENews" )>
        <em style="color:#FF0000">Western African Energy </em>
        <cfelse>
        Western African Energy
      </cfif>
      </label>
      </label>
      <div style="clear:both"></div>
      <label>
      <input type="checkbox" name="chkEAENews" value="1" <cfif get.chkEAENews  EQ 1>  checked="checked"  </cfif>   />
      <cfif ListFindNoCase( unresitered, "chkEAENews" )>
        <em style="color:#FF0000">Eastern African Energy</em>
        <cfelse>
        Eastern African Energy
      </cfif>
      </label>
      </label>
      <div style="clear:both"></div>
      <label>
      <input type="checkbox" name="chkSAENews" value="1" <cfif get.chkSAENews  EQ 1>  checked="checked"  </cfif>   />
      <cfif ListFindNoCase( unresitered, "chkSAENews" )>
        <em style="color:#FF0000">Southern African Energy </em>
        <cfelse>
        Southern African Energy
      </cfif>
      </label>
      <div style="clear:both"></div>
      <label>
      <input type="checkbox" name="chkAF" value="1" <cfif get.chkAF  EQ 1>  checked="checked"  </cfif> />
      <cfif ListFindNoCase( unresitered, "chkAF" )>
        <em style="color:#FF0000">PetroAfricanus  Weekly </em>
        <cfelse>
        PetroAfricanus  Weekly
      </cfif>
      </label>
      <div style="clear:both"></div>
      <label>
      <input type="checkbox" name="chkPetMagNews" value="1" <cfif get.chkPetMagNews  EQ 1>  checked="checked"  </cfif> />
      <cfif ListFindNoCase( unresitered, "chkPetMagNews" )>
        <em style="color:#FF0000">PetroMaghreb  Weekly</em>
        <cfelse>
        PetroMaghreb  Weekly
      </cfif>
      </label>
      <div style="clear:both"></div>
      <label>
      <input type="checkbox" name="chkNigerNews" value="1" <cfif get.chkNigerNews  EQ 1>  checked="checked"  </cfif> />
      <cfif ListFindNoCase( unresitered, "chkNigerNews" )>
        <em style="color:#FF0000">Nigeria Oil, Gas  Weekly </em>
        <cfelse>
        Nigeria Oil, Gas  Weekly
      </cfif>
      </label>
      <div style="clear:both"></div>
      <label>
      <input type="checkbox" name="chkAngolaNews" value="1" <cfif get.chkAngolaNews  EQ 1>  checked="checked"  </cfif> />
      <cfif ListFindNoCase( unresitered, "chkAngolaNews" )>
        <em style="color:#FF0000">Worldwide Independents </em>
        <cfelse>
        Angola  Oil, Gas  Weekly
      </cfif>
      </label>
      <div style="clear:both"></div>
      <hr />
      <label>
      <input type="checkbox" name="chkA" value="1" <cfif get.chkA  EQ 1>  checked="checked"  </cfif> />
      <cfif ListFindNoCase( unresitered, "chkA" )>
        <em style="color:#FF0000">PetroAsiana    Weekly</em>
        <cfelse>
        PetroAsiana    Weekly
      </cfif>
      </label>
      <div style="clear:both"></div>
      <label>
      <input type="checkbox" name="chkOzNews" value="1" <cfif get.chkOzNews  EQ 1>  checked="checked"  </cfif> />
      <cfif ListFindNoCase( unresitered, "chkOzNews" )>
        <em style="color:#FF0000">PetroAustralasia  Weekly </em>
        <cfelse>
        PetroAustralasia  Weekly
      </cfif>
      </label>
      <div style="clear:both"></div>
      <label>
      <input type="checkbox" name="chkRussiaNews" value="1" <cfif get.chkRussiaNews  EQ 1>  checked="checked"  </cfif> />
      <cfif ListFindNoCase( unresitered, "chkRussiaNews" )>
        <em style="color:#FF0000">Russia  Oil, Gas  Weekly</em>
        <cfelse>
        Russia  Oil, Gas  Weekly
      </cfif>
      </label>
      <div style="clear:both"></div>
      <label>
      <input type="checkbox" name="chkIndiaNews" value="1" <cfif get.chkIndiaNews  EQ 1>  checked="checked"  </cfif> />
      <cfif ListFindNoCase( unresitered, "chkIndiaNews" )>
        <em style="color:#FF0000">India  Oil, Gas  Weekly </em>
        <cfelse>
        India  Oil, Gas  Weekly
      </cfif>
      </label>
      <div style="clear:both"></div>
      <label>
      <input type="checkbox" name="chkChinaNews" value="1" <cfif get.chkChinaNews  EQ 1>  checked="checked"  </cfif> />
      <cfif ListFindNoCase( unresitered, "chkChinaNews" )>
        <em style="color:#FF0000">China  Oil, Gas  Weekly </em>
        <cfelse>
        China  Oil, Gas  Weekly
      </cfif>
      </label>
      <div style="clear:both"></div>
      <hr />
      <label>
      <input type="checkbox" name="chkP21" value="1" <cfif get.chkP21 EQ 1  EQ 1>  checked="checked"  </cfif>  />
      <cfif ListFindNoCase( unresitered, "chkP21" )>
        <em style="color:#FF0000">Do Not send Newsletters </em>
        <cfelse>
        Do Not send Newsletters
      </cfif>
      </label>
      </label>
    </td>
  </tr>
</table>
</fieldset>