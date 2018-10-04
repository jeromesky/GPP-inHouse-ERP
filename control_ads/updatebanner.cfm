<CFIF USER_USERLEVEL NEQ "1"><cflocation url="main.cfm"></CFIF>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>Main Window</title>
</head>

<body bgcolor="#FFFFFF" link="blue" vlink="blue" alink="blue">

<table border="0" width="85%"><tr>
<td>

<script>
 function WinOpen(url,x,y) {
  var options = "toolbar=no,scrollbars=yes,resizable=yes,width=" + x + ",height=" + y;
  msgWindow=window.open(url,"WinOpen",options);
 } 
 function viewlocalbanner(imgURL) {
  WinOpen('viewbanner.cfm?imgurl=' + imgURL);
 }
</script>
<cfform action="updatebanner.cfm" method="Post" Name="formname">
<table width=30%>
 <tr>
  <td colspan=2 nowrap><center><font face="Tahoma,Arial" color="Navy" size="4"><b>U P D A T E &nbsp; B A N N E R</b></font>
  </td>
 </tr>
<cfif NOT isDefined("Action")>
  <tr>
   <td colspan="2" nowrap><font face="Arial" color="black" size="2"><b>Keyword:</font> <cfinput type="text" name="Keyword" Size=20 Required="Yes" Message="You must enter a keyword"> <input type=submit name="Search" Value="Search"></td>
  </tr>
  <input type="hidden" name="Action" Value="Search">   
<cfelse>
<cfif Action eq "DeleteBanner">
			<cfquery name="qDeleteBanner" datasource="#ds#">
				delete from fuseAds_Banners
				where iBannerID = #BannerID#
			</cfquery>
			<cfquery name="qDeleteBanner" datasource="#ds#">
				delete from fuseAds_BannerCategory
				where iBannerID = #BannerID#
			</cfquery>
			<cfquery name="qDeleteBanner" datasource="#ds#">
				delete from fuseAds_ClickTrack
				where iBannerID = #BannerID#
			</cfquery>
			<cfquery name="qDeleteBanner" datasource="#ds#">
				delete from fuseAds_ImpressionTrack
				where iBannerID = #BannerID#
			</cfquery>
			<script>
				alert('Banner was Deleted');
				window.location = 'updatebanner.cfm';
			</script>
	</cfif>
  <tr>
   <td colspan="2">
  <cfif Action eq "Search">
   <cfquery name="qSearchUsers" datasource="#ds#">
    select * from fuseAds_Banners
    where vchDescription like '%#Keyword#%'
	order by dtEndDate DESC
   </cfquery>
   <cfif qSearchUsers.RecordCount eq "0">
   <table border="0">
    <tr>
     <td colspan="2" align="middle"><font face="Arial" color="black" size="2"><b>No Users Found</b></td>
    </tr>
    </table>
   <cfelse>
   <cfif Action eq "DeleteBanner">
			<cfquery name="qDeleteBanner" datasource="#ds#">
				delete from fuseAds_Banners
				where iBannerID = #BannerID#
			</cfquery>
			<cfquery name="qDeleteBanner" datasource="#ds#">
				delete from fuseAds_BannerCategory
				where iBannerID = #BannerID#
			</cfquery>
			<cfquery name="qDeleteBanner" datasource="#ds#">
				delete from fuseAds_ClickTrack
				where iBannerID = #BannerID#
			</cfquery>
			<cfquery name="qDeleteBanner" datasource="#ds#">
				delete from fuseAds_ImpressionTrack
				where iBannerID = #BannerID#
			</cfquery>
			<script>
				alert('Banner was Deleted');
				window.location = 'deletebanner.cfm';
			</script></cfif>
    <table width="400" cellpadding="2" cellspacing="1">
    <tr>
     <td bgcolor="Black"><font face="Arial" color="white" size="2"><b>Ad Name</b></font></td>
    
     <td bgcolor="Black" nowrap width="20"><font face="Arial" color="white" size="2"><b>Update</b></font></td>
	 <td bgcolor="Black" nowrap width="20"><font face="Arial" color="white" size="2"><b>Remove</b></font></td>
	  <td bgcolor="Black" nowrap width="20"><font face="Arial" color="white" size="2"><b>Banners</b></font></td>
    </tr>
    <cfset bcolor="B3CFE2">
    <cfoutput query="qSearchUsers">
     <tr>
      <td bgcolor="#BCOLOR#"><font face="Arial" color="black" size="2">#vchDescription#</td>
    
	 <td bgcolor="#BCOLOR#" align="middle"><a href="updatebanner.cfm?Action=UpdateBanner&BannerID=#iBannerID#"><img src="i/mag.gif" alt="Update Banner" border="0"></a></td>
	  <td  bgcolor="#BCOLOR#" ><a href="updatebanner.cfm?Action=deleteBanner&BannerID=#iBannerID#" onClick="return confirm('Deleting a banner will delete all associated reports')"><font face="Arial" color="black" size="2">Delete</a></td>
	  <td  bgcolor="#BCOLOR#" ><img src="../../#vchImageURL#"></td>
<!--- 	   <td bgcolor="#BCOLOR#" align="middle"><cfif #vchImageURL# neq ""><a href="javascript:viewlocalbanner('#vchImageURL#')"><img src="i/mag.gif" alt="View Banner" border="0"></a></cfif></td>--->
     </tr>
     <cfif bcolor eq "B3CFE2">
     <cfset bcolor = "9bb0d4">
    <cfelse>
     <cfset bcolor = "B3CFE2">
    </cfif></cfoutput>
    </table>
   </cfif>
   
   <table border="0">
   <tr>
   <td><a href="updatebanner.cfm"><img src="i/backarr.gif" border="0"></a></td><td><b><font face="Tahoma,Arial" size="1"><a href="updatebanner.cfm"><font color="black">back</font></a></font></td>
   </tr>
   </table>
   </td>
  </tr></cfif>
  <cfif Action eq "UpdateBanner">
  
    <script>
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
   <cfquery name="qGetBanner" datasource="#ds#">
    select * from fuseAds_Banners
    where iBannerID = #BannerID#
   </cfquery>
   <table border="0">
   <tr>
    <td><a href="javascript:WinOpen('help.cfm#h3','500','420');"><img src="i/q.gif" border="0"></a></td>
    <td><font face="Arial" color="black" size="2"><b>Client:</td>
    <td><cfquery name="qGetClients" datasource="#ds#">
      select * from fuseAds_Clients
      where chClientStatus = 'Active'
     </cfquery>
     <select name="ClientID">
      <cfoutput query="qGetClients">
       <option value="#iClientID#" <cfif qGetBanner.iClientID eq iClientID>selected</cfif>>#vchClientName#   
      </cfoutput>
     </select></td>
   </tr>   
   <tr>
    <td><a href="javascript:WinOpen('help.cfm#h4','500','420');"><img src="i/q.gif" border="0"></a></td>
    <td><font face="Arial" color="black" size="2"><b>Banner Type:</td>
    <td><select name="BannerType">
      <option value="Local" <cfif qGetBanner.vchBannerType eq "Local">selected</cfif>>Local
      <option value="External" <cfif qGetBanner.vchBannerType eq "External">selected</cfif>>External
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
       <option value="#iSizeID#" <cfif qGetBanner.iBannerSize eq iSizeID>selected</cfif>>#vchBannerSize#
      </cfoutput>
     </select></td>
   </tr>
   <tr>
    <td valign=top><a href="javascript:WinOpen('help.cfm#h6','500','420');"><img src="i/q.gif" border="0"></a></td>
    <td valign="top"><font face="Arial" color="black" size="2"><b>Category:</td>
    <td>
     <cfquery name="qGetCategory" datasource="#ds#">
      select * from fuseAds_Categories where chCategoryStatus = 'Active'
     </cfquery>
     <select name="Category" multiple>
      <cfoutput query="qGetCategory">
       <cfquery name="qCheckCategory" datasource="#ds#">
        select * from fuseAds_BannerCategory
        where iCategoryID = #iCategoryID# 
        and iBannerID = #BannerID#     
       </cfquery>
       <option value="#iCategoryID#" <cfif qCheckCategory.recordcount neq 0>selected</cfif>>#vchCategoryName#
      </cfoutput>
     </select></td>
   </tr>  
   <tr>
    <td><a href="javascript:WinOpen('help.cfm#h7','500','420');"><img src="i/q.gif" border="0"></a></td>  
    <td><font face="Arial" color="black" size="2"><b>Description:</td>
    <td><cfinput type="text" name="Description" Size="30" value="#qGetBanner.vchDescription#" Maxlength="50" Required="Yes" Message="You must enter a Description"></td>
   </tr>
   <tr>
    <td><a href="javascript:WinOpen('help.cfm#h8','500','420');"><img src="i/q.gif" border="0"></a></td>  
    <td nowrap><font face="Arial" color="black" size="2"><b>Track Impressions:</td>
    <td><select name="TrackImpressions">
      <option <cfif qGetBanner.chTrackImpressions eq "Yes">selected</cfif>>Yes
      <option <cfif qGetBanner.chTrackImpressions eq "No">selected</cfif>>No
     </select></td>
   </tr>
   <tr>
    <td><a href="javascript:WinOpen('help.cfm#h9','500','420');"><img src="i/q.gif" border="0"></a></td>  
    <td nowrap><font face="Arial" color="black" size="2"><b>Maximum Impressions:</td>
    <cfif qGetBanner.iMaxImpressions eq "0">
     <cfset MaxImpressions = "">
    <cfelse>
     <cfset MaxImpressions = qGetBanner.iMaxImpressions>
    </cfif>
    <td><cfinput type="text" value="#MaxImpressions#" name="MaxImpressions" Size="5"  Maxlength="10" Validate="Integer"></td>
   </tr> 
   <tr>
    <td><a href="javascript:WinOpen('help.cfm#h10','500','420');"><img src="i/q.gif" border="0"></a></td>  
    <td><font face="Arial" color="black" size="2"><b>Track Click Throughs:</td>
    <td><select name="TrackClicks">
      <option <cfif qGetBanner.chTrackClicks eq "Yes">selected</cfif>>Yes
      <option <cfif qGetBanner.chTrackClicks eq "No">selected</cfif>>No
     </select></td>
   </tr>
   <tr>
    <td><a href="javascript:WinOpen('help.cfm#h11','500','420');"><img src="i/q.gif" border="0"></a></td>
    <cfif qGetBanner.iMaxClicks eq "0">
     <cfset MaxClicks = "">
    <cfelse>
     <cfset MaxClicks = qGetBanner.iMaxClicks>
    </cfif>    
    <td nowrap><font face="Arial" color="black" size="2"><b>Maximum Clicks:</td>
    <td><cfinput type="text" Value="#MaxClicks#" name="MaxClicks" Size="5"  Maxlength="10" Validate="Integer"></td>
   </tr>   
   <tr>
    <cfif qGetBanner.dtStartDate eq "1900-01-01 00:00:00" or qGetBanner.dtStartDate eq "1899-12-30 00:00:00">
     <cfset StartDate = "">
    <cfelse>
     <cfset StartDate = Dateformat(qGetBanner.dtStartDate,"mm/dd/yyyy")>
    </cfif>   
    <td><a href="javascript:WinOpen('help.cfm#h12','500','420');"><img src="i/q.gif" border="0"></a></td>  
    <td><font face="Arial" color="black" size="2"><b>Start Date:</td>
    <td><cfinput type="text" value="#StartDate#" name="StartDate" Size="15"  Maxlength="10" Validate="Date">&nbsp;<font face="Arial" color="black" size="1">(mm/dd/yyyy)</td>
   </tr>
   <tr>
    <cfif qGetBanner.dtEndDate eq "1900-01-01 11:59:59 PM" or qGetBanner.dtEndDate eq "1899-12-30 11:59:59 PM">
     <cfset EndDate = "">
    <cfelse>
     <cfset EndDate = Dateformat(qGetBanner.dtEndDate,"mm/dd/yyyy")>
    </cfif>    
    <td><a href="javascript:WinOpen('help.cfm#h13','500','420');"><img src="i/q.gif" border="0"></a></td> 
    <td><font face="Arial" color="black" size="2"><b>End Date:</td>
    <td><cfinput type="text" value="#EndDate#" name="EndDate" Size="15"  Maxlength="10" Validate="Date">&nbsp;<font face="Arial" color="black" size="1">(mm/dd/yyyy)</td>
   </tr>
   <tr>
    <td valign=top><a href="javascript:WinOpen('help.cfm#h14','500','420');"><img src="i/q.gif" border="0"></a></td>  
    <td valign=top><font face="Arial" color="black" size="2"><b>Do not run on:</td>
    <td><select name="DayOfWeek" multiple>
      <cfloop index="i" From="1" To="7">
       <cfoutput>
       <option value="#i#" <cfif ListFindNoCase(qGetBanner.vchExceptionDays,i) neq 0>selected</cfif>>#DayOfWeekAsString(i)#
       </cfoutput>
      </cfloop>
     </select></td>
   </tr>
   <tr>
    <td><a href="javascript:WinOpen('help.cfm#h15','500','420');"><img src="i/q.gif" border="0"></a></td>  
    <td valign=top><font face="Arial" color="black" size="2"><b>Start at:</td>
    <td><select name="StartTime">
      <cfloop index="i" From="0" To="23">
       <cfoutput>
        <option value="#i#:00:00" <cfif Hour(qGetBanner.chFromTime) eq i>selected</cfif>>#i#:00:00
       </cfoutput>
      </cfloop>
     </select></td>
   </tr>
   <tr>
    <td valign=top><a href="javascript:WinOpen('help.cfm#h16','500','420');"><img src="i/q.gif" border="0"></a></td>  
    <td valign=top><font face="Arial" color="black" size="2"><b>To:</td>
    <td><select name="EndTime">
      <cfloop index="i" From="0" To="23">
       <cfoutput>
        <option value="#i#:59:59"  <cfif Hour(qGetBanner.chToTime) eq i>selected</cfif>>#i#:59:59
       </cfoutput>
      </cfloop>
     </select></td>
   </tr>  
   <tr>
    <td></td>  
    <td colspan="2"><font face="Arial" color="Navy" size="2"><b>Local banner</td>
   </tr>
   <tr>
    <td><a href="javascript:WinOpen('help.cfm#h17','500','420');"><img src="i/q.gif" border="0"></a></td>
    <td><font face="Arial" color="black" size="2"><b>Image URL</b>:
    <td>
     <cfinput type="text" name="ImageURL" Size="30" value="#qGetBanner.vchImageURL#" Maxlength="255"><cfoutput><br />
	 <img src="../<cfoutput>#qGetBanner.vchImageURL#</cfoutput>"></cfoutput>
    </td>
   </tr>
   <tr>
    <td><a href="javascript:WinOpen('help.cfm#h18','500','420');"><img src="i/q.gif" border="0"></a></td>
    <td><font face="Arial" color="black" size="2"><b>Re-direct URL</b>:</td>

    <td><!--- <cfinclude template="../eventsdropdownUpdate.cfm">---><cfinput type="text" name="RedirectURL" Size="30" value="#qGetBanner.vchRedirectURL#" Maxlength="255"></td>
   </tr>
   <tr>
    <td><a href="javascript:WinOpen('help.cfm#h19','500','420');"><img src="i/q.gif" border="0"></a></td> 
    <td colspan="2">
     <font face="Arial" color="Navy" size="2"><b>External banner code</b><font color=black size=1>Note: click on the question mark for information regarding cache busting techniques.</font>
    </td>
   </tr>
   <tr>
    <td></td>
    <td colspan="2"><textarea name="ExternalCode" Cols=40 Rows=5><cfoutput>#qGetBanner.txExternalCode#</cfoutput></textarea></td>
   </tr>
   <tr>
    <td></td>
    <td colspan="2" align="middle">
   <input type="submit" name="UpdateBanner" Value="Update Banner" onClick="return verifyfields()">
   <input type="hidden" name="Action" Value="UpdateBannerDB">
     <cfoutput><input type="hidden" name="BannerID" Value="#BannerID#"></cfoutput></td>
   </tr> 
   </table>
  </cfif>
  <cfif Action eq "UpdateBannerDB">
   <cfif NOT isDefined("DayOfWeek")>
    <cfset DayOfWeek = "0">
   </cfif> 
   <cfif MaxImpressions eq "">
    <cfset MaxImpressions = 0>
   </cfif>
   <cfif MaxClicks eq "">
    <cfset MaxClicks = 0>
   </cfif>  
   <cfif StartDate eq "">
    <cfset StartDate = "01/01/1900">
   </cfif>
   <cfif EndDate eq "">
    <cfset EndDate = "01/01/1900">
   </cfif>   
   <cfquery name="qInsertBanner" datasource="#ds#">
    update fuseAds_Banners
    set iClientID = #CLIENTID#,
    vchBannerType = '#BANNERTYPE#',
    vchImageURL = '#IMAGEURL#',
    vchDescription = '#DESCRIPTION#',
    txExternalCode = '#EXTERNALCODE#',
    iBannerSize = #BANNERSIZEID#,
    chTrackImpressions = '#TRACKIMPRESSIONS#',
    chTrackClicks = '#TRACKCLICKS#',
    chBannerStatus = 'Enabled',
    dtStartDate = #CreateODBCDateTime(STARTDATE & " 00:00:00")#,
    dtEndDate = #CreateODBCDateTime(ENDDATE)#,
    iMaxImpressions = #MAXIMPRESSIONS#,
    iMaxClicks = #MAXCLICKS#,
    vchExceptionDays = '#DAYOFWEEK#',
    chFromTime = #CreateODBCDateTime("01/01/1900 " & STARTTIME)#,
    chToTime = #CreateODBCDateTime("01/01/1900 " & ENDTIME)#,
    vchRedirectURL  = '#RedirectURL#'
    where iBannerID = #BannerID#
   </cfquery>   

   <cfquery name="qDeleteCategories" datasource="#ds#">
    delete from fuseAds_BannerCategory
    where iBannerID = #bannerID#
   </cfquery> 
   <cfif isDefined("Category")>

    <cfset WSArray = ListToArray(Category)>
    <cfset ArrayLen = ArrayLen(WSArray)>
    
    <cfloop index="i" from="1" to="#ArrayLen#">
     <cfquery name="qInsertWebSite" datasource="#ds#">
      insert into fuseAds_BannerCategory
      (iCategoryID, iBannerID)
      values
      (#WSArray[i]#, #bannerID#)
     </cfquery>
    </cfloop>
   </cfif>
   <script>
    alert('Banner was Updated');
    window.location = 'updatebanner.cfm';
   </script>
  </cfif>
 </cfif>
</table>
</cfform></center></td>
</tr>
</table>

</body>
</html>