<cfquery name="qAddCategory" datasource="#ds#">
	insert into fuseAds_BannerSize
	(vchBannerSize, chBannerSizeStatus)
	values
	('#Width#x#Height#', '#BannerSizeStatus#')
</cfquery>