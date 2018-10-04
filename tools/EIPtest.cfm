<cfinclude template="../Application.cfm">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>www.petro21.com</title>
<link href="../styles/styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../Javascript/jquery.js" ></script>
<script type="text/javascript" src="../Javascript/jeditable.js" ></script>

</head>

<body>

<span class="name" id="2" >dssdsdsdsdsd  kiujskhj dskjdskjsd skjdskjds </span>
<script type="text/javascript" >
  $('.name').editable('Update.cfm', { 
         	name : 'name',
			type      : 'textarea',
			width: 600,
			height : 40,
			submit    : 'OK',
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...',
			      type   : 'textarea',
      submitdata: { _method: "put" },
      select : true,
      cssclass : "editable"
     		});
</script>
</body>
</html>