<cfparam name="url.method" default="old">

<cfif url.method EQ 'old'>

<CFHEADER NAME="Content-Disposition" VALUE="inline; filename=badges-#var.zzzz#-#dateformat(now(), "yyyy-mm-dd")#-#timeformat(now(), "HH-MM")#.xls">
<CFCONTENT TYPE="application/vnd.msexcel">
<table width="100%" border="0" cellpadding="4" cellspacing="1" id="TableEdit">
<tr>
<th width='250px'>name</th>
<th width='250px'>full name</th> 
<th width='500px'>company</th>
</tr>
<cfoutput query="qry_listMaster" group='user_id'><tr>
<td>#trim(name)#</td>
<td>#trim(name)# #trim(surname)#</td> 
<td>#trim(company)#</td>
</tr></cfoutput>
</table>

<cfelseif url.method EQ 'new'>

<cfspreadsheet action="write" 
    filename = "G:\websites\my-office\List-Registered\v2\badges-#var.zzzz#-#dateformat(now(), "yyyy-mm-dd")#-#timeformat(now(), "HH-MM")#.xls" 
    query = "qry_listMaster" 
    overwrite="true">

<cfoutput>
<a href="badges-#var.zzzz#-#dateformat(now(), "yyyy-mm-dd")#-#timeformat(now(), "HH-MM")#.xls">Download File</a>
</cfoutput>
<cfelse>

Method not chossen!

</cfif>