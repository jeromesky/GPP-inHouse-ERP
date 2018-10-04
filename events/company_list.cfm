<cfinclude template="../Application.cfm" >
<cfquery datasource="#dsnP21#" name="get">
SELECT id, company, logofile FROM logos 
WHERE company LIKE '%#form.company#%'
ORDER BY company
</cfquery>
<div style="height:220px; overflow:auto">
<script type="text/javascript">
function AddCompany(id, eventid) {
	var getSponsorType =  $("#select_sponsor_category").val();
		$.post("company_sponsorAdd.cfm", {  id: id, field: getSponsorType, eventid:eventid  }, function(data){ 
			$("#"+getSponsorType +"").append(data);
			$('#record_'+id+'').animate( { backgroundColor: "##fbc7c7" }, "fast").animate({ opacity: "hide" }, "slow").remove();
			//alert(data);
	});
	
		}
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="2" style="color:#333333">
  <tr>
    <td style="border-bottom:1px dotted #999999">Place sponsor in </td>
    <td style="border-bottom:1px dotted #999999"><select name="sponsor_category" id="select_sponsor_category">
      <option value="logos_sponsore">Media Partners </option>
      <option value="logos_supporter">Place here if  Sponsor type not listed below</option>
      
      <option value="sponsor_lead">Lead Sponsor</option>
      <option value="sponsor_platinum">Platinum Sponsor</option>
      <option value="sponsor_gold">Gold Sponsor</option>
      
      <option value="sponsor_silver">Silver Sponsor</option>
      <option value="sponsor_bronze">Bronze Sponsor</option>
      <option value="sponsor_Airline">Prefered Airline Sponsors</option>
      <option value="logo_corpMembers">Corporate Menmber Sponsor</option>
      <option value="logo_CorpSponsor">Corporate Sponsor</option>
      <option value="supportedby">Supporting Sponsor</option>
      <option value="logo_Patron">Corporate Patron Sponsor</option>
      <option value="logo_Contributing">Contributing Sponsor</option>
    </select></td>
    <td style="border-bottom:1px dotted #999999">logo loaded</td>
    <td style="border-bottom:1px dotted #999999">&nbsp;</td>
  </tr>
<cfoutput query="get">

  <tr  onMouseOver="style.backgroundColor='##D8E2F9';" onMouseOut="style.backgroundColor='##ffffff';" id="record_#get.id#">
    <td colspan="2">#get.company#</td>
    <td width="85" align="center"><cfif get.logofile NEQ ""><img src="../img/ok_tick.gif" /></cfif></td>
    <td width="25"><a href="javascript:AddCompany(#get.id#, #form.eventid#)"><img src="../img/tickBox.jpg" border="0" /></a></td>
  </tr>
</cfoutput>
</table>
</div>
