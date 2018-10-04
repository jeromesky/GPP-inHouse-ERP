<cfoutput>
  <script type="text/javascript">
			$( ".accordion" ).accordion({autoHeight: false, animated: false, collapsible: true<cfif form.branchid NEQ 0 AND NOT  listFind("500, 501, 502", qry_branch.branchType) >, active: 1</cfif>});	
	
	<cfif listFind( "503,504,505" , qry_branch.branchType)>
		$("##branch_banchName").css("display" , "none");
	</cfif>
	</script>
<div class="accordion">
	<h2>Main Details</h2>
    <div>
<!--- <input type="hidden" name="companyID" id="#randomID#companyID" value="#form.companyID#">
<input type="hidden" name="branchid" id="#randomID#branchid" value="#form.branchid#">--->
        <cfif qry_branch.branchLogo NEQ "">
        <b></b>
        <i class="NoFormat" >        
        	<img src="http://www.petro21.com/_files/business/#qry_branch.branchLogo#" /></i>
        </cfif>
        
        <b>Branch Type</b><!---<cfif form.branchid NEQ 0>#qry_branch.typeLabel#<cfelse></cfif>---> 
        <i class="NoFormat" >
        		<cf_types cat="branch" catid="0" id="#qry_branch.branchType#" name="branchType"></i>
        
        <div id="branch_banchName">
        <b><!---<cfif form.branchid NEQ 0><cfelse>Name</cfif>--->#qry_branch.typeLabel# </b> 
        <i class="NoFormat">
          		<input type="text" id="#randomID#branchName" name="branchName" value="#qry_branch.branchName#" class="ui-corner-all" /></i> 
        </div>
        
        <b>Phone</b>
		<i class="NoFormat" >
        		<input type="text" style="width:35px" value="#qry_branch.countryPhoneCode#" disabled="disabled" class="countryCode ui-corner-all" /> 
                <input type="text" style="width:35px" maxlength="9" id="branchAreaPhone" name="branchAreaPhone" value="#qry_branch.branchAreaPhone#" class="ui-corner-all" />
                <input type="text" style="width:105px" maxlength="10" id="branchPhoneNo" name="branchPhoneNo"  value="#qry_branch.branchPhoneNo#" class="ui-corner-all" />
        </i>
        
        <b>Fax</b>
		<i class="NoFormat" >
        		<input type="text" style="width:35px" value="#qry_branch.countryPhoneCode#" disabled="disabled" class="countryCode ui-corner-all" /> 
                <input type="text" style="width:35px" maxlength="9" id="branchAreaFax" name="branchAreaFax" value="#qry_branch.branchAreaFax#" class="ui-corner-all" />
                <input type="text" style="width:105px" maxlength="10" id="branchFaxNo" name="branchFaxNo"  value="#qry_branch.branchFaxNo#" class="ui-corner-all" />
        </i>

        <cf_contact_suggest contactID="#qry_branch.contactID#" contact="#qry_branch.contactName#" open="1" random="#randomID#">
        <b>Vat No</b> 
            <i class="NoFormat" >
            <input type="text" name="branchVatNO" id="branchVatNO" value="#qry_branch.branchVatNO#" class="ui-corner-all" /></i> 
        <b>for</b>
        <i class="NoFormat" >#qry_branch.companyName#</i>
        
        <cfif form.branchid NEQ 0><b></b>
            <i class="NoFormat">
                <ul class="listMenu ui-corner-bottom  ui-widget ui-widget-content podBgFade podForm ui-corner-all">
                	<cfif qry_branch.branchType EQ 500>
                    <li><a href="../areas/dsp_branch2area.cfm" class="loadContent" title="branch2area" id="#form.branchid#">set areas of interest</a></li>
                    </cfif>
                    <li><a href="javascript:openWindow({ url:'../files/index.cfm', param: {'fileTable': 'branch', 'fileTableID': #form.branchid#}, Args:{  title : 'Manage files', height:500, width:900, modal:false}});">load Branch related files</a></li>
                </ul>
             </i>
           </cfif> 
	</div>

	<h2>Physical Address</h2>
    <div>
    	<b>Bill Address</b>
        <i class="NoFormat" >
        	<input type="radio" name="billingAddress" value="2"  <cfif qry_branch.billingAddress eq 2>checked</cfif> />
        </i>
        <cf_country_suggest country="#qry_branch.streetCountryName#" countryfieldname="streetCountryName" countryID="#qry_branch.streetCountryID#" fieldname="streetCountryID" random="#randomID#">
        
<!---        <b>State/Region</b> 
        <i class="NoFormat" >
        <input type="text" id="streetRegionName" value="#qry_branch.streetRegionName#" class="ui-corner-all">
        <input type="hidden" name="streetRegionID" id="streetRegionID" value="#qry_branch.streetRegionID#" /></i> --->
        
        <cf_Region_suggest textValue="#qry_branch.streetRegionName#" searchRegionField="streetRegionName" regionID="#qry_branch.streetRegionID#" fieldname="streetRegionID" countryFieldname="streetCountryID" random="#randomID#">
        <cf_city_suggest city="#qry_branch.streetCityName#" cityfieldname="streetCityName" cityID="#qry_branch.streetCityID#" fieldname="streetCityID" countryFieldname="streetCountryID" random="#randomID#">
        
        <b>Street Address</b>
        <i class="NoFormat" >
        <textarea name="streetAddress" id="streetAddress" class="ui-corner-all"><cfif qry_branch.streetAddress NEQ "default branch">#qry_branch.streetAddress#</cfif></textarea></i> 
        <b>Street Code</b> 
        <i class="NoFormat" >
       	<input type="text" name="StreetCode" id="StreetCode" value="#qry_branch.StreetCode#" class="ui-corner-all" /></i>
  </div>
 
    <h2>Postal Address</h2>
	<div>
    	<b>Bill Address</b>
        <i class="NoFormat" >
        	<input type="radio" name="billingAddress" value="1" <cfif qry_branch.billingAddress eq 1>checked</cfif> />
        </i>
        <cf_country_suggest country="#qry_branch.postalCountryName#" countryfieldname="postalCountryName" countryID="#qry_branch.postalCountryID#"  fieldname="postalCountryID" random="#randomID#">
        
<!---      <b>State/Region</b> 
        <i class="NoFormat" >
        <input type="text" id="postalRegionName" value="#qry_branch.postalRegionName#" class="ui-corner-all">
        <input type="hidden" name="postalRegionID" id="postalRegionID" value="#qry_branch.postalRegionID#" /></i> --->
        <cf_Region_suggest textValue="#qry_branch.postalRegionName#" searchRegionField="postalRegionName" regionID="#qry_branch.postalRegionID#" fieldname="postalRegionID" countryFieldname="postalCountryID" random="#randomID#">
        <cf_city_suggest city="#qry_branch.postalCityName#" cityfieldname="postalCityName" cityID="#qry_branch.postalCityID#" fieldname="postalCityID" countryFieldname="postalCountryID" random="#randomID#">
        
        <b>Postal Address</b> 
        <i class="NoFormat" >
        <textarea name="postalAddress" id="postalAddress" class="ui-corner-all">#qry_branch.postalAddress#</textarea></i> 
        <b>Postal Code</b> 
        <i class="NoFormat" >
        <input type="text" name="PostalCode" id="PostalCode" value="#qry_branch.PostalCode#" class="ui-corner-all" /></i> 
  	</div>
            
<cfif qry_branch.branchType EQ 500 OR form.branchid EQ 0>  
    <h2>Publication access</h2>
    <div>
            <b>Username</b>
            <i class="NoFormat">
            <input type="text" name="branchUserName" id="branchUserName" value="#qry_branch.branchUserName#" class="ui-corner-all" /></i>
            <b>Password</b>
            <i class="NoFormat">
            <input type="text" name="branchPassword" id="branchPassword" value="#qry_branch.branchPassword#" class="ui-corner-all" /></i>
            <b>URL</b>
            <i class="NoFormat">
            <input type="text" name="publicationURL" id="publicationURL" value="#qry_branch.publicationURL#" class="ui-corner-all" /></i> 
    </div>
</cfif>        
        
  	<h2>Other Branch details</h2>
    <div>
           <!--- <b>Vat No</b> 
            <i class="NoFormat" >
            <input type="text" name="branchVatNO" id="branchVatNO" value="#qry_branch.branchVatNO#" class="ui-corner-all" /></i> --->
            <b>Branch Email</b> 
            <i class="NoFormat" >
           	<input type="text" name="branchEmail" id="branchEmail" value="#qry_branch.branchEmail#" class="ui-corner-all" /></i>   
            <b>URL</b>
            <i class="NoFormat">
            <input type="text" name="branchURL" id="branchURL" value="#qry_branch.branchURL#" class="ui-corner-all" /></i>
            <b>Bios</b>
            <i class="NoFormat">
            <textarea name="branchBios" id="branchBios" class="ui-corner-all">#qry_branch.branchBios#</textarea></i>
   </div> 
 </div></cfoutput>