<cfinclude template="../Application.cfm">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
</head>
<body <cfif parameterexists(form.id)>onload="javascript:parent.window.location='index.cfm'"</CFIF>>

<cfif parameterexists(form.id)>
<cfquery datasource="#dsnP21#" name="get">
SELECT * FROM events WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>

<cfquery datasource="#dsnP21#"   >
Insert into events(
	event_type,
	event_name,
	event_abbr,
	event_year,	
	event_expire,
	event_days,
	event_month,
	event_loc_city,
	event_loc_country,
	event_cost_currency,
	venuRoom,
	event_blurb,
	event_blurb_program,
	event_blurb_sponsors,
	event_blurb_exhib,
	event_sponsors_blurb,
	event_supporters_blurb,
	related_two,
	groupby,
	ColorD,
	ColorL,
	Enquir,
	exhEnq,
	sponEnq,
	accPay,
	GenCont,
	PaCont,
	AcoCont,
	VisCont,
	hotel,
	timereg,
	timestart,
    event_loc_hotel,
    venueaddress,
    FocusOn,
    Slogan,
    SloganSub,
    briefingSlogan,
    club
    
    )
Values (
	'#form.event_type#',
	'#form.event_name#',
	'#get.event_abbr#',
	#form.event_year#,	
	#DateAdd("yyyy", 1, get.event_expire)#,
	'#get.event_days#',
	'#get.event_month#',
	'#get.event_loc_city#',
	'#get.event_loc_country#',
	'#get.event_cost_currency#',
	'#get.venuRoom#',
	'#get.event_blurb#',
	'#get.event_blurb_program#',
	'#get.event_blurb_sponsors#',
	'#get.event_blurb_exhib#',
	'#get.event_sponsors_blurb#',
	'#get.event_supporters_blurb#',
	'#get.related_two#',
	#form.groupby#,
	'#get.ColorD#',
	'#get.ColorL#',
	'#get.Enquir#',
	'#get.exhEnq#',
	'#get.sponEnq#',
	'#get.accPay#',
	'#get.GenCont#',
	'#get.PaCont#',
	'#get.AcoCont#',
	'#get.VisCont#',
	 '#get.hotel#',
	'#get.timereg#',
	'#get.timestart#',
    '#get.event_loc_hotel#',
    '#get.venueaddress#',
    '#get.FocusOn#',
    '#get.Slogan#',
    '#get.SloganSub#',
    '#get.briefingSlogan#',
    <cfif get.club eq "">0<cfelse>#get.club#</cfif>
)    

</cfquery>
<!---<CFHTTP URL="http://www.petro21.com/my-office/events/indexCreate.cfm" METHOD="Get"></CFHTTP> 
<CFFILE ACTION="WRITE" FILE="G:\websites\my-office\events\index.cfm" OUTPUT="#CFHTTP.FileContent#" NAMECONFLICT="overwrite"><cflocation url="index.cfm">--->

<cfelse>

<form id="form1" name="form1" method="post" action="">
<table width="250" border="0" cellspacing="4" cellpadding="0">
  <tr>
    <td>group</td>
    <td>
    <cfquery datasource="#dsnP21#" name="get">
		SELECT * FROM groupby
	</cfquery>
<cfoutput>
	<select name="groupby" style="width:200px" >
			<option value="0"  >no group</option>
        <cfloop query="get">
			<option value="#get.id#"  >#get.groupby#</option>
    	</cfloop>
	</select>
</cfoutput>    </td>
  </tr>
  <tr>
    <td>event type</td>
    <td><select name="event_type">
<option value="Event" >Event</option>
<option value="EB"  >Briefing</option>
<option value="Din"   >Dinner</option>
<option value="Week"   >Oil Week</option>
<option value="book"   >Books</option>
<option value="CLUB"   >Club</option>
<option value="Advis"   >Advisory</option>
<option value="CM"   >Content Management</option>
<option value="Roadshow">Roadshow</option>
</select></td>
  </tr>
  <tr>
    <td>event Name</td>
    <td><input type="text" name="event_name" /></td>
  </tr>
  <tr>
    <td>event Year</td>
    <td><input type="text" name="event_year" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>
      <input type="submit" name="button" id="button" value="Submit" /><input type="hidden" name="id" value="<cfoutput>#url.id#</cfoutput>" />    </td>
  </tr>
</table>
</form>
</cfif>

</body>
</html>