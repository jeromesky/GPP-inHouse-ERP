<!--- aow: http://localhost/_2/reports/events/act_event_delegatelist.cfm --->
<cfsetting requesttimeout="5000">
<cfparam default="0" name="pdf.alphamark">

<cfquery datasource="#gpp#" name="qry_delegates">
	SELECT DISTINCT  
		LEFT(company, 1) As alphaOrder,
		Upper(title) AS title,
		Upper(name) AS name,
		Upper(surname) AS surname,
		Upper(company) AS company,
		Upper(possition) AS jobtitle
	FROM [view_conference_attendence_list]
	WHERE 
		[lngconference_id] IN (765,766,767) 
		AND (active = 1)
		AND ((chkcancelled != 1) OR (ChkCancelled IS NULL)) 
	ORDER BY 
		LEFT(company, 1),
		company,
		surname,
		name;
</cfquery>

<cfheader name="Content-Disposition" value="attachment;filename=aow.pdf">

<cfdocument format="PDF" localurl="yes" marginTop=".25" marginLeft=".3" marginRight=".3" marginBottom=".25" pagetype="A4" >

<style>
  td {
  font-family: Arial, Helvetica, sans-serif;
  font-size:12px;
  padding: 2px;
  }
  
  tr {

  }

.text-rotation {
  -webkit-transform: rotate(-90deg); 
  -moz-transform: rotate(-90deg);
  font-weight: bold;
  background-color: lightgray;
  color: white;
  text-align: center;
  } 
  
  .company {
	   border-bottom: 1px solid #A9A9A9;
	  color: #444444;
	  font-size: 15px;
	  font-weight: bold;
	  padding: 20px 0 0;
  }
</style>

<!----<cfdocumentitem type="header">
<table width="100%" style="border-bottom:4px  solid #dddddd"><tr><td><img src="http://www.petro21.com/_files/business/AOW_del_list.jpg" width="136" height="60" style="width:136px; height:60px" /></td><td align="right"><img src="http://www.petro21.com/_files/business/CAMAC_Energy_del_list.jpg" width="92" height="60"  style="width:92px; height:60px"  /></td></tr></table>
</cfdocumentitem>--->
<table width="100%">
	<cfoutput query="qry_delegates" group="company"><tr>
		<td colspan=2 class='company'>&nbsp;#Company#</td>
		<cfif pdf.alphamark NEQ alphaOrder><!---<td class='text-rotation'>#alphaOrder#</td><cfelse><td></td>---></cfif><cfset pdf.alphamark = alphaOrder>
	</tr>
	<cfoutput><tr>
		<td>#title# #name# #surname#</td>
        <td>#jobtitle#</td>
	</tr></cfoutput></cfoutput>
</table>

<cfdocumentitem type= "footer"> 
      <cfoutput><i>#cfdocument.currentpagenumber# of #cfdocument.totalpagecount#</i></cfoutput>
</cfdocumentitem>

</cfdocument>