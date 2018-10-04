<CFIF USER_USERLEVEL NEQ "1"><cflocation url="main.cfm"></CFIF>

<body bgcolor="#FFFFFF" link="blue" vlink="blue" alink="blue">
<center>
<table border="0" width="85%">
	<tr>
 <td>
 <table border="0" width="80%">
  <tr>
  	<td>
   <center><font face="Tahoma,Arial" color="Navy" size="4"><b>T A G &nbsp; G E N E R A T OR</b></font></td>
  </tr>
  <tr>
  	<td><center><font face="Tahoma,Arial" color="Black" size="2">
 You can use this section to help generate your ad tag.  The fuseAds tag 
 requires you to pass IDs for the attributes and the tag generator will help you do this.</td>
  </tr>
 	</table>
 	<form action="generator.cfm" method="post">
 	<table cellpadding="2" border="0" cellspacing="0">
  <cfquery name="qGetCategories" datasource="#ds#">
  	select * from fuseAds_Categories
  	where chCategoryStatus = 'Active'
  </cfquery>
  <tr>
  	<td><font color="Black" Face="Arial" Size="2">Categories:</td>
  	<td>
   <select name="Categories">
   	<option value="All">All Categories
   	<cfoutput query="qGetCategories"><option value="#iCategoryID#">#vchCategoryName#</cfoutput>
   </select></td>
  </tr>
  </tr>
  <cfquery name="qGetSizes" datasource="#ds#">
  	select * from fuseAds_BannerSize
  </cfquery>
  <tr>
  	<td><font color="Black" Face="Arial" Size="2">Banner Sizes:</td>
  	<td><select name="Sizes">
   	<option value="All">All Banner Sizes
   	<cfoutput query="qGetSizes">
    <option value="#iSizeID#">#vchBannerSize#
   	</cfoutput>
   </select></td>
  </tr>
  <cfquery name="qGetClients" datasource="#ds#">
  	select * from fuseAds_Clients
  	where chClientStatus = 'Active'
  </cfquery>
  <tr>
  	<td><font color="Black" Face="Arial" Size="2">Clients:</td>
  	<td><select name="Clients">
   	<option value="All">All Clients
   	<cfoutput query="qGetClients">
    <option value="#iCLientID#">#vchClientName#
   	</cfoutput>
   </select></td>
  </tr>  
  <tr>
  	<td colspan="2" align="middle"><input type="submit" name="generate" value="  Generate Tag  "></td>
  </tr>
  <cfif isDefined("generate")>
  <tr>
  	<td colspan="2"><font color="Black" Face="Arial" Size="2"><b>Tag Generation</b></td>  
  </tr>
  <tr>
  	<td colspan="2">
   <cfset Tag = "<cf_fuseads">
   <cfif Sizes neq "All">
   	<cfset Tag = Tag & " BannerSize=" & chr(34) & #Sizes# & chr(34)>
   </cfif>
   <cfif Categories neq "All">
   	<cfset Tag = Tag & " Category=" & chr(34) & #Categories# & chr(34)>
   </cfif>
   <cfif Clients neq "All">
   	<cfset Tag = Tag & " Client=" & chr(34) & #Clients# & chr(34)>
   </cfif>   	
   <cfset Tag = Tag & " datasource=" & chr(34) & #qGetAdminSettings.vchDatasource# & chr(34) & ">">
<cfoutput>  	
   <textarea name="TagGeneration" Cols="40" Rows="10">
#Tag#
   </textarea>
</cfoutput></td>  	
  </tr>
  </cfif>
 	</table></form>
 </td>
	</tr>
</table> 