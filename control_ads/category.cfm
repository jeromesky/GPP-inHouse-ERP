<CFIF USER_USERLEVEL NEQ "1"><cflocation url="main.cfm"></CFIF>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Main Window</title>
</head>

<body bgcolor="#FFFFFF" link="blue" vlink="blue" alink="blue">

<cfset dCategoryName = ""><cfset dCategoryStatus = "Active">

<cfif isDefined("Action")>
 <cfif Action eq "AddCategory">
  <cfinclude template="inc/#DBTYPE#/category_insertcategory.cfm">
  <cflocation url="category.cfm">
 </cfif>
 <cfif Action eq "delete">
  <cfquery name="qDeleteCategory" datasource="#ds#">
   delete from fuseAds_Categories
   where iCategoryID = #CategoryID#
  </cfquery>

  <cfquery name="qGetBanners" datasource="#ds#">
   select * from fuseAds_BannerCategory
   where iCategoryID = #CategoryID#
  </cfquery>
  <cfloop query="qGetBanners">
   <cfquery name="qDeleteBanners" datasource="#ds#">
    delete from fuseAds_banners
    where iBannerID = #iBannerID#
   </cfquery>
  </cfloop>
  <cfquery name="qDeleteBannerCategory" datasource="#ds#">
   delete from fuseAds_BannerCategory
   where iCategoryID = #CategoryID#
  </cfquery>
  <cflocation url="category.cfm">
 </cfif>
 <cfif Action eq "Update">
  <cfquery name="qGetCategory" datasource="#ds#">
   select * from fuseAds_Categories
   where iCategoryID = #CategoryID#
  </cfquery>

  <cfset dCategoryName = qGetCategory.vchCategoryName>
  <cfset dCategoryStatus = qGetCategory.chCategoryStatus>

</cfif>
 <cfif Action eq "UpdateCategory">
  <cfquery name="qUpdateCategory" datasource="#ds#">
   update fuseAds_Categories
   set
   vchCategoryName = '#CategoryName#',
   chCategoryStatus = '#CategoryStatus#'
   where iCategoryID = #CategoryID#
  </cfquery>
  <cflocation url="category.cfm">
 </cfif>
</cfif>

<center>
<table border="0">
<tr>
<td><center>
<cfform action="category.cfm" method="Post" Name="formname">
<table border="0">
 <tr>
  <td colspan=2 align="center"><font face="Tahoma, Arial" color="Navy" size="4"><b>C A T E G O R I E S</b></font></td>
 </tr>
 <tr>
  <td colspan="2"><font face="Tahoma,Arial" color="Black" size="2">
   Here are you add, update or delete categories for your banners.  
   <p>
   <b>NOTE:</b> Deleting categories will delete all associated banners.</td>
 </tr>
 <tr>
  <td><font face="Tahoma,Arial" color="black" size="2"><b>Category Name:</td>
  <td><cfinput type="text" name="CategoryName" Size="30" Value="#dCategoryName#" Maxlength="50" Required="Yes" Message="You must enter a category name"></td>
 </tr>
 <tr>
  <td><font face="Tahoma,Arial" color="black" size="2"><b>Status</td>
  <td>
   <select name="CategoryStatus">
    <option value="Active" <cfif dCategoryStatus eq "Active">selected</cfif>>Active
    <option value="Non-Active" <cfif dCategoryStatus eq "Non-Active">selected</cfif>>Non-Active
   </select></td>
 </tr> 
 <tr>
  <td colspan="2" align="right">
   <cfif isDefined("Action")>
    <cfif Action eq "Update">
     <input type="submit" name="UpdateCategory" Value="Update Category">
     <input type="hidden" name="Action" Value="UpdateCategory">
     <cfoutput><input type="hidden" name="CategoryiD" Value="#CategoryiD#"></cfoutput>
    </cfif>
   <cfelse> 
    <input type="submit" name="AddCategory" Value="Add Category">
    <input type="hidden" name="Action" Value="AddCategory">
   </cfif>
   </td>
 </tr> 
</table>
</cfform>
 <cfquery name="qGetCategories" datasource="#ds#">
  select * from fuseAds_Categories
 </cfquery>
 <table border="0">
 <tr>
  <td colspan="2" align="middle">
   <table width="400" cellpadding="2" cellspacing="1">
    <tr>
     <td bgcolor="Black"><font face="Arial" color="white" size="2"><b>Category Name</b></font></td>
     <td bgcolor="Black"><font face="Arial" color="white" size="2"><b>Status</b></font></td>
     <td bgcolor="Black" nowrap width="20"><font face="Arial" color="white" size="2"><b>Update</b></font></td>
     <td bgcolor="Black" nowrap width="20"><font face="Arial" color="white" size="2"><b>Delete</b></font></td>
    </tr>
    <cfset bcolor="B3CFE2">
    <cfoutput query="qGetCategories">
     <tr>
      <td bgcolor="#bcolor#"><font face="Arial" color="black" size="2">#vchCategoryName#</td>
      <td bgcolor="#bcolor#"><font face="Arial" color="black" size="2">#chCategoryStatus#</td>
      <td bgcolor="#bcolor#"><center><a href="category.cfm?Action=update&categoryID=#icategoryID#"><img src="i/mag.gif" alt="Update" border="0"></a></td>
      <td bgcolor="#bcolor#"><center><a href="category.cfm?Action=delete&categoryID=#icategoryID#" onClick="return confirm('If you delete a category, all associated banners will be deleted')"><img alt="Delete" src="i/mag.gif" border="0" /></a></td> 
     </tr>
    <cfif bcolor eq "B3CFE2">
     <cfset bcolor = "9bb0d4">
    <cfelse>
     <cfset bcolor = "B3CFE2">
    </cfif>
    </cfoutput>
   </table>
  </td>
 </tr>
</table></center>

</td>
</tr>
</table>

</body></html>