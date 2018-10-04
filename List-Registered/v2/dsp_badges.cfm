<CFHEADER NAME="Content-Disposition" VALUE="inline; filename=badge_#dateformat(now(), "yyyy-mm-dd")#-#randrange(1,99)#.xls">
<CFCONTENT TYPE="application/vnd.msexcel">

<table width="100%" border="0" cellpadding="4" cellspacing="1" id="TableEdit">
<tr>
<th width='300px'>name</th>
<th width='300px'>full name</th> 
<th width='600px'>company</th>
</tr>
<cfoutput query="qry_print" group='user_id'><tr>
<td>#trim(name)#</td>
<td>#trim(name)# #trim(surname)#</td> 
<td>#trim(company)#</td>
</tr></cfoutput>
</table>