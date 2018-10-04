<cfinclude template="../Application.cfm" >
<cfset listOfMustKeep = "34,29,19,26,6">
<cfquery datasource="#dsnP21#" name="get">
SELECT id, name, filename 
FROM MailOut_template 
Where name is not null 
and filename is not null
</cfquery>

<script type="text/javascript">
<!---$(document).ready(function() { //form for the file upload
		$('#FormTemplate').submit(function() { 
				$(this).ajaxSubmit({ success: loadTemplateList, clearForm: true });
				return false; 
		});
});
--->
function deleteTemplate(id) {
		$.post("delete.cfm", { id: id , choose: "template"}, function(){  $("#rec"+id).animate( { backgroundColor: "#fbc7c7" }, "fast").animate({ opacity: "hide" }, "slow"); });
}

$(function() {
		$("#new_Template, button, input:submit, a", "#toolbar_template").button();
		$("#repeat").buttonset();
}

$(function() {
		$('#B_refreshList, #new_Template').button({ text: true,	});
	});
</script>

<div id="toolbar_template" class="ui-widget-header ui-corner-all">
		<a href="javascript:loadTemplateForm();" id="B_new_Template">Upload new Template </a>
    <a href="javascript:loadTemplateList();" id="B_refreshList">Refresh List</a>
    <a href="javascript:loadImageForm();" id="B_new_Upload">Upload image</a>
</div>
<form id="FormTemplate" name="name" method="post" action="templateForm.cfm" enctype="multipart/form-data">
<div id="areaTemplate"></div></form>
<table border="0" cellspacing="2" cellpadding="0">
<cfoutput query="get">
  <tr id="rec#get.id#" onMouseOver="style.backgroundColor='##e8f2f9';" onMouseOut="style.backgroundColor='##ffffff';">
    <td width="350">#get.name#</td>
    <td width="200">#get.filename#</td>    
    <td width="20"><a href="javascript:loadEditTemplate(#get.id#);"><img src="../img/new_edit.gif" border="0"></a></td>
    <td width="20"><cfif NOT listContains(listOfMustKeep, get.id, ",")><a href="javascript:deleteTemplate(#get.id#);"><img src="../img/new_delete.gif" border="0"></a></cfif></td>
  </tr></cfoutput>
</table>

<script type="text/javascript">
	$(function() {
		$('#B_refreshList, #B_new_Template, #B_new_Upload').button({ text: true, });
	});
</script>