<cfset DateDiff = DateDiff("d", StartDate, EndDate)>
<cfif DateDiff eq "0">
	<cfset DateDiff = "1">
</cfif>

<cfif Action eq	"ExportImpViews">
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
	<cfset Total = 0>
	<cfloop query="qGetReport">
		<cfset Total = Total + ImpressionCount>
	</cfloop>
<CFCONTENT TYPE="text/x-excel-csv"><CFHEADER NAME="Content-Disposition" VALUE="attachment; filename=export.csv">"Page","Total for Period","Average per day","% of Total"<cfoutput>#chr(10)#</cfoutput><cfloop query="qGetReport"><cfset Avg = NumberFormat(ImpressionCount / DateDiff, "99.99")><cfset percent = NumberFormat((ImpressionCount * 100) / Total, "99.99")><cfoutput>"#vchPathInfo#","#ImpressionCount#","#Avg#","%#percent#"#chr(10)#</cfoutput></cfloop>
</cfif>

<cfif Action eq	"ExportClkViews">
	<cfquery name="qGetReport" datasource="#ds#">
	select fit.vchPathInfo, Sum(fit.iClickCount) as ClickCount
	from fuseAds_ClickTrack fit, fuseAds_Banners fb, fuseAds_Clients fc<cfif isDefined("Categories")><cfif Categories neq "All">,fuseAds_BannerCategory fbc</cfif></cfif>
	
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

	group by fit.vchPathInfo
	order by
	<cfif DBTYPE eq "MYSQL">
		ClickCount DESC
	<cfelse>
		Sum(fit.iClickCount) DESC
	</cfif>
</cfquery>
	<cfset Total = 0>
	<cfloop query="qGetReport">
		<cfset Total = Total + ClickCount>
	</cfloop>
	
<CFCONTENT TYPE="text/x-excel-csv"><CFHEADER NAME="Content-Disposition" VALUE="attachment; filename=export.csv">"Page","Total for Period","Average per day","% of Total"<cfoutput>#chr(10)#</cfoutput><cfloop query="qGetReport"><cfset Avg = NumberFormat(ClickCount / DateDiff, "99.99")><cfset percent = NumberFormat((ClickCount * 100) / Total, "99.99")><cfoutput>"#vchPathInfo#","#ClickCount#","#Avg#","%#percent#"#chr(10)#</cfoutput></cfloop>
</cfif>


<cfif Action eq	"ExportClkAnalysis">
	<cfquery name="qGetReport" datasource="#ds#">
	select fit.iBannerID, Sum(fit.iClickCount) as ClickCount, vchDescription, vchClientName,
	iMaxClicks, vchImageURL, iClicks
	from fuseAds_ClickTrack fit, fuseAds_Banners fb, fuseAds_Clients fc<cfif isDefined("Categories")><cfif Categories neq "All">,fuseAds_BannerCategory fbc</cfif></cfif>
	
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

	group by fit.iBannerID, fb.vchDescription, fc.vchClientName, fb.iMaxClicks, fb.vchImageURL, fb.iClicks
	order by
	<cfif DBTYPE eq "MYSQL">
		ClickCount DESC
	<cfelse>
		Sum(fit.iClickCount) DESC
	</cfif>	
</cfquery>
	<cfset Total = 0>
	<cfloop query="qGetReport">
		<cfset Total = Total + ClickCount>
	</cfloop>
	
<CFCONTENT TYPE="text/x-excel-csv"><CFHEADER NAME="Content-Disposition" VALUE="attachment; filename=export.csv">"Banner","Client Name","Total for Period","Avg for Period","% of total","Imp. Remaining"<cfoutput>#chr(10)#</cfoutput><cfloop query="qGetReport"><cfoutput>"#vchDescription#","#vchClientName#","#ClickCount#"<cfif iMaxClicks neq "0"><cfset RemImp = iMaxClicks - iClicks></cfif><cfset Avg = NumberFormat(ClickCount / DateDiff, "99.99")><cfset percent = NumberFormat((ClickCount * 100) / Total, "99.99")>,"#Avg#","#percent#%",<cfif iMaxClicks neq "0">"#RemImp#"<cfelse>"n/a"</cfif>#chr(10)#</cfoutput></cfloop>
</cfif>

<cfif Action eq	"ExportImpAnalysis">
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
	<cfset Total = 0>
	<cfloop query="qGetReport">
		<cfset Total = Total + ImpressionCount>
	</cfloop>	

<CFCONTENT TYPE="text/x-excel-csv"><CFHEADER NAME="Content-Disposition" VALUE="attachment; filename=export.csv">"Banner","Client Name","Total for Period","Avg for Period","% of total","Imp. Remaining"<cfoutput>#chr(10)#</cfoutput><cfloop query="qGetReport"><cfoutput>"#vchDescription#","#vchClientName#","#ImpressionCount#"<cfif iMaxImpressions neq "0"><cfset RemImp = iMaxImpressions - iImpressions></cfif><cfset Avg = NumberFormat(ImpressionCount / DateDiff, "99.99")><cfset percent = NumberFormat((ImpressionCount * 100) / Total, "99.99")>,"#Avg#","#percent#%",<cfif iMaxImpressions neq "0">"#RemImp#"<cfelse>"n/a"</cfif>#chr(10)#</cfoutput></cfloop>
</cfif>