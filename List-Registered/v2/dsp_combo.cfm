<cfparam name='url.clean' default='event'>
<CFHEADER NAME="Content-Disposition" VALUE="inline; filename=regos_#dateformat(now(), "yyyy-mm-dd")#-#randrange(1,99)#.xls">
<CFCONTENT TYPE="application/vnd.msexcel">

<table width="100%" border="0" cellpadding="4" cellspacing="1" id="TableEdit">
<tr>
<th width='100px'>fullname</th>
<th width='100px'>title</th>
<th width='200px'>name</th>
<th width='200px'>surname</th> 
<th width='200px'>company</th>
<th width='400px'>job</th>
<th width='200px'>email</th>
<th width='200px'>event1name</th>
<th width='200px'>event1status</th>
<th width='200px'>event1payment</th>
<th width='200px'>event1comment</th>
<th width='200px'>event2name</th>
<th width='200px'>event2status</th>
<th width='200px'>event2payment</th>
<th width='200px'>event2comment</th>
<th width='200px'>event3name</th>
<th width='200px'>event3status</th>
<th width='200px'>event3payment</th>
<th width='200px'>event3comment</th>
</tr>
<cfoutput query="qry_regos" group=fullname><tr>
<td>#trim(title)# #trim(name)# #trim(surname)#</td>
<td>#trim(title)#</td>
<td>#trim(name)#</td>
<td>#trim(surname)#</td> 
<td>#trim(ucase(company))#</td>
<td>#ucase(ReplaceNoCase(qry_regos.possition, '&AMP;', '&'))#</td>
<td>#trim(lcase(email))#</td><cfoutput>
<td>#trim(ReplaceNoCase(eventName, ':#url.clean#:', ' '))#</td>
<td><cfif chkSpeaker eq 1>Speaker</cfif> 
<cfif chkGuest eq 1>Guest</cfif> 
<cfif chkPress eq 1>Press</cfif> 
<cfif chkExhibitor eq 1>Exhibitor</cfif> 
<cfif chkDelegate eq 1>Delegate</cfif></td>
<td>#trim(Paid)# - #trim(invoiceNo)#</td>
<td>#trim(comment)#</td></cfoutput>
</tr></cfoutput>
</table>