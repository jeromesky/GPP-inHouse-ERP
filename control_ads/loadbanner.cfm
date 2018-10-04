<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script>

function checkFields() {

  if (document.form.img.value == "") 
  {
   alert("loading a Banner is required");
    return false;
  }
document.form.submit();

}
</script>
<cfif parameterExists(form.img)>
<cffile action="upload" 
        filefield="Form.img" 
		
		destination= "G:\websites\petro21\htdocs\advertising\"
        accept="image/swf, image/jpeg, image/gif" 
		nameconflict="MakeUnique">
		<cfset uploadedimg = #File.ServerFile#>
		<cflocation url="addbanner.cfm?uploadedimg=#uploadedimg#">
</cfif>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>www.petro21.com</title>
</head>

<body>
<form name="form" action="loadbanner.cfm" enctype="multipart/form-data" method="post">
  <table  width="60%" height="87" border="0" cellpadding="0" cellspacing="2">
    <tr>
      <td colspan="2" align="center"> Browse and Upload New Banner </td>
    </tr>
    <tr>
      <td> Load Banner </td> 	
      <td> <input type=file name="img"> </td>
	</tr>
    <tr>
	  <td align="center" colspan="2"> <input type=button value=load onClick="javascript:checkFields();" /> </td>
	</tr>
  </table>
</form>
</body>
</html>