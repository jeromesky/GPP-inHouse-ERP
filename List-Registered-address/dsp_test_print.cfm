<CFHEADER NAME="Content-Disposition" VALUE="inline; filename=output_#dateformat(now(), "yyyy-mm-dd")#-#randrange(1,99)#.xls">
<CFCONTENT TYPE="application/vnd.msexcel">

<table width="100%" border="0" cellpadding="4" cellspacing="1" id="TableEdit">
<tr>
<th width='100px'>title</th>
<th width='200px'>name</th>
<th width='200px'>surname</th> 
<th width='200px'>company</th>
<th width='200px'>job</th> 
<th width='100px'>acesss</th>
</tr>
<cfoutput query="qry_print" group='user_id'>
<cfsilent>

<cfscript>
allow = 0;
</cfscript>

<cfoutput>

<cfscript>
allow = ListPrepend(allow, eventID);
</cfscript>

</cfoutput>

<cfscript>
//472
 var3 = listfind(allow, '472');

//473
 var2 = listfind(allow, '473');

//474
 var1 = listfind(allow, '474');
</cfscript>

</cfsilent>
<tr>
<td>#trim(title)#</td>
<td>#trim(name)#</td>
<td>#trim(surname)#</td> 
<td>#trim(company)#</td>
<td>#ucase(ReplaceNoCase(qry_conf.possition, '&AMP;', '&'))#</td>
<td> <cfif var1 EQ 0>&##9711;<cfelse>&##8226;</cfif> <cfif var2 EQ 0>&##9711;<cfelse>&##8226;</cfif> <cfif var3 EQ 0>&##9711;<cfelse>&##8226;</cfif> </td>
</tr></cfoutput>
</table>