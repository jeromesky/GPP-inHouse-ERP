<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Ads Admin</title>
</head>

<body bgcolor="#327DB1" <cfif #isdefined("signin")# eq "false">onload="document.forums.username.focus()"</cfif>>
<center><br /><br /><br /><br />
 <table border="1" cellspacing="0" cellpadding="0" bordercolor="black"><tr><td>
 <table border="0" width="500" height="300" cellpadding="0" cellspacing="0">
 <tr>
 <td bgcolor="#29496B" valign="top" height="42"></td><td bgcolor="#29496B" align="right"><font face="Tahoma, Arial" size="2" color="white"><b>Administration Area</font></td><td bgcolor="#29496B">&nbsp;</td>
 </tr>
 <tr>
<td bgcolor="eeeeee" valign="top" colspan="3">
 
<cfif #isdefined("signin")#>

<cfif Len(Username) eq "0" or Len(Password) eq "0">
<br /><br /><br />
 <center><table border="0"><tr><td><font face="Arial" size="2"><b>
 Please fill in the username and password before logging in.</b>
 <p /> 
 Press the back button on your browser to go back to the login screen.</font></td>
 </tr>
 </table>
 </center>

<cfelse>
 <!--- check user against our records --->
 <cfquery name="qCheckUser" datasource="#ds#">
  select iUserID, iClientID from fuseAds_Users where vchUsername = '#username#' and vchpassword = '#password#'
 </cfquery>
  <!--- if the user does not exist ---->
  <cfif #qCheckUser.recordcount# eq "0"><br /><br /><br />
   <center><table border="0"><tr><td>
   <font face="Arial" size="2"><b>That is an invalid user.</b>
   <p /> 
   Please go <a href="signin.cfm"><font color="blue">back</font></a> and ensure you have the right login</font>
   </td></tr></table></center>

  <cfelse>
   <!--- set the users id to a session id variable --->
   <cfset session.userid = #qCheckUser.iuserid#>
   <cfset session.clientid = #qCheckUser.iClientID#>

   <cfset encstatement = Encrypt("LoggedIn","fu-$!ads*&d")>

   <!--- set the cookie 4 the shop members --->
   <cfcookie name="FuseAdsadmin" value="#encstatement#">
   <br /><br /><br />
   <!--- move the member 2 the members menu --->
   <center><table border="0"><tr><td><font face="Arial" size="2"><b>
   You have logged in successfully.
   <p /> 
   If you were not taken to the main menu automatically then click <a href="index.cfm"><font color="blue">here</font></a>.
   </td></tr></table></center>
      
   <script language="Javascript">
    location.href="index.cfm"
   </script>
   </cfif>
 </cfif>
<cfelse>
 <cfform action="signin.cfm" name="forums" method="post">
 <center><br /><br />
 <table border="0">
 <tr>
 <td><font face="Verdana,Arial" size="5" color="Black">Admin Login</font>
<p /> <center>
 <table border="0" cellpadding="3" cellspacing="0">
 <tr>
  <td><font face="Arial" size="2"><b>USERNAME:</b></font></td><td><cfinput style="background: EFF3FF;" required="yes" message="Please type in a username" type="text" name="username"></td>
 </tr>
 <tr>
  <td><font face="Arial" size="2"><b>PASSWORD:</b></font></td><td><cfinput style="background: EFF3FF;" required="yes" message="Please type in a password" type="password" name="password"></td>
 </tr>
 <tr>
  <td align="right" colspan="2"><br />
  <input type="hidden" name="signin">
  <input type="submit" value="Login"></td>
 </tr>
 </table>
 </center><br /><br /><br /></td>
 </tr>
 </table>
</cfform></cfif></td>
 </tr>
 </table>
 </td>
 </tr>
 </table>

</center>
</body>
</html>