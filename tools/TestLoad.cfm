<cfinclude template="../Application.cfm">
<cfif parameterexists(form.userfile) >

<cffile action="upload" filefield="form.userfile" destination="G:\websites\my-office\tools" nameconflict="overwrite" >

<cfoutput>
#form.id# // #form.for# // #form.field#
</cfoutput>

<cfelse>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="../javascript/jquery.js" ></script>
<script type="text/javascript" src="../javascript/fileUpload.js"  ></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
<script type="text/javascript">
 $(document).ready(function() {
new AjaxUpload('#upload_button_id', {
  // Location of the server-side upload script
  action: 'TestLoad.cfm',
  // File upload name
  name: 'userfile',
  // Additional data to send
  data: {
    example_key1 : 'example_value',
    example_key2 : 'example_value2'
  },
  // Submit file after selection
  autoSubmit: true,
  // The type of data that you're expecting back from the server.
  // Html (text) and xml are detected automatically.
  // Only useful when you are using json data as a response.
  // Set to "json" in that case.
  responseType: false,
  // Fired after the file is selected
  // Useful when autoSubmit is disabled
  // You can return false to cancel upload
  // @param file basename of uploaded file
  // @param extension of that file
  onChange: function(file, extension){},
  // Fired before the file is uploaded
  // You can return false to cancel upload
  // @param file basename of uploaded file
  // @param extension of that file
  onSubmit: function(file, extension) {$('#upload_button_id').html("Loading File...");},
  // Fired when file upload is completed
  // WARNING! DO NOT USE "FALSE" STRING AS A RESPONSE!
  // @param file basename of uploaded file
  // @param response server response
  onComplete: function(file, response) {$('#upload_button_id').html("Loading Completed...");}
});
});
</script>
</head>

<body>

<div id="upload_button_id">Upload</div>

</body>
</html>
</cfif>