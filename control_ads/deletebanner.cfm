<CFIF USER_USERLEVEL NEQ "1"><cflocation url="main.cfm"></CFIF>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head><title>Main Window</title>
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
		WinOpen('viewbanner.cfm?imgurl=' + imgURL, 560, 200);
	}
</script>
<cfform action="deletebanner.cfm" method="Post" Name="formname">
<table width=30%>
	<tr>
	<td colspan=3><center><font face="Tahoma, Arial" color="navy" size="4"><b>D E L E T E &nbsp; B A N N E R</b></font></td>
	</tr>
	<cfif NOT isDefined("Action")>
		<tr>
	<td colspan="2"><font face="Arial" color="black" size="2"><b>Keyword:</font> <cfinput type="text" name="Keyword" Size=20 Required="Yes" Message="You must enter a keyword"> <input type=submit name="Search" Value="Search"></td>
		</tr>
		<input type="hidden" name="Action" Value="Search">
	<cfelse>
		<cfif Action eq "Search">
			<cfquery name="qSearchUsers" datasource="#ds#">
				select * from fuseAds_Banners
				where vchDescription like '%#Keyword#%'
			</cfquery>
			<cfif qSearchUsers.RecordCount eq "0">
				<tr>
			<td colspan="2" align="middle"><font face="Arial" color="black" size="2"><b>No Banners Found</b></td>
				</tr>
			<cfelse>
				<cfoutput query="qSearchUsers">
					<tr>
				<td><font face="Arial" color="black" size="2">#vchDescription#</td>
				<td><cfif #vchImageURL# neq ""><a href="javascript:viewlocalbanner('#vchImageURL#')"><img src="i/magview.gif" alt="View Banner" border="0"></a></cfif></td>
				<td><a href="deletebanner.cfm?Action=deleteBanner&BannerID=#iBannerID#" onclick="return confirm('Deleting a banner will delete all associated reports')"><font face="Arial" color="black" size="2">Delete</a></td>
					</tr>
				</cfoutput></cfif></cfif>
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
			</script></cfif></cfif>
</table>
</cfform>
</center></td>
</tr>
</table>

</body>
</html>