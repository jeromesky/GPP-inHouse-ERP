<cfsetting showdebugoutput="no">

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
<table border="0" width="100%">
	<tr>
		<td><center>
			<table border="0">
				<tr>
					<td colspan=2><center><font face="Tahoma,Arial" color="navy" size="4"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;I M P R E S S I O N &nbsp; -- &nbsp; A N A L Y S I S&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></font></td>
				</tr>
			</table>
<script>
	function WinOpen(url,x,y) {
		var options = "toolbar=no,scrollbars=yes,resizable=yes,width=" + x + ",height=" + y;
		msgWindow=window.open(url,"WinOpen",options);
	}	
	function viewlocalbanner(imgURL) {
			WinOpen('../viewbanner.cfm?imgurl=' + imgURL, 550, 250);
	}
</script>

<cfquery name="qGetReport" datasource="#ds#">
	select fit.iBannerID, Sum(fit.iImpressionCount) as ImpressionCount,	vchDescription, vchClientName, iMaxImpressions, vchImageURL, iImpressions
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

	group by fit.iBannerID, fb.vchDescription, fc.vchClientName, fb.iMaxImpressions, fb.vchImageURL, fb.iImpressions
	order by 
	<cfif DBTYPE eq "MYSQL">
		ImpressionCount DESC
	<cfelse>
		Sum(fit.iImpressionCount) DESC
	</cfif>
</cfquery>
			<!--- Display Report Information --->
			<cfinclude template="menu_print.cfm">
			
			<!--- Display Graph --->
			<cfset GraphTitle = "Impression Report">
			<cfset GraphField = "vchDescription">
			<cfinclude template="graph_print.cfm">
			
<table cellpadding="1" cellspacing="0" width="100%"><tr><td bgcolor="FFFFFF">
	<table width="100%" bgcolor="FFFFFF" cellpadding="2" cellspacing="0">
		<tr>
		<td bgcolor="white" align="left"><font color="Black" Face="Arial" Size="1"><b>Banner</td>
		<td bgcolor="white" align="left"><font color="Black" Face="Arial" Size="1"><b>Client Name</td>
		<td bgcolor="white" align="middle"><font color="Black" Face="Arial" Size="1"><b>Total forPeriod</td>		
		<td bgcolor="white" align="middle"><font color="Black" Face="Arial" Size="1"><b>Avg forPeriod</td>
		<td bgcolor="white" align="middle"><font color="Black" Face="Arial" Size="1"><b>% oftotal</td>
		<td bgcolor="white" align="middle"><font color="Black" Face="Arial" Size="1"><b>Imp.Remaining</td>
		<td bgcolor="white" align="middle"><font color="Black" Face="Arial" Size="1"><b>Clicks</td>
		<td bgcolor="white" align="middle"><font color="Black" Face="Arial" Size="1"><b>Ratio</td>
		<td bgcolor="white" align="middle"><font color="Black" Face="Arial" Size="1"><b>&nbsp;</td>
		</tr>
	<cfoutput query="qGetReport">
		<cfquery name="qGetClickCount" datasource="#ds#">
			select sum(iClickCount) as ClickCount
			from fuseAds_ClickTrack fct, fuseAds_Banners fb, fuseAds_Clients fc <cfif isDefined("Categories")><cfif Categories neq "All">,fuseAds_BannerCategory fbc</cfif></cfif>
			where dtDateTime between #StartDate# and #EndDate#
			and fct.iBannerID = #iBannerID#			
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
		</cfquery>
		<tr>
		<td><font color="Black" Face="Arial" Size="1">#vchDescription#</td>
		<td bgcolor="FFFFFF"><font color="Black" Face="Arial" Size="1">#vchClientName#</td>
		<td bgcolor="FFFFFF" align="middle"><font color="Black" Face="Arial" Size="1">#ImpressionCount#</td>	
		<cfif iMaxImpressions neq "0">
			<cfset RemImp = iMaxImpressions - iImpressions>
		</cfif>
		<cfif ImpressionCount neq "" and DateDiff neq "">
			<cfset Avg = NumberFormat(ImpressionCount / DateDiff, "99999999999.99")>
		<cfelse>
			<cfset Avg = "0">
		</cfif>
		<td bgcolor="FFFFFF" align="middle"><font color="Black" Face="Arial" Size="1">#Avg#</td>
		<cfif ImpressionCount eq "0">
			<cfset percent = 0>
		<cfelse>		
			<cfset percent = NumberFormat((ImpressionCount * 100) / Total, "99.99")>
		</cfif>
		<td bgcolor="FFFFFF" align="middle" nowrap><font color="Black" Face="Arial" Size="1">%#percent#</td>
		<td bgcolor="FFFFFF" align="middle"><font color="Black" Face="Arial" Size="1"><cfif iMaxImpressions neq "0">#RemImp#<cfelse>n/a</cfif></td>		
		<cfif IsNumeric(qGetClickCount.ClickCount)>
			<td bgcolor="FFFFFF" align="middle"><font color="Black" Face="Arial" Size="1">#qGetClickCount.ClickCount#</td>
			<cfset Ratio = NumberFormat((qGetClickCount.ClickCount * 100) / ImpressionCount, "99.99")>
			<td bgcolor="FFFFFF" align="middle"><font color="Black" Face="Arial" Size="1">#Ratio#</td>
		<cfelse>
			<td bgcolor="FFFFFF" align="middle"><font color="Black" Face="Arial" Size="1">n/a</td>
			<td bgcolor="FFFFFF" align="middle"><font color="Black" Face="Arial" Size="1">n/a</td>
		</cfif>
		<td bgcolor="FFFFFF" align="middle"><cfif vchImageURL neq ""><a href="javascript:viewlocalbanner('#vchImageURL#')"><img src="i/magw.gif" border="0"><cfelse>&nbsp;</cfif></a></td>	
		</tr>
	</cfoutput>
	</table>
</td></tr></table>
	
</td></tr></table>