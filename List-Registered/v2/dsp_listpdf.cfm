<cfdocument format="pdf" pagetype="A4" marginbottom="0.4" margintop="0.4" marginleft="0.01" marginright="0.01" filename="list-#dateformat(now(), 'yyyy-mm-dd')#.pdf" overwrite="yes">

<cfoutput>
<cfdocumentitem type="header">
 	<div style="padding:10px; background-color:##E8E8E8; font-size:18px; font-weight:bold; font-family:Arial, Helvetica, sans-serif"><h1>#url.TEN#</h1></div>
</cfdocumentitem>
<cfdocumentitem type="footer">
 	<div style="padding:6px; background-color:##E8E8E8; font-size:12px; font-family:Arial, Helvetica, sans-serif">
   	#cfdocument.currentpagenumber# of #cfdocument.totalsectionpagecount#
    <span style="margin-left:50px;right:10px">Printed #dateFormat(now(), "dd mmmm yyyy")#</span>
    </div>
</cfdocumentitem>
<cfdocumentsection>
<cfset var.company = "none">
<cfset var.person = "none">
<cfset var.count = "0">
 <style type="text/css">
	table{font-size:12px}
	td{padding:4px}
	.header{}
</style>
  <table width="100%" border="0" id="TableEdit" cellpadding="1" cellspacing="1" style="font-family:Arial, Helvetica, sans-serif; color:##000000; font-size:12px; text-align:left;">
    <cfloop query="qry_listMaster"><cfif var.company NEQ qry_listMaster.company><tr>
          <td valign="bottom" colspan="2" style="border-top:1px solid ##CCC; font-weight:bold; padding:7px 4px 4px 4px">
		   <strong>#ucase(ReplaceNoCase(qry_listMaster.company, '&AMP;', '&'))#</strong></td><cfset var.company = "#qry_listMaster.company#">
     </tr></cfif>
      <cfif var.person NEQ '#Ucase(qry_listMaster.title)# #Ucase(qry_listMaster.name)# #Ucase(qry_listMaster.surname)#'><tr>     
          <td><span class="words">#Ucase(qry_listMaster.title)# #Ucase(qry_listMaster.name)# #Ucase(qry_listMaster.surname)#</span></td>
          <td valign="bottom"><span class="words">#ucase(ReplaceNoCase(qry_listMaster.job, '&AMP;', '&'))#</span></td>
          <cfset var.person = "#Ucase(qry_listMaster.title)# #Ucase(qry_listMaster.name)# #Ucase(qry_listMaster.surname)#">
          <cfset var.count = var.count + 1>
	</tr></cfif></cfloop>
    <cfif parameterexists(url.count)><tr>
    	<td colspan="2" align="right"><span class="words">Count: #var.count#</span></td>
    </tr></cfif>
  </table>
</cfdocumentsection></cfoutput>
</cfdocument>

<cfheader name="content-disposition" value="attachment;filename=list-#dateformat(now(), 'yyyy-mm-dd')#.pdf">
<cfcontent type="application/pdf" file="http://www.petro21.com/my-office/List-Registered/v2/list-#dateformat(now(), 'yyyy-mm-dd')#.pdf" deletefile="no">