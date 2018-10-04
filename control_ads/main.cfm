<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Main Window</title>
</head>

<body bgcolor="#FFFFFF" link="blue" vlink="blue" alink="blue">
<script language="javascript">
function WinOpen(url,x,y) {
 var options = "toolbar=no,scrollbars=yes,resizable=yes,width=" + x + ",height=" + y;
 msgWindow=window.open(url,"WinOpen",options);
}
function Passwordverify() {
 if (document.main.Password.value != document.main.Verification.value) { 
  alert('Password verification failed');
  return false;
 }
 if (document.main.Password.value == '') { 
  alert('Password verification failed');
  return false;
 }
 if (document.main.Verification.value == '') { 
  alert('Password verification failed');
  return false;
 }

}
</script>
<table border="0" width="85%"><tr>
<td>

<cfif USER_USERLEVEL eq "1">
<cfif IsDefined("Update")>
  <cfif qGetAdminSettings.RecordCount eq "0">
   <cfquery name="UpdateSettings" datasource="#ds#">
    insert into fuseAds_Settings
    (vchTrackURL, vchDatasource, chDBType)
    values
    ('#TrackURL#', '#Datasource#', '#Settings_DBType#')
   </cfquery>
  <cfelse>
   <cfquery name="UpdateSettings" datasource="#ds#">
   update fuseAds_Settings
   set
   vchTrackURL = '#TrackURL#',
   vchDatasource = '#Datasource#',
   chDBType = '#Settings_DBType#'
   </cfquery>
  </cfif>
  
  <cfquery name="UpdateAdminProfile" datasource="#ds#">
   update fuseAds_Users
   set vchPassword = '#adminpassword#'
   where vchUsername = 'Administrator'
  </cfquery>
  
  <cflocation url="main.cfm">
 </cfif>
 
 <cfquery name="qAdminSettings" datasource="#ds#">
  select vchPassword from fuseAds_Users
  where vchUsername = 'Administrator' 
 </cfquery>
 <cfform action="main.cfm" method="post">
 <center>
 <table border="0">
 <tr>
 <td colspan="3" bgcolor="ffffff" align="center"><font face="Tahoma, Arial" color="Navy" size="4"><b>M A I N &nbsp; S E T T I N G S</b></font></td>
 </tr>
 <tr>
 <td colspan="3"><br /><br /></td>
 </tr>
 <tr>
  <td><a href="javascript:WinOpen('help.cfm#h1','500','420');"><img src="i/q.gif" border="0"></a></td><td><font face="Tahoma, Arial" size="2"><b>Track URL:</b></font></td>
  <td><cfinput type="text" value="#qGetAdminSettings.vchTrackURL#" name="trackurl" required="yes" maxlength="150" message="Please fill in the tracking URL" size="45"></td>
 </tr>
 <tr>
  <td><a href="javascript:WinOpen('help.cfm#h2','500','420');"><img src="i/q.gif" border="0"></a></td><td><font face="Tahoma, Arial" size="2"><b>Datasource:</b></font></td>
  <td><cfinput type="text" value="#qGetAdminSettings.vchDatasource#" name="datasource" required="yes" maxlength="150" message="Please fill in the datasource used for fuseAds" size="45"></td>
 </tr>
 <tr>
  <td><a href="javascript:WinOpen('help.cfm#h2a','500','420');"><img src="i/q.gif" border="0"></a></td>
  <td><font face="Tahoma, Arial" size="2"><b>Database type:</b></font></td>
  <td>
   <select name="Settings_DBType">
    <option value="Access" <cfif DBTYPE eq "Access" or DBTYPE eq "">selected</cfif>>Access    
    <option value="MSSQL" <cfif DBTYPE eq "MSSQL">selected</cfif>>MSSQL
    <option value="ORACLE" <cfif DBTYPE eq "ORACLE">selected</cfif>>ORACLE
    <option value="MYSQL" <cfif DBTYPE eq "MYSQL">selected</cfif>>MYSQL        </select></td>
 </tr> <!--- <tr>
  <td><a href="javascript:WinOpen('help.cfm#h3','500','420');"><img src="i/q.gif" border="0"></a></td><td><font face="Tahoma, Arial" size="2"><b>Administrator Password:</b></font></td>
  <td><cfinput type="text" value="#qAdminSettings.vchPassword#" name="adminpassword" required="yes" maxlength="150" message="Please fill in a administrator e-mail" size="45"></td>
 </tr> --->
 
 <tr>
  <td colspan="3" align="right"><br /><input type="submit" value="Update"><input type="hidden" name="update"></td>
 </tr>
 </table>
 </center>
 </cfform>
<cfelse>
 <cfif IsDefined("Update")>
  <cfquery name="qUpdateUser" datasource="#ds#">
   update fuseAds_Users
   set vchPassword = '#Password#'
   where iUserID = #Session.userID#  
  </cfquery>
 </cfif> 
 <cfquery name="qGetUserInfo" datasource="#ds#">
  select * from fuseAds_Users u
  where iUserID = #session.userid#
 </cfquery>
 <cfquery name="qGetClientInfo" datasource="#ds#">
  select * from fuseAds_Clients
  where iClientID = #qGetUserInfo.iClientID#
 </cfquery>
 <br />
 <cfform action="main.cfm" method="post" name="main">
 <center>
 <table border="0">
  <tr>
   <td colspan="2" bgcolor="ffffff" align="center"><font face="Tahoma, Arial" color="Navy" size="4"><b>M A I N &nbsp; S E T T I N G S</b></font><br /></td>
  </tr>
  <tr>
   <td><font face="Tahoma, Arial" size="2"><b>Client Name:</b></font></td>
   <td><font face="Tahoma, Arial" size="2"><cfoutput>#qGetClientInfo.vchClientName#</cfoutput></td>
  </tr>
  <tr>
   <td><font face="Tahoma, Arial" size="2"><b>Password:</b></font></td>
   <td><cfinput type="Password" value="#qGetUserInfo.vchPassword#" name="Password" required="yes" maxlength="150" message="Please fill in a password" size="45"></td>
  </tr>
  <tr>
   <td><font face="Tahoma, Arial" size="2"><b>Verification:</b></font></td>
   <td><cfinput type="Password" value="#qGetUserInfo.vchPassword#" name="Verification" required="yes" maxlength="150" message="Please fill in a password verification" size="45"></td>
  </tr>
  <tr>
   <td colspan="2" align="middle"><input type="submit" name="Update" Value="Update Settings" onClick="return Passwordverify()"></td>
  </tr>  
 </table>
 </cfform></cfif>

</td>
</tr>
</table>

</body></html>