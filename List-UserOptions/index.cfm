<cfinclude template="../Application.cfm">

                <cfquery datasource="#gpp#" name="qryCountries">
                SELECT
                         [countryPhoneCode]
                        ,[countryNameEN]
                        ,[countryID]
                FROM
                        [CRM_Countries_List]
                ORDER BY [countryNameEN] 
                </cfquery>
                
                <cfquery datasource="#gpp#" name="get_sectors">
                select  
                    [sectorID]
                    ,[sectorName]
                    ,[sectorFieldNameOld]
                from 
                    [CRM_sectors]
            </cfquery>
<!--- 2010-08-23: Jason: removed from list where id_gpp --->


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 
<script type="text/javascript" src="../javascript/jquery1.4.js" ></script>
<link type="text/css" href="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.css" rel="stylesheet" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.min.js"></script>
    <script type="text/javascript" src="../javascript/jqprint.js" ></script>
    <script type="text/javascript" src="../javascript/interface.js" ></script>
    <script type="text/javascript" src="../javascript/jquery.form.js"  ></script>
    <link href="../styles/indexV2.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Reports</title>
<script type="text/javascript" >

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
						
						//if yes go to the page
						}else{
						//if no load to ID
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
.next{width:13px; height:73px; background-image:url(../img/Rotate_Next.jpg)}
.prev{ widows:13px; height:73px; background-image:url(../img/Rotate_Previous.jpg)}
div.scrollable { 
 
    /* required settings */ 
    position:relative; 
    overflow:hidden; 
    width: 450px; 
    height:140px; 
} 
 
/* 
    root element for scrollable items. Must be absolutely positioned 
    and it should have a extremely large width to accomodate scrollable items. 
    it's enough that you set width and height for the root element and not for this element. 
*/ 
div.scrollable div.items { 
    /* this cannot be too large */ 
    width:450px; 
    position:absolute; 
} 
 
/* 
    a single item. must be floated in horizontal scrolling. 
    typically, this element is the one that *you* will style the most. 
*/ 
div.scrollable div.items div { 
    float:left; 
} 
 
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
</style> 
</head>
<body>
<cfinclude template="../nav/testNav2009V2.cfm">
<div id="outer">
	<div id="iner">
  <form action="act_format.cfm" method="post" name="formSubmitIT" id="formSubmitIT">     
<!--- start SLIDEr HERE ----->    
   <div id="sliderContainer"  style="height:750px">
  <div id="slidepanel"  style="height:750px">
        <div class="slideContent clearfix" style="width:98%; height:750px">
        
        <!--- START CONTENT HERE ------->
  
          
 
            <div class="columns" style="width:160px">
				<h3>Search country</h3>
                <select name="countryID" id="country" style="width:160px; height:230px" multiple="multiple">
    						<cfoutput query="qryCountries">
                            <option value="#qryCountries.countryID#">#qryCountries.countryNameEN#</option>
							</cfoutput>
      			</select>  
            
            
            </div>
            
        <div class="columns" style="width:180px">
            <h3>or User Sector (only with country)</h3>
        		<cfoutput query="get_sectors">
                <b>#get_sectors.sectorName#</b>
                <i class="NoFormat"><input type="checkbox" name="industrySector" id="industrySector" value="#get_sectors.sectorFieldNameOld#" /></i>
                </cfoutput>
        </div>  
            
            
            <div class="columns" style="width:105px">
				<h3>Display</h3>
                    <b>email</b>
                    <i class="NoFormat"><input  type="checkbox" name="email"  value="1"   /></i>

                    <b>Invoice No</b>
                    <i class="NoFormat"><input type="checkbox" name="invoiceNo" value="1" /></i>
                    </label>
                    
                    <b>Phone</b>
                    <i class="NoFormat"><input type="checkbox" name="phone" value="1" /></i>

                    <b>3rd party guest</b>
                    <i class="NoFormat"><input type="checkbox" name="chkCompGuest" value="1" /></i>

                    <b>Comment</b>
                    <i class="NoFormat"><input  type="checkbox" name="comment" value="1" /></i>
    
                    <b>Email&nbsp;secretary </b>
                    <i class="NoFormat"><input  type="checkbox" name="email_sec"  value="1" /></i>

                    <b>Phone&nbsp;ALT</b>
                    <i class="NoFormat"><input  type="checkbox" name="phone_ALT"  value="1" /></i>

                    <b>Discount</b>
                    <i class="NoFormat"><input type="checkbox" name="discount" value="1" /></i>

                    <b>Attend Type</b>
                    <i class="NoFormat"><input type="checkbox" name="attend_type" value="1" /></i>

                    
            </div>
            <div class="columns" style="width:105px">
            		<h3>Display</h3>
                    <b>Mobile</b>
                    <i class="NoFormat"><input  type="checkbox" name="mobile"  value="1"  /></i>

                    <b>Address</b>
                    <i class="NoFormat"><input type="checkbox" name="address" value="1" /></i>

                    <b>Country</b>
                    <i class="NoFormat"><input type="checkbox" name="country" value="1" /></i>
                    
                    <b>City</b>
                    <i class="NoFormat"><input type="checkbox" name="city" value="1" /></i>

                    <b>ZIP</b>
                    <i class="NoFormat"><input type="checkbox" name="zip" value="1" /></i>

                    <b>Include&nbsp;Total</b>
                    <i class="NoFormat"><input  type="checkbox" name="count"  value="1" checked="checked"  /></i> 
    
                    <b>Title</b>
                    <i class="NoFormat"><input type="checkbox" name="Title" value="1" /></i>
                    
                    <b>Public Comment</b>
                    <i class="NoFormat"><input type="checkbox" name="Comment_Public" value="1" /></i>
                    
               

            </div>
            <div class="columns" style="width:200px">
            <h3>Output</h3>
            
           		<label> <input type="radio" name="format" id="screan" class="external" value="screen" checked="checked" />print to screan </label><br />
                <label> <input type="radio" name="format" id="pdf" class="external" value="pdf"  />PDF </label><br />
      			<label> <input type="radio" name="format" id="excel" class="external" value="excel" />Excel </label><br />
                <hr /> 
                
                <label><input type="radio" name="layout" id="Mailmerge" value="Mailmerge" checked="checked" />Mailmerge</label><br />
                <label><input type="radio" name="layout" id="List" value="List"  />List</label><br />
      			<label><input type="radio" name="layout" id="badge" value="badge" />Badges</label>
                
               <hr />
            
                   <input name="search" type="submit" value="search" style="width:75px" />
     		 <!---<div id="print_button" class="button">Print Page</div>--->
      	</div>

          <!--- END CONTENT HERE ------->
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