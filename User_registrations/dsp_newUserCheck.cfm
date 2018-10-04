<cfinclude template="../User_registrations/qry_newUserCheck.cfm">
<cfoutput>
	<legend>Check User</legend>
    <cfif get_user.recordcount EQ 1 >
<div id="index">
<sup class="displayLabel">added</sup>	<sup class="displayData"> #dateFormat(get_user.capturedDate, "dd mm yyyy")#</sup>
<sup class="displayLabel">By</sup>	<sup class="displayData"> #get_user.staffName#</sup>
<sup class="displayLabel">Directory</sup>	<sup class="displayData"> #get_user.directoryName# </sup>
<sup class="displayLabel">Directory Date</sup>	<sup class="displayData"> #dateFormat(get_user.DirectoryDate, "dd mm yyyy")#</sup>

<div class="clear"></div>
</div>
        	<div id="" class="ui-widget-header ui-corner-all toolbar" >
            <a href="javascript:loader('../user_functions/dsp_Newsletters.cfm', 'area_newUser_functions' , #form.userID#, 0 );">Newsletters</a>
            <a href="javascript:loader('../Industry_Sector/industry_sector.cfm', 'area_newUser_functions' , #form.userID#, 0 );">industry Sector</a>
            <a href="javascript:loader('../user_functions/dsp_RegionInterest_email.cfm', 'area_newUser_functions' , #form.userID#, 0 );">interest Email</a>
            <a href="javascript:loader('../user_functions/dsp_RegionInterest_post.cfm', 'area_newUser_functions' , #form.userID#, 0 );">interest Post</a>
            <a href="javascript:loader('../user_functions/dsp_dataClasification.cfm', 'area_newUser_functions' , #form.userID#, 0 );">role/Directory</a>
			</div>
    
<table border="0" cellspacing="5"> 
	<tr>
    		<td valign="top">
            <form action="../User_registrations/qry_add_new_User.cfm" method="post" id="newUserAddForm">
    
            <b>Name</b>
            <i class="NoFormat">#get_user.userName#</i>
            
            <b>Position</b>
            <i class="NoFormat"><input type="text" name="strDesignation" id="strDesignation" value="#get_user.userPosition#" /></i>
            <i class="field_button_container ui-state-default ui-corner-all update-current-field " name="strDesignation" title="0">
                    <em class="ui-icon ui-icon-arrowreturn-1-s"></em>
            </i>
            
            <b>Company</b>
            <i class="NoFormat">
            <input type="text" name="company" id="company" value="#get_user.companyName#" />
            <input type="hidden" name="lngCompany_ID" id="lngCompany_ID" value="#get_user.companyID#" />
            </i>
            <i class="field_button_container ui-state-default ui-corner-all update-current-field" name="lngCompany_ID" title="company">
                    <em class="ui-icon ui-icon-arrowreturn-1-s"></em>
            </i>
            
            <b>City</b>
            <i class="NoFormat">
            <input type="text" name="strCity" id="strCity"  value="#get_user.CityNameEN#" />
            <input type="hidden"  name="cityID" id="cityID" value="<cfif  get_user.cityID EQ "">0<cfelse>#get_user.cityID#</cfif>" />
            </i><i class="field_button_container ui-state-default ui-corner-all update-current-field" name="cityID" title="strCity">
                
                    <em class="ui-icon ui-icon-arrowreturn-1-s"></em>
            </i>
            
            <b>Country</b>
            <i class="NoFormat">
            <input type="text" name="CountryName" id="CountryName"  value="#get_user.countryNameEN#" />
            <input type="hidden"  name="countryID" id="countryID" value="<cfif  get_user.countryID EQ "">0<cfelse>#get_user.countryID#</cfif>" />
            </i>
            <i class="field_button_container ui-state-default ui-corner-all update-current-field" name="countryID" title="CountryName">
                    <em class="ui-icon ui-icon-arrowreturn-1-s"></em>
            </i>
            
            <b>Address</b>
            <i class="NoFormat"><textarea  name="strStreet_Adress" id="strStreet_Adress">#get_user.userAddress#</textarea></i>
            <i class="field_button_container ui-state-default ui-corner-all update-current-field" name="strStreet_Adress" title="0">
                    <em class="ui-icon ui-icon-arrowreturn-1-s"></em>
            </i>
            
            <b>Postal</b>
            <i class="NoFormat"><textarea  name="strPostal_Adress" id="strPostal_Adress"  >#get_user.userPostal#</textarea></i>
            <i class="field_button_container ui-state-default ui-corner-all update-current-field" name="strPostal_Adress" title="0">
                    <em class="ui-icon ui-icon-arrowreturn-1-s"></em>
            </i>
            
            <b>State/Provance</b>
            <i class="NoFormat"><input type="text" name="Addr_State" id="Addr_State" value="#get_user.userState#" /></i>
            <i class="field_button_container ui-state-default ui-corner-all update-current-field" name="Addr_State" title="0">
                    <em class="ui-icon ui-icon-arrowreturn-1-s"></em>
            </i>
            
            <b>Zip/Code</b>
            <i class="NoFormat"><input type="text" name="intCode" id="intCode" value="#get_user.intCode#" /></i>
            <i class="field_button_container ui-state-default ui-corner-all update-current-field" name="intCode" title="0">
                    <em class="ui-icon ui-icon-arrowreturn-1-s"></em>
            </i>
            
            <b>Phone</b>
            <i class="NoFormat">
                <input maxlength="10" style="width:35px" TYPE="text" class="countryCode" disabled value="#get_user.countryPhoneCode#"> 
                <input maxlength="30" style="width:35px" TYPE="text" id="AreaCodeTel" NAME="AreaCodeTel" value="#get_user.userAreaCodePhone#">
                <input type="text" id="strPhDirect_No" name="strPhDirect_No" style="width:83px" value="#get_user.userTel#" >
            </i>
            <i class="field_button_container ui-state-default ui-corner-all update-current-field" name="strPhDirect_No" title="0">
            		<em class="ui-icon ui-icon-arrowreturn-1-s"></em>
            </i>
            
            <b>Alt Phone</b>
            <i class="NoFormat">
                <input maxlength="10" style="width:35px" TYPE="text" class="countryCode" disabled value="#get_user.countryPhoneCode#"> 
                <input maxlength="30" style="width:35px" TYPE="text" id="AreaCodeTelAlt" NAME="AreaCodeTelAlt" value="#get_user.userAreaCodePhoneAlt#">
                <input type="text" id="strPhAlt1_No" name="strPhAlt1_No" style="width:83px" value="#get_user.strPhAlt1_No#" >
            </i>
            <i class="field_button_container ui-state-default ui-corner-all update-current-field" name="strPhAlt1_No" title="0">
            		<em class="ui-icon ui-icon-arrowreturn-1-s"></em>
            </i>
            
            
            <b>Mobile</b>
            <i class="NoFormat"><input type="text" name="strMobile_No" id="strMobile_No" value="#get_user.userMobile#" /></i>
            <i class="field_button_container ui-state-default ui-corner-all update-current-field" name="strMobile_No" title="0">
            		<em class="ui-icon ui-icon-arrowreturn-1-s"></em>
            </i>
            
            <b>Int Phone</b>
            <i class="NoFormat"><input type="text" name="userPhoNumbInt" id="userPhoNumbInt" value="#get_user.userIntPhone#" /></i>
            <i class="field_button_container ui-state-default ui-corner-all update-current-field" name="userPhoNumbInt" title="0">
            		<em class="ui-icon ui-icon-arrowreturn-1-s"></em>
            </i>
            
            <b>Fax</b>
            <i class="NoFormat">
                <input maxlength="10" style="width:35px" TYPE="text" class="countryCode" disabled value="#get_user.countryPhoneCode#"> 
                <input maxlength="30" style="width:35px" TYPE="text" id="AreaCodeFax" NAME="AreaCodeFax" value="#get_user.userAreaCodeFax#">
                <input type="text" id="strFaxDirect_No" name="strFaxDirect_No" style="width:83px" value="#get_user.UserFax#" >
            </i>
            <i class="field_button_container ui-state-default ui-corner-all update-current-field" name="strFaxDirect_No" title="0">
            			<em class="ui-icon ui-icon-arrowreturn-1-s"></em>
            </i>
            
            <b>Alt Fax</b>
            <i class="NoFormat">
                <input maxlength="10" style="width:35px" TYPE="text" class="countryCode" disabled value="#get_user.countryPhoneCode#"> 
                <input maxlength="30" style="width:35px" TYPE="text" id="AreaCodeFaxAlt" NAME="AreaCodeFaxAlt" value="#get_user.userAreaCodeFaxAlt#">
                <input type="text" id="strFaxAlt1_No" name="strFaxAlt1_No" style="width:83px" value="#get_user.userFaxAlt#" > 
            </i>
            <i class="field_button_container ui-state-default ui-corner-all update-current-field" name="strFaxAlt1_No" title="0">
            		<em class="ui-icon ui-icon-arrowreturn-1-s"></em>
            </i>
            
            <b>Email</b>
            <i class="NoFormat"><input type="text" name="strEmail" id="strEmail" value="#get_user.userEmail#" /></i>
            <i class="field_button_container ui-state-default ui-corner-all update-current-field" name="strEmail" title="0">
            		<em class="ui-icon ui-icon-arrowreturn-1-s"></em>
            </i>
            
            <b>Alt Email</b>
            <i class="NoFormat"><input type="text" name="strEmail_Alt" id="strEmail_Alt" value="#get_user.userEmailAlt#" /></i>
            <i class="field_button_container ui-state-default ui-corner-all update-current-field" name="strEmail_Alt" title="0">
            		<em class="ui-icon ui-icon-arrowreturn-1-s"></em>
            </i>
            
            <b>Sec Email</b>
            <i class="NoFormat"><input type="text" name="strSecretary_Email" id="strSecretary_Email" value="#get_user.UserSecretaryEmail#" /></i>
            <i class="field_button_container ui-state-default ui-corner-all update-current-field" name="strSecretary_Email" title="0">
            		<em class="ui-icon ui-icon-arrowreturn-1-s"></em>
            </i>
            <input type="hidden" name="id" id="NewUserID" value="#form.userID#">
            
            <b></b>
            <i class="NoFormat"><button>Add/User</button> <a href="javascript:DeleteUser(#form.userid#);" class="button deletNewUser">Delete Record</a></i>
			</form>
           </td>

        <td valign="top">
        	<div id="area_newUser_functions"></div>

        
        </td>
    </tr>
</table>
<cfelse>
	<div style="margin:auto auto; font-size:16px; padding:20px">
SOMEONE IS EDITING THIS RECORD, SELECT AN OTHER
</div>
</cfif>
</cfoutput>