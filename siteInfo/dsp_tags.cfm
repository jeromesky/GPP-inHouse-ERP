<cfinclude template="../_display/dsp_header.cfm">
<table width="700" border="0" cellspacing="1" cellpadding="4">
  <tr>
    <td colspan="7">tag events</td>
  </tr>
  <tr>
    <td>cf_event_name </td>
    <td>eventID</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
    <tr>
    <td>cf_event_List_week </td>
    <td>name/ fieldname</td>
    <td>id/ eventid</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>

  <tr>
    <td>cf_events_dropDown</td>
    <td>eventID</td>
    <td>fieldName</td>
    <td>elapse/ -1 = year</td>
    <td>operator/ IN-OR</td>
    <td>eventType/ list-single</td>
    <td>&nbsp;</td>
  </tr>
    <tr>
    <td colspan="7">tag country</td>
  </tr>
     <tr>
    <td>cf_country_suggest </td>
    <td>fieldname</td>
    <td>countryID</td>
    <td>country</td>
    <td>random</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
       <tr>
    <td>cf_city_suggest </td>
    <td>fieldname</td>
    <td>cityID</td>
    <td>city</td>
    <td>random</td>
    <td>countryFieldname</td>
    <td>&nbsp;</td>
  </tr>
    <tr>
    <td colspan="7">tag Currency</td>
  </tr>
     <tr>
    <td>cf_contact_suggest </td>  
    <td>contactID</td>
    <td>contact</td>
    <td>open</td>
    <td>random</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
   <tr>
    <td colspan="7">tag contact</td>
  </tr>
   <tr>
    <td>cf_contact_search </td>
    <td>contactID</td>
    <td>value</td>
    <td>open/ 1-0 open window</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
     <tr>
    <td>cf_contact_type </td>
    <td>name</td>
    <td>id</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

<cfinclude template="../_display/dsp_footer.cfm">