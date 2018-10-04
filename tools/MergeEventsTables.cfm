<cfinclude template="../application.cfm">
<cfif parameterexists(form.gppid) >
		 <cfquery datasource="#dsnP21#" name="getWEBevent">
            select * 
            FROM events
            WHERE id =  <cfqueryparam cfsqltype="cf_sql_integer" value="#form.webID#">
        </cfquery>
        
            <!--- 	<cfdump var="#getWEBevent#">
          <cfabort>--->

        <cfquery datasource="#gpp#" >
        UPDATE  tblAnnual_Conf
        SET
        webID 							= <cfqueryparam  value="#getWEBevent.id#" >
      , event_type 						=  <cfqueryparam  value="#getWEBevent.event_type#" >
      , event_name 					= <cfqueryparam  value="#getWEBevent.event_name#" >
      , event_abbr 						= <cfqueryparam  value="#getWEBevent.event_abbr#" >
      , event_year 						= <cfqueryparam  value="#getWEBevent.event_year#"  >
      , event_expire 					= <cfqueryparam  value="#getWEBevent.event_expire#"  cfsqltype="cf_sql_date"  >
      , event_days 						= <cfqueryparam  value="#getWEBevent.event_days#" >
      , event_month 					= <cfqueryparam  value="#getWEBevent.event_month#" >
      , event_loc_hotel 				= <cfqueryparam  value="#getWEBevent.event_loc_hotel#" >
      , event_loc_city 					= <cfqueryparam  value="#getWEBevent.event_loc_city#" >
      , event_loc_country 			= <cfqueryparam  value="#getWEBevent.event_loc_country#" >
      , event_cost_currency 		= <cfqueryparam  value="#getWEBevent.event_cost_currency#" >
      , event_cost_us 				= <cfqueryparam  value="#numberformat(getWEBevent.event_cost_us, "9999.99")#" cfsqltype="cf_sql_money4" >
      , event_cost_uk 				=<cfqueryparam  value="#numberformat(getWEBevent.event_cost_uk, "9999.99")#" cfsqltype="cf_sql_money4" >
      , event_cost_eu 				= <cfqueryparam  value="#getWEBevent.event_cost_eu#" >
      , econf_cost 						= <cfqueryparam  value="#numberformat(getWEBevent.econf_cost, "9999.99")#" cfsqltype="cf_sql_money4"  >
      , venuRoom 						= <cfqueryparam  value="#getWEBevent.venuRoom#" >
      , econf_descr 					= <cfqueryparam  value="#getWEBevent.econf_descr#" >
      , event_cost_details 			= <cfqueryparam  value="#getWEBevent.event_cost_details#" >
      , event_blurb 						= <cfqueryparam  value="#getWEBevent.event_blurb#" >
      , event_blurb_program 		= <cfqueryparam  value="#getWEBevent.event_blurb_program#" >
      , event_blurb_sponsors 	= <cfqueryparam  value="#getWEBevent.event_blurb_sponsors#" >
      , event_blurb_exhib 			= <cfqueryparam  value="#getWEBevent.event_blurb_exhib#" >
      , event_sponsors_blurb 	= <cfqueryparam  value="#getWEBevent.event_sponsors_blurb#" >
      , event_supporters_blurb 	= <cfqueryparam  value="#getWEBevent.event_supporters_blurb#" >
      , event_loc_weather 			= <cfqueryparam  value="#getWEBevent.event_loc_weather#" >
      , logo_contributing 			= <cfqueryparam  value="#getWEBevent.logo_contributing#" >
      , logo_Patron 					= <cfqueryparam  value="#getWEBevent.logo_Patron#" >
      , file_banner 						= <cfqueryparam  value="#getWEBevent.file_banner#" >
      , file_program 					= <cfqueryparam  value="#getWEBevent.file_program#" >
      , file_update 						= <cfqueryparam  value="#getWEBevent.file_update#" >
      , file_image_pdf 				= <cfqueryparam  value="#getWEBevent.file_image_pdf#" >
      , file_image 						= <cfqueryparam  value="#getWEBevent.file_image#" >
      , file_spe 							= <cfqueryparam  value="#getWEBevent.file_spe#" >
      , webdisp 							= <cfqueryparam  value="#getWEBevent.webdisp#"  >
      , Econf 								= <cfqueryparam  value="#getWEBevent.Econf#"  >
      , groupby 							= <cfqueryparam  value="#getWEBevent.groupby#"   >
      , logos_sponsore 				= <cfqueryparam  value="#getWEBevent.logos_sponsore#" >
      , logos_supporter 				= <cfqueryparam  value="#getWEBevent.logos_supporter#" >
      , ColorD 							= <cfqueryparam  value="#getWEBevent.ColorD#" >
      , ColorL 								= <cfqueryparam  value="#getWEBevent.ColorL#" >
      , live 									= <cfqueryparam  value="#getWEBevent.live#"  >
      , Enquir 								= <cfqueryparam  value="#getWEBevent.Enquir#" >
      , exhEnq 							= <cfqueryparam  value="#getWEBevent.exhEnq#" >
      , sponEnq 							= <cfqueryparam  value="#getWEBevent.sponEnq#" >
      , accPay 							= <cfqueryparam  value="#getWEBevent.accPay#" >
      , GenCont 							= <cfqueryparam  value="#getWEBevent.GenCont#" >
      , PaCont 							= <cfqueryparam  value="#getWEBevent.PaCont#" >
      , AcoCont 							= <cfqueryparam  value="#getWEBevent.AcoCont#" >
      , VisCont 							= <cfqueryparam  value="#getWEBevent.VisCont#" >
      , hotel 								= <cfqueryparam  value="#getWEBevent.hotel#"  >
      , timereg 							= <cfqueryparam  value="#getWEBevent.timereg#" >
      , timestart 							= <cfqueryparam  value="#getWEBevent.timestart#" >
      , supportedby 					= <cfqueryparam  value="#getWEBevent.supportedby#" >
      , sponsorOppFile 				= <cfqueryparam  value="#getWEBevent.sponsorOppFile#" >
      , program 							= <cfqueryparam  value="#getWEBevent.program#"  cfsqltype="cf_sql_date"  >
      , logo_CorpSponsor 			= <cfqueryparam  value="#getWEBevent.logo_CorpSponsor#" >
      , logo_corpMembers 			= <cfqueryparam  value="#getWEBevent.logo_corpMembers#" >
      , club 									= <cfqueryparam  value="#getWEBevent.club#" >
      , Item_ID 							= <cfqueryparam  value="#getWEBevent.Item_ID#"  >
      , sponsor_gold 					= <cfqueryparam  value="#getWEBevent.sponsor_gold#" >
      , sponsor_platinum 			= <cfqueryparam  value="#getWEBevent.sponsor_platinum#" >
      , sponsor_silver 				= <cfqueryparam  value="#getWEBevent.sponsor_silver#" >
      , sponsor_bronze 				= <cfqueryparam  value="#getWEBevent.sponsor_bronze#" >
      , doc_SE_intern 				= <cfqueryparam  value="#getWEBevent.doc_SE_intern#" >
      , FocusOn 							= <cfqueryparam  value="#getWEBevent.FocusOn#" >
      , Slogan 							= <cfqueryparam  value="#getWEBevent.Slogan#" >
      , SloganSub 						= <cfqueryparam  value="#getWEBevent.SloganSub#" >
      , briefingSlogan 					= <cfqueryparam  value="#getWEBevent.briefingSlogan#" >
      , newsletterBannerTop 		=  <cfqueryparam  value="#getWEBevent.newsletterBannerTop#" >
      , newsletterBannerCol1 	= <cfqueryparam  value="#getWEBevent.newsletterBannerCol1#" >
      , newsletterBannerCol2 	= <cfqueryparam  value="#getWEBevent.newsletterBannerCol2#" >
      , newsletterBannerTop600= <cfqueryparam  value="#getWEBevent.newsletterBannerTop600#" >
      , staffOnDay 						= <cfqueryparam  value="#getWEBevent.staffOnDay#" >
      , discountValue 					= <cfqueryparam  value="#getWEBevent.discountValue#"  >
      , discountDate 					= <cfqueryparam  value="#getWEBevent.discountDate#"  cfsqltype="cf_sql_date"  >
      , HomePageBanner 			= <cfqueryparam  value="#getWEBevent.HomePageBanner#" >
      , singleEventNot 				= <cfqueryparam  value="#getWEBevent.singleEventNot#"  >
      , preRegistration 				= <cfqueryparam  value="#getWEBevent.preRegistration#" >
      , filesAvailableDate 			= <cfqueryparam  value="#getWEBevent.filesAvailableDate#"  cfsqltype="cf_sql_date"  >
      , AttendFormDate 				= <cfqueryparam  value="#getWEBevent.AttendFormDate#"   cfsqltype="cf_sql_date"  >
      , boothDateSetup 				= <cfqueryparam  value="#getWEBevent.boothDateSetup#"  cfsqltype="cf_sql_date"  >
      , boothTimeSetup 				= <cfqueryparam  value="#getWEBevent.boothTimeSetup#" >
      , boothDateRemove 			= <cfqueryparam  value="#getWEBevent.boothDateRemove#"  cfsqltype="cf_sql_date"  >
      , boothTimeRemove 			= <cfqueryparam  value="#getWEBevent.boothTimeRemove#" >
      , preRegistrationTime 		= <cfqueryparam  value="#getWEBevent.preRegistrationTime#" >
      , preRegistrationDate 		= <cfqueryparam  value="#getWEBevent.preRegistrationDate#" cfsqltype="cf_sql_date" >
      , sponsor_Airline 				= <cfqueryparam  value="#getWEBevent.sponsor_Airline#" >
      ,sponsor_lead					= <cfqueryparam  value="#getWEBevent.sponsor_lead#" >
      ,eventDateEnd					= <cfqueryparam cfsqltype="cf_sql_date"  value="#getWEBevent.eventDateEnd#" >
       
        WHERE IngConference_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.gppid#">
      </cfquery> 
      
      <cfquery datasource="#dsnP21#" name="getWEBevent">
            UPDATE events
            SET  
            merged =  1
            WHERE id =  <cfqueryparam cfsqltype="cf_sql_integer" value="#getWEBevent.id#">
        </cfquery>
        
        
      <cfquery datasource="#gpp#" name="getGPPevent">
            select  IngConference_ID, lngCon_ID, strConference_Name, webID, strConference_Code, event_expire, cancelled
            from tblAnnual_Conf
            WHERE IngConference_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.gppid#">
        </cfquery>
        
          
        <!---<cfdump var="#form.webID#">--->
        <cfdump var="#getGPPevent#">

</cfif>


        <cfquery datasource="#gpp#" name="getGPPevent">
            select  IngConference_ID, lngCon_ID, strConference_Name, webID, strConference_Code, event_expire, cancelled
            from tblAnnual_Conf
            WHERE Year(event_expire) = 2010
            ORDER BY event_expire  desc
        </cfquery>
        <cfquery datasource="#dsnP21#" name="getWEBevent">
            select id, event_name, event_year
            from events
            WHERE 
				event_year = '2010'
				<!---event_expire > <cfqueryparam cfsqltype="cf_sql_date" value="    #now()#">---> AND 
            ( merged <> 1 OR merged = 0 ) AND ( event_type = 'week' OR event_type = 'event' OR event_type = 'din' OR event_type = 'eb' OR event_type = 'Bu_Pr' )
            ORDER BY event_expire desc 
        </cfquery>

        <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
        <html xmlns="http://www.w3.org/1999/xhtml">
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>P21</title>
        </head>
        
        <body>

        <form action="MergeEventsTables.cfm" method="post">
        <h3>Merge Events From WEB to GPP table</h3>
        <table width="500" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
          <td>Select Web Source event ID <cfoutput>#getWEBevent.recordcount#</cfoutput></td>
            <td>Select GPP destination event ID <cfoutput>#getGPPevent.recordcount#</cfoutput></td>
          </tr>
          <tr>
            
            <td>
                    <select name="webID" multiple="multiple">
                   <cfoutput query="getWEBevent">
                     <option value="#getWEBevent.id#">#getWEBevent.event_name# #getWEBevent.event_year#</option></cfoutput>
                </select>    </td>
                <td>
                <select name="gppid"  multiple="multiple">
                    <cfoutput query="getGPPevent">
                  <option value="#getGPPevent.IngConference_ID#">#getGPPevent.strConference_Name# (#datePart("yyyy", getGPPevent.event_expire)#)</option></cfoutput>
                </select>    </td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><input type="submit" value="merge" /></td>
          </tr>
            <tr>
            <td>&nbsp;</td>
            <td></td>
          </tr>
        </table>
        </form>
        </body>
        </html>
