<cfinclude template="../application.cfm">
<cfset numrecords = 0 >

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>P21</title>
<script type="text/javascript" src="../javascript/jquery.js" ></script>
<script type="text/javascript" src="../javascript/jquery.form.js"  ></script>
<script type="text/javascript" src="../javascript/Jeditable.js"  ></script>
<script type="text/javascript" src="../javascript/interface.js" ></script>
<link type="text/css" href="http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/jquery-ui-1.7.2.custom.css" rel="stylesheet" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/jquery-ui-1.7.2.custom.min.js"></script>
<script type="text/javascript" src="../javascript/bsn.AutoSuggest/bsn.AutoSuggest_c_2.0.js"></script>
<link rel="stylesheet" href="../javascript/bsn.AutoSuggest/css/autosuggest_inquisitor.css" type="text/css" media="screen" charset="utf-8" />

<script type="text/javascript">
 $(document).ready(function() {
 
						$('#tabs').tabs();
				//hover states on the static widgets
				$('#dialog_link, ul#icons li').hover(
					function() { $(this).addClass('ui-state-hover'); }, 
					function() { $(this).removeClass('ui-state-hover'); }
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
input .strFirst_Name, input .strFirst_Name { height:20px}
input .addButton{background-color: none ; border:0px dotted #fff}
.Title { font:Arial, Helvetica, sans-serif; color:#333333}
-->
.backSelected{background-color:#FFE7D6}
#areaSearchResult { margin:20px 0 0 0}
.searchResultGrid{ border-bottom:1px solid #E4E4E4; border-right:1px solid #E4E4E4}
</style>
</head>

<body>
<cfinclude template="../nav/testNav2009V2.cfm">
<div id="header">Edit Users On GPP Data: -- <span class="header_title"></span></div>
<div id="outer">
	<div id="iner">
    <form name="searchfrm" id="searchfrm" method="post" action="find_All_Reg_search.cfm">
<table width="100%" border="0" cellspacing="1" cellpadding="7" style="background-color:#F2F2F2; border-bottom:3px solid #D2D2D2; border-right:3px solid #D2D2D2">
  <tr>
    <td width="4%">Search for </td>
    <td width="17%">
<cfquery name="getEvent" datasource="#dsnP21#">
SELECT id, event_name, event_year FROM events
WHERE (event_type = 'event' OR event_type = 'DIN' OR event_type = 'EB' ) AND event_expire > #now()#
ORDER by event_expire
</cfquery>    
    	<select name="event" >
        <cfoutput query="getEvent">
        	<option value="#getEvent.id#" >#getEvent.event_name# #getEvent.event_year#</option>
        </cfoutput>
        </select>
    </td>
    <td width="2%"><input name="search" value="search" type="submit"></td>
    <td><label></label>
    <label></label>&nbsp;</td>
    </tr>
</table>
    </form>
		<div id="tabs">
			<ul>
				<li><a href="#result">Search Results</a></li>
	
			</ul>
            <div id="result">
				<div id="areaSearchResult"></div>
            </div>
 		</div>  

  </div>
</div>

<script type="text/javascript">
$(document).ready(function() { 	
		var options = { target:        '#areaSearchResult',  	clearForm: false    	};  
		
	    $('#searchfrm').submit(function() { 
			$(this).ajaxSubmit(options); 
			return false; 
		}); 

});

function deleteRec(id) {
	$("#rec_"+id).animate( { backgroundColor: "#fbc7c7" }, "fast").animate({ opacity: "hide" }, "fast");
}		

</script>
</body>
</html>
<!---

//function AddRecord(id) {
	//	$.post("Add.cfm", { id: id }, function() {  $("#rec_"+id).animate( { backgroundColor: "#0b860b" }, "fast").animate({ opacity: "hide" }, "fast");   }  );   
//}
--->