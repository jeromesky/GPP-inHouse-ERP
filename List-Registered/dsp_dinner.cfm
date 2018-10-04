<CFHEADER NAME="Content-Disposition" VALUE="inline; filename=dinner-#dateformat(now(), "yyyy-mm-dd")#-#randrange(1,99)#.xls">
<CFCONTENT TYPE="application/vnd.msexcel">

<table width="100%" border="0" cellpadding="4" cellspacing="1">
<tr>
<th width='100px'>title</th>
<th width='200px'>name</th>
<th width='200px'>surname</th> 
<th width='200px'>company</th>
<th width='200px'>job</th> 
</tr>
<cfoutput query="qry_dinner">
<tr>
<td>#trim(title)#</td>
<td>#trim(name)#</td>
<td>#trim(surname)#</td> 
<td>#trim(company)#</td>
<td>#ucase(ReplaceNoCase(job, '&AMP;', '&'))#</td>
</tr></cfoutput>
</table>