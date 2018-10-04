<cfinclude template="qry_userCard.cfm">
<cfoutput query="qryUserCard">
<div class="user-card">
<!---<input type="hidden" name="userID" value="#form.userID#" />--->
	<div class="info">
    	<div class="photo">
        <cfif fileName NEQ "">
        <img src="http://www.petro21.com/_files/client/#fileName#" width="65" height="82">
        <cfelse>
        <img src="http://www.petro21.com/images_slate/avatar.jpg" width="65" height="65">
        </cfif>
        </div>
    </div>
    
    <div class="details">
    
    	<b>Name</b>
        <i>#title# #name# #otherName# #lastName#</i>
        
        <b>Possition</b>
        <i>#position#</i>
        
        <b>Company</b>
        <i>#companyName#</i>
        
        <b>Label</b>
        <i>#AKA_companyName#</i>
        
    	<b>Email</b>
        <i>#email_private#</i>
        
        <b>Tel</b>
        <i>#countryPhoneCode# - #phoneCode# - #phoneNumber#</i>
        
        <b>Fax</b>
        <i>#countryPhoneCode# - #faxCode# - #faxNumber#</i>
        
        <b>country</b>
        <i>#countryName#</i>
        
    </div>
<div class="clear"></div>
</div></cfoutput>