<cfif not isDefined("StartDate")>
 <cfset StartDate = Now()>
 <cfset DayOfWeek = DayOfWeek(Now())>
 <cfloop condition="dayofweek neq 1">
  <cfset StartDate = DateAdd("d", -1, StartDate)>
  <cfset DayOfWeek = DayOfWeek - 1>
 </cfloop>
</cfif>

<cfset StartDate = CreateODBCDateTime(DateFormat(StartDate, "mm/dd/yyyy") & " 00:00:00")>
<cfif not isDefined("EndDate")>
 <cfset EndDate = CreateODBCDateTime(DateFormat(DateAdd("d", 7, StartDate), "mm/dd/yyyy") & " 00:00:00")>
<cfelse>
 <cfset EndDate = CreateODBCDateTime(DateFormat(EndDate, "mm/dd/yyyy") & " 23:59:59")>
</cfif>
  
<body bgcolor="#FFFFFF" link="blue" vlink="blue" alink="blue">
<center>
<table border="0" width="85%">
 <tr>
  <td>
   <table>
    <tr>
     <td colspan=2><center><font face="Tahoma,Arial" color="Navy" size="4"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;I M P R E S S I O N &nbsp; -- &nbsp; P A G E &nbsp; V I E W S&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></font></td>
    </tr>
   </table>
<script>
 function WinOpen(url,x,y) {
  var options = "toolbar=no,scrollbars=yes,resizable=yes,width=" + x + ",height=" + y;
  msgWindow=window.open(url,"WinOpen",options);
 } 
 function viewlocalbanner(imgURL) {
  WinOpen('viewbanner.cfm?imgurl=' + imgURL, 550, 250);
 }
</script>

<cfquery name="qGetReport" datasource="#ds#">
 select fit.vchPathInfo, Sum(fit.iImpressionCount) as ImpressionCount
 from fuseAds_ImpressionTrack fit, fuseAds_Banners fb, fuseAds_Clients fc<cfif isDefined("Categories")><cfif Categories neq "All">,fuseAds_BannerCategory fbc</cfif></cfif>
 
 where dtDateTime between #StartDate# and #EndDate#
 and chTrackImpressions = 'Yes'
 <cfif isDefined("Clients")>
  <cfif Clients neq "All">
   and fc.iClientID = #Clients#
  </cfif>
 </cfif>
 <cfif isDefined("Categories")>
  <cfif Categories neq "All">
   and fbc.iCategoryID = #Categories#
  </cfif>
 </cfif>
 <cfif isDefined("Sizes")>
  <cfif Sizes neq "All">
   and fb.iBannerSize = #Sizes#
  </cfif>
 </cfif>
 <cfif isDefined("Server")>
  <cfif Server neq "All">
   and fit.vchServerName = '#Server#'
  </cfif>
 </cfif>
 <CFIF USER_USERLEVEL NEQ "1">
  and fc.iClientID = #session.clientid#
 </CFIF>
 and fb.iBannerID = fit.iBannerID
 and fb.iClientID = fc.iClientID
 <cfif isDefined("Categories")><cfif Categories neq "All">
 and fbc.iBannerID = fb.iBannerID
 </cfif></cfif>

 <CFIF USER_USERLEVEL NEQ "1">
  and fc.iClientID = #session.clientid#
 </CFIF> 
  
 group by fit.vchPathInfo
 order by 
 <cfif DBTYPE eq "MYSQL">
  ImpressionCount DESC
 <cfelse>
  Sum(fit.iImpressionCount) DESC
 </cfif>
</cfquery>
<table width="500">
    <tr>
     <td>
      <cfoutput>
      <table border="0">
       <tr>
        <td width="15"><a href="imppageviewed.cfm<cfif isDefined("Server")>?Server=#Server#&Sizes=#Sizes#&Categories=#Categories#&Clients=#Clients#&StartDate=#UrlEncodedFormat(StartDate)#&EndDate=#UrlEncodedFormat(EndDate)#</cfif>"><img src="../i/ref.gif" alt="Refresh" border="0" align="absmiddle"></a></td>
        <td><a href="imppageviewed.cfm<cfif isDefined("Server")>?Server=#Server#&Sizes=#Sizes#&Categories=#Categories#&Clients=#Clients#&StartDate=#UrlEncodedFormat(StartDate)#&EndDate=#UrlEncodedFormat(EndDate)#</cfif>"><font face="Tahoma,Arial" color="Navy" size="1">refresh</font></a></td>
        <td width="5">&nbsp;</td>
        <td width="15"><a target="_blank" href="imppageviewedprint.cfm<cfif isDefined("Server")>?Server=#Server#&Sizes=#Sizes#&Categories=#Categories#&Clients=#Clients#&StartDate=#UrlEncodedFormat(StartDate)#&EndDate=#UrlEncodedFormat(EndDate)#</cfif>"><img src="../i/printer.gif" alt="Print" border="0" align="absmiddle"></a></td>
        <td><a target="_blank" href="imppageviewedprint.cfm<cfif isDefined("Server")>?Server=#Server#&Sizes=#Sizes#&Categories=#Categories#&Clients=#Clients#&StartDate=#UrlEncodedFormat(StartDate)#&EndDate=#UrlEncodedFormat(EndDate)#</cfif>"><font face="Tahoma,Arial" color="Navy" size="1">print</font></a></td>
        <td width="5">&nbsp;</td>
        <td width="15"><a href="export.cfm?Action=ExportImpViews<cfif isDefined("Server")>&Server=#Server#&Sizes=#Sizes#&Categories=#Categories#&Clients=#Clients#</cfif>&StartDate=#UrlEncodedFormat(StartDate)#&EndDate=#UrlEncodedFormat(EndDate)#"><img src="../i/export.gif" alt="Export" border="0" align="absmiddle"></a></td>
        <td><a href="export.cfm?Action=ExportImpViews<cfif isDefined("Server")>&Server=#Server#&Sizes=#Sizes#&Categories=#Categories#&Clients=#Clients#</cfif>&StartDate=#UrlEncodedFormat(StartDate)#&EndDate=#UrlEncodedFormat(EndDate)#"><font face="Tahoma,Arial" color="Navy" size="1">export</font></a></td>
       </tr>
      </table>
      </cfoutput>
     </td>
     <td align="right">
      <table border="0">
       <tr>
        <td><a href="javascript:WinOpen('help.cfm?Action=ImpViews', 500,500)"><img src="../i/help.gif" alt="Help" border="0" align="absmiddle"></a></td><td><a href="javascript:WinOpen('help.cfm?Action=ImpViews', 500,500)"><font face="Tahoma,Arial" color="Navy" size="1">help</font></a></td>
       </tr>
      </table>
     </td>
    </tr>
   </table>   
   
   <!--- Display Report Information --->
   <cfinclude template="menu.cfm">
   
   <!--- Display Graph --->
   <cfset GraphTitle = "Impression Report by Page Views">
   <cfset GraphField = "vchPathInfo">
   <cfinclude template="graph.cfm">
   
   <table cellpadding="1" cellspacing="0" width="500">
    <tr>
     <td bgcolor="black">
      <table width="100%" bgcolor="FFFFEE" cellpadding="2" cellspacing="0">
       <tr>
        <td bgcolor="black" align="middle"><font color="White" Face="Arial" Size="1"><b>Page</td>
        <td bgcolor="black" align="middle"><font color="White" Face="Arial" Size="1"><b>Total forPeriod</td>  
        <td bgcolor="black" align="middle"><font color="White" Face="Arial" Size="1"><b>Avg perDay</td>
        <td bgcolor="black" align="middle"><font color="White" Face="Arial" Size="1"><b>% oftotal</td>
        <td bgcolor="black" align="middle"><font color="White" Face="Arial" Size="1"><b>Clicks</td>
        <td bgcolor="black" align="middle"><font color="White" Face="Arial" Size="1"><b>Ratio</td>        
       </tr>
       <cfoutput query="qGetReport">
        <cfquery name="qGetClickCount" datasource="#ds#">
         select  sum(iClickCount) as ClickCount
         from fuseAds_ClickTrack fct, fuseAds_Banners fb, fuseAds_Clients fc <cfif isDefined("Categories")><cfif Categories neq "All">,fuseAds_BannerCategory fbc</cfif></cfif>
         where dtDateTime between #StartDate# and #EndDate#
         <cfif isDefined("Clients")>
          <cfif Clients neq "All">
           and fc.iClientID = #Clients#
          </cfif>
         </cfif>   
         <cfif isDefined("Categories")>
          <cfif Categories neq "All">
           and fbc.iCategoryID = #Categories#
          </cfif>
         </cfif>   
         <cfif isDefined("Sizes")>
          <cfif Sizes neq "All">
           and fb.iBannerSize = #Sizes#
          </cfif>
         </cfif>
         <cfif isDefined("Server")>
          <cfif Server neq "All">
           and fct.vchServerName = '#Server#'
          </cfif>
         </cfif>   
         and  fb.iBannerID = fct.iBannerID
         and  fb.iClientID = fc.iClientID 
         <cfif isDefined("Categories")>
          <cfif Categories neq "All">
           and fbc.iBannerID = fb.iBannerID
          </cfif>
         </cfif> 
         
         group by fct.vchPathInfo  
        </cfquery> 
        <tr>
         <td><font color="Black" Face="Arial" Size="1">#vchPathInfo#</td>
         <td bgcolor="FFFFEE" align="middle"><font color="Black" Face="Arial" Size="1">#ImpressionCount#</td> 
         <cfif ImpressionCount neq "" or DateDiff neq "">
          <cfset Avg = NumberFormat(ImpressionCount / DateDiff, "99999999999.99")>
         <cfelse>
          <cfset Avg = "0">
         </cfif>
         <td bgcolor="FFFFEE" align="middle"><font color="Black" Face="Arial" Size="1">#Avg#</td>
         <cfif ImpressionCount eq "0">
          <cfset percent = 0>
         <cfelse>
          <cfset percent = NumberFormat((ImpressionCount * 100) / Total, "99.99")>
         </cfif>
         <td bgcolor="FFFFEE" align="middle" nowrap><font color="Black" Face="Arial" Size="1">%#percent#</td>
         <cfif qGetClickCount.ClickCount neq "" and qGetClickCount.ClickCount neq "0">
          <td bgcolor="FFFFEE" align="middle"><font color="Black" Face="Arial" Size="1">#qGetClickCount.ClickCount#</td>
          <cfset Ratio = NumberFormat((qGetClickCount.ClickCount * 100) / ImpressionCount, "99.99")>
          <td bgcolor="FFFFEE" align="middle"><font color="Black" Face="Arial" Size="1">#Ratio#</td>
         <cfelse>
          <td bgcolor="FFFFEE" align="middle"><font color="Black" Face="Arial" Size="1">n/a</td>
          <td bgcolor="FFFFEE" align="middle"><font color="Black" Face="Arial" Size="1">n/a</td>
         </cfif>         
        </tr>
       </cfoutput>
      </table>
     </td>
    </tr>
   </table>

  </td>
 </tr>
</table>