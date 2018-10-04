<cfheader name="Content-Disposition" value="attachment; filename=output.pdf">
<cfcontent type="application/pdf">

<cfdocument format="pdf" pagetype="A4" marginbottom="0.4" margintop="0.9" marginleft="0.1" marginright="0.1" overwrite="Yes">
<style type="text/css">
#TableEdit { font-family:Arial, Helvetica, sans-serif; color:#000000; font-size:12px;}
.words {text-transform: capitalize}
td { border-bottom:1px solid #E8E8E8}
th { }
.TDdelegate { width:250px}
</style>
<cfdocumentitem type="header">
<table width="100%" border="0" cellpadding="2" cellspacing="1" id="TableEdit" 
  style="font-family:Arial, Helvetica, sans-serif; color:##000000; font-size:12px; font-weight:bold; text-align:left; background-color:#CCC">
<tr><cfoutput>
<th align=left><font size="+3">#get.eventName#</font></th>
<th align=right>#cfdocument.currentpagenumber# of #cfdocument.totalpagecount#
<!---<br/> Total: #get.recordcount# --->
<br/>Printed #dateformat(now(), "dd mmmm yyyy")#&nbsp;</th>
</tr>
</cfoutput>
</table>
</cfdocumentitem>
<cfdocumentsection>Test<!---
<table width="100%" border="0" cellpadding="4" cellspacing="1" id="TableEdit" 
  style="font-family:Arial, Helvetica, sans-serif; color:##000000; font-size:12px;">
<cfoutput query="get" group='company'>
<tr>
<td colspan=4 style="border-bottom:1px solid ##CCC;font-size:14px;"><strong>#ucase(get.company)#</strong></td>
</tr>
<cfoutput><tr>
<td>#ucase(get.title)# #ucase(get.name)# #ucase(get.surname)#</b></td>
<td>#ucase(ReplaceNoCase(get.possition, '&AMP;', '&'))#</td>
</tr></cfoutput>
</cfoutput>
</table>--->
</cfdocumentsection>
<cfdocumentitem type="footer">
  <table width="100%" border="0" cellpadding="4" cellspacing="1" id="TableEdit" style="font-family:Arial, Helvetica, sans-serif; color:##000000; font-size:12px;">
    <tr>
      <td> .</td>
    </tr>
  </table>
</cfdocumentitem>
</cfdocument>