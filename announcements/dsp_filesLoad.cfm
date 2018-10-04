<cfparam name="url.filename" default="null">

<cfoutput>
<div align="left">

<fieldset>
  <legend>File <cfif url.FA EQ 'fileUpdate'>Update<cfelse>Upload</cfif></legend>

<form action="?" method="post" enctype="multipart/form-data">
<input type="hidden" name="fa" value="fileFTP">
<cfif url.filename NEQ 'null'><input type="hidden" name="filename" value="#url.filename#"></cfif>
Select <cfif url.FA EQ 'fileUpdate'>replacement<cfelse>a</cfif> file: <br>

<input type="file" name="uploadfile"><br>
<input type="submit" value="Upload File"><br>
</form>

</fieldset>

</div>
</cfoutput>