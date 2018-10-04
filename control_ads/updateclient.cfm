<CFIF USER_USERLEVEL NEQ "1"><cflocation url="main.cfm"></CFIF>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Main Window</title>
</head>

<body bgcolor="#FFFFFF" link="blue" vlink="blue" alink="blue">

<script>
	function WinOpen(url,x,y) {
		var options = "toolbar=no,scrollbars=yes,resizable=yes,width=" + x + ",height=" + y;
		msgWindow=window.open(url,"WinOpen",options);
	}	
	function viewlocalbanner(imgURL) {
		WinOpen('viewbanner.cfm?imgurl=' + imgURL, 550,200);
	}
</script>

<table border="0" width="85%"><tr>
<td>
<center>

<cfform action="updateclient.cfm" method="Post" Name="formname">
<table border="0" width=400>
	<tr>
	<td colspan=2 nowrap><center><font face="Arial" color="Navy" size="4"><b>U P D A T E&nbsp; C L I E N T</b></font></td>
	</tr>
	
	<cfif isDefined("Action") eq "No">
	<tr>
	<td colspan=2 nowrap><center><font face="Arial" color="black" size="2"><b>Keyword:</font> <cfinput type="text" name="Keyword" Size=20 Required="Yes" Message="You must enter a keyword"> <input type=submit name="Search" Value="Search"></td>
	</tr>
	<input type="hidden" name="Action" Value="Search">
	
	<cfelse>
		<cfif Action eq "Search">
			<cfquery name="qSearchClients" datasource="#ds#">
				select * from fuseAds_Clients
				where vchClientName like '%#Keyword#%'
			</cfquery>
			<cfif qSearchClients.RecordCount eq "0">
				<tr>
					<td colspan="2" align="middle"><font face="Arial" color="black" size="2"><b>No Clients Found</b></td>
				</tr>
			<cfelse>
				<tr>
					<td colspan="2" align="middle">
				<cfset bcolor="B3CFE2">
				<table border="0" width="80%"cellpadding="2" cellspacing="1">									
				<cfloop query="qSearchClients">
				
				<tr>
		<td bgcolor="black" colspan="2"><font face="Tahoma, Arial" size="2" color="white"><b>Client Name</b></font></td>
		<td bgcolor="black" colspan="2" align="right"><font face="Tahoma, Arial" size="2" color="white"><b>Task</b></font></td>
				</tr>
		<cfoutput>
				<tr>
		<td bgcolor="#bcolor#" colspan="2"><font face="Arial" color="black" size="2">#vchClientName#</b></td>
		<td bgcolor="#bcolor#" colspan="2" align="right"><font face="Arial" color="black" size="2"><a href="updateclient.cfm?Action=UpdateClient&ClientID=#iClientID#"><font color="black">Update</font></a></td>
					</tr>
					</cfoutput>
					
					<cfquery name="qGetClientBanners" datasource="#ds#">
						select * from fuseAds_Banners
						where iClientID = #qSearchClients.iClientID#
					</cfquery>
					<cfif qGetClientBanners.recordcount neq "0">
				<tr>
			<td bgcolor="Black">&nbsp;</td>
			<td bgcolor="Black"><font face="Arial" color="White" size="2"><b>Banners</b></td>
			<td bgcolor="Black"><font face="Arial" color="White" size="2"><b>Clicks</b></td>
			<td bgcolor="Black"><font face="Arial" color="White" size="2"><b>Imp.</b></td>
				</tr>					
			<cfoutput query="qGetClientBanners">
				<tr>
			<td align="middle" bgcolor="eeeeee"><cfif vchImageURL neq ""><a href="javascript:viewlocalbanner('#vchImageURL#')"><img src="i/mag.gif" border="0" align="absmiddle"></a><cfelse>&nbsp;</cfif></td>
			<td bgcolor="eeeeee"><font face="Arial" color="black" size="2">#vchDescription#</td>
			<td bgcolor="eeeeee"><font face="Arial" color="black" size="2">#iClicks#</td>
			<td bgcolor="eeeeee"><font face="Arial" color="black" size="2">#iImpressions#</td>
				</tr></cfoutput></cfif>
				</cfloop>
				<tr>
				<td>
			<table border="0">
			<tr>
			<td><a href="updateclient.cfm"><img src="i/backarr.gif" border="0"></a></td><td><b><font face="Tahoma,Arial" size="1"><a href="updateclient.cfm"><font color="black">back</font></a></font></td>
			</tr>
			</table>
			</td>
			</tr>
			</table>
			</cfif>
			</td>
			</tr>
		</cfif>
		<cfif Action eq "UpdateClient">
		<cfquery name="qGetClient" datasource="#ds#">
			select * from fuseAds_Clients fc
			where fc.iClientID = #ClientId#
		</cfquery>
		<cfquery name="qGetUser" datasource="#ds#">
			select * from fuseAds_Users 
			where iClientID = #ClientID#		
		</cfquery>
		
			<cfoutput query="qGetClient">
			<tr>
		<td colspan="2"><center><table border="0">
			<tr>
		<td><font face="Arial" color="black" size="2">Client Name:</td>
		<td><cfinput type="text" name="ClientName" Size="30" value="#vchClientName#" Maxlength="255" Required="Yes" Message="You must enter a Client Name"></td>
			</tr>
			<tr>
		<td><font face="Arial" color="black" size="2">Contact:</td>
		<td><cfinput type="text" name="Contact" Size="30" value="#vchContact#" Maxlength="100" Required="No"></td>
			</tr>
			<tr>
		<td><font face="Arial" color="black" size="2">Phone Number:</td>
		<td><cfinput type="text" name="Phone" Size="30" value="#vchContactPhone#" Maxlength="15" Required="No"></td>
			</tr>
			<tr>
		<td><font face="Arial" color="black" size="2">Email Address:</td>
		<td><cfinput type="text" name="Email" Size="30" value="#vchContactEmail#" Maxlength="255" Required="No"></td>
			</tr>
			<tr>
		<td><font face="Arial" color="black" size="2">Status:</td>
		<td><select name="Status">
		<option value="Active" <cfif chClientStatus eq "Active">Selected</cfif>>Active
		<option value="Non-Active" <cfif chClientStatus eq "Non-Active">Selected</cfif>>Non-Active
		</select></td>
			</tr>
			<tr>	
		<td valign=top><font face="Arial" color="black" size="2">Username:</td>
		<td><cfinput type="text" name="Username" Size="30" value="#qGetUser.vchUsername#" Maxlength="255" Required="Yes" Message="You must enter a username"></td>
			</tr>
			<tr>	
		<td valign=top><font face="Arial" color="black" size="2">Password:</td>
		<td><cfinput type="text" name="Password" Size="30" value="#qGetUser.vchPassword#" Maxlength="255" Required="Yes" Message="You must enter a password"></td>
			</tr></cfoutput>		
			<tr>
		<td colspan="2" align="right">
		<input type="submit" name="UpdateClient" Value="Update Client">
		<input type="hidden" name="Action" Value="UpdateClientDB">
		<cfoutput><input type="hidden" name="ClientID" Value="#ClientID#"></cfoutput></td>
			</tr>
			</table>
			</td>
		</tr>
		</cfif>
		<cfif Action eq "UpdateClientDB">
			<cfquery name="qUpdateClient" datasource="#ds#">
				update fuseAds_Clients
				set vchClientName = '#ClientName#',
				vchContact = '#Contact#',
				vchContactPhone = '#Phone#',
				vchContactEmail = '#Email#',
				chClientStatus = '#Status#'
				where iClientID = #ClientID#
			</cfquery>
			<cfquery name="qUpdateUser" datasource="#ds#">
				update fuseAds_Users
				set vchUsername = '#Username#',
				vchPassword = '#Password#'
				where iClientiD = #ClientID#			
			</cfquery>
			<script>
				alert('Client was updated');
				window.location = 'updateclient.cfm';
			</script>			
		</cfif>
	</cfif>
</table>
</cfform>
</center></td>
</tr>
</table>

</body></html>	