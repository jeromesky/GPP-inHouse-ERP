
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>.</title>
<cfset fromid = form.fromid >
<cfquery name="get" datasource="petro21" password="hashbrown" username="petro21">
select *
from events_bk
where id = <CFQUERYPARAM Value="#fromid#">
</cfquery>

<cfif form.toID EQ "">

<cfquery name="new" datasource="petro21" password="hashbrown" username="petro21">
 INSERT INTO events (event_type, event_name, event_cost_details, event_blurb, file_image_pdf)
VALUES (<CFQUERYPARAM Value="#get.event_type#">, <CFQUERYPARAM Value="#get.event_name#">, <CFQUERYPARAM Value="#get.event_cost_details#">, <CFQUERYPARAM Value="#get.event_blurb#">, <CFQUERYPARAM Value="#get.file_image_pdf#">)
</cfquery>

<cfelse>

</cfif>
<!--- 
<cfif form.toID EQ "">
<cfquery name="new" datasource="petro21" password="hashbrown" username="petro21">
 INSERT INTO events_test2 (event_type, event_name, event_abbr, event_year, event_expire, event_date, event_loc_hotel, event_loc_country, event_cost_currency, event_cost_us, event_cost_uk, event_cost_details, event_blurb, event_blurb_program, event_blurb_sponsors, event_blurb_exhib, event_sponsors_blurb, event_supporters_blurb, event_loc_weather, event_loc_xchange, event_loc_warnings, event_loc_area, file_banner, file_program, file_update, file_image_pdf, file_image, file_spe, related_one, related_two, related_three, last_updated, past)
VALUES ('#get.event_type#', '#get.event_name#', '#get.event_abbr#', '#get.event_year#', '#get.event_expire#', '#get.event_date#', '#get.event_loc_hotel#', '#get.event_loc_country#', '#get.event_cost_currency#', '#get.event_cost_us#', '#get.event_cost_uk#', '#get.event_cost_details#', '#get.event_blurb#', '#get.event_blurb_program#', '#get.event_blurb_sponsors#', '#get.event_blurb_exhib#', '#get.event_sponsors_blurb#', '#get.event_supporters_blurb#', '#get.event_loc_weather#', '#get.event_loc_xchange#', '#get.event_loc_warnings#', '#get.event_loc_area#', '#get.file_banner#', '#get.file_program#', '#get.file_update#', '#get.file_image_pdf#', '#get.file_image#', '#get.file_spe#', '#get.related_one#', '#get.related_two#', '#get.related_three#', '#get.last_updated#', #get.past#)
</cfquery>

<cfelse>

<cfquery name="update" datasource="petro21" password="hashbrown" username="petro21">
<cfset toid = form.toID >
UPDATE events_test2
SET event_type		='#get.event_type#',
event_name			='#get.event_name#',
event_abbr			='#get.event_abbr#',
event_year			='#get.event_year#',
event_expire		='#get.event_expire#',
event_date			='#get.event_date#',
event_loc_hotel		='#get.event_loc_hotel#',
event_loc_country		='#get.event_loc_country#',
event_cost_currency	='#get.event_cost_currency#',
event_cost_us		='#get.event_cost_us#',
event_cost_uk		='#get.event_cost_uk#',
event_cost_details	='#get.event_cost_details#',
event_blurb			='#get.event_blurb#',
event_blurb_program	='#get.event_blurb_program#',
event_blurb_sponsors	='#get.event_blurb_sponsors#',
event_blurb_exhib		='#get.event_blurb_exhib#',
event_sponsors_blurb	='#get.event_sponsors_blurb#',
event_supporters_blurb	='#get.event_supporters_blurb#',
event_loc_weather		='#get.event_loc_weather#',
event_loc_xchange		='#get.event_loc_xchange#',
event_loc_warnings	='#get.event_loc_warnings#',
event_loc_area		='#get.event_loc_area#',
file_banner			='#get.file_banner#',
file_program		='#get.file_program#',
file_update			='#get.file_update#',
file_image_pdf		='#get.file_image_pdf#',
file_image			='#get.file_image#',
file_spe			='#get.file_spe#',
related_one			='#get.related_one#',
related_two			='#get.related_two#',
related_three		='#get.related_three#',
last_updated		='#get.last_updated#',
past				=#get.past#                 
WHERE id  = '#toid#'
</cfquery>
</cfif>
--->
</head>
<body>

</body>
</html>
