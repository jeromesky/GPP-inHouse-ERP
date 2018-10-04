<cfdocument format="pdf" pagetype="A4" marginbottom="0.15" margintop="0.9" marginleft="0.1" marginright="0.1">

<style type="text/css">
  #TableEdit { font-family:Arial, Helvetica; color:#000000; font-size:11px;}
  td { border-bottom:1px solid #E8E8E8}
</style>

<cfdocumentitem type="header">
<table width="100%" border="0" cellpadding="2" cellspacing="1" id="TableEdit" 
  style="font-family:Arial, Helvetica, sans-serif; color:##000000; font-size:12px; font-weight:bold; text-align:left; background-color:#CCC">
<tr><cfoutput>
<th align=left><font size="+3">#get.eventName#</font></th>
<th align=right><cfif url.pgnum EQ 'yes'>#cfdocument.currentpagenumber# of #cfdocument.totalpagecount#</cfif>
<cfif url.count EQ 'yes'><br/>Total: #qry_conf.recordcount#</cfif>
<br/><cfif url.printdate EQ 'yes'>Printed #dateformat(now(), "dd mmmm yyyy")#</cfif>&nbsp;</th>
</tr>
</cfoutput>
</table></cfdocumentitem>

<cfdocumentsection>
<table width="100%" border="0" cellpadding="4" cellspacing="1" id="TableEdit" 
  style="font-family:Arial, Helvetica, sans-serif; color:##000000; font-size:12px;">
<cfoutput query="qry_conf" group='firstletter'>
<cfif url.firstlettergroup EQ 'yes'>
<cfif firstletter NEQ 'A'>
<!---<tr>
<td colspan=4>&nbsp;</td>
</tr>---></cfif></cfif>
<cfoutput group='company'>
<tr>
<td colspan=4 style="border-bottom:1px solid ##CCC;font-size:13px;"><strong>#ucase(qry_conf.company)#</strong></td>
</tr>
<cfoutput><tr>
<cfif url.indent GT 0><td style="width:#url.indent#px;"> </td></cfif>
<td width="35%">#ucase(qry_conf.title)# #ucase(qry_conf.name)# <!--- </span></td>
<td> ---><cfif url.surnamehighlight EQ 'yes'><b></cfif>#ucase(qry_conf.surname)#</b></td>
<td>#ucase(ReplaceNoCase(qry_conf.possition, '&AMP;', '&', 'ALL'))#</td>
</tr></cfoutput>
</cfoutput>
</cfoutput>
</table>
</cfdocumentsection>

</cfdocument>