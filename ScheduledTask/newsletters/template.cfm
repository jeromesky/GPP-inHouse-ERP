<!---<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<cfoutput><title>#get_newsletter.newsletterName#</title></cfoutput>
</head>
<body>
<table cellspacing="0" cellpadding="0" border="1" width="960" bordercolor="#336193">
  <tr>
    <td align="center"><table width="960" border="0" cellspacing="0" cellpadding="0" style="font-family:Arial, Helvetica, sans-serif; font-size:12px">
        <tr>
          <td colspan="4" background="http://www.petro21.com/_files/eNews/<cfoutput>#get_newsletter.banner#</cfoutput>"><a href="http://www.petro21.com"><img src="http://www.petro21.com/_files/eNews/<cfoutput>#get_newsletter.banner#</cfoutput>" border="0" width="960" height="60"></a></td>
        </tr>
        <tr>
          <td colspan="4" bgcolor="#336193" align="center" height="20"><table border="0" cellspacing="0" cellpadding="0" bgcolor="#336193" height="20" style="font-family:Arial, Helvetica, sans-serif; font-size:10px; color:#e9e9e9">
              <tr>
                <td style="padding:5px"><a href="http://www.petro21.com/?nl=<cfoutput>#url.newsletterID#&lk=1</cfoutput>" style="color:#e9e9e9; text-decoration:none">HOME</a></td>
                <td width="1" bgcolor="#ffffff" ></td>
                <td style="padding:5px"><a href="http://www.petro21.com/pages/?fa=about&pg=profile&nl=<cfoutput>#url.newsletterID#&lk=2</cfoutput>" style="color:#e9e9e9; text-decoration:none">ABOUT US</a></td>
                <td width="1" bgcolor="#ffffff"></td>
                <td style="padding:5px"><a href="http://www.petro21.com/events/" style="color:#e9e9e9; text-decoration:none">EVENTS</a></td>
                <td width="1" bgcolor="#ffffff"></td>
                <!--- <td style="padding:5px"><a href="http://www.petro21.com/links/?nl=#<cfoutput>url.newsletterID#&lk=3</cfoutput>" style="color:#e9e9e9; text-decoration:none">ENERGY LINKS</a></td>
                <td width="1" bgcolor="#ffffff"></td>
               <td style="padding:5px"><a href="http://www.petro21.com/research/?id=352&<cfoutput>nl=#url.newsletterID#&lk=4</cfoutput>" style="color:#e9e9e9; text-decoration:none">BOOKS</a></td>
                <td width="1" bgcolor="#ffffff"></td>
                <td style="padding:5px"><a href="http://www.petro21.com/research/?id=403&<cfoutput>nl=#url.newsletterID#&lk=5</cfoutput>" style="color:#e9e9e9; text-decoration:none">ADVISORY</a></td>
                <td width="1" bgcolor="#ffffff"></td>
                <td style="padding:5px"><a href="http://www.petro21.com/research/?id=519&<cfoutput>nl=#url.newsletterID#&lk=6</cfoutput>" style="color:#e9e9e9; text-decoration:none">BRIEFINGS</a></td>
                <td width="1" bgcolor="#ffffff"></td>
                <td style="padding:5px"><a href="http://www.petro21.com/research/?id=524&<cfoutput>nl=#url.newsletterID#&lk=7</cfoutput>" style="color:#e9e9e9; text-decoration:none">ROADSHOWS</a></td>
                <td width="1" bgcolor="#ffffff"></td>
                <td style="padding:5px"><a href="http://www.petro21.com/research/?id=374&<cfoutput>nl=#url.newsletterID#&lk=8</cfoutput>" style="color:#e9e9e9; text-decoration:none">STRATEGY ONLINE</a></td>
                <td width="1" bgcolor="#ffffff"></td>
                <td style="padding:5px"><a href="http://www.petro21.com/research/?id=278&<cfoutput>nl=#url.newsletterID#&lk=9</cfoutput>" style="color:#e9e9e9; text-decoration:none">DATABANK</a></td>
                <td width="1" bgcolor="#ffffff"></td>--->
                <td style="padding:5px"><a href="http://www.petro21.com/pages/?fa=about&pg=offices&<cfoutput>nl=#url.newsletterID#&lk=10</cfoutput>" style="color:#e9e9e9; text-decoration:none">CONTACT US</a></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td colspan="4" valign="middle" style="border-right:1px solid #336193;"><cfinclude template="../output/bannerTOP3_#url.newsletterID#.html"></td>
        </tr>
        <tr>
          <td colspan="4"><cfoutput>#var.migrationBanner#</cfoutput></td>
        </tr>
        <tr>
          <td width="160" height="31" valign="middle" align="center" style="border-left:1px solid #CCCCCC; border-bottom:1px solid #CCCCCC; font-family: Georgia; font-style: italic;color: #999999; padding:0 0 0 0px"><span style="font-size:16px">Advertisers</span></td>
          <td width="318" style="border-left:1px solid #336193; border-bottom:1px solid #336193; font-family: Georgia; font-style: italic;color: #336193; padding:0 0 0 10px" align="center"><div style="font-size: 16px;"><cfif url.newsletterID eq 33>Breaking Africa News<cfelse>Breaking Oil & Gas News</cfif></div></td>
          <td width="319" style="border-left:1px solid #336193; border-bottom:1px solid #336193; font-family: Georgia; font-style: italic;color: #336193; padding:0 0 0 10px" align="center"><span style="font-size:13px"><cfoutput>#dateFormat(now(), "dddd d mmmm, yyyy")#</cfoutput></span></td>
          <td width="160" valign="middle" align="center" style="border-left:1px solid #336193; border-bottom:1px solid #CCCCCC; font-family: Georgia; font-style: italic;color: #336193; padding:0 0 0 0px"><span style="font-size:16px">Our Events</span></td>
        </tr>
        <tr>
          <td width="160" valign="top"><cfinclude template="../output/bannerSkyScraper_#url.newsletterID#.html"></td>
          <td  width="640" colspan="2" valign="top" style="border-left:1px solid #fff; border-right:1px solid #eee"><cfinclude template="../output/news_#url.newsletterID#.html"></td>
          <td width="160" valign="top"><cfinclude template="../output/bannerLeft_#url.newsletterID#.html"></td>
        </tr>
        <tr>
          <td height="40" bgcolor="#336193" align="center"><a href="http://www.petro21.com/" style="font-size:11px; color:#ffffff; text-decoration:none">www.petro21.com for more</a></td>
          <td bgcolor="#336193" style="border-left:1px solid #ffffff;"><!---<a href="http://www.petro21.com/events/?eventid=578"><img src="http://www.petro21.com/_files/eNews/AEF-320x44_11.jpg" border="0" width="320" height="40"></a>---></td>
          <td bgcolor="#336193" style="border-left:1px solid #ffffff; border-right:1px solid #ffffff;"><!---<a href="http://www.petro21.com/events/?eventid=578"><img src="http://www.petro21.com/_files/eNews/AEF-320x44_11.jpg" border="0" width="320" height="40"></a>---></td>
          <td height="40" bgcolor="#336193" align="center"><img src="http://www.petro21.com/_files/promo/NL_2010_petroPub.jpg" width="115" height="14"></td>
        </tr>
        <tr>
          <td colspan="4" style="font-size:10px; color:#393939; font-family:Arial, Helvetica, sans-serif" align="center"><table width="940" border="0" cellspacing="0" cellpadding="0" height="70" style=" font-size:10px; color:#393939; font-family:Arial, Helvetica, sans-serif">
              <tr>
                <td class="footer" align="justify" style="border-right:2px solid #cecfcb"><div style="text-align:justify"><cfinclude template="dsp_newsletters.cfm"></div></td>
                <td width="267" align="right">
                	<img src="http://www.petro21.com/refer/?z=l&id=<cfoutput>#url.referID#</cfoutput>&mid=999999999999" style="border:0;width:1px;height:1px;" />
                <b><a href="http://www.petro21.com/post/subscriptions.cfm?userid=<cfif parameterexists(sendlist.userid)><cfoutput>#sendlist.userid#&nl=#sendlist.newsletterID#&recId=#sendlist.subscriptionID#</cfoutput></cfif>" style="color:#333332; text-decoration:none;">Unsubscribe</a> | <a href="http://petro21.com/signup/?news=news" style="color:#333332; text-decoration:none;">Subscribe To Our Other Newsletters</a></b><br>
                  <b><a href="http://www.petro21.com/research/advertising.cfm" style="color:#333332; text-decoration:none;">Advertise on Petro21.com or Newsletters</a></b>&nbsp;| <a href="http://www.petro21.com/research/?id=426" style="color:#333332; text-decoration:none;">Disclaimer</a></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td colspan="4" height="3" bgcolor="#336193"></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>--->
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<cfoutput><title>#get_newsletter.newsletterName#</title></cfoutput>
</head>
<body>
<table cellspacing="0" cellpadding="0" border="1" width="960" bordercolor="#336193">
  <tr>
    <td align="center"><table width="960" border="0" cellspacing="0" cellpadding="0" style="font-family:Arial, Helvetica, sans-serif; font-size:12px">
        <tr>
          <td colspan="4" background="http://www.petro21.com/_files/eNews/<cfoutput>#get_newsletter.banner#</cfoutput>"><a href="http://www.petro21.com"><img src="http://www.petro21.com/_files/eNews/<cfoutput>#get_newsletter.banner#</cfoutput>" border="0" width="960" height="60"></a></td>
        </tr>
        

        <tr>
          <td colspan="4"><a href="<cfoutput>#var.migrationBanner#</cfoutput>"><img src="http://www.petro21.com/_files/eNews/re-reg.jpg" width="960" height="90" /></a></td>
        </tr>
		<tr>
			<td height="10">
			</td>
		</tr>
        <tr>
			<td bgcolor="#517ca7" align="center" style="font-size:16px; color:#FFF; padding:130px 25px 60px 25px">
            	<a href="<cfoutput>#migrationLink(RecipientEmailAddress, sendlist.userID)#</cfoutput>" style="color:#ffffff">To continue to receive our <b>Petro21 Daily News</b>, now enhanced with multiple self-tailored options, please <b>Click here</b> and re-register</a>
			</td>
		</tr>
        <tr>
          <td colspan="4" style="font-size:10px; color:#393939; font-family:Arial, Helvetica, sans-serif" align="center">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="4" height="3" bgcolor="#336193"></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>