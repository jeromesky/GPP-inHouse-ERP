<cfinclude template="../Application.cfm">
<cfif parameterexists(url.eventid)>
    <cfset eventid = #url.eventid# >
<cfelse>
    <cfset eventid = #form.eventid# >
</cfif>

<cfquery datasource="#gpp#" name="getevent">
SELECT 
	webID AS id, 
<!---    webdisp, --->
    event_cost_eu, 
    econf_cost, 
    econf_descr, 
    event_name, 
    event_type 
FROM 
	tblAnnual_Conf 
WHERE 
	webID = <cfqueryparam cfsqltype="cf_sql_integer" value="#eventid#">
</cfquery>

<cfquery datasource="#dsnP21#" name="get">
SELECT 
	speakers_program.id, 
    speakers_program.decription, 
    speakers_program.comment, 
	speakers_program.speakersession, 
    speakers_program.speakertime, 
    speakers_program.pos, 
    speakers.name, 
	speakers.delegation, 
    speakers_program.speaker, 
    speakers.id AS speakerID
FROM 
	speakers_program 
	LEFT outer JOIN speakers
	ON speakers_program.clientid = speakers.id
WHERE 
	speakers_program.eventid = <cfqueryparam cfsqltype="cf_sql_integer" value="#eventid#"> AND 
    (speakers_program.speaker = 0 OR speakers_program.speaker = 1)
ORDER BY 
	speakersession , speakertime
</cfquery>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>www.petro21.com</title>

<link href="../styles/indexV2.css" rel="stylesheet" type="text/css">
<link href="../styles/styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../javascript/jquery.js" ></script>
<script type="text/javascript" src="../javascript/jquery.form.js"  ></script>
<script type="text/javascript" src="../javascript/Jeditable.js"  ></script>
<script type="text/javascript" src="../javascript/interface.js" ></script>
<script type="text/javascript" src="../javascript/fileUpload.js"  ></script>
<script type="text/javascript" src="../javascript/jquery.rating_On-Off.js"></script>
<link rel="stylesheet" type="text/css" href="../javascript/rating_On-Off.css" />

<script type="text/javascript">
$(function() {
        
  $(".event_cost_eu").editable("updateEconference.cfm", { 
    id   : 'id',
    name : 'event_cost_eu',
	indicator : '<img src="../img/indicator.gif">',
    data   : "{'$':'US - $','£':'UK - &pound;','EUR':'EU - &euro;','ZAR':'SA - ZAR'}",
    type   : "select",
    submit : "OK",
    style  : "inherit",
    submitdata : function() {
      return {id : <cfoutput>#getevent.id#</cfoutput>};
    }
  });
  
  $('.webdisp').editable('updateEconference.cfm', { 
        	id   : 'id',
         	name : 'webdisp',
			submit    : 'OK',
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});
  
  $('.econf_cost').editable('updateEconference.cfm', { 
        	id   : 'id',
			name : 'econf_cost',
			submit    : 'OK',
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});
  $('.econf_open').editable('updateEconference.cfm', { 
        	id   : 'id',
			name : 'econf_open',
			width:	'50px',
			submit    : 'OK',
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});
  $('.econf_close').editable('updateEconference.cfm', { 
        	id   : 'id',
			name : 'econf_close',
			submit    : 'OK',
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});
			
   $('.econf_descr').editable('updateEconference.cfm', { 
        	id   : 'id',
			name : 'econf_descr',
			width: 500,
			submit    : 'OK',
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});
	$('.edit_price').editable('updateFilePrice.cfm', { 
         	name : 'cost',
			submit    : 'OK',
			width : 35,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});		
	$('.editTitle').editable('updateTitle.cfm', { 
         	name : 'newvalue',
			submit    : 'OK',
			width: 400,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});		

  ////////////  ////////////  ////////////  ////////////  //////////////// EDIT SPEAKER 			
      var options = { 
		success:     function(){
		
		$("#areaSpeakerForm").animate( { backgroundColor: "#F6F6F6" }, "fast").css('padding','0px');
		$("#areaSpeakerForm").html("");
		} ,
		clearForm: true
    };  
    $('#addspeaker').submit(function() { 
		$(this).ajaxSubmit(options); 
		return false; 
    }); 		
  });
  function loadSpeaker(id) {
			$("#areaSpeakerForm").fadeIn("slow").load("../events/speakersForm.cfm?id="+id+"");
			$("#areaSpeakerForm").animate( { backgroundColor: "#C90900" }, "fast").css('padding','10px');
		}
	function unloadForm(){
			$("#areaSpeakerForm").html("");
			$("#areaSpeakerForm").animate( { backgroundColor: "#F6F6F6" }, "fast").css('padding','0px');
	
	}
//////////////////////////DELETE FILE 
function DeleteFile(id) {
			$.post("delete.cfm", {deleteid: id}, function(){ 
				$("#file_"+id).animate( { backgroundColor: "#fbc7c7" }, "fast").animate({ opacity: "hide" }, "slow"); 
			});
		}
//////////////////////////DELETE RECORD 
function DeleteRow(id) {
$.post("../Program/speakers_delete.cfm", {del: "rego" , id: "" ,  recordid:id }, function(){
	$("#row"+id).animate( { backgroundColor: "#fbc7c7" }, "fast").animate({ opacity: "hide" }, "slow"); 
	});
		}		
</script>
<style type="text/css">
.econf_descr { border:1px solid #999999; height:25px; width:500px}
</style>
</head>

<body>
<cfinclude template="../nav/testNav2009V2.cfm">
<div id="header">E-Conferences:: -- <span class="header_title">Full List</span></div>
<div id="outer">
	<div id="iner">
<div class="sectionHeader">Discusion Details</div>
    <div style="margin:2px 0 15px 0 ; border-bottom:1px dotted #336699"></div>    
<cfoutput>
<table border="0" cellspacing="5" width="100%" style="border:1px solid ##999999; background-color:##F6F6F6">
  <tr>
    <td width="129" align="right">&nbsp;</td>
    <td colspan="3">&nbsp;</td>
    </tr>
  <tr>
    <td align="right"><strong>Discussion name </strong></td>
    <td colspan="3">#getevent.event_name#      <!---<strong>Opening Date</strong>--->      <!---<span class="econf_open" id="#getevent.id#" >#dateFormat(getevent.econf_open, "dd mmm yyyy")#</span>---></td>
    </tr>
<!---  <tr>
    <td align="right"><strong>live on frontend</strong></td>
    <td><!---<span class="webdisp" id="#getevent.id#" ><cfif getevent.webdisp EQ 0>No<cfelse>Yes</cfif></span>---></td>
    <td><!---<strong>Closing Date</strong>---></td>
    <td><!---<span class="econf_close" id="#getevent.id#" >#dateFormat(getevent.econf_close, "dd mmm yyyy")#</span>---></td>
  </tr>--->
  <tr>
    <td align="right"><strong>Discusion cost</strong></td>
    <td width="1401">#getevent.event_cost_eu#<span class="econf_cost" id="#getevent.id#" >#numberFormat(getevent.econf_cost, "9999.99")#</span></td>
  </tr>
  <tr>
  	<td align="right"><strong>currency</strong></td>
    <td colspan="3"><span class="event_cost_eu" style="display: inline">#getevent.event_cost_eu#</span></td>

    </tr>
<!---  <tr>
    <td align="right"><strong>Discussion Description</strong></td>
    <td colspan="3"><span class="econf_descr" id="#getevent.id#" >#getevent.econf_descr#</span></td>
    </tr>--->
</table>
</cfoutput>
<div style="height:20px"></div>
<table  border="0" cellspacing="5" width="100%" bgcolor="#F6F6F6" >
  <tr>
  <td><form action="../events/speakerSave.cfm" method="post" id="addspeaker"><div id="areaSpeakerForm"></div></form> </td>
  </tr>
  </table>
  <div style="height:20px"></div>
<div class="sectionHeader">Load files to presentation</div>
    <div style="margin:2px 0 15px 0 ; border-bottom:1px dotted #336699"></div>
	 <cfoutput query="get"> 
     <div id="row#get.id#">
      <table width="100%" border="0" cellspacing="3" cellpadding="3" >
        <tr   >
          <td rowspan="2"  width="100" valign="top" style="border-bottom:1px dotted ##CCCCCC; <cfif get.speakertime NEQ "">border-right:1px dotted ##CCCCCC</cfif>">
		  		<cfif get.speakertime NEQ "">#timeformat(get.speakertime, "HH:mm")#  <!---(#get.ID# )(#get.speakerID# )---><br /><div id="upload_button_#trim(get.id)#" class="uploadButton" style="width:80px">Load File</div></cfif>
          </td>
          <td   style=" <cfif get.speaker EQ 0>padding:5px; background-color:##eeeeee ; border-bottom:1px dotted ##d6d6d6 ; </cfif> <cfif get.speaker EQ 1>font-weight:normal;  color:##0099CC;vertical-align:bottom; height:35px" valign="bottom</cfif>">
				  <cfif get.decription NEQ ""><strong class="editTitle" id="#trim(get.id)#">#get.decription#</strong><br />
				  <cfif get.name NEQ "" ><a href="javascript:loadSpeaker(#get.speakerID#)" >#trim(get.name)#, #trim(get.delegation)#</a>
                  </cfif></cfif>
          </td>
          <td width="30" align="center"><cfif get.speaker EQ 0><a href="javascript:DeleteRow(#get.id#);" title="delete presentation"><img src="../img/cross_circle.gif" width="13" height="14" alt="Delete presentation" /></a></cfif></td>
        </tr>
        <tr>
          <td style="border-bottom:1px dotted ##CCCCCC;" colspan="2">
          <div id="loadFIle#trim(get.id)#"><cfinclude template="loadfiles.cfm"></div>          </td>
        </tr>
      </table>
      </div>
      </cfoutput> 
  </div>
</div>

    <script type="text/javascript">
	$(document).ready(function() { 
		<cfoutput query="get">	
						<cfif get.speaker NEQ 1>
						new AjaxUpload('##upload_button_#get.id#', {
					  action: 'formsubmit.cfm',
					  name: 'docsfilename',
					  data: {  speakerid : '#get.id#'   },
					  autoSubmit: true,
					  responseType: false,
					  onChange: function(file, extension){},
					  onSubmit: function(file, extension) {$('##upload_button_#get.id#').html("<img src=../img/ProgressBar_transparent.gif width=50 >");},
					  onComplete: function(file, response) {$('##upload_button_#get.id#').html("File Loaded..."); $('##loadFIle#trim(get.id)#').append(response);}
					});
					</cfif>
		</cfoutput>
	});
	</script>
</body>
</html>