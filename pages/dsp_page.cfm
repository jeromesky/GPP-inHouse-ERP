<cfoutput query="qryPage">

<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>

<h1>EDIT Content </h1>

<FORM METHOD=POST ACTION="?fa=update" id="editForm" name="editForm">

<table cellspacing=2 cellpadding=2 width=1200>
<tr>
<td class='label'> <b>Name:</b> </td> 
<td class='edit'> <input type="text" name="Title" SIZE="100" MAXLENGTH="200" VALUE="#CONTENTName#"></td>
</tr>
<tr>
<td class='label'> <b>Label:</b> </td> 
<td class='edit'> <input type="text" name="Title" SIZE="80" MAXLENGTH="200" VALUE="#CONTENTLABEL#"></td>
</tr>
<tr>
<tr>
<td class='label' align='top'> <b>Columns:</b> </td> 
<td class='edit'><select name='layout'>
  <option>-- select layout: </option>
  <option>- 2 Columns</option>
  <option value="4|8" <cfif trim(CONTENTLAYOUT) EQ '4|8'>selected='selected'</cfif>>4 | 8</option>
  <option value="8|4" <cfif trim(CONTENTLAYOUT)  EQ '8|4'>selected='selected'</cfif>>8 | 4</option>
  <option value="6|6" <cfif trim(CONTENTLAYOUT)  EQ '6|6'>selected='selected'</cfif>>6 | 6</option>
  <option>- 3 Columns</option>
  <option value="4|4|4" <cfif trim(CONTENTLAYOUT) EQ '4|4|4'>selected='selected'</cfif>>4 | 4 | 4</option>
  <option>- 4 Columns</option>
  <option value="3|3|3|3" <cfif trim(CONTENTLAYOUT) EQ '3|3|3|3'>selected='selected'</cfif>>3 | 3 | 3 | 3</option>
</select>
</td>
</tr>
<tr>
<td class='label' valign='top'> <b>Content:</b> </td>
<td class='edit'>

	<div id="topSpace">
	</div>

<div id="row"><cfloop from=1 to=#col.maxColumn# index='vv'>
  <div style="float: left;"><textarea id="editor#editNum#" name="editor#editNum#">#Evaluate("contentHTML#vv#")#</textarea></div>
<cfset editNum = EditNum+1></cfloop></div>
  <div style="clear: both;"></div>
	<div id="bottomSpace">
	</div>

</td>
</tr>
<tr>
<TD bgcolor='##FEA'> Delete </td> 
<td class='edit'> <a xhref="?fa=remove&recordID=#contentID#">Click here</a> </td>
</tr>

<input type="Hidden" Name="id" value="#contentID#">

</form>
</table>
 
	<script type="text/javascript">
	//<![CDATA[

		// Create all editor instances at the end of the page, so we are sure
		// that the "bottomSpace" div is available in the DOM (IE issue).

		CKEDITOR.replace( 'editor1',
			{
        
        toolbar : 'Basic',
				sharedSpaces :
				{
					top : 'topSpace',
					bottom : 'bottomSpace'
				},

				// Removes the maximize plugin as it's not usable
				// in a shared toolbar.
				// Removes the resizer as it's not usable in a
				// shared elements path.
				removePlugins : 'maximize,resize'
			} );
			
		CKEDITOR.replace( 'editor2',
			{
				sharedSpaces :
				{
					top : 'topSpace',
					bottom : 'bottomSpace'
				},

				// Removes the maximize plugin as it's not usable in a shared toolbar.
				// Removes the resizer as it's not usable in a shared elements path.
				removePlugins : 'maximize,resize'
			} );

		CKEDITOR.replace( 'editor3',
			{
				sharedSpaces :
				{
					top : 'topSpace',
					bottom : 'bottomSpace'
				},

				// Removes the maximize plugin as it's not usable in a shared toolbar.
				removePlugins : 'maximize'
			} );

		CKEDITOR.replace( 'editor4',
			{
				sharedSpaces :
				{
					top : 'topSpace',
					bottom : 'bottomSpace'
				},

				// Removes the maximize plugin as it's not usable in a shared toolbar.
				removePlugins : 'maximize'
			} );			
	//]]>
	</script>

</cfoutput>