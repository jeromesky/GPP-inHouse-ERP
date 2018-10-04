<!--- Get Total Banners --->
<cfset Total = 0>
<cfif cgi.script_name contains "imp">
 <cfloop query="qGetReport">
  <cfset Total = Total + ImpressionCount>
 </cfloop>
<cfelse>
 <cfloop query="qGetReport">
  <cfset Total = Total + ClickCount>
 </cfloop>
</cfif>

<!--- Get the Difference in the start and end date --->
<cfset DateDiff = DateDiff("d", StartDate, EndDate)>
<cfif DateDiff eq "0"><cfset DateDiff = "1"></cfif>

<cfoutput>
<table border="0" cellpadding=2 bgcolor="B3CFE2" cellspacing=0 width=500>
 <tr>
  <td colspan="2" bgcolor="black"><font color="White" Face="Arial" Size="2"><b>Report Information</td>
 </tr>
 <tr>
  <td bgcolor="B3CFE2">
  <center>
  <table border="0" bgcolor="B3CFE2" cellpadding="2" cellspacing="0">
   <tr><td><font color="Black" Face="Arial" Size="2"><b>Start date:</td><td><font color="Black" Face="Arial" Size="2">#DateFormat(StartDate, "mm/dd/yyyy")#</td></tr>
   <tr><td><font color="Black" Face="Arial" Size="2"><b>End date:</td><td><font color="Black" Face="Arial" Size="2">#DateFormat(EndDate, "mm/dd/yyyy")#</td></tr>
  </table>
  </td>
  <td bgcolor="B3CFE2">
  <center>
  <table border="0" bgcolor="B3CFE2" cellpadding="2" cellspacing="0">  
   <tr><td><font color="Black" Face="Arial" Size="2"><b>Number of days in selection:</td><td><font color="Black" Face="Arial" Size="2">#DateDiff#</td></tr>
   <tr><td><font color="Black" Face="Arial" Size="2"><b>Total Impressions:</td><td><font color="Black" Face="Arial" Size="2">#Total#</td></tr>
  </table>
  </td>
 </tr>
</table>
</cfoutput>

<cfform action="#Script_name#" Method="Post">
<center>
<table border="0" cellpadding=0 bgcolor="B3CFE2" cellspacing=0 width="500">
 <tr>
  <td colspan=2 bgcolor=black>
  <center>
   <table border="0" bgcolor="B3CFE2" cellpadding="2" cellspacing="0" width=100%>
    <tr>
     <td colspan="2" bgcolor="black"><font color="White" Face="Arial" Size="2"><b>Date Selection</td>
    <tr>
   </table>
  </td>
 </tr>
 <Tr>
  <td bgcolor="B3CFE2"><center>
   <table border="0" bgcolor="B3CFE2" border="0" cellpadding="2" cellspacing="0">
    <tr>
     <td><font color="Black" Face="Arial" Size="2">Start Date:</td>
     <td><cfinput type="text" name="StartDate" size="10" Maxlength="10" Value="#DateFormat(StartDate, "mm/dd/yyyy")#" Required="Yes" Message="You must enter a start date" Validate="Date"></td> 
    </tr>
    <tr>
     <td><font color="Black" Face="Arial" Size="2">End Date:</td>
     <td><cfinput type="text" name="EndDate" size="10" Maxlength="10" Value="#DateFormat(EndDate, "mm/dd/yyyy")#" Required="Yes" Message="You must enter a end date" Validate="Date"></td> 
    </tr>
    <cfquery name="qGetClients" datasource="#ds#">
     select * from fuseAds_Clients
    </cfquery>
    <tr>
     <td><font color="Black" Face="Arial" Size="2">Clients:</td>
     <td>
      <select name="clients">
       <option value="All">All Clients
       <cfoutput query="qGetClients">
        <option value="#iclientID#" <cfif isDefined("Clients")><cfif Clients eq iclientID>selected</cfif></cfif>>#vchClientName#
       </cfoutput>
      </select>
     </td>
    </tr>
   </table>
  </td>
  <td valign=top>
  <center>
   <table bgcolor="B3CFE2" cellpadding="2" border="0" cellspacing="0">
    <cfquery name="qGetCategories" datasource="#ds#">
     select * from fuseAds_Categories
    </cfquery>
    <tr>
     <td><font color="Black" Face="Arial" Size="2">Categories:</td>
     <td>
      <select name="Categories">
       <option value="All">All Categories
       <cfoutput query="qGetCategories">
        <option value="#iCategoryID#" <cfif isDefined("Categories")><cfif Categories eq iCategoryID>selected</cfif></cfif>>#vchCategoryName#
       </cfoutput>
      </select>
     </td>
    </tr>
    </tr>
    <cfquery name="qGetSizes" datasource="#ds#">
     select * from fuseAds_BannerSize
    </cfquery>
    <tr>
     <td><font color="Black" Face="Arial" Size="2">Banner Sizes:</td>
     <td>
      <select name="Sizes">
       <option value="All">All Banner Sizes
       <cfoutput query="qGetSizes">
        <option value="#iSizeID#" <cfif isDefined("Sizes")><cfif Sizes eq iSizeID>selected</cfif></cfif>>#vchBannerSize#
       </cfoutput>
      </select>
     </td>
    </tr>
    <cfquery name="qGetSerer" datasource="#ds#">
     select distinct vchServerName from fuseAds_ImpressionTrack
    </cfquery>
    <tr>
     <td><font color="Black" Face="Arial" Size="2">Server:</td>
     <td>
      <select name="Server">
       <option value="All">All Servers
       <cfoutput query="qGetSerer">
        <option value="#vchServerName#" <cfif isDefined("Server")><cfif Server eq vchServerName>selected</cfif></cfif>>#vchServerName#
       </cfoutput>
      </select>
     </td>
    </tr> 
   </table>
  </td>
 </tr>
 <tr>
  <td colspan="2" align="middle"> <table border="0" width="95%"><tr><td align="right"><input type="submit" name="submit" value="  Refresh  "></td></tr></table></td>
 </tr>
</table>
</cfform>