<cfoutput>
<cfswitch expression="#form.field#">

	<cfcase value="comment">
    	<cfinclude template="qry_speakerDetails.cfm">
        		 <fieldset>
            	<legend>Speaker private info</legend>         	 
                <i class="NoFormat">
                	<textarea class="fl_area" id="comment#form.speakerID#">#Evaluate("qry_speakerDetails.#form.field#")#</textarea><!---#qry_speakerDetails["form.field"]--->
                </i>
                <b></b>
                <i class="NoFormat">
                <button class="button_comments" id="#form.speakerID#" title="comment" >Save</button>
                </i>
                </fieldset>
    </cfcase>
    
    <cfcase value="arragements">
    	<cfinclude template="qry_speakerDetails.cfm">
            	 <fieldset>
            	<legend>Speaker arragements</legend>
                <i class="NoFormat">
                	<textarea class="fl_area" id="arragements#form.speakerID#">#Evaluate("qry_speakerDetails.#form.field#")#</textarea>
                </i>
                <b></b>
                <i class="NoFormat">
                <button  class="button_comments" id="#form.speakerID#" title="arragements">Save</button>
                </i>
                </fieldset>
    </cfcase>
    
    <cfcase value="extraDetails">
    	<cfinclude template="qry_speakerDetails.cfm">
            	 <fieldset>
            	<legend>Speaker public info</legend>
                <i class="NoFormat">
                	<textarea class="fl_area" id="extraDetails#form.speakerID#">#Evaluate("qry_speakerDetails.#form.field#")#</textarea> 
                </i>
                <b></b>
                <i class="NoFormat">
                <button class="button_comments" id="#form.speakerID#" title="extraDetails">Save</button>
                </i>
                </fieldset>
    </cfcase>
    
        <cfcase value="speakerInfo">
        	<cfinclude template="qry_userDetails.cfm">
            <fieldset>
            	<legend>Speaker contact  details</legend>
            	 <b>phone</b> 
                <i class="fl_text NoFormat">#qry_user.countryPhoneCode# #qry_user.AreaCodeTel# #qry_user.strPhDirect_No#</i>
                <b>alt phone</b> 
                <i class="fl_text NoFormat">#qry_user.countryPhoneCode# #qry_user.AreaCodeTelAlt# #qry_user.strPhAlt1_No#</i>
                <b>mobile</b> 
                <i class="fl_text NoFormat">#qry_user.strMobile_No#</i>
                <b>fax</b> 
                <i class="fl_text NoFormat">#qry_user.countryPhoneCode# #qry_user.AreaCodeFax# #qry_user.strFaxDirect_No#</i>

            	<b>email</b> 
                <i class="fl_text NoFormat">#qry_user.userEmail#</i>
                <b>alt email</b> 
                <i class="fl_text NoFormat">#qry_user.strEmail_Alt#</i>
                <b>sec email</b> 
                <i class="fl_text NoFormat">#qry_user.strSecretary_Email#</i>
    		</fieldset>
    </cfcase>
</cfswitch>
 <div class="clear"></div>
</cfoutput>