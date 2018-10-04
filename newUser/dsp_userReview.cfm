<cfinclude template="qry_userReview.cfm">
<style type="text/css">
#area_newUser{ width:950px; margin: 40px auto 0px auto }
</style>
<cfoutput><div id="area_newUser">
<div id="jWizard" class="jWizard">
<fieldset>
	<legend>Review New User</legend>
    <form action="index.cfm" method="post">
         <b>Name</b>
         <i class="NoFormat">#get.userName#</i>
         <b>Delegation</b>
         <i class="NoFormat">#get.userDelegation#</i>
         <b>Telephone</b>
         <i class="NoFormat">#get.userTel# : #get.userTelAlt#</i>  
         <b>Mobile</b>
         <i class="NoFormat">#get.userMobile#</i> 
         <b>Alt int number</b>
         <i class="NoFormat">#get.ph_IntNo#</i>
          <b>Fax</b>
         <i class="NoFormat">#get.userFax#: #get.userFaxAlt#</i>
         <b>Email</b>
         <i class="NoFormat">#get.useremail#</i>
         <b>Role</b>
         <i class="NoFormat">#get.roleName#</i>
        <b>Company</b> 
        <i class="NoFormat">#get.companyName#</i>
        <b>Company Label</b>
         <i class="NoFormat">#get.AKA_companyName#</i>
<!---         <b>Street address</b>
         <i class="NoFormat">#get.streetAddress#</i>
         <b>Postal address</b>
         <i class="NoFormat">#get.postalAddress#</i>--->
        <b>Country</b>
        <i class="NoFormat">#get.countryNameEN#</i> 
        <b></b>
        <i class="NoFormat"><button class="ui-corner-all">Add New User</button></i>
	</form>
</fieldset>
</div></div></cfoutput>