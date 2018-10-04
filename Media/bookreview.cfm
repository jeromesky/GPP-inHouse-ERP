<script type="text/javascript">
  tinyMCE.init({ mode : "none"});
</script>
<script type="text/javascript">
	tinyMCE.init({
		// General options
		mode : "exact",
		elements : "content",
		theme : "advanced",
		skin : "o2k7",
		skin_variant : "black",
		cleanup_on_startup : true,
		cleanup : true,
		plugins : "safari,pagebreak,style,layer,table,save,advhr,advimage,advlink,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",
		// Theme options
		theme_advanced_buttons1 : "pastetext,pasteword,|,bullist,numlist,|,bold,italic,underline,|,undo,redo,|,link,image,cleanup,help,code",
		theme_advanced_buttons2 :"",
		theme_advanced_buttons3 :"",
		theme_advanced_buttons4 :"",
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "left",
		theme_advanced_statusbar_location : "bottom",
		theme_advanced_resizing : true,
		// Example content CSS (should be your site CSS)
		content_css : "css/content.css",
		// Drop lists for link/image/media/template dialogs
		template_external_list_url : "lists/template_list.js",
		external_link_list_url : "lists/link_list.js",
		external_image_list_url : "lists/image_list.js",
		media_external_list_url : "lists/media_list.js",
		// Replace values for the template plugin
		template_replace_values : {
			username : "Some User",
			staffid : "991234"
		}
	});
</script>

     
     <cfquery datasource="#dsnP21#" name="getboob">SELECT id, title FROM media ORDER BY title</cfquery>
     <table width="800" border="0" cellspacing="4">
        <tr>
         <td colspan="4"><cfif parameterexists(form.bookid)><span style="color:#CC3300">Review Added</span>  </cfif>       </td>
         <td width="170" rowspan="7" valign="top" style="border-left:1px dotted #336699">
              	<ul>
				<cfoutput query="getboob">
        <li > <a href="javascript:listLoad(#getboob.id#);">#getboob.title#</a></li>
		</cfoutput>
        </ul>         </td>
        </tr>
       <tr>
         <td>Review for</td>
         <td width="222">
         <select name="bookid" id="bookid">
           <cfoutput query="getboob">
             <option value="#getboob.id#">#getboob.title#</option>
           </cfoutput>
         </select></td>
         <td width="92">Review Title</td>
         <td width="198"><input type="text" name="title" maxlength="150" /></td>
       </tr>
       <tr>
         <td>link to original</td>
         <td><input type="text" name="link" maxlength="150" /></td>
         <td>U-tube link</td>
         <td><input type="text" name="utube" maxlength="400" /></td>
       </tr>
       <tr>
         <td>date published</td>
         <td><input type="text" name="publishdate"  /><img src="../img/calendar_24.gif" border="0" onclick="scwShow(scwID('publishdate'),event,3);" /></td>
         <td>&nbsp;</td>
         <td>&nbsp;</td>
       </tr>
       <tr>
         <td width="85">Review</td>
         <td>&nbsp;</td>
         <td>Publisher</td>
         <td><label>
           <input type="text" name="source" maxlength="80" />
         </label></td>
       </tr>
       
       
       <tr>
         <td colspan="4"><textarea name="content" style="width:600px; height:200px;"></textarea></td>
         </tr>
       
       <tr>
         <td>&nbsp;</td>
         <td>&nbsp;</td>
         <td>&nbsp;</td>
         <td>
           
             <input type="submit" name="button2" id="button2" value="Submit" />         </td>
         </tr>
     </table>
