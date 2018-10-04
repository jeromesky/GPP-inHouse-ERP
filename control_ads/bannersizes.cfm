<CFIF USER_USERLEVEL NEQ "1"><cflocation url="main.cfm"></CFIF>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
 <title>Main Window</title>
</head>

<body bgcolor="#FFFFFF" link="blue" vlink="blue" alink="blue">

<cfset dWidth = "">
<cfset dHeight = "">
<cfset dBannerStatus = "Active">

<cfif isDefined("Action")>
 <cfif Action eq "AddBannerSize">
  <cfinclude template="inc/#DBType#/bannersize_insertbannersize.cfm">

  <cflocation url="bannersizes.cfm">
 </cfif>
 <cfif Action eq "delete">
  <cfquery name="qDeleteCategory" datasource="#ds#">
   delete from fuseAds_BannerSize
   where iSizeID = #SizeID#
  </cfquery>

  <cfquery name="qDeleteBanners" datasource="#ds#">
   delete from fuseAds_banners
   where iBannerSize = #SizeID#
  </cfquery>

  <cflocation url="bannersizes.cfm">
 </cfif>
 <cfif Action eq "Update">
  <cfquery name="qGetBannerSize" datasource="#ds#">
   select * from fuseAds_BannerSize
   where iSizeID = #SizeID#
  </cfquery>

  <cfset dWidth = left(qGetBannerSize.vchBannerSize, findnocase("x", qGetBannerSize.vchBannerSize,1)-1)>
  <cfset dHeight = Right(qGetBannerSize.vchBannerSize, len(qGetBannerSize.vchBannerSize)-findnocase("x", qGetBannerSize.vchBannerSize,1))>
  <cfset dBannerStatus = qGetBannerSize.chBannerSizeStatus>

 </cfif>
 <cfif Action eq "UpdateBannerSize">
  <cfquery name="qUpdateBannerSize" datasource="#ds#">
   update fuseAds_BannerSize
   set
   vchBannerSize = '#Width#x#Height#',
   chBannerSizeStatus = '#BannerSizeStatus#'
   where iSizeID = #SizeID#
  </cfquery>
  <cflocation url="bannersizes.cfm">
 </cfif>
</cfif>

<center>
<table border="0">
<tr>
<td><center>
<cfform action="bannersizes.cfm" method="Post" Name="formname">
<table border="0">
 <tr>
  <td colspan=2><center><font face="Tahoma, Arial" color="Navy" size="4"><b>B A N N E R &nbsp; S I Z E S</b></font><br /><br /></td>
 </tr>
 <tr>
  <td colspan="2"><font face="Tahoma,Arial" color="Black" size="2">Here are you add, update or delete banner sizes for your banners.<br /> Banner Sizes are defined with a width and height.
   <p>
   <b>NOTE:</b> Deleting banner sizes will delete all associated banners.<br /><br />
  </td>
 </tr> 
 <tr>
  <td><font face="Tahoma,Arial" color="black" size="2"><b>Width:</td>
  <td><cfinput type="text" name="Width" Size="30" Value="#dWidth#" Maxlength="50" Required="Yes" Validate="Integer" Message="You must enter a valid banner width"></td>
 </tr>
 <tr>
  <td><font face="Tahoma,Arial" color="black" size="2"><b>Height:</td>
  <td><cfinput type="text" name="Height" Size="30" Value="#dHeight#" Maxlength="50" Required="Yes" Validate="Integer" Message="You must enter a valid banner height"></td>
 </tr>
 <tr>
  <td><font face="Tahoma,Arial" color="black" size="2"><b>Status</td>
  <td><select name="BannerSizeStatus">
    <option value="Active" <cfif dBannerStatus eq "Active">selected</cfif>>Active
    <option value="Non-Active" <cfif dBannerStatus eq "Non-Active">selected</cfif>>Non-Active
   </select></td>
 </tr> 
 <tr>
  <td colspan="2" align="right"><br />
   <cfif isDefined("Action")>
    <cfif Action eq "Update">
     <input type="submit" name="UpdateBannerSize" Value="Update Banner Size">
     <input type="hidden" name="Action" Value="UpdateBannerSize">
     <cfoutput><input type="hidden" name="SizeID" Value="#SizeID#"></cfoutput>
    </cfif>
   <cfelse> 
    <input type="submit" name="AddBannerSize" Value="Add Banner Size">
    <input type="hidden" name="Action" Value="AddBannerSize">
   </cfif>
   <br /><br /></td>
 </tr> 
</table>
</cfform>
 <cfquery name="qGetCategories" datasource="#ds#">
  select * from fuseAds_BannerSize
 </cfquery>
 <table border="0">
 <tr>
  <td colspan="2" align="middle">
   <table width="400" cellpadding="2" cellspacing="1">
    <tr>
     <td bgcolor="Black"><font face="Arial" color="white" size="2"><b>Size</b></font></td>
     <td bgcolor="Black"><font face="Arial" color="white" size="2"><b>Status</b></font></td>
     <td bgcolor="Black" nowrap width="20"><font face="Arial" color="white" size="2"><b>Update</b></font></td>
     <td bgcolor="Black" nowrap width="20"><font face="Arial" color="white" size="2"><b>Delete</b></font></td>
    </tr>
    <cfset bcolor="B3CFE2">
    <cfoutput query="qGetCategories">
     <tr>
      <td bgcolor="#bcolor#"><font face="Arial" color="black" size="2">#vchBannerSize#</td>
      <td bgcolor="#bcolor#"><font face="Arial" color="black" size="2">#chBannerSizeStatus#</td>
      <td bgcolor="#bcolor#"><center><a href="bannersizes.cfm?Action=update&SizeID=#iSizeID#"><img src="i/mag.gif" alt="Update" border="0"></a></td>
      <td bgcolor="#bcolor#"><center><a href="bannersizes.cfm?Action=delete&SizeID=#iSizeID#" onClick="return confirm('If you delete a category, all associated banners will be deleted')"><img alt="Delete" src="i/mag.gif" border="0"></a></td> 
     </tr>
    <cfif bcolor eq "B3CFE2">
     <cfset bcolor = "9bb0d4">
    <cfelse>
     <cfset bcolor = "B3CFE2"></cfif>
    </cfoutput>
   </table></td>
 </tr>
</table>
</center>

</td>
</tr>
</table>

</body></html>