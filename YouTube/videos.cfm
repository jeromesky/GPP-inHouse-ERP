<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Petro21.com</title>
</head>

<body><form id="form1" name="form1" method="post" action="">
<table width="400" border="1">
  <tr>
    <td>
      <label>
        <input type="text" name="link" id="textfield" />
        </label>
    </td>
    <td><label>
      <input type="submit" name="button" id="button" value="Submit" />
    </label></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table></form>
<object width="425" height="344"><param name="movie" value="http://www.youtube.com/v/8ROLDuJz9UM&hl=en&fs=1"></param><param name="allowFullScreen" value="true"></param><embed src="http://www.youtube.com/v/8ROLDuJz9UM&hl=en&fs=1" type="application/x-shockwave-flash" allowfullscreen="true" width="425" height="344"></embed></object>
<cfif parameterexists(form.link)>
<cfset findStart = find("v/", form.link ) >
<cfset findEnd = find("></param>", form.link ) >
<cfset cutLeft = Left(form.link, (findStart -2)) >
<cfoutput>Start at = #findStart#, End at #findEnd#<br />
edited from = #Left(form.link, (len(form.link)- findEnd))#
</cfoutput>
</cfif>

</body>
</html>