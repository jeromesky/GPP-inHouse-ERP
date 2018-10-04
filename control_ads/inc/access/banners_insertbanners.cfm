<!--- write to fusead --->
<cfparam name="getday" default="#day#">
<cfparam name="getmonth" default="#month#">
<cfparam name="getyear" default="#year#">
<cfparam name="EndDate" default="#getmonth#/#getday#/#getyear#">
<cfparam name="imgpath" default="../advertising/">
<cfquery name="qInsertBanner" datasource="#ds#">
<cfset redirectURL = "../" & #RedirectURL# >
	insert into fuseAds_Banners
	(iClientID, vchBannerType, vchImageURL, vchDescription, txExternalCode, iBannerSize, chTrackImpressions, chTrackClicks, chBannerStatus, dtStartDate, dtEndDate, iMaxImpressions, iMaxClicks, vchExceptionDays, chFromTime, chToTime, iClicks, iImpressions, vchRedirectURL, ibannercategory)
	values 
(#CLIENTID#,'#BANNERTYPE#','#imgpath##IMAGEURL#','#DESCRIPTION#','#EXTERNALCODE#',#BANNERSIZEID#,'#TRACKIMPRESSIONS#','#TRACKCLICKS#','Enabled', '#STARTDATE# 00:00:00','#EndDate# 23:59:59',#MAXIMPRESSIONS#,#MAXCLICKS#,'#DAYOFWEEK#','01/01/1900 #STARTTIME#','01/01/1900 #ENDTIME#',0,0, <cfif parameterexists(form.external) is "True" >'#externalURL#'<cfelse>'#redirectURL#'</cfif>, #Category#)
</cfquery>
<cfif BannerSizeID EQ 6 >
<!--- write to petrotrekker --->
<cfparam name="EndDateEU" default="#getday#-#getmonth#-#getyear#">
<cfparam name="urlLink" default="http://www.petro21.com/">	
<cfparam name="imagerepository" default="advertising/">

      <cfquery datasource="#dsnP21#" name="dbinsert2"  >
        Insert banners(bname, path, href, eventdate )
        Values('#form.ImageURL#', '#urlLink##imagerepository##form.ImageURL#', '#urlLink##form.RedirectURL#', '#DateFormat(EndDateEU, "mm/dd/yyyy")#')
     </cfquery>
	 
	 <!--- write to News --->
 
      <cfquery datasource="#dsnP21#" name="addbanner"  >
	  SET ANSI_WARNINGS OFF
        Insert bannerNews(img, link,  eventdate, show )
        Values('#form.ImageURL#', '#urlLink##form.RedirectURL#', '#DateFormat(EndDateEU, "mm/dd/yyyy")#', '1')
	   SET ANSI_WARNINGS On
     </cfquery>	 
	</cfif> 
	<cflocation url="loadbanner.cfm">