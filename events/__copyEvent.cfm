<cfset datenow=#CreateODBCDate(Now())#>
<cfquery datasource="#dsnP21#" name="getdata">
Select * from events Where id = #url.id#
</cfquery>

<cfquery datasource="#dsnP21#">
   Insert into events(event_type, event_name,event_abbr, event_year, event_expire, event_date, event_days, event_month, event_loc_hotel, event_loc_city, event_loc_country, event_cost_us, event_cost_details, event_cost_currency, event_cost_uk, event_blurb, event_blurb_program, event_blurb_sponsors, event_supporters_blurb, event_sponsors_blurb, event_blurb_exhib, event_loc_xchange, event_loc_warnings, event_loc_area, Econf, groupby, file_image_pdf )
	  		
			
Values('#getdata.event_type#', '#getdata.event_name#', '#getdata.event_abbr#', '#(getdata.event_year +1)#', '#dateformat(datenow + 160, 'DD MMMM YYYY')#', '#getdata.event_date#', '#getdata.event_days#', '#getdata.event_month#', '#getdata.event_loc_hotel#', '#getdata.event_loc_city#', '#getdata.event_loc_country#', '#getdata.event_cost_us#', '#getdata.event_cost_details#', '#getdata.event_cost_currency#', '#getdata.event_cost_uk#',   '#getdata.event_blurb#', '#getdata.event_blurb_program#', '#getdata.event_blurb_sponsors#', '#getdata.event_supporters_blurb#',  '#getdata.event_sponsors_blurb#', '#getdata.event_blurb_exhib#', '#getdata.event_loc_xchange#', '#getdata.event_loc_warnings#', '#getdata.event_loc_area#',  '#getdata.Econf#', '#getdata.groupby#', '#getdata.file_image_pdf#')
    
</cfquery>

<cflocation url="#cgi.HTTP_REFERER#">