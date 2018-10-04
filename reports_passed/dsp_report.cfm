<script type="text/javascript">
$('#nameFull').change(function(){
	var get_nameFull	= $(this).attr("checked") ? $(this).val() : 0
		if(get_nameFull == 1 ){
			$('#nameTitle, #nameFirst, #nameLast').attr('checked', true);
		}
});

$('#postalAllow').change(function(){
	var get_postalAllow	= $(this).attr("checked") ? $(this).val() : 0
		if(get_postalAllow == 1 ){
			$('#postalStreet,  #postalAddress,  #postalCode, #postalCity').attr('checked', true);
		}
});
</script>
 <fieldset class="columnFieldset">
 	<legend>Column Heading</legend>
         <fieldset style="height:230px">
		<legend><input type="checkbox" name="nameFull" id="nameFull" value="1" /><b>Fullname</b></legend>
                <ul class="checklist cl2">
    <li><label for="nameTitle"><input type="checkbox" name="nameTitle" id="nameTitle" value="1" /> Title</label></li><!--- col: Title - tbl: tblIndividual --->
    <li><label for="nameFirst"><input type="checkbox" name="nameFirst" id="nameFirst" value="1" checked /> First Name</label></li><!--- col: strFirst_Name - tbl: tblIndividual --->
    <li><label for="nameLast"><input type="checkbox" name="nameLast" id="nameLast" value="1" checked  /> Surname / Family Name</label></li><!--- col: strSurname - tbl: tblIndividual --->
    <li><label for="company"><input type="checkbox" name="company" id="company" value=1 checked /> Company</label></li><!--- col: strCompany_Name - tbl: tblCompany --->
    <li><label for="Personal_Info"><input type="checkbox" name="Personal_Info" id="Personal_Info" value=1 /> Personal Note</label></li><!--- col: strPersonal_Info - tbl: tblCompany --->
    <li><label for="InvoiceNo_LNK"><input type="checkbox" name="InvoiceNo_LNK" id="InvoiceNo_LNK" value=1 /> Invoice Number</label></li><!--- col: InvoiceNo_LNK - tbl: tblInvoiceDetails --->
    <li><label for="INVComments"><input type="checkbox" name="INVComments" id="INVComments" value="1"  /> Invoice Comment Internal</label></li><!--- col: INVComments - tbl: tblInvoiceDetails --->
    <li><label for="Comment_Public"><input type="checkbox" name="Comment_Public" id="Comment_Public" value="1"  /> Invoice Comment Public</label></li><!--- col: Comment_Public - tbl: tblInvoiceDetails --->
    <li><label for="Comment_Paid_Status"><input type="checkbox" name="Comment_Paid_Status" id="Comment_Paid_Status" value=1 /> Invoice Paid Comment Public</label></li><!--- col: Comment_Paid_Status - tbl: tblInvoiceDetails --->
     <li><label for="display_count"><input type="checkbox" name="display_count" id="display_count" value=1 /> Display Count</label></li><!--- col: Comment_Paid_Status - tbl: tblInvoiceDetails --->
                 </ul>
    	</fieldset>
        <fieldset style="height:170px">
			<legend><b>Comms.</b></legend>
            		<ul class="checklist cl2">
    <li><label for="commsPhone"><input type="checkbox" name="commsPhone" id="commsPhone" value=1 /> Phone</label></li><!--- col: strPhDirect_Code - tbl: tblIndividual --->
    <li><label for="commsFAX"><input type="checkbox" name="commsFAX" id="commsFAX" value=1 /> FAX</label></li><!--- col: strFaxDirect_No - tbl: tblIndividual --->
    <li><label for="commsEmail"><input type="checkbox" name="commsEmail" id="commsEmail" value=1 /> Primery Email</label></li><!--- col: strEmail - tbl: tblIndividual --->
    <li><label for="commsEmail"><input type="checkbox" name="commsEmail" id="commsEmail" value=1 /> Alternative  Email</label></li><!--- col: strEmail_Alt - tbl: tblIndividual --->
    <li><label for="commsEmail"><input type="checkbox" name="commsEmail" id="commsEmail" value=1 /> Secretary  Email</label></li><!--- col: strSecretary_Email - tbl: tblIndividual --->
                 	</ul>
    	</fieldset> 
        <fieldset >
            <legend>Status</legend>
                <label><input name="status" type="radio" value="C" checked /> Current </label>
                <label><input name="status" type="radio" value="A" /> Archived </label>
        </fieldset>         
</fieldset>

<fieldset class="columnFieldset">
	<legend>Further Column Heading</legend>
    	<fieldset style="height:230px">
		<legend><input type="checkbox" name="postalAllow" id="postalAllow" value="1" /><b>Adddress</b></legend>
                 <ul class="checklist cl2">
        <li><label for="postalStreet"><input type="checkbox" name="postalStreet" id="postalStreet" value="1" /> Street Address</label></li><!--- col: strStreet_Adress - tbl: tblIndividual --->
        <li><label for="postalAddress"><input type="checkbox" name="postalAddress" id="postalAddress" value="1" /> Postal Address</label></li><!--- col: strPostal_Adress - tbl: tblIndividual --->
        <li><label for="postalCode"><input type="checkbox" name="postalCode" id="postalCode" value="1" /> Postal Code</label></li><!--- col: strSecretary_Email - tbl: tblIndividual --->
        <li><label for="postalCity"><input type="checkbox" name="postalCity" id="postalCity" value="1" /> City</label></li><!--- col: intCode - tbl: tblIndividual --->
        <li><label for="postalState"><input type="checkbox" name="postalState" id="postalState" value="1" /> State</label></li><!--- col: Addr_State - tbl: tblIndividual --->
        <li><label for="sourceView"><input type="checkbox" name="sourceView" id="sourceView" value="1" /> Source</label></li><!--- col: strIndSource - tbl: tblIndividual --->
        <li><label for="mealNeeds"><input type="checkbox" name="mealNeeds" id="mealNeeds" value="1" /> Meal Requirements</label></li><!--- col: IND_MealPREF - tbl: tblIndividual --->
                 </ul>
       </fieldset>
</fieldset>

 <fieldset class="columnFieldset">
<legend>Country</legend>
<cfinclude template="dsp_country_list.cfm">
<input type="checkbox" name="CountryVisible" value="1" /> visible 
<input type="radio" name="CountryIncluded" value=1 checked />incl 
<input type="radio" name="CountryIncluded" value=0 />excl 
        
</fieldset>
<div class="clear"></div>
