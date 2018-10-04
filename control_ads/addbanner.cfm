<CFIF USER_USERLEVEL NEQ "1"><cflocation url="main.cfm"></CFIF>
<cfsilent>
<cfquery name="qGetBannerSizes" datasource="#ds#">
	select * from fuseAds_BannerSize
	where chBannerSizeStatus = 'Active'
</cfquery>
<cfquery name="qGetClients" datasource="#ds#">
	select * from fuseAds_Clients
	where chClientStatus = 'Active'
</cfquery>
<cfquery name="qGetCategories" datasource="#ds#">
	select * from fuseAds_Categories
	where chCategoryStatus = 'Active'
</cfquery>
</cfsilent>

<cfif qGetBannerSizes.RecordCount eq "0" or qGetClients.recordcount eq "0" or qGetCategories.recordcount eq "0">
	<script>
 alert('Before adding banners you must make certain that you have active Banner Sizes, Categories, and Clients');
 window.location = 'main.cfm'
	</script>
</cfif>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Main Window</title>
</head>

<body bgcolor="#FFFFFF" link="blue" vlink="blue" alink="blue">

<cfif isDefined("Action")>
	<cfif Action eq "AddBanner">
 <cfif StartDate eq ""><cfset StartDate = "01/01/1900"></cfif>
 <cfparam name="getday" default="#day#">
<cfparam name="getmonth" default="#month#">
<cfparam name="getyear" default="#year#">
<cfparam name="EndDate" default="#getmonth#/#getday#/#getyear#">
 <cfif EndDate eq ""><cfset EndDate = "01/01/1900"></cfif>
 <cfif NOT isDefined("DayOfWeek")><cfset DayOfWeek = "0"></cfif> 
 <cfif MaxImpressions eq ""><cfset MaxImpressions = 0></cfif>
 <cfif MaxClicks eq ""><cfset MaxClicks = 0></cfif>

 <cfinclude template="inc/#DBType#/banners_insertbanners.cfm">

 <cfquery name="qGetBannerID" datasource="#ds#">
 	select Max(iBannerID) as BannerID from fuseAds_Banners
 </cfquery>

 <cfif isDefined("Category")>
 	
 <cfset WSArray = ListToArray(Category)>
 <cfset ArrayLen = ArrayLen(WSArray)>
 	
 	<cfloop index="i" from="1" to="#ArrayLen#">
  <cfquery name="qInsertWebSite" datasource="#ds#">
  insert into fuseAds_BannerCategory
  (iCategoryID, iBannerID)
  values
  (#WSArray[i]#, #qGetBannerID.BannerID#)
  </cfquery>
 	</cfloop>
 </cfif>

 <script>
 	alert('Banner was added');
 	window.location = 'addbanner.cfm';
 </script>
	</cfif>
</cfif>
	<script>
 function WinOpen(url,x,y) {
 	var options = "toolbar=no,scrollbars=yes,resizable=yes,width=" + x + ",height=" + y;
 	msgWindow=window.open(url,"WinOpen",options);
 }
 function viewlocalbanner() {
 	if (document.formname.ImageURL.value == '') {
  alert('You must enter banner image URL')
 	} else {
  WinOpen('viewbanner.cfm?imgurl=' + document.formname.ImageURL.value);
 	}
 }
 function verifyfields() {
 	if ((document.formname.ImageURL.value == '' || document.formname.RedirectURL.value == '')  && document.formname.BannerType.options[document.formname.BannerType.selectedIndex].value == 'Local') {
  alert('You must enter a local banner relative URL and/or a re-direct URL');
  return false;
 	} 
 	if (document.formname.ExternalCode.value == '' && document.formname.BannerType.options[document.formname.BannerType.selectedIndex].value == 'External') {
  alert('You must enter the external banner code');
  return false;
 	} 
 	return true;
 }
	</script>
	
<table border="0" width="85%"><tr>
<td>

<cfform action="addbanner.cfm" method="Post" Name="formname">
<table border="0">
	<tr>
 <td colspan=3><center><font face="Tahoma,Arial" color="Navy" size="4"><b>A D D &nbsp; B A N N E R</b></font><br /><br /></td>
	</tr>
	<tr>
 <td><a href="javascript:WinOpen('help.cfm#h3','500','420');"><img src="i/q.gif" border="0"></a></td>
 <td><font face="Arial" color="black" size="2"><b>Client:</td>
 <td><cfquery name="qGetClients" datasource="#ds#">
  select * from fuseAds_Clients
  where chClientStatus = 'Active'
  order by vchClientName
 	</cfquery>
 	<select name="ClientID">
  <cfoutput query="qGetClients">
  	<option value="#iClientID#">#vchClientName#</option>
  </cfoutput>
 	</select></td>
	</tr>
	<tr>
 <td><a href="javascript:WinOpen('help.cfm#h4','500','420');"><img src="i/q.gif" border="0"></a></td>
 <td><font face="Arial" color="black" size="2"><b>Banner Type:</td>
 <td><select name="BannerType">
  <option value="Local">Local
  <option value="External">External
 	</select></td>
	</tr>
	<tr>
 <td><a href="javascript:WinOpen('help.cfm#h5','500','420');"><img src="i/q.gif" border="0"></a></td>
 <td><font face="Arial" color="black" size="2"><b>Banner Size:</td>
 <td><cfquery name="qGetBannerSizes" datasource="#ds#">
  select * from fuseAds_BannerSize
  where chBannerSizeStatus = 'Active'
 	</cfquery>
 	<select name="BannerSizeID">
  <cfoutput query="qGetBannerSizes">
  	<option value="#iSizeID#">#vchBannerSize#</option>
  </cfoutput>
 	</select></td>
	</tr>
	<tr>
 <td valign=top><a href="javascript:WinOpen('help.cfm#h6','500','420');"><img src="i/q.gif" border="0"></a></td>
 <td valign="top"><font face="Arial" color="black" size="2"><b>Category:</td>
 <td><cfquery name="qGetCategory" datasource="#ds#">
  select * from fuseAds_Categories
  where chCategoryStatus = 'Active'
 	</cfquery>
 	<select name="Category" multiple>
  <cfoutput query="qGetCategory">
  	<option value="#iCategoryID#">#vchCategoryName#</option>
  </cfoutput>
 	</select></td>
	</tr>
	<tr>
 <td><a href="javascript:WinOpen('help.cfm#h7','500','420');"><img src="i/q.gif" border="0"></a></td> 
 <td><font face="Arial" color="black" size="2"><b>Description:</td>
 <td><cfinput type="text" name="Description" Size="30" Maxlength="50" Required="Yes" Message="You must enter a Description"></td>
	</tr>
	<tr>
 <td><a href="javascript:WinOpen('help.cfm#h8','500','420');"><img src="i/q.gif" border="0"></a></td> 
 <td><font face="Arial" color="black" size="2"><b>Track Impressions:</td>
 <td><select name="TrackImpressions">
  <option>Yes</option>
  <option>No</option>
 	</select></td>
	</tr>
	<tr>
 <td><a href="javascript:WinOpen('help.cfm#h9','500','420');"><img src="i/q.gif" border="0"></a></td> 
 <td><font face="Arial" color="black" size="2"><b>Maximum Impressions:</td>
 <td><cfinput type="text" name="MaxImpressions" Size="5"  Maxlength="10" Validate="Integer"></td>
	</tr>	
	<tr>
 <td><a href="javascript:WinOpen('help.cfm#h10','500','420');"><img src="i/q.gif" border="0"></a></td> 
 <td><font face="Arial" color="black" size="2"><b>Track Click Throughs:</td>
 <td><select name="TrackClicks">
  <option>Yes</option>
  <option>No</option>
 	</select></td>
	</tr>
	<tr>
 <td><a href="javascript:WinOpen('help.cfm#h11','500','420');"><img src="i/q.gif" border="0"></a></td> 
 <td><font face="Arial" color="black" size="2"><b>Maximum Clicks:</td>
 <td><cfinput type="text" name="MaxClicks" Size="5"  Maxlength="10" Validate="Integer"></td>
	</tr>
	<tr>
 <td><a href="javascript:WinOpen('help.cfm#h12','500','420');"><img src="i/q.gif" border="0"></a></td> 
 <td><font face="Arial" color="black" size="2"><b>Start Date:</td>
 <td><cfinput type="text" name="StartDate" Size="15"  Maxlength="10" Validate="Date" value="02/02/2002">&nbsp;<font face="Arial" color="black" size="1">(mm/dd/yyyy)</td>
	</tr>
	<tr>
 <td><a href="javascript:WinOpen('help.cfm#h13','500','420');"><img src="i/q.gif" border="0"></a></td>	
 <td><font face="Arial" color="black" size="2"><b>End Date:</td>
 <td><cfinput type="text" name="day" Size="5"  Maxlength="10" Validate="Date">
   <cfinput type="text" name="month" Size="5"  Maxlength="10" Validate="Date">
 <cfinput type="text" name="year" Size="5"  Maxlength="10" Validate="Date">
 <font face="Arial" color="black" size="1">(dd/mm/yyyy)</td>
	</tr>
	<tr>
 <td valign="top"><a href="javascript:WinOpen('help.cfm#h14','500','420');"><img src="i/q.gif" border="0"></a></td> 
 <td valign="top"><font face="Arial" color="black" size="2"><b>Do not run on:</td>
 <td><select name="DayOfWeek" multiple>
  <cfloop index="i" From="1" To="7">
  	<cfoutput><option value="#i#">#DayOfWeekAsString(i)#</option></cfoutput>
  </cfloop>
 </select></td>
	</tr>
	<tr>
 <td><a href="javascript:WinOpen('help.cfm#h15','500','420');"><img src="i/q.gif" border="0"></a></td>
 <td><font face="Arial" color="black" size="2"><b>Start at:</td>
 <td><select name="StartTime">
  <cfloop index="i" From="0" To="23">
  	<cfoutput>
 	<option value="#i#:00:00">#i#:00:00</option>
  	</cfoutput>
  </cfloop>
 	</select></td>
	</tr>
	<tr>
 <td><a href="javascript:WinOpen('help.cfm#h16','500','420');"><img src="i/q.gif" border="0"></a></td>
 <td><font face="Arial" color="black" size="2"><b>To:</td>
 <td><select name="EndTime">
  <cfloop index="i" From="0" To="23">
  	<cfoutput><option value="#i#:59:59" <cfif i eq "23">selected</cfif>>#i#:59:59</option></cfoutput>
  </cfloop>
 	</select></td>
	</tr>
	<tr>
 <td></td>
 <td colspan="2"><br /><font face="Arial" color="Navy" size="2"><b><b>Local banner</td>
	</tr>
	<tr>
 <td><a href="javascript:WinOpen('help.cfm#h17','500','420');"><img src="i/q.gif" border="0"></a></td>
 <td><font face="Arial" color="black" size="2"><b>Image</font>
 <td>
 <input type="hidden" name="ImageURL" value="<cfoutput>#url.uploadedimg#</cfoutput>">
 	<img src="http://www.petro21.com/advertising/<cfoutput>#url.uploadedimg#</cfoutput>"></td>
	</tr>
	<tr>
 <td valign="top"><a href="javascript:WinOpen('help.cfm#h18','500','420');"><img src="i/q.gif" border="0"></a></td>
 <td valign="top"><font face="Arial" color="black" size="2"><b>Re-directURL</td>
 <td valign="top"><cfinclude template="../components/eventsdropdown.cfm"> <br /><br /><br /></td>
	</tr>
	<tr>
	  <td valign="top">&nbsp;</td>
	  <td>External URL</td>
	  <td><input type="checkbox" name="external" id="checkbox"></td>
	  </tr>
	<tr>
	  <td valign="top">&nbsp;</td>
	  <td>&nbsp;</td>
	  <td><input type="text" name="externalURL" id="textfield"></td>
	</tr>
	<tr>
 <td valign="top"><a href="javascript:WinOpen('help.cfm#h19','500','420');"><img src="i/q.gif" border="0"></a></td>	
 <td colspan="2"><font face="Arial" color="Navy" size="2"><b>External banner code </b><br /><font color=black size=1>Note: click on the question mark for information regarding cache busting techniques.</font></td>
	</tr>
	<tr>
 <td></td>
 <td colspan="2"><textarea name="ExternalCode" Cols=40 Rows=5></textarea></td>
	</tr>
	<tr>
 <td></td>
 <td colspan="2" align="left"><br />
 	<input type="submit" name="AddBanner" Value="Add Banner" onClick="return verifyfields()">
 	<input type="hidden" name="Action" Value="AddBanner"></td>
	</tr>	
</table>
</cfform></center></td>
</tr>
</table>

</body>
</html>