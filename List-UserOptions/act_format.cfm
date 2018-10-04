<cfinclude template="qry_users.cfm">




<cfif form.format EQ "excel">
    <CFHEADER NAME="Content-Disposition" VALUE="inline; filename=#replace(get.eventName, ' ', '-', 'ALL')#_#dateformat(now(), "yyyy-mm-dd")#.xls">
    <CFCONTENT TYPE="application/vnd.msexcel">
    <cfinclude template="dsp_columns.cfm">
    </CFCONTENT>




<cfelseif form.format EQ "pdf">
    <cfdocument format="pdf" pagetype="A4" marginbottom="0.4" margintop="0.4" marginleft="0.01" marginright="0.01">
    <cfif form.layout EQ "List">
    	<cfinclude template="dsp_columns_list.cfm">
    <cfelse>
    	<cfinclude template="dsp_columns.cfm">
    </cfif>
    </cfdocument>



<cfelseif form.format EQ "screen">
	<cfinclude template="dsp_columns.cfm">
</cfif>