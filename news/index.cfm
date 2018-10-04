
<cfinclude template="act_newsletterMenu.cfm">
<cfinclude template="qry_index.cfm">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="../javascript/jquery.js" ></script>
<script type="text/javascript" src="../javascript/jquery.form.js"></script>
<script type="text/javascript" src="../javascript/Jeditable.js"></script>
<script type="text/javascript" src="../javascript/interface.js"></script>
<script type="text/javascript" src="../javascript/fileUpload.js"></script>
<link type="text/css" href="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.css" rel="stylesheet" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.min.js"></script>
<cfoutput>

<script type="text/javascript" >


function addCount(){
		addcounter = (addcounter + 1);
		$("##counter").html(addcounter);
}

function subtractCount(){
		addcounter = (addcounter - 1);
		$("##counter").html(addcounter);
}




function deleteFilter(id) {
		$.post("filter_save.cfm", { id: id }, function() { $("##filter_"+id).animate( { backgroundColor: "##fbc7c7" }, "fast").animate({ opacity: "hide" }, "fast");  }  ); 
}
function deleteSearchTitle(id) {
		$.post("editTitles.cfm", { id: id }, function() { $("##SearchTitle_"+id).animate( { backgroundColor: "##fbc7c7" }, "fast").animate({ opacity: "hide" }, "fast");  }  ); 
}
function searchTitleManuel(searchString, newsletterID) {
		$.post("news_search_Pipes.cfm", { searchString: searchString, newsletterID : newsletterID }, function(responseText){  $('##areaNewsResult').prepend(responseText); } ); 
}


function deleteColected(id) {
		$.post("news_delete.cfm", { id: id }, function () { 
		//removeRow(id);
		removeRow("Colleted_", id)
		subtractCount();
		//$("##Colleted_"+id).animate( { backgroundColor: "##fbc7c7" }, "fast").animate({ opacity: "hide" }, "fast"); 
		});
}
function loadNewSearchTitle(data){
		$('##NewsTitleArea').fadeIn("fast").prepend(data);
		}
function loadNewSearchTitlePreset(data){
		$('##NewsTitleAreaPreset').fadeIn("fast").prepend(data);
		}
		
function loadResult(responseText){
		$('##areaNewsResult').fadeIn("fast").prepend(responseText);
		$('##progressBar_Q').fadeOut("fast").html("");
		}
		
		
<!---function removeRow(rowID){
	$("##row_"+rowID).animate( { backgroundColor: "##fbc7c7" }, "fast").animate({ opacity: "hide" }, "fast"); 
}--->

 function loadNewFilter(responseText){
		$('##filterWords').fadeIn("fast").prepend(responseText);
}	

function showNewArticle(data, title){
	$("##selectNews").prepend("<div class=selectedNewsResult id=Colleted_" + data + " onClick=javascript:deleteColected(" + data + ");  onmouseover=this.className=\'selectedNewsResultOn\'  onMouseOut=this.className=\'selectedNewsResult\'>" + title +"</div>"); 	
}


$(document).ready(function() { 	

	<cfloop query="get">
				$.post("news_search_Pipes.cfm", { searchString: "#get.newsName#", searchid: #get.id#, newsletterID : #newsletter.id#, maxdisplay:#NewsletterOptions.searchBackdays#}, function(responseText){  $('##areaNewsResult').append(responseText); });
	</cfloop><!------>
	
	///SET THIS newsletterID
	var newsletterID  = #newsletter.id#;

	$('form').live('submit', function() { 
			var get_row = $(this).attr("id");
			var get_title = $('##title'+get_row).html();
			var get_selectNewsID = $("##news_cat", this).val();
				$(this).ajaxSubmit( { success: function(data){ 
						
						 
						if (get_selectNewsID == newsletterID ){
							addCount();
							showNewArticle(data, get_title);
							removeRow("row_", get_row);
						} else {
							alert("article added to an other newsletter");
						}
					} 
				}); 
			return false; 
	}); 

	// Reset Font Size
	$('.fontSizer').click(function(){
			var ourText = $('.newsTitle');
			var currFontSize = ourText.css('fontSize');
			var finalNum = parseFloat(currFontSize, 10);
			var stringEnding = currFontSize.slice(-2);
			if(this.id == 'large') {
				finalNum *= 1.2;
			}
			else if (this.id == 'small'){
				finalNum /=1.2;
			}
			ourText.css('fontSize', finalNum + stringEnding);
		});


	//var options = { success: loadNewSearchTitle, clearForm: false  };  
    $('##FormNewTitle').submit(function() { 
		$(this).ajaxSubmit({ success: loadNewSearchTitle, clearForm: false});
		return false; 
    });
   //var options = { success: loadNewSearchTitlePreset, clearForm: false  };  
    $('##FormNewTitlePreset').submit(function() { 
		$(this).ajaxSubmit({ success: loadNewSearchTitlePreset, clearForm: false  });
		return false; 
    });
	
	
	$('##filterForm').submit(function() { 
		$(this).ajaxSubmit({ success: loadNewFilter, clearForm: false });
		$("##filter").val("");
		return false; 
    });

	var $scrollingDiv = $("##podSelectedNews");
 
		$(window).scroll(function(){			
			$scrollingDiv.stop().animate({"marginTop": ($(window).scrollTop() - 15) + "px"}, "fast" );			
		});
	
});	


$(document).ready(function() { 


	$(".sendDay").live('change', function(){
			var selected = new Array();
		
			$(".sendDay:checked").each(function() {
			    selected.push($(this).val());
			   
		  });
		  $.post("Update_newsletter.cfm", { "sendDay": selected, "newsletterID" : #newsletter.id# } ); 
			
	});
					
					
	new AjaxUpload('##upload_button', {
	  action: 'Update_newsletter.cfm',
	  name: 'newsletterBanner',
	  data: {  newsletterID : '#newsletter.id#'   },
	  autoSubmit: true,
	  responseType: false,
	  onChange: function(file, extension){},
	  onSubmit: function(file, extension) {$('##upload_button').html("<img src=../img/ProgressBar_transparent.gif width=50 >");},
	  onComplete: function(file, response) {$('##upload_button').html("File Loaded..."); }
	});
					
	$('##options, ##filterWords, ##OtherNewsletters, ##NewsTitleArea, ##NewsTitleAreaPreset').hide();
	
	$('a##OMST').click(function(){
	$('##NewsTitleAreaPreset').toggle("fast");
		return false;
	});
	
	$('a##ONTA').click(function(){
	$('##NewsTitleArea').toggle("fast");
		return false;
	});
	
	$('a##OKW').click(function(){
	$('##filterWords').toggle("fast");
		return false;
	});
	
	$('a##Opt').click(function(){
	$('##options').toggle("fast");
		return false;
	});
	
	$('a##ONL').click(function(){
	$('##OtherNewsletters').toggle("fast");
		return false;
	});
	
	//var options = { success: loadResult, clearForm: false  };  
    $('##QuickSearch').submit(function() { 
		$(this).ajaxSubmit({ success: loadResult, clearForm: false  });
		//$("##searchString").val("");
		$('##progressBar_Q').fadeIn("fast").html("<img src=../img/ProgressBar_transparent.gif />");
		return false; 
    });
	
	
			
			var fieldText = '.searchBackdays, .live, .numrecordsSearch, .numrecordsDisplay, .sendTime';

		$(fieldText).editable(submitEdit, { 
            height 		: 20,
			width		: 25,
			type 			: "text",
			indicator 	: '<img src="../img/indicator.gif">',
            tooltip   	: "Click to edit...",
            onblur 		: 'submit',
			style			: 'display: inline'
	
			});
		
			function submitEdit(value, settings)
			{ 
		   var postValue 	= new Object();
		   var newValue 	= value;
		   var fieldname 	= $(this).attr("class");
		   var id 				= $(this).attr("id");
		   postValue = {"newsletterID" : id, "value": value,  "fieldname" : fieldname, "nocache": randomnumber}; 
		   var returned = $.ajax({
			   url			: "../news/Update_newsletter.cfm", 
			   type		: "POST",
			   data 		: postValue,
			   cache	: "false",
			   dataType: "json",
			   success	: function(data, textStatus, jqXHR) {
									var jsonData = eval(data);
									if ( jsonData.status == 1 ) {
										//growl("Update", 'data updated successfully', 'message', 'ui-icon ui-icon-check', 'notice');
									}
									if ( jsonData.status == 2 ) {
										//growl("communication error", 'data change not saved', 'message', 'ui-icon ui-icon-check', 'error');
										$("."+fieldname).html("some error do something");
									}
			   			},
			   error		: function(jqXHR, textStatus, errorThrown){
							$("."+fieldname).html("soem error");
			   			}
			});
	   return(newValue);
		}
					

});
</script>
</cfoutput>

<style type="text/css">
<!--
.increaseFont, .decreaseFont {cursor: pointer}
.newsTitle{width:322px}
.newsTitle a{ font-size:1em}
.newsSource{width:130px; color:#666;}
.newsDate{width:50px; color:#999}
.newsSelect {width:20px}
.newsHeader{background-color:#06C; color:#fff}
.newsHilight{color:#06C}
select{width:60px; min-width:60px; max-width:60px}
.newsletterid{ width:60px; min-width:60px; max-width:60px}
select.newsletterid{ width:60px; min-width:60px; max-width:60px}
a:link {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 13px;
	color:#333333;
	text-decoration:none;
}
a:hover {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 13px;
	color: #006699;
	text-decoration: underline;
}

#areaNewsResult {  padding:0; }
#areaManualSearch { }
.selectedNewsResult { font-size:12px; margin:4px 0 0 0; border-bottom:dotted 1px #0066FF }
.selectedNewsResult  span{ font-size:8px }
.selectedNewsResultOn { margin:4px 0 0 0; border-bottom:dotted 1px #0066FF; padding:5px; background-color:#FFBABA; font-size:14px; cursor:pointer }
.selectedNewsResultH { margin:4px 0 0 0; border-bottom:dotted 1px #0066FF; padding:3px; background-color:#CC3333; cursor:pointer; font-size:13px }
.live, .newsHeaderTitle, .searchBackdays, .numrecordsSearch, .companyline, .darkheaderText, .numrecordsDisplay, .sendDay, .sendTime, .headerline{ margin:0 0 0 5px; padding:0 8px 0 8px; border:#999999 1px solid; }
legend {margin:10px 0 10px 0}
.headerButton{ float:right }
.headerButton span { margin-right:8px; padding:0px 5px}
.headerTitle{ float:left; width:60%}
-->
</style>
<title><cfoutput>#NewsletterOptions.newsletter#</cfoutput></title>
<link href="../styles/indexV2.css" rel="stylesheet" type="text/css">
</head>

<body>
<cfinclude template="../nav/testNav2009V2.cfm">
<div id="outer">
	<div id="iner">
    
    	<div class="index"><a name="top"></a>
            <sup class="displayLabel">Newsletter</sup>			
        <sup class="displayData"><cfoutput>#NewsletterOptions.newsletter#</cfoutput></sup>
            <sup class="displayLabel">Quick Search</sup>
            <form action="news_search_Pipes.cfm" id="QuickSearch" name="QuickSearch" method="post">			
            <sup class="displayData">
                <input type="text" name="searchString" id="searchString" style="width:140px;margin:0px;"/> 
                <input type="hidden" name="newsletterID" value="<cfoutput>#newsletter.id#</cfoutput>" />
                <button style="padding:2px 8px">search</button>
            </sup>
            </form>
            <sup class="displayLabel"><div id="progressBar_Q"></div></sup>
            <sup class="displayData"><a name="top"></a></sup>
            <div class="clear"></div>
        </div>
<div style="height:20px"></div>   
<div class="c8 ui-corner-all  ui-widget ui-widget-content" id="areaNewsResult">
 
</div>

<div class="c4">
<div class="scrollNav">
    <div id="areaManualSearch"  class="ui-corner-all marginBottom15  ui-widget ui-widget-content  podForm podBgFade_bl">
        <table width="100%" border="0" cellspacing="4" cellpadding="2" style=" font-size:12px; color:#333333; ">
        <tr>
        <td><strong>Options</strong><a href="#" id="Opt"> (click to open)</a></td>
        </tr>
      <tr>
        <td>
        <div id="options" >
        <cfoutput>
        <fieldset >
            <legend>Options for #NewsletterOptions.newsletter#</legend>
            <a href="index.cfm">Go back to view selected</a><br />
            <div class="clear" style="height:5px"></div>
            <a href="editTitles.cfm?id=#newsletter.id#">Change search titles</a><br />
            Is Newsletter live:: <span class="live" id="#newsletter.id#">#SelectedNewsletter.live#</span> <span style="color:##666666"> 1 for on, 0 for off</span><br />
    
        </fieldset>
        <fieldset >
            <legend>Display options</legend>
            Number of days back to display from search : <span class="searchBackdays" id="#newsletter.id#">#SelectedNewsletter.searchBackdays#</span><br />
            <div class="clear" style="height:5px"></div>
            Number of results to display from search : <span class="numrecordsSearch" id="#newsletter.id#">#SelectedNewsletter.numrecordsSearch#</span><br />
            <div class="clear" style="height:5px"></div>
            Number of news to dislpay on newsletter : <span class="numrecordsDisplay" id="#newsletter.id#">#SelectedNewsletter.numrecordsDisplay#</span><br />
        </fieldset>
        <fieldset >
            <legend>When to send out Newsletter</legend>
             <cfloop from="1" to="7" index="i">
             <label><input type="checkbox" class="sendDay" name="sendDay" id="#i#" value="#i#" <cfif SelectedNewsletter.sendDay contains i >checked</cfif>> #DayOfWeekAsString(i)#</label><br />
             </cfloop>
             <span class="sendDay" id="#newsletter.id#"><!---#DayOfWeekAsString(SelectedNewsletter.sendDay)#---></span><br />
             <div class="clear" style="height:5px"></div>
             Hour of Day : <span class="sendTime" id="#newsletter.id#">#SelectedNewsletter.sendTime#</span> <span style="color:##666666">time in 24 hour format, 1 - 23</span><br />
        </fieldset>
        <fieldset >
            <legend>load newsletter banner</legend>
      
            <div id="upload_button" class="uploadButton" style="width:80px; float:right">Load File</div>
        </fieldset></cfoutput>
        </div>
        </td>
        </tr>
    </table>
    </div>

    <div class="ui-corner-all marginBottom15  ui-widget ui-widget-content  podForm podBgFade">
    <table width="100%" border="0" cellspacing="4" cellpadding="2" style=" font-size:12px; color:#333333;">
      <tr>
        <td colspan="3"><strong>Edit News Search Titles</strong> <a href="#" id="ONTA">(click to open)</a></td>
        </tr>
            <form action="editTitles.cfm" id="FormNewTitle" name="FormNewTitle" method="post">
          <tr>
        <td>Add new title</td>
        <td><input type="text" name="newsName" id="newsName" style="width:140px" /> <input type=hidden name="newsletterID" value="<cfoutput>#newsletter.id#</cfoutput>" /></td>
        <td><button >Add</button></td>
      </tr>
            </form>
      <tr>
        <td colspan="3">
        <div id="NewsTitleArea">
        <cfoutput query="get">
    <div id="SearchTitle_#get.id#"><a href="javascript:deleteSearchTitle(#get.id#);"><img src="../img/new_delete_mini.gif" border="0"></a> #get.newsName# (#get.noResult#)</div></cfoutput>
        </div></td>
        </tr>
    </table>
    </div>

<cfinclude template="dsp_selectedNews.cfm">

</div>
</div>



<div style="clear:both"></div>

<cfinclude template="../_display/dsp_footer.cfm">