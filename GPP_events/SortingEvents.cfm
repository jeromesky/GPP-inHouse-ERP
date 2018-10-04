<cfinclude template="../application.cfm">
<cfset numrecords = 0 >
<cfquery datasource="#gpp#" name="getGroup">
 	select  *
	from Conference_groups
    Order By name
</cfquery>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>www.petro21.com</title>
<script type="text/javascript" src="../javascript/jquery1.4.js" ></script>
<!---<script type="text/javascript" src="../javascript/jquery.js" ></script>--->
<script type="text/javascript" src="../javascript/jquery.form.js"  ></script>
<script type="text/javascript" src="../javascript/Jeditable.js"  ></script>
<script type="text/javascript" src="../javascript/interface.js" ></script>
<link type="text/css" href="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.css" rel="stylesheet" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.min.js"></script>
<!---<link type="text/css" href="http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/jquery-ui-1.7.2.custom.css" rel="stylesheet" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/jquery-ui-1.7.2.custom.min.js"></script>
<script type="text/javascript" src="../javascript/bsn.AutoSuggest/bsn.AutoSuggest_c_2.0.js"></script>
<link rel="stylesheet" href="../javascript/bsn.AutoSuggest/css/autosuggest_inquisitor.css" type="text/css" media="screen" charset="utf-8" />

<link rel="stylesheet" type="text/css" media="screen" href="../javascript/jquery.jqGrid-3.6/css/ui.jqgrid.css" />
<script src="../javascript/jquery.jqGrid-3.6/js/src/i18n/grid.locale-en.js" type="text/javascript"></script>
<script src="../javascript/jquery.jqGrid-3.6/js/jquery.jqGrid.min.js" type="text/javascript"></script>--->

<script type="text/javascript">
var TheWeekId = 0 ; 

function RemoveFromList(id) {
		 $("#rec_"+id).animate( { backgroundColor: "#0b860b" }, "fast").animate({ opacity: "hide" }, "fast");	  
}

function DeleteRecord(id) {
		$.post("delete.cfm", { id: id }, function() { $("#rec_"+id).animate( { backgroundColor: "#fbc7c7" }, "fast").animate({ opacity: "hide" }, "fast");    }  ); 	 
}

$(document).ready(function(){
	$('#weekgroup :selected').val();
		$("#weekgroup").change(function(){
			var getGroupid = $('#weekgroup').val() ;
			$('#areaWeekgroup').fadeIn("fast").load("../gpp_events/Conference_week.cfm" , { id: getGroupid });
			$('#areaWeekEvent').html("");
		});	
		
		
		
		$('#formConference').live("submit", function() { 
		$(this).ajaxSubmit( {clearForm: false, success: function (){ $('#areaConferenceEdit').html("");  $('#table_weekevent tr:first').before(returnData); }   }) ; 
		return false; 
    }); 

});		

function EditAddWeek(id){
		$('#areaWeekgroup').fadeIn("fast").load("../gpp_events/Conference_week.cfm" , { id: id });
}
function ViewWeek(id){
		TheWeekId = id;
		$('#areaWeekEvent').fadeIn("fast").load("../gpp_events/Conference_events.cfm" , { id: id });
		$(this).parent().parent('td').css('background-color', 'red');
		//alert(TheWeekId);
}

 $(document).ready(function() {

 $(".inputChange input").change(function(){ alert("JQuery: change"); });
 			
				$('#tabs').tabs();
				//hover states on the static widgets
				$('#dialog_link, ul#icons li').hover(
					function() { $(this).addClass('ui-state-hover'); }, 
					function() { $(this).removeClass('ui-state-hover'); }
				);
				
	    $('#submitWeek, #submitGroup').submit(function() { 
		$(this).ajaxSubmit( {clearForm: false}  ) ; 
		return false; 
    }); 
	 
  });

function LoadWeekPane(id, week){
$('#areaWeekGroupEdit').load("WeekGroupForm.cfm" , { id: id , week: week });
}
	
function LoadConferencePane(id, week){
$('#areaConferenceEdit').load("ConferenceForm.cfm" , { id: id , week: week });
}

function LoadList(){
$('#listEvents').load("Event_list.cfm");
}
 
$(function() {
		$("#sortable2 > li > input.delete").click(function() {
		  $(this).remove();
		  $("#sortable2").sortable('refresh');
		} );


		$("#sortable1, #sortable2").sortable({
			connectWith: '.connectedSortable'
		}).disableSelection();
		
	});
	
function serialize(){
	var ListToAdd = $('#sortable2').sortable('toArray');
	//serial = $("#sortable2").Sortable.serialize("toArray");
	$.post("savegrouped.cfm", {  weekid: TheWeekId, conferenceid: ListToAdd  }, function(data){ alert(data);} );
	//alert(ListToAdd );
	//alert(TheWeekId);
};

</script>
<style type="text/css">
	#sortable1, #sortable2 { list-style-type: none; margin: 0; padding: 0; float: left; margin-right: 10px; }
	#sortable1 li, #sortable2 li { margin: 0 5px 5px 5px; padding: 5px; font-size: 1.2em; width: 120px; }
	</style>
	

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="../styles/indexv2.css" rel="stylesheet" type="text/css">
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

input .addButton{background-color: none ; border:0px dotted #fff}
.Title { font:Arial, Helvetica, sans-serif; color:#333333}
-->
.backSelected{background-color:#FFE7D6}
#areaSearchResult { margin:10px 0 0 0}
.searchResultGrid{ border-bottom:1px solid #E4E4E4; border-right:1px solid #E4E4E4}
.searchResultGridPaid{ border-bottom:1px solid #E4E4E4; border-right:1px solid #E4E4E4; background-color:#e6f1f9}
.tableOtions td { border-bottom:1px dotted #666666 }
#paneAttendedEventsLeft {clear:both; float:left; position: relative; width:690px;  background-image:url(../img/GPPDATA/Arrow_Left.jpg); background-position:right top; background-repeat:no-repeat }
#paneAttendedEventsRight {clear:right; float:left; position: relative;;  width:130px; background-color:#F0EDFE; padding:15px; height:390px; width:350px; }
h4 {border-bottom:1px solid #ccc; }
#sortable1 .ui-state-default, #sortable2 .ui-state-default{font-size:11px; font-weight:normal}
</style>
</head>

<body>
<cfinclude template="../nav/testNav2009V2.cfm">
<div id="header">Edit Manage Conferences: -- <span class="header_title">Groups / Events</span></div>
<div id="outer">
	<div id="iner">

		<div id="tabs">
			<ul>
				<li><a href="#Manage">Manage Conferences</a></li>
				<li><a href="GroupWeeks.cfm" >Sort Groups</a></li>
                <li><a href="GroupEvents.cfm">Sort Conferences</a></li>
			</ul>
           
            <div id="Manage">
				<div id="areaSearchResult">

    <div style="background-color:#FFF; padding:5px 15px; margin:0 0 5px 0; border:1px dotted #CCCCCC">
                	Select Conference Group 
            		<select name="weekgroup" style="width:330px;" id="weekgroup">
						<cfoutput query="getGroup"><option value="#getGroup.id#">#getGroup.name#</option>
                        </cfoutput>
                    </select>
    </div>

     <h4>Select week / club Group</h4>
    <div id="areaWeekgroup" style="background-color:#FFF;  margin:0 0 5px 0; height:250px; width:500px; overflow:auto; clear:both; float:left"></div>
    
    
    <form id="formWeek" action="../GPP_events/WeekGroupForm.cfm" method="post">
    <div id="areaWeekGroupEdit" style=" margin:0 0 0 15px; height:250px; width:450px; clear:right; float:left; border:1px dotted #CCCCCC"></div>
    </form>
    <a href="javascript:LoadList();">loadlist</a>
     <div id="listEvents" style=" margin:0 0 0 15px; height:250px; width:220px; clear:right; float:left; border:1px dotted #CCCCCC; overflow:scroll">
    <cfquery datasource="#gpp#" name="get">
SELECT
	IngConference_ID, 
	strConference_Name 
FROM 
	tblAnnual_Conf 

ORDER BY 
	IngConference_ID  
DESC
</cfquery>
     	<ul id="sortable1" class="connectedSortable">
        	<cfoutput query="get">
    		<li class="ui-state-default" id="#get.IngConference_ID#">#get.strConference_Name# <input type="button" value="delete" name="" ></li>
    		</cfoutput>
        </ul>
     </div>
     // \\ <a href="##" onClick="serialize(); return false;">Save added conferences</a>
      <div  style=" margin:0 0 0 15px; height:250px; width:220px; clear:right; float:left; border:1px dotted #CCCCCC">
                 	<ul id="sortable2" class="connectedSortable" style="border:1px #999999 solid; min-width:200px; min-height:40px">
                    	
                    </ul>
                 </div>
				
    <div class="clear"></div>
   
    <h4>Edit / Add event</h4>
    <div id="areaWeekEvent" style="background-color:#FFF;  margin:0 0 5px 0;  height:260px; width:500px; clear:both; float:left"></div>
    
    <form id="formConference" action="ConferenceForm.cfm" method="post">
            <div id="areaConferenceEdit" style=" margin:0 0 0 15px; height:260px; width:450px; clear:right; float:left; border:1px dotted #CCCCCC"></div>
	</form>
    		    
    <div class="clear"></div>
    
                <!--- END PANE MANAGE --->
                </div>
            </div>
             <form action="GroupWeeks.cfm" method="post" id="submitGroup" >
            <div id="Groups" >
            	<div id="areaSearchDetails">
              <!--- <cfquery datasource="#gpp#" name="get">
                    select  *
                    from Conference_groups
                </cfquery>
               
                Select Group
                <select name="group" >
                    <cfoutput query="get">
                        <option value="#get.id#">#get.name#</option>
                    </cfoutput>
                </select>
                <div style=" clear:both; height:15px; margin-bottom:10px; border-bottom:1px solid #999999"></div>
                <cfquery datasource="#gpp#" name="getevents">
                    select  tblConference.IngCon_ID, tblConference.strConference_Description, Conference_groups.name
                    from tblConference
                    LEFT JOIN Conference_groups 
                    ON tblConference.week = Conference_groups.id
                    
                </cfquery>
                
                <table cellpadding="4" cellspacing="1" style="font-family:Arial, Helvetica, sans-serif; font-size:12px">
                    <cfoutput query="getevents">
                    <tr>
                        <td>#getevents.strConference_Description#</td>
                        <td>#getevents.name#</td>
                        <td><input type="checkbox" name="week" value="#getevents.IngCon_ID#" /></td>
                    </tr>
                    </cfoutput>
                </table>
                <input type="submit" value="save" />
              --->
                
                </div>
            </div>
              </form>
            <!--- TAB CONFERENCE ------>
            <form action="GroupEvents.cfm" method="post" id="submitWeek" >
            <div id="Conferences" >
            	<div id="areaConference">
            <!---   <cfquery datasource="#gpp#" name="get">
                select  *
                from tblConference
            </cfquery>
           
            Select week
            <select name="group" >
                <cfoutput query="get">
                    <option value="#get.IngCon_ID#">#get.strConference_Description#</option>
                </cfoutput>
            </select>
            <div style="clear:both; height:15px; margin-bottom:10px; border-bottom:1px solid #999999"></div>
            <cfquery datasource="#gpp#" name="getevents">
                select  tblAnnual_Conf.IngConference_ID, tblAnnual_Conf.strConference_Name, tblAnnual_Conf.strConference_Code,
                tblConference.strConference_Description
                from tblAnnual_Conf
                LEFT JOIN tblConference
                ON tblAnnual_Conf.lngCon_ID = tblConference.IngCon_ID
            </cfquery>
 
            <table cellpadding="4" cellspacing="1" style="font-family:Arial, Helvetica, sans-serif; font-size:12px">
                <cfoutput query="getevents">
                <tr>
                    <td>#getevents.strConference_Code#</td>
                    <td>#getevents.strConference_Name#</td>
                    <td><input type="checkbox" name="week" value="#getevents.IngConference_ID#" /></td>
                    <td style="color:##666666">#getevents.strConference_Description#</td>
                </tr>
                </cfoutput>
            </table>
            <input type="submit" value="save" />--->
            
                </div>
                <div class="clear"></div>
            </div>
            </form>
 		</div>
  </div>
</div>

</body>
</html>