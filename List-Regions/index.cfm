<cfinclude template="../Application.cfm">

<cfquery datasource="#gpp#" name="Get">
SELECT 
CASE 
	WHEN event_name <> ''
    THEN event_name
    ELSE strConference_Name
 END AS eventName , 
 AnType,
YEAR(event_expire) AS event_year, webID, IngConference_ID AS ID
FROM tblAnnual_Conf
WHERE (event_type = 'event' OR event_type =  'din' OR event_type = 'eb' OR event_type = 'Bu_pr' OR AnType = 'exh' OR AnType = 'spon' OR AnType = 'list' ) 
AND event_expire > #DateAdd("yyyy", -5, now())# 
ORDER BY event_expire DESC
</cfquery>

<!--- 2010-08-23: Jason: removed from list where id_gpp --->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 
<script type="text/javascript" src="../javascript/jquery1.4.js"></script>
<link type="text/css" href="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.css" rel="stylesheet" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.min.js"></script>
    <script type="text/javascript" src="../javascript/jqprint.js"></script>
    <script type="text/javascript" src="../javascript/interface.js"></script>
    <script type="text/javascript" src="../javascript/jquery.form.js"></script>
    <link href="../styles/indexV2.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Reports</title>
<script type="text/javascript" >
<!---
$(document).ready(function(){
	$('#selectEvent :selected').val();
		$("#selectEvent").change(function(){
			var getid = $('#selectEvent').val() ;
			var getExcel = $('#excel').attr("checked") ? $('#excel').val() : 0 ; 
			
				if ( getExcel == 1 ){
						window.open( "form.cfm?id="+getid  );
				}else{
			
			$('#areaEdit').fadeIn("slow").load("form.cfm" , { id: getid , excel: getExcel });
		}
		});
});--->
$(document).ready(function() { 	
	$("div#slidepanel").slideDown("fast");
// SLIDE MENU TOGGLE
	$("#slideOpen").click(function(){
		$("div#slidepanel").slideDown("fast");
	});	
	// Collapse slidepanel
	$("#slideClose").click(function(){
		$("div#slidepanel").slideUp("fast");	
	});		
	// Switch buttons from "Log In | Register" to "slideClose slidepanel" on click
	$("#slideToggle a").click(function () {
		$("#slideToggle a").toggle();
	});	

	//form submit
    $('#formSubmitIT').submit(function() { 
			var get_excel = $('#excel').attr("checked") ? $('#excel').val() : 0 ;
			var get_pdf = $('#pdf').attr("checked") ? $('#pdf').val() : 0 ;

			$("div#slidepanel").slideUp("fast");
				$(this).ajaxSubmit({ target : '#areaEdit', clearForm: false }); 
						
						if ( get_excel != 0 || get_pdf != 0 ){
							$("#slideToggle a").toggle();
						//if yes go to the page
						}else{
						//if no load to ID
						$("#slideToggle a").toggle();
						return false; 
						}
    }); 

//print page	
	$("div#print_button").click(function(){
    	$("div#areaEdit").jqprint({importCSS: true});  
});

<!---$("#selectEvent").focus().toggle( function (){  $("#country").attr("disabled", true).find('option').attr("selected", false).end(); }, function (){   $("#country").removeAttr("disabled"); });
$("#country, #industrySector").focus().toggle(  function (){     $('#selectEvent').attr("disabled", true).find('option').attr("selected", false).end(); }, function (){     $('#selectEvent').removeAttr("disabled");  });
	--->
}); 

function resultData(data){
		$('#areaEdit').html(data);
}
</script>
<style  type="text/css" media="all">
/* you may want to setup some decorations to active the item */ 
div.items div.active { 
    border:1px inset #ccc; 
    background-color:#fff; 
}
h3 {margin:0px; color:#006699}
a { font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#FFFFFF; text-decoration:none}
A:HOver{text-decoration:underline}
table { font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#333333}
#areaEdit td { border-bottom:1px solid #E8E8E8}
th { font-weight:bold; color:#46415E; text-align:left; background-color:#E2EAFC}
.words {text-transform: capitalize}
.tableAttType{ }
#configure { padding:5px 10px; border:1px solid #434343; background-image:url(../img/Configure_back.png); margin:0 5px 5px 5px}
#configuretable{color:#FFFFFF}
#configuretable .tableAttType td {border-bottom:1px dotted #fff}
label {color:#FFFFFF}
th {font-weight:bold}
b{ margin:0px}
i{margin:0px}
</style> 
</head>
<body>
<cfinclude template="../nav/testNav2009V2.cfm">
<div id="outer">
	<div id="iner">
  <form action="act_format.cfm" method="post" name="formSubmitIT" id="formSubmitIT">     
<!--- start SLIDEr HERE ----->    
   <div id="sliderContainer" style="height:750px">
  <div id="slidepanel" style="height:750px">
        <div class="slideContent clearfix" style="width:98%; height:750px">
        <!--- START CONTENT HERE --->
        <div class="columns"   style="width:120px">
        	<h3>Search by region</h3>
        		     <label ><input type="checkbox" name="areaID"  value="2"  />
North Africa</label><label ><input type="checkbox" name="areaID"  value="3"  />
Southern Africa </label><label ><input type="checkbox" name="areaID"  value="4"  />
Eastern Africa</label><label ><input type="checkbox" name="areaID"  value="5"  />
Western Africa</label><label ><input type="checkbox" name="areaID"  value="6"  />
Asia</label><label ><input type="checkbox" name="areaID" value="7"  />
Australasia</label><label ><input type="checkbox" name="areaID"  value="8"  />
Middle East</label><label ><input type="checkbox" name="areaID" value="9"  />
North America</label>

          </div>    
          
          
         <div class="columns"   style="width:120px">
        	<h3>Search by region</h3>
            <label ><input type="checkbox" name="areaID" id="10" value="10"  />
Latin America</label><label ><input type="checkbox" name="areaID" id="11" value="11"  />
Europe</label><label ><input type="checkbox" name="areaID" id="12" value="12"  />

Worldwide </label><label ><input type="checkbox" name="areaID" id="15" value="15"  />
Central Asia</label><label ><input type="checkbox" name="areaID" id="16" value="16"    />
Mediterranean </label><label ><input type="checkbox" name="areaID" id="17" value="17"  />
Eastern Europe</label>
        
              
        
              
          </div>    
          
          <div class="columns"  style="width:110px"> 
          	<h3>Exclude</h3>
            			<INPUT TYPE="checkbox" NAME="chkMail" value="1" id="chkMail" checked  >
                        Do not Post<br>
                        <INPUT TYPE="checkbox" NAME="chkPrioPost" value="1" id="chkPrioPost"  >
                        Primary Post<br>
                        <INPUT TYPE="checkbox" NAME="chkSecPost" value="1" id="chkSecPost"  >
                        Secondary Post<br />
</div>

<div class="columns" style="width:115px">
				<h3>Display</h3>
                    <b>Title</b>
                    <i class="NoFormat"><input type="checkbox" name="Title" value="1" /></i>
                    <b>email</b>
                    <i class="NoFormat"><input  type="checkbox" name="email"  value="1"   /></i>
                    <b>Invoice No</b>
                    <i class="NoFormat"><input type="checkbox" name="invoiceNo" value="1" /></i>
                    </label>
                    <b>Phone</b>
                    <i class="NoFormat"><input type="checkbox" name="phone" value="1" /></i>
                    <b>Fax</b>
                    <i class="NoFormat"><input type="checkbox" name="fax" value="1" /></i>
                    <b>3rd party guest</b>
                    <i class="NoFormat"><input type="checkbox" name="chkCompGuest" value="1" /></i>
                    <b>Comment</b>
                    <i class="NoFormat"><input  type="checkbox" name="comment" value="1" /></i>
                    <b>Email&nbsp;secretary </b>
                    <i class="NoFormat"><input  type="checkbox" name="email_sec"  value="1" /></i>
                    <b>Discount</b>
                    <i class="NoFormat"><input type="checkbox" name="discount" value="1" /></i>
                    <b>Pub Comment</b>
                    <i class="NoFormat"><input type="checkbox" name="Comment_Public" value="1" /></i>
                    
            </div>

<div class="columns" style="width:200px">
            		<h3>Display</h3>
                    <b>Mobile</b>
                    <i class="NoFormat"><input  type="checkbox" name="mobile"  value="1"  /></i>
<hr>
                    <b>Address details</b>
                    <i class="NoFormat"><input type="checkbox" name="address" value="1" /></i>
                    
                    <b>City</b>
 <!---                   <i class="NoFormat"><input type="checkbox" name="city" value="1" /></i>

                    <b>Country</b>
                    <i class="NoFormat"><input type="checkbox" name="country" value="1" /></i>
                    
                    <b>Zip</b>
                    <i class="NoFormat"><input type="checkbox" name="zip" value="1" /></i>--->
                    

<!---                   <b>Join Address fields</b>
                    <i class="NoFormat"><input type="checkbox" name="JoinAddress" value="1" /></i>--->
                    

<hr>
                     <i class="NoFormat"><select name="paid"  style="width:40px;">
                    <option value="none">Payments</option>
                    <option value="yes">Paid</option>
                    <option value="no">Unpaid</option>
                    <option value="all">Both</option>
                    </select></i>  

                    <i class="NoFormat"><select name="ChkCancelled" style="width:40px; max-width:40px;">
                    <option value="!= 1">attended</option>
                    <option value="= 1">cancelled</option>
                    <option value="*">Both</option>
                    </select></i> 

                    <i class="NoFormat"><select name="Status"  style="width:40px;">
                    <option value="C" selected="selected">Current</option>
                    <option value="A">Archived</option>
                    </select></i>  
    

                    
                    
                    
</div>
           
           
           
            <div class="columns" style="width:115px">

            <h3>Output</h3>
            
                <label> <input type="radio" name="format" id="screan" class="external" value="screan" checked="checked" />print to screan </label><br />
                <label> <input type="radio" name="format" id="pdf" class="external" value="pdf"  />PDF </label><br />
      			<label> <input type="radio" name="format" id="excel" class="external" value="excel" />Excel </label><br />
                <hr /> 
                
                <label><input type="radio" name="layout" id="Mailmerge" value="Mailmerge" checked="checked" />Mailmerge</label><br />
                <label><input type="radio" name="layout" id="List" value="List"  />List</label><br />
      			<label><input type="radio" name="layout" id="badge" value="badge" />Badges</label>
                
               <hr />
        <input name="search" type="submit" value="search" style="width:75px" /> <span id="print_button" class="button">Print Page</span>
     		</div>
          <!--- END CONTENT HERE --->
          <div style="height:120px"></div>
        </div>
  </div>
  <!-- The tab to pull down -->
  <div class="slideTab">
        <ul class="tabButton">
          <li class="left">&nbsp;</li>
          <li id="slideToggle"> <a id="slideOpen" class="slideOpen" href="#">Open Panel</a> <a id="slideClose" style="display: none;" class="slideClose" href="#">Close Panel</a> </li>
          <li class="right">&nbsp;</li>
        </ul>
  </div>
</div> 
    </form>
  <!--- END SLIDER ----->  
	<div id="areaEdit"> </div>
   </div>
    
 <div class="clear"></div>  
</div>

</body>
</html>