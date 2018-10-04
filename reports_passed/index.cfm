<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<script type='text/JavaScript' src='../javascript/scw.js'></script>
<script type="text/javascript" src="../javascript/jquery.js" ></script>
<script type="text/javascript" src="../javascript/jquery.form.js"  ></script>
<script type="text/javascript" src="../Javascript/jeditable.js" ></script>
<script type="text/javascript" src="../Javascript/jquery.maskedinput.js" ></script>
<script type="text/javascript" src="../Javascript/jquery.jeditable.masked.js" ></script>
<link type="text/css" href="http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/jquery-ui-1.7.2.custom.css" rel="stylesheet" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/jquery-ui-1.7.2.custom.min.js"></script>
<script language="javascript">
// prepare the form when the DOM is ready 
$(document).ready(function() { 
	$('#tabs').tabs();

    var options = { 
        success:  loadList,    
        clearForm: true        // clear all form fields after successful submit 
    };  
    $('#reports').submit(function() { 
		$(this).ajaxSubmit(options); 
		return false; 
    }); 
});  
		function LoadForms() {
			$("#area_PANE_Fields").load("dsp_report.cfm");
			$("#area_PANE_Filters").load("dsp_filter.cfm");
			$("#area_PANE_Events").load("dsp_EventsPage.cfm");
		}
		function loadList() {
			//$("#areaResult").load("dsp_results.cfm");
		}
</script>

<link href="../styles/styles.css" rel="stylesheet" type="text/css" />
 <style type="text/css">
<!--
.checklist li {
	background: none;
	padding-left: 0;
}
/* CSS for checklists */
	.checklist {
	border: 0px solid #ccc;
	list-style: none;
	height: 470px;
	overflow: auto;
}
.checklist, .checklist li {
	margin-left: 0;
	padding: 0;
	font-size:90%;
}
.checklist label {
	display: block;
	padding-left: 0px;
	text-indent: -25px;
}
.checklist label:hover, .checklist label.hover {
	background: #6fc0ea;
	color: #fff;
}
* html .checklist label {
	xheight: 1%;
}
/* Checklist 2 */
	.cl2 {
	}
.cl2 input {
	vertical-align: middle;
}
.cl2 label {
	padding: 0.0em 0.0em 0.0em 24px;
}
.cl2 label:hover, .cl2 label.hover {
	background: #6fc0ea; 
	color: #fff;
}

#tableResult td {border-bottom:1px solid #AEE3FF; }
.columnFieldset { display:block; float:left; width:300px; height:520px}
.columnFieldset_Filter_Page { display:block; float:left; width:160px; height:520px; overflow:visible}
#Fieldset_Events{ display:block; float:left; width:500px; height:520px }
#Fieldset_AttendType{ display:block; float:left; width:200px; height:320px }
.areaFilter { height:260px; overflow:hidden}
-->
</style> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>P21.com - My Office - Reports</title>
</head>

<body onload="javascript:loadList();javascript:LoadForms();">
<cfinclude template="../nav/testNav2009V2.cfm">
<div id="outer">
	<div id="iner">

<form action="dsp_results.cfm" method="post" id=reports"> 
<div id="tabs">
			<ul>
		<li><a href="#Fields">Output / Fields</a></li>
		<li><a href="#filter">Personal Filter Options</a></li>
                <li><a href="#Events">Events</a></li>
                <li><a href="#Result">Results</a></li>
                <li><a href="#Queries">Saved Queries</a></li>
                <li><a href="#invoice">Invoice</a></li>
			</ul>
            <div id="Fields">
                    <div id="area_PANE_Fields"></div>
            </div>
            <div id="filter" >
                    <div id="area_PANE_Filters"></div>
            </div>
            <div id="Events" >
                    <div id="area_PANE_Events"></div>
                    <div class="clear"></div>
            </div>
            <div id="Result" >
            	<!--- navigation Bar --->
  			<fieldset style="width:900px; left:200px;">
                        <legend >Results to ... </legend>
					<br/>
				<label><input name="output_layout" type="radio" value="print" checked />Print List</label><br>
                        <label><input name="output_layout" type="radio" value="badges" />Badge*</label><br>
               		<label><input name="output_layout" type="radio" value="cards" />Registration Cards*</label>
				<br/>
                            <input type="submit" name="output_format" value=".htm" />
                            <input type="submit" name="output_format" value=".xls" />
                            <input type="submit" name="output_format" value=".pdf" />
                            <input type="submit" name="output_format" value=".sql" />
				<font size="-2px;" color=red>* = Fixed Format Layout, column settings, are fixed</font><br>

                   </fieldset>
            	<div id="areaResult"></div>
                   <div class="clear"></div>
            </div>
            <div id="Queries">
            </div>
            <div id="invoice" >
            </div>
</div> 
</form>
	</div>
</div>
 
   <script type="text/javascript">
		/*-----------------------------------------------------------+
		 | addLoadEvent: Add event handler to body when window loads |
		 +-----------------------------------------------------------*/
		function addLoadEvent(func) {
			var oldonload = window.onload;
			
			if (typeof window.onload != "function") {
				window.onload = func;
			} else {
				window.onload = function () {
					oldonload();
					func();
				}
			}
		}
		/*------------------------------------+
		 | Functions to run when window loads |
		 +------------------------------------*/
		addLoadEvent(function () {
			initChecklist();
		});
		/*----------------------------------------------------------+
		 | initChecklist: Add :hover functionality on labels for IE |
		 +----------------------------------------------------------*/
		function initChecklist() {
			if (document.all && document.getElementById) {
				// Get all unordered lists
				var lists = document.getElementsByTagName("ul");
				for (i = 0; i < lists.length; i++) {
					var theList = lists[i];
					
					// Only work with those having the class "checklist"
					if (theList.className.indexOf("checklist") > -1) {
						var labels = theList.getElementsByTagName("label");
						
						// Assign event handlers to labels within
						for (var j = 0; j < labels.length; j++) {
							var theLabel = labels[j];
							theLabel.onmouseover = function() { this.className += " hover"; };
							theLabel.onmouseout = function() { this.className = this.className.replace(" hover", ""); };
						}
					}
				}
			}
		}
	</script>
</body>
</html>