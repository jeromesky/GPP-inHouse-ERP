<cfparam name='url.clean' default='event'>
<CFHEADER NAME="Content-Disposition" VALUE="inline; filename=regos_#dateformat(now(), "yyyy-mm-dd")#-#randrange(1,99)#.xls">
<CFCONTENT TYPE="application/vnd.msexcel">

<table width="100%" border="0" cellpadding="4" cellspacing="1" id="TableEdit">
<tr>
<th width='200px'>eventName</th>
<th width='100px'>fullname</th>
<th width='100px'>title</th>
<th width='200px'>name</th>
<th width='200px'>surname</th> 
<th width='200px'>company</th>
<th width='400px'>job</th>
<th width='200px'>email</th>

<!---
<th width='20px'>chkSpeaker</th>
<th width='20px'>chkGuest</th>
<th width='20px'>chkPress</th>
<th width='20px'>chkExhibitor</th>
<th width='20px'>chkDelegate</th> --->

<th width='200'>AttendanceType</th>
<th width='20px'>invoiceNo_LNK</th>
<th width='20px'>Paid</th>
<th width='200px'>comment</th>
<th width='200px'>comment2</th>
<th width='200px'>comment3</th>

</tr>
<cfoutput query="qry_regos">
<tr>
<td>#trim(ReplaceNoCase(eventName, ':#url.clean#:', ' '))#</td>
<td>#trim(title)# #trim(name)# #trim(surname)#</td>
<td>#trim(title)#</td>
<td>#trim(name)#</td>
<td>#trim(surname)#</td> 
<td>#trim(ucase(company))#</td>
<td>#ucase(ReplaceNoCase(qry_regos.possition, '&AMP;', '&'))#</td>
<td>#trim(lcase(email))#</td>

<!---
<td>#trim(chkSpeaker)#</td>
<td>#trim(chkGuest)#</td>
<td>#trim(chkPress)#</td>
<td>#trim(chkExhibitor)#</td>
<td>#trim(chkDelegate)#</td>--->
<td><cfif chkSpeaker eq 1> Speaker</cfif> 
<cfif chkGuest eq 1> Guest</cfif> 
<cfif chkPress eq 1> Press</cfif> 
<cfif chkExhibitor eq 1> Exhibitor</cfif> 
<cfif chkDelegate eq 1> Delegate</cfif></td>
<td>#trim(invoiceNo)#</td>
<td>#trim(Paid)#</td>
<td>#trim(comment)#</td>
<td>#trim(Comment_Public)#</td>
<td></td>
</tr></cfoutput>
</table>