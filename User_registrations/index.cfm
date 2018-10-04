<cfinclude template="../application.cfm">
<cfset numrecords = 0 >
<cfquery datasource="#gpp#" name="get">
 	select TOP 40 *
	from CRM_Users_NewRegistration_list
    <cfif parameterexists(url.order) >
    	 ORDER BY id #url.order#
    <cfelse>
    ORDER BY id DESC
	</cfif>
<!---    SELECT COUNT(city) AS counting
    FROM CRM_Users_NewRegistration_list--->
</cfquery>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>www.petro21.com</title>
<script type="text/javascript" src="../javascript/jquery.js" ></script>
<script type="text/javascript" src="../javascript/jquery.form.js"  ></script>
<script type="text/javascript" src="../javascript/Jeditable.js"  ></script>
<script type="text/javascript" src="../javascript/interface.js" ></script>
 <script type="text/javascript" src="../javascript/jqprint.js" ></script>
<script type="text/javascript" src="../javascript/bsn.AutoSuggest/bsn.AutoSuggest_c_2.0.js"></script>
<link rel="stylesheet" href="../javascript/bsn.AutoSuggest/css/autosuggest_inquisitor.css" type="text/css" media="screen" charset="utf-8" />

<script type="text/javascript">

function RemoveFromList(id) {
		 $("#rec_"+id).animate( { backgroundColor: "#0b860b" }, "fast").animate({ opacity: "hide" }, "fast");	  
}

function DeleteRecord(id) {
		$.post("delete.cfm", { id: id }, function() { $("#rec_"+id).animate( { backgroundColor: "#fbc7c7" }, "fast").animate({ opacity: "hide" }, "fast");    }  ); 	 
}

function DoUpdate(id) {
	 $("#BPA_Designation_"+id).css("visibility","visible").css("color","red");
	 $("#IndustrySector_"+id).css("visibility","visible").css("color","red");	 
	 $("#newsletters_"+id).css("visibility","visible").css("color","red");
	 $("#WebInterest_"+id).css("visibility","visible").css("color","red");;
	 $("#userDetails_"+id).css("visibility","visible").css("color","red");;
	 $("#PostInterest_"+id).css("visibility","visible").css("color","red");
}

function HighLightSelected() {
	 $(this).parent().addClass('backSelected');

}
<!---
$('input[name=check]').click( function(){

   var $el = $(this);
   $el.is(':checked') ? $el.parent().addClass('valgt') 
                      : $el.parent().removeClass('valgt');

})
--->

 $(document).ready(function() {
 
	 $("div#print_button").click(function(){
				$(this).parents("div:eq(73)").jqprint();  
		});
 
 $(".inputChange input").change(function(){ alert("JQuery: change"); });
 
  $('.Title').editable('updateUser.cfm', { 
        	id   : 'id',
         	name : 'Title',
			submit    : 'OK',
			width		: 40,
			height	: 20,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});
 
 
  $('.strFirst_Name').editable('updateUser.cfm', { 
        	id   : 'id',
         	name : 'strFirst_Name',
			width		: 200,
			height	: 20,
			submit    : 'OK',
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});
  $('.strSurname').editable('updateUser.cfm', { 
        	id   : 'id',
         	name : 'strSurname',
			width		: 200,
			height	: 20,
			submit    : 'OK',
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...',
			style	:	'JETextarea'
     		});
$('.strEmail').editable('updateUser.cfm', { 
        	id   : 'id',
         	name : 'strEmail',
			width		: 200,
			height	: 20,
			submit    : 'OK',
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...',
			style	:	'JETextarea'
     		});
$('.strSecretary_Email').editable('updateUser.cfm', { 
        	id   : 'id',
         	name : 'strSecretary_Email',
			width		: 200,
			height	: 20,
			submit    : 'OK',
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...',
			style	:	'JETextarea'
     		});
 $('.strEmail_Alt').editable('updateUser.cfm', { 
        	id   : 'id',
         	name : 'strEmail_Alt',
			width		: 200,
			height	: 20,
			submit    : 'OK',
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...',
			style	:	'JETextarea'
     		});
 					
 $('.strDesignation').editable('updateUser.cfm', { 
        	id   : 'id',
         	name : 'strDesignation',
			width		: 200,
			height	: 20,
			submit    : 'OK',
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...',
			style	:	'JETextarea'
     		});
 $('.strCity').editable('updateUser.cfm', { 
        	id   : 'id',
         	name : 'strCity',
			width		: 200,
			height	: 20,
			submit    : 'OK',
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...',
			cssclass	:	'JETextarea'
     		});
 $('.intCode').editable('updateUser.cfm', { 
        	id   : 'id',
         	name : 'intCode',
			width		: 200,
			height	: 20,
			submit    : 'OK',
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...',
			cssclass	:	'JETextarea'
     		});			
			
	 $('.strStreet_Adress').editable('updateUser.cfm', { 
        	id   : 'id',
         	name : 'strStreet_Adress',
			type      : 'textarea',
			width		: 200,
			height	: 100,
			submit    : 'OK',
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...',
			cssclass	:	'JETextarea'
     		});
 $('.strPostal_Adress').editable('updateUser.cfm', { 
        	id   : 'id',
         	name : 'strPostal_Adress',
			type      : 'textarea',
			width		: 200,
			height	: 100,
			submit    : 'OK',
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...',
			cssclass	:	'JETextarea'
     		});			
			
 $('.tel').editable('updateUser.cfm', { 
        	id   : 'id',
         	name : 'tel',
			width		: 200,
			height	: 20,
			submit    : 'OK',
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...',
			cssclass	:	'JETextarea'
     		});
 $('.fax').editable('updateUser.cfm', { 
        	id   : 'id',
         	name : 'fax',
			width		: 200,
			height	: 20,
			submit    : 'OK',
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...',
			cssclass	:	'JETextarea'
     		});
$(".CountryName").editable("updateUser.cfm", { 
			id   		: 'id',
			name 	: 'CountryName',
			indicator : '<img src="../img/indicator.gif">',
			loadurl 	: '../components/AJAXcountry.cfm',
			type   	: "select",
			submit 	: "OK",
			style  	: "inherit",
			submitdata : function() {
			var	thisCountryID = $(this).attr("id");
			  return {id : thisCountryID};
			}
  });
	 			
				$(".checklist .checkbox-select").click(
				function(event) {
					event.preventDefault();
					$(this).parent().addClass("selected");
					$(this).parent().find(":checkbox").attr("checked","checked");
					$('#IsADup').addClass("showObject");
				}
			);
			
			$(".checklist .checkbox-deselect").click(
				function(event) {
					event.preventDefault();
					$(this).parent().removeClass("selected");
					$(this).parent().find(":checkbox").removeAttr("checked");
					$('#IsADup').addClass("hideObject");
				}
			);

  });
</script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="../styles/styles.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body, table {
font-family:Arial, Helvetica, sans-serif;
font-size:12px;
color:#333333;}

.sepa {
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-right-style: solid;
	border-bottom-style: solid;
	border-right-color: #ECF5FB;
	border-bottom-color: #ECF5FB;
	

}
legend{ background:#585858; color:#FFFFFF; padding:1px 15px 1px 15px; margin-bottom:20px}
ul{list-style:none}
.labelarea{ clear:both; float:left;width:80px; padding:0px; margin:1px; text-align:right; }
.fieldarea{clear:right; float:left; padding:0px; margin:1px 1px 1px 10px; width:445px}
.rightSeparator { border-right:1px dotted #666666; border-bottom:1px dotted #666666; }
.JustRight { border-right:1px dotted #666666;  }

.input-text{
	border:1px solid #3b6e22;
	color:#666666;
	width:180px;
}
.inputField, .textarea, .selectLis{
 background:#ffffff url(http://www.petro21.com/img/inputBg.gif) top left no-repeat;
font-size:12px;
padding:4px 2px;
border:solid 1px #aaaaaa;
margin:5px 0 0px 0px;
}
.JETextarea {

width:200px;
height:30px;
}

input .strFirst_Name, input .strFirst_Name { height:20px}
input .addButton{background-color: none ; border:0px dotted #fff}
.Title { font:Arial, Helvetica, sans-serif; color:#333333}
-->
.backSelected{background-color:#FFE7D6}
/*   stuff for the checkbox stuff */

.checklist {
			list-style: none;
			margin: 0;
			padding: 0;
		}
	
		.checklist li {
			
			margin-right: 10px;
			background: url(../img/New_user_save.png) no-repeat 0 0;
			width: 111px;
			height: 58px;
			position: relative;
		}
		
		.checklist li.selected {
			background-position: -111px 0;
		}
		
		.checklist li.selected .checkbox-select {
			display: none;
		}
		
		.checkbox-select {
			display: block;
			float: left;
			position: absolute;
			top: 0px;
			left: 0px;
			width: 111px;
			height: 58px;
			background: url(../img/New_user_save.png) no-repeat 0 0;
			text-indent: -9999px;
		}
		
		.checklist li input {
			display: none;	
		}
		
		a.checkbox-deselect {
			display: none;
			color: white;
			font-weight: bold;
			text-decoration: none;
			position: absolute;
			top: 0px;
			right: 0px;
			background: url(../img/New_user_save.png) no-repeat  -111px 0;
			width: 111px;
			height: 58px;
		}
		
		.checklist li.selected a.checkbox-deselect {
			display: block;
		}
		

.hideObject{visibility:hidden}
.showObject{visibility:visible} 

</style>
</head>

<body>
<cfinclude template="../nav/testNav2009V2.cfm">
<div id="header">New Registrations: -- <span class="header_title">for news<cfoutput>   of (#get.recordcount#</cfoutput>)</span></div>
<div id="outer">
	<div id="iner">
<cfif Security.AdministratorManagement CONTAINS Session.staffName >
<div style="padding:15px; border:1px solid #CCCCCC; background-color:#FBFBFB">
<a href="index.cfm?order=ASC"><<-- Oldest records</a> / <a href="index.cfm?order=DESC">Newest records -->></a>
</div>
<cfoutput query="get">
<div id="rec_#get.id#" >
<form id="form_#get.id#" action="Add.cfm" method="post" >
	<table width="100%" border="0" cellspacing="0" cellpadding="8" style="border-bottom:1px solid ##CCCCCC;"  >
      <tr bgcolor="##ececec">
        <td width="200"><cfif get.web_reg EQ 1><img src="../img/Web_reg.png"> Web Online Registration<cfelse><img src="../img/Web_reg_GPP.png">  GPP Registration</cfif> </td>
        <td width="200">Search GPP  current Records </td>
        <td width="480"> Newsletters  <cfif get.isADup EQ 1 ><span style=" display:block; border:1px solid ##993300; padding:10px; color:##FF3300; background-color:##FFFFCC">Pleas chech for duplicate<cfif get.comment NEQ "" ><br>#get.comment#</cfif></span></cfif></td>
        <td width="140">Region of interest email </td>
        <td width="140">Region of interest Post </td>
        <td>Action</strong><strong></td>
      </tr>
      <tr>
        <td valign="top" class="rightSeparator">
       <strong>New User name</strong><br>
       <span id="userDetails_#get.id#" style="visibility:hidden" ><input type="checkbox" name="userDetails"  onClick="javascript:HighLightSelected();"  > Update user details <br /> </span>
       <span class="Title" id="#get.id#" >#get.title#</span> 
       		
            <span class="strFirst_Name" id="#get.id#" >#get.name#</span> 
            <span class="strSurname" id="#get.id#" >#get.surname#</span><br><br>
       <strong>Position</strong>: <span class="strDesignation" id="#get.id#" >#get.position#</span><br />
       <strong>Email</strong>:  <span class="strEmail" id="#get.id#" >#get.strEmail#</span><br />
        <strong>Alt Email</strong>:  <span class="strEmail_Alt" id="#get.id#" >#get.strEmail_Alt#</span><br />
         <strong>Secr Email</strong>:  <span class="strSecretary_Email" id="#get.id#" >#get.strSecretary_Email#</span><br /><br>
           
       
        <strong>Company</strong>: <cfif get.company EQ ""><input type="text" name="SearchCompany"  id="SearchCompany_#get.id#" style="width:100px" class="inputField"> <input type="text" id="lngCompany_ID_#get.id#" name="lngCompany_ID" style="width:1px"   class="inputField"  /> <cfelse> #get.company#</cfif> <br /><br />
         
       <strong>City</strong>: <span class="strCity" id="#get.id#" >#get.city#</span><br />
		<strong>Coutry</strong>: <span class="CountryName" id="#get.id#"  style="display: inline">#get.country#</span><br>
        <strong>Address: </strong> <span class="strStreet_Adress" id="#get.id#" >#get.strStreet_Adress#</span> <br>
        <strong>Postal</strong>: <span class="strPostal_Adress" id="#get.id#" >#get.strPostal_Adress#</span><br>
		 <strong>ZIP: </strong> <span class="intCode" id="#get.id#" >#get.intCode#</span> <br>
         <strong>tel: </strong> <span class="tel" id="#get.id#" >#get.tel#</span> <br>
         <strong>fax: </strong> <span class="fax" id="#get.id#" >#get.fax#</span> <br>
         </td>
        <td valign="top" class="rightSeparator" bgcolor="##e7eaf9">
        	<div style=" margin:0 0 5px 0; background-color:##fff; padding:10px">
<table border="0" cellpadding="0" cellspacing="2">
	
	<tr>
    	<td><input type="text" name="SearchOldRecord"  id="SearchOldRecord_#get.id#" style="width:140px" class="inputField"></td>
		<td> <input type="text"  style="width:1px"   class="inputChange" name="oldRecord" id="OldRecord_#get.id#" >   </td>
   </tr>
   <tr>
   	<td colspan="2">Update to this Record
   	  <input type="checkbox" name="UpdateRecord" id="UpdateRecord_#get.id#" value="1" onClick="javascript:DoUpdate(#get.id#)"> </td>
    </tr>
</table>
<div id="areaOldAddress_#get.id#"></div>
</div>        </td>
        <td valign="top" class="rightSeparator" ><table border="0" cellspacing="10" cellpadding="0" >
          <tr>
            <td valign="top">
             <span id="newsletters_#get.id#" style="visibility:hidden" ><input type="checkbox" name="newsletters"   > Update Newsletters <br /></span>
            <div class="labelarea" style="width:20px">
              <input type="checkbox" name="NL_W" <cfif get.NL_W  EQ 1>  checked="checked"  </cfif> />
            </div>
                <div class="fieldarea" style="width:190px">Petro21 Worldwide   Daily</div>
              <div style="clear:both"></div>
              <div class="labelarea" style="width:20px">
                  <input type="checkbox" name="chkNOCNews" <cfif get.chkNOCNews  EQ 1>  checked="checked"  </cfif> />
                </div>
              <div class="fieldarea" style="width:190px">National Oil Companies   </div>
              <div style="clear:both"></div>
              <div class="labelarea" style="width:20px">
                  <input type="checkbox" name="chkPCapNews" <cfif get.chkPCapNews  EQ 1>  checked="checked"  </cfif> />
                </div>
              <div class="fieldarea" style="width:190px">PetroCapital  Weekly </div>
              <div style="clear:both"></div>
              <div class="labelarea" style="width:20px">
                  <input type="checkbox" name="NL_LA" <cfif get.NL_LA  EQ 1>  checked="checked"  </cfif> />
                </div>
                
              <div class="fieldarea" style="width:190px">PetroLatino  Weekly </div>
              <div style="clear:both"></div>
              <div class="labelarea" style="width:20px">
                  <input type="checkbox" name="chkCaNews" <cfif get.chkCaNews  EQ 1>  checked="checked"  </cfif> />
                </div>
              <div class="fieldarea" style="width:190px">PetroCaribbean  Weekly </div>
              <div style="clear:both"></div>
              <div class="labelarea" style="width:20px">
                  <input type="checkbox" name="NL_ME" <cfif get.NL_ME  EQ 1>  checked="checked"  </cfif> />
                </div>
              <div class="fieldarea" style="width:190px">PetroArabian  Weekly </div>
              <div style="clear:both"></div>
              <div class="labelarea" style="width:20px">
                  <input type="checkbox" name="chkMedNews" <cfif get.chkMedNews  EQ 1>  checked="checked"  </cfif> />
                </div>
              <div class="fieldarea" style="width:190px">PetroMediterranean  Weekly </div>
              <div style="clear:both"></div>
              <div class="labelarea" style="width:20px">
                <input type="checkbox" name="NL_EU" <cfif get.NL_EU  EQ 1>  checked="checked"  </cfif> />
              </div>
              <div class="fieldarea" style="width:190px">PetroEuropa  Weekly </div>
              
              <div style="clear:both"></div>
              <div class="labelarea" style="width:20px">
                <input type="checkbox" name="chkNigerNews" <cfif get.chkNigerNews  EQ 1>  checked="checked"  </cfif> />
              </div>
              <div class="fieldarea" style="width:190px">Nigeria Oil, Gas  Weekly </div>
              
              <div style="clear:both"></div>
              <div class="labelarea" style="width:20px">
                <input type="checkbox" name="chkIndiaNews" <cfif get.chkIndiaNews  EQ 1>  checked="checked"  </cfif> />
              </div>
              <div class="fieldarea" style="width:190px">India  Oil, Gas  Weekly </div>
              
              <div style="clear:both"></div>
              <div class="labelarea" style="width:20px">
                <input type="checkbox" name="chkBrazilNews" <cfif get.chkBrazilNews  EQ 1>  checked="checked"  </cfif> />
              </div>
              <div class="fieldarea" style="width:190px">Brazil  Oil, Gas  Weekly </div>
              
              <div style="clear:both"></div>
              <div class="labelarea" style="width:20px">
                <input type="checkbox" name="chkChinaNews" <cfif get.chkChinaNews  EQ 1>  checked="checked"  </cfif> />
              </div>
              <div class="fieldarea" style="width:190px">China  Oil, Gas  Weekly </div>
              <div style="clear:both"></div>
              <div class="labelarea" style="width:20px">
                <input type="checkbox" name="chkIraqNews" <cfif get.chkIraqNews  EQ 1>  checked="checked"  </cfif> />
              </div>
              
              <div class="fieldarea" style="width:190px">Iraq Oil, Gas & Energy     </div>  
              <div style="clear:both"></div>
              <div class="labelarea" style="width:20px">
                <input type="checkbox" name="chkAtlanticNews" <cfif get.chkAtlanticNews  EQ 1>  checked="checked"  </cfif> />
              </div>
              <div class="fieldarea" style="width:190px">Atlantic Ocean Oil & Gas Weekly     </div>   
              
                          </td>
            <td valign="top"><div class="labelarea" style="width:20px">
              <input type="checkbox" name="chkWAENews" <cfif get.chkWAENews  EQ 1>  checked="checked"  </cfif>   />
            </div>
                <div class="fieldarea" style="width:190px">Western African Energy </div>
              <div style="clear:both"></div>
              <div class="labelarea" style="width:20px">
                <input type="checkbox" name="chkEAENews" <cfif get.chkEAENews  EQ 1>  checked="checked"  </cfif>   />
              </div>
              <div class="fieldarea" style="width:190px">Eastern African Energy </div>
              <div style="clear:both"></div>
              <div class="labelarea" style="width:20px">
                <input type="checkbox" name="chkSAENews" <cfif get.chkSAENews  EQ 1>  checked="checked"  </cfif>   />
              </div>
              <div class="fieldarea" style="width:190px">Southern African Energy </div>
              <div style="clear:both"></div>
              <div class="labelarea" style="width:20px">
                <input type="checkbox" name="NL_AF" <cfif get.NL_AF  EQ 1>  checked="checked"  </cfif> />
              </div>
              <div class="fieldarea" style="width:190px">PetroAfricanus  Weekly</div>
              <div style="clear:both"></div>
              <div class="labelarea" style="width:20px">
                <input type="checkbox" name="NL_AS" <cfif get.NL_AS  EQ 1>  checked="checked"  </cfif> />
              </div>
              <div class="fieldarea" style="width:190px">PetroMaghreb  Weekly</div>
              <div style="clear:both"></div>
              <div class="labelarea" style="width:20px">
                <input type="checkbox" name="chkPetMagNews" <cfif get.chkPetMagNews  EQ 1>  checked="checked"  </cfif> />
              </div>
              <div class="fieldarea" style="width:190px">PetroAsiana    Weekly</div>
              <div style="clear:both"></div>
              <div class="labelarea" style="width:20px">
                <input type="checkbox" name="chkOzNews" <cfif get.chkOzNews  EQ 1>  checked="checked"  </cfif> />
              </div>
              <div class="fieldarea" style="width:190px">PetroAustralasia  Weekly </div>
              
<div style="clear:both"></div>
              <div class="labelarea" style="width:20px">
                <input type="checkbox" name="chkRussiaNews" <cfif get.chkRussiaNews  EQ 1>  checked="checked"  </cfif> />
              </div>
              <div class="fieldarea" style="width:190px">Russia  Oil, Gas  Weekly </div>
              
              <div style="clear:both"></div>
              <div class="labelarea" style="width:20px">
                <input type="checkbox" name="chkAngolaNews" <cfif get.chkAngolaNews  EQ 1>  checked="checked"  </cfif> />
              </div>
              <div class="fieldarea" style="width:190px">Angola  Oil, Gas  Weekly </div>
              
              <div style="clear:both"></div>
              <div class="labelarea" style="width:20px">
                <input type="checkbox" name="chkPetEurasNews" <cfif get.chkPetEurasNews  EQ 1>  checked="checked"  </cfif> />
              </div>
              <div class="fieldarea" style="width:190px">PetroEurasia    Weekly </div>
              
               <div style="clear:both"></div>
              <div class="labelarea" style="width:20px">
                <input type="checkbox" name="chkUSANews" <cfif get.chkUSANews  EQ 1>  checked="checked"  </cfif> />
              </div>
              <div class="fieldarea" style="width:190px">USA Oil, Gas Weekly </div>
              
              <div style="clear:both"></div>
              <div class="labelarea" style="width:20px">
                <input type="checkbox" name="chkSuperNews" <cfif get.chkSuperNews  EQ 1>  checked="checked"  </cfif> />
              </div>
              <div class="fieldarea" style="width:190px">Super-Majors Oil & Gas </div>
              <div style="clear:both"></div>
              <div class="labelarea" style="width:20px">
                <input type="checkbox" name="chkFrontierNews" <cfif get.chkFrontierNews  EQ 1>  checked="checked"  </cfif> />
              </div>
              <div class="fieldarea" style="width:190px">Frontier Exploration  </div>
               <div style="clear:both"></div>
              <div class="labelarea" style="width:20px">
                <input type="checkbox" name="chkWorldIndNews" <cfif get.chkWorldIndNews  EQ 1>  checked="checked"  </cfif> />
              </div>
              <div class="fieldarea" style="width:190px">Worldwide Independents    </div>
              <div style="clear:both; margin-top:10px"></div>              </td>
          </tr>
        </table></td>
        <td valign="top" class="rightSeparator" >
         <span id="WebInterest_#get.id#" style="visibility:hidden" ><input type="checkbox" name="WebInterest"   > Update Email Int <br /></span>
  <INPUT TYPE="checkbox" NAME="chkWebIntAf"  id="chkWebIntAf" <cfif get.chkWebIntAf  EQ 1>  checked="checked" </cfif>>
  Africa  
    <br />    
    <input type="checkbox" name="chkWebIntNaf" id="chkWebIntNaf" <cfif get.chkWebIntNaf  EQ 1>  checked="checked"  </cfif> />
    North Africa<br />

    <input type="checkbox" name="chkWebIntSAE" id="chkWebIntSAE" <cfif get.chkWebIntSAE  EQ 1>  checked="checked"  </cfif>  />
    Southern Africa
    <br />

     <input type="checkbox" name="chkWebIntEAf"   id="chkWebIntEAf" <cfif get.chkWebIntEAf  EQ 1>  checked="checked"  </cfif>  />
    Eastern Africa<br />
    <input type="checkbox" name="chkWebIntWAf"   id="chkWebIntWAf" <cfif get.chkWebIntWAf  EQ 1>  checked="checked"  </cfif>  />
    Western Africa<br>
    <INPUT TYPE="checkbox" NAME="chkWebIntAs"   id="chkWebIntAs"<cfif get.chkWebIntAs  EQ 1>  checked="checked"  </cfif>  > Asia<br />
    <INPUT TYPE="checkbox" NAME="chkWebIntAus"   id="chkWebIntAus"<cfif get.chkWebIntAus  EQ 1>  checked="checked"  </cfif>  > Australia<br />
<input type="checkbox" name="chkWebIntMe"  id="chkWebIntMe"<cfif get.chkWebIntMe  EQ 1>  checked="checked"  </cfif>  />
Middle East<br />
<input type="checkbox" name="chkWebIntNa"   id="chkWebIntNa"  <cfif get.chkWebIntNa  EQ 1>  checked="checked"  </cfif> />
North America<br />
<input type="checkbox" name="chkWebIntLa"   id="chkWebIntLa" <cfif get.chkWebIntLa  EQ 1>  checked="checked"  </cfif>  />
Latin America<br />
<input type="checkbox" name="chkWebIntEu"   id="chkWebIntEu" <cfif get.chkWebIntEu  EQ 1>  checked="checked"  </cfif>  />
Europe<br />
<input type="checkbox" name="chkWebIntWo"  id="chkWebIntWo" <cfif get.chkWebIntWo  EQ 1>  checked="checked"  </cfif>  />
Worldwide
<br />
<input type="checkbox" name="chkWebIntGen"    id="chkWebIntGen" <cfif get.chkWebIntGen  EQ 1>  checked="checked"  </cfif> />
General <br /> <input type="checkbox" name="chkWebIntAdvertising" <cfif get.chkWebIntAdvertising EQ 1  EQ 1>  checked="checked"  </cfif>  />
3rd party Communication</td>
        <td valign="top" class="rightSeparator"  >
    <span id="PostInterest_#get.id#" style="visibility:hidden" ><input type="checkbox" name="PostInterest"   > Update Post Int <br /></span>
    
  <INPUT TYPE="checkbox" NAME="chkAF"  id="chkAF" <cfif get.chkAF  EQ 1>  checked="checked"  </cfif> >
  Africa<br />    
    <input type="checkbox" name="chkMag"    id="chkMag" <cfif get.chkMag  EQ 1>  checked="checked"  </cfif>  />
    North Africa<br />
    <input type="checkbox" name="chSAE"   id="chSAE" <cfif get.chSAE  EQ 1>  checked="checked"  </cfif> />
    Southern Africa<br />
     <input type="checkbox" name="chkEAF"   id="chkEAF" <cfif get.chkEAF  EQ 1>  checked="checked"  </cfif> />
    Eastern Africa<br />
    <input type="checkbox" name="chkWA"   id="chkWA" <cfif get.chkWA  EQ 1>  checked="checked"  </cfif> />
    Western Africa<br>
    <INPUT TYPE="checkbox" NAME="chkA"   id="chkA" <cfif get.chkA  EQ 1>  checked="checked"  </cfif> > Asia<br />
    <INPUT TYPE="checkbox" NAME="chkIntPostAus"   id="chkIntPostAus"<cfif get.chkIntPostAus  EQ 1>  checked="checked"  </cfif>  > Australia<br />
<input type="checkbox" name="chkME"  id="chkME"<cfif get.chkME  EQ 1>  checked="checked"  </cfif>  />
Middle East<br />
<input type="checkbox" name="chkNA"   id="chkNA" <cfif get.chkNA  EQ 1>  checked="checked"  </cfif>  />
North America<br />
<input type="checkbox" name="chkL"   id="chkL" <cfif get.chkL  EQ 1>  checked="checked"  </cfif>  />
Latin America<br />
<input type="checkbox" name="chkE"   id="chkE" <cfif get.chkE  EQ 1>  checked="checked"  </cfif> />
Europe<br />
<input type="checkbox" name="chkW"  id="chkW" <cfif get.chkW  EQ 1>  checked="checked"  </cfif>  />
Worldwide</td>
<td rowspan="2" valign="top">
<cfif get.approved EQ 1 >
<img src="../img/New_user_approved.png" >
<cfelseif Session.staffName EQ "babette">
<ul class="checklist">
	<li>
		<input name="SaveOptionsOnly" value="1" type="checkbox" />
                 <a class="checkbox-select" href="##"></a>
                 <a class="checkbox-deselect" href="##"></a>    </li>
</ul><br />
<div id="IsADup">
	<label><input type="checkbox" name="isADup" > To check for duplicate</label><br>
	
    	<textarea name="comment" id="comment" style="width:120px" >Add Comment</textarea>
</div>
</cfif>
<div class="clear"></div>
<input type="image" src="http://petro21.com/my-office/img/New_user_Add.png" style="" class="addButton"><br />
<!---<a href="javascript:AddRecord(#get.id#)"><img src="http://petro21.com/my-office/img/New_user_Add.png" width="115" height="131"></a>---><a href="javascript:DeleteRecord(#get.id#)"><img src="http://petro21.com/my-office/img/New_user_Delete.png" width="115" height="131"></a>
<!---<div id="print_button">print record</div>---></td>
      </tr>
      <tr>
      	<td colspan="3" class="rightSeparator" valign="top">
        <table cellpadding="6" cellspacing="2" border="0" >
 <tr>
   <td ><b>BPA Designation</b></td>
   <td >
   <span id="BPA_Designation_#get.id#" style="visibility:hidden"><input type="checkbox" name="BPA_Designation_Update"   > Update BPA Designation</span></td>
   <td valign="top" class="JustRight">&nbsp;</td>
     <td ><b>Industry Sector</b></td>
  <td >
    <span id="IndustrySector_#get.id#" style="visibility:hidden"><input type="checkbox" name="IndustrySector"   > Update Industry Sectors</span></td>
 </tr>
 <tr><td >
<input type="radio" name="BPA_Designation" id="BPA_Designation" value="SnrManagement" <cfif get.BPA_Designation  EQ "SnrManagement" > checked</cfif>   >Senior Management<br />
<input type="radio" name="BPA_Designation" id="BPA_Designation" value="Professional" <cfif get.BPA_Designation  EQ "Professional" > checked</cfif>>Professional<br />
<input  type="radio" name="BPA_Designation" id="BPA_Designation" value="Consultant" <cfif get.BPA_Designation  EQ "Consultant" > checked</cfif>>Consultant
</td><td valign="top">
<input type="radio" name="BPA_Designation" id="BPA_Designation" value="OpsManagement" <cfif get.BPA_Designation  EQ "OpsManagement" > checked</cfif>>Operating Management<br />
<input type="radio" name="BPA_Designation" id="BPA_Designation" value="Marketing" <cfif get.BPA_Designation  EQ "Marketing" > checked</cfif>>Marketing
</td><td valign="top" class="JustRight">
<input type="radio" name="BPA_Designation" id="BPA_Designation" value="MinistriesGov" <cfif get.BPA_Designation  EQ "MinistriesGov" > checked</cfif>>Ministries / Government<br />
<input type="radio" name="BPA_Designation" id="BPA_Designation" value="HR_Training" <cfif get.BPA_Designation  EQ "HR_Training" > checked</cfif>>Training / HR
</td>
  <td valign="top">

  <input type="checkbox" name="chkExploration" id="IndustrySector" <cfif get.chkExploration  EQ 1 > checked</cfif> > 
  Exploration and Prod<br />
 <input type="checkbox" name="chkRefining" id="IndustrySector" <cfif get.chkRefining  EQ 1 > checked</cfif>> Power<br />
 <input type="checkbox" name="chkPower" id="IndustrySector" <cfif get.chkPower  EQ 1 > checked</cfif>> 
 Down, Ref, PetroChem</td>
  <td valign="top" >

 <input type="checkbox" name="chkGas" id="IndustrySector"  <cfif get.chkGas  EQ 1 > checked</cfif>>Gas<br />
 <input type="checkbox" name="chkRenBio" id="IndustrySector"  <cfif get.chkRenBio  EQ 1 > checked</cfif>>Renewable, Biofeul<br />
 <input type="checkbox" name="industrySecEconomy" id="IndustrySector"  <cfif get.industrySecEconomy  EQ 1 > checked</cfif>> Economy
 </td>
</tr>
</table>       </td>
        <td class="rightSeparator" valign="top" >
        		<table border="0" cellpadding="5" cellspacing="2"  id="Post_#get.id#">
                	<tr>	
                    	<td><b>Post</b><input type="hidden" name="id"  id="id_#get.id#" value="#get.id#"></td>
                    </tr>
                    <tr>
                    		<td><INPUT TYPE="checkbox" NAME="chkMail"  id="chkMail" <cfif get.chkMail  EQ 1>  checked="checked"  </cfif>>
  Do not Post <br>
<INPUT TYPE="checkbox" NAME="chkPrioPost"  id="chkPrioPost" <cfif get.chkPrioPost  EQ 1> checked="checked" </cfif>>
  Primary Post<br>
<INPUT TYPE="checkbox" NAME="chkSecPost" id="chkSecPost" <cfif get.chkSecPost  EQ 1> checked="checked" </cfif>>
  Secondary Post</td>
                     </tr>
                 </table>      </td>
        <td class="rightSeparator" valign="top" >&nbsp;</td>
        </tr>
    </table>
 </form>
 </div>  
   </cfoutput>
   <cfelse >
Only Members of the Management Admin group can access this page
</cfif>
	</div>
</div>
</form>
<script type="text/javascript">

<cfoutput query="get">
	var options = {
		script:"Suggest_User.cfm?json=true&",
		varname:"input",
		json:true,
		minchars: 5,
		timeout: 5000,
		delay: 100,
		callback: function (obj) { document.getElementById('OldRecord_#get.id#').value = obj.id; loadOldClient(obj.id, #get.id#);  }
	};
	var UpdateOldRecord_#get.id# = new AutoSuggest('SearchOldRecord_#get.id#', options);
	
 <cfif get.company EQ "">	
			var options = {
					script:"../New_User/company_Suggest.cfm?json=true&",
					varname:"input",
					json:true,
					minchars: 5,
					timeout: 5500,
					delay: 100,
					callback: function (obj) { 
									document.getElementById('lngCompany_ID_#get.id#').value = obj.id; 

									}
				};
				var as_json = new AutoSuggest('SearchCompany_#get.id#', options);	
</cfif>
</cfoutput>
function loadOldClient(oldID, PlaceID) {
		$("#areaOldAddress_"+PlaceID).fadeIn("slow").load("Get_Old_Client.cfm", {id: oldID});
	
}

<!---<cfoutput query="get">--->
$(document).ready(function() { 	
	<!---	var options = { success: RemoveFromList, 	clearForm: false    	};  
		
	    $('##form_#get.id#').submit(function() { 
			$(this).ajaxSubmit(options); 
			return false; 
		}); --->

	    $('form').submit(function() { 
			$(this).ajaxSubmit({ success: RemoveFromList, 	clearForm: false }); 
			return false; 
		}); 

});
<!---</cfoutput>	--->
</script>
</body>
</html>
<!---
//function AddRecord(id) {
	//	$.post("Add.cfm", { id: id }, function() {  $("#rec_"+id).animate( { backgroundColor: "#0b860b" }, "fast").animate({ opacity: "hide" }, "fast");   }  );   
//}
--->