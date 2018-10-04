
<CFHEADER NAME="Content-Disposition" VALUE="inline; filename=eventName_#dateformat(now(), "yyyy-mm-dd")#.xls">
<CFCONTENT TYPE="application/vnd.msexcel">
<cfinclude template="dsp_resultHeader.cfm">
<cfinclude template="dsp_result.cfm">
</CFCONTENT>