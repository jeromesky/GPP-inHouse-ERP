<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>.</title>
<style type="text/css">
<!--
#Layer1 {
	position:absolute;
	left:124px;
	top:67px;
	width:169px;
	height:156px;
	z-index:1;
}
-->
</style>
</head>

<body>
<table width="629" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutDefaultTable-->
  <tr>
    <td width="110" height="50">&nbsp;</td>
    <td width="176"><form id="form1" name="form1" method="post" action="#">
      <input type="text" name="emailList" value="" />
      <input type="submit" name="Submit" value="Submit" />
    </form>
    </td>
  </tr>
  <tr>
    <td height="58">&nbsp;</td>
    <td valign="top"><cfoutput>#Asc(form.emailList)#//\\#chr(32)# #chr(58)# #chr(47)# #chr(92)# #chr(59)# #chr(39)# #chr(38)# #chr(34)# #chr(13)#</cfoutput></td>
  </tr>
</table>
</body>
</html>
