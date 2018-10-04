    <cfinclude template="../application.cfm">
<cfquery datasource="#gpp#" name="get">
 	select  *
	from CRM_InvoiceNotes
	WHERE InvoiceID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#" >
</cfquery>

<script type="text/javascript">
$(document).ready(function(){
	<!---  		$.htmlClean.defaults.format = true;
            $.ui.htmlInput.defaults.styleUrl = "editor.css";
            $("#comment").htmlInput();--->
	
    $('#Transaction_History_Form').submit(function() { 
	<!---	$('form').bind('form-pre-serialize', function(e) {
					tinyMCE.triggerSave();
					});--->
		$(this).ajaxSubmit({ success:  Load_History_Returned, clearForm: false  }); 
		return false;
    });
});
function Load_History_Returned(data){
		$("#Invoice_history_Table tr:first").before(data);
		$("#InvoiceNoteComment").html("");
}
$("#InvoiceNoteComment ").charCounter(2000, {	format: "%1 of 2000"});
</script>
<!---<script type="text/javascript" src="../javascript/htmlInput/jquery.htmlInput-min.js"></script>
<script type="text/javascript" src="../javascript/htmlInput/jquery.htmlClean-min.js"></script>
<link type="text/css" href="../javascript/htmlInput/ui.htmlInput.css" rel="Stylesheet" />--->
<style type="text/css">
#Invoice_history_Table .header { padding:15px 10px 3px 10px; font-size:10px;border-bottom:1px dotted #ccc; color:#000099 }
#Invoice_history_Table .InvoiceNoteComment { padding:10px; border-bottom:1px dotted #999999}
</style>
<form method="post" action="Invoices_History_save.cfm" id="Transaction_History_Form">
<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
    <td>Add comment</td>
    <td align="right"><input type="hidden" value="<cfoutput>#form.id#</cfoutput>" name="id" /><input type="submit" value="add comment" /></td>
  </tr>
  <tr>
    <td colspan="2"><textarea name="InvoiceNoteComment" id="InvoiceNoteComment" style="width:300px; height:90px"></textarea></td>
    </tr>
</table>
</form>
<div style="overflow:auto; height:250px; ">
<table border="0" cellpadding="4" cellspacing="1" id="Invoice_history_Table" width="100%"><cfoutput query="get">
	<tr bgcolor="###iif(currentrow MOD 2,DE('ffffff'),DE('f8f8f8'))#">
    	<td class="header">#DateFormat(get.InvoiceNoteDate, "dd mm yyyy")# / #get.staffName#</td>
   </tr>
   <tr bgcolor="###iif(currentrow MOD 2,DE('ffffff'),DE('f8f8f8'))#">
   		<td class="comment">#get.InvoiceNoteComment#</td>
    </tr></cfoutput>
<tr>
    	<td class="header"></td>
   </tr>
   <tr>
   		<td class="comment"></td>
    </tr>
 </table>
</div>
<!----<script type="text/javascript" src="../Javascript/tiny_mce/jscripts/tiny_mce/tiny_mce.js"></script>--->
<!---if (tinyMCE.getInstanceById('comment'))
{
   tinyMCE.execCommand('mceAddControl', false, 'comment');
}
tinyMCE.addMCEControl(document.getElementById("comment"), "comment");--->
<!---
$(function() {
$('textarea.tinymce').tinymce({
// Location of TinyMCE script
script_url : '../Javascript/tiny_mce/jscripts/tiny_mce/tiny_mce.js',
// General options
theme : "simple"
});
});--->