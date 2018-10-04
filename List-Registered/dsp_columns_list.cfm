<cfoutput>
 <cfdocumentitem type="header"><div style="padding:10px; background-color:##E8E8E8; font-size:18px; font-weight:bold; font-family:Arial, Helvetica, sans-serif"><h1>#get.eventName#</h1></div></cfdocumentitem>
 <cfdocumentitem type="footer">
 	<div style="padding:6px; background-color:##E8E8E8; font-size:12px; font-family:Arial, Helvetica, sans-serif">
    	#cfdocument.currentpagenumber# of #cfdocument.totalsectionpagecount#
        <span style=" margin-left:50px;right:10px">Printed #dateFormat(now(), "dd mmmm yyyy")#</span>
    </div>
 </cfdocumentitem>
 <cfdocumentsection>
 <style type="text/css">
	table{font-size:12px}
	td{padding:4px}
	.header{}
</style>
  <table width="100%" border="0" id="TableEdit" cellpadding="1" cellspacing="1" style="font-family:Arial, Helvetica, sans-serif; color:##000000; font-size:12px; text-align:left;">
<!---<tr>
        <td colspan="#fieldcount#" id="header">#get.eventName# <cfif parameterexists(form.count)>Count: #get.recordcount#</cfif></td>
      </tr>--->
    <cfset var.company = "none">
    <cfloop query="get"><cfif var.company NEQ get.company>
      <tr>
          <td valign="bottom" colspan="2" style="border-top:1px solid ##CCC; font-weight:bold; padding:7px 4px 4px 4px">
		   <strong>#Ucase(get.company)#</strong><cfset var.company = "#get.company#"></td>
     </tr></cfif>
      <tr>     
          <td><span class="words">#Ucase(get.title)# #Ucase(get.name)#</span> <span class="words">#Ucase(get.surname)#</span></td>
          <td valign="bottom"><span class="words">#ucase(ReplaceNoCase(get.possition, '&AMP;', '&'))#</span></td>
	</tr>
    </cfloop>
  </table><cfif parameterexists(form.count)>Count: #get.recordcount#</cfif>
  </cfdocumentsection>
</cfoutput>