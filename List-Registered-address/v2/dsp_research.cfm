<CFHEADER NAME="Content-Disposition" VALUE="inline; filename=regos_#dateformat(now(), "yyyy-mm-dd")#-#dateformat(now(), "HHMMSS")#-#randrange(1,99)#-T#qry_research.recordcount#.xls">
<cfcontent type="application/msexcel">
<table>
<tr>
<th width='400px'>eventName</th>
<th width='400px'>fullname</th>
<th width='400px'>title</th>
<th width='400px'>name</th>
<th width='400px'>surname</th> 
<th width='700px'>company</th>
<th width='700px'>job</th>
<th width='500px'>email</th>
<th width='400px'>email_sec</th>

<th width='200px'>phone_Direct_countryCode</th>
<th width='200px'>phone_Direct_areaCode</th>
<th width='200px'>phone_Direct</th>
<th width='200px'>phone_SB_countryCode</th>
<th width='200px'>phone_SB_areaCode</th>
<th width='200px'>phone_SB</th>
<th width='200px'>phone_Other1_countryCode</th>
<th width='200px'>phone_Other1_areaCode</th>
<th width='200px'>phone_Other1</th>
<!---<th width='200px'>phone_Other2</th>--->
<th width='200px'>phone-Mobile</th>
<th width='200px'>phone-Inter</th>
<th width='200px'>fax_Direct_countryCode</th>
<th width='200px'>fax_Direct_areaCode</th>
<th width='200px'>fax_Direct</th>
<th width='200px'>fax_SB_countryCode</th>
<th width='200px'>fax_SB_areaCode</th>
<th width='200px'>fax_SB</th>
<th width='200px'>fax_Other1_countryCode</th>
<th width='200px'>fax_Other1_areaCode</th>
<th width='200px'>fax_Other1</th>
<!---<th width='200px'>fax_Other2</th>--->
</tr>
<cfoutput query="qry_research"><tr bgcolor="###iif(currentrow MOD 2,DE('efefef'),DE('fffff'))#">
<td>#trim(ReplaceNoCase(eventName, ':event:', ' '))#</td>
<td>#trim(title)# #trim(name)# #trim(surname)#</td>
<td>#trim(title)#</td>
<td>#trim(name)#</td>
<td>#trim(surname)#</td> 
<td>#trim(company)#</td>
<td>#ucase(ReplaceNoCase(possition, '&AMP;', '&'))#</td>
<td>#trim(email)#</td>
<td>#trim(email_sec)#</td>

<td>#trim(foneDirect_IDD)#</td>
<td>#trim(foneDirect_AreaCode)#</td>
<td>#trim(foneDirect)#</td>
<td>#trim(foneSB_IDD)#</td>
<td>#trim(foneSB_AreaCode)#</td>
<td>#trim(foneSB)#</td>
<td>#trim(foneOther1_IDD)#</td>
<td>#trim(foneOther1_AreaCode)#</td>
<td>#trim(foneOther1)#</td>
<!---<td>#trim(foneOther2)#</td>--->
<td>#trim(fone_Mobile)#</td>
<td>#trim(fone_Inter)#</td>
<td>#trim(faxDirect_IDD)#</td>
<td>#trim(faxDirect_AreaCode)#</td>
<td>#trim(faxDirect)#</td>
<td>#trim(faxSB_IDD)#</td>
<td>#trim(faxSB_AreaCode)#</td>
<td>#trim(faxSB)#</td>
<td>#trim(faxOther1_IDD)#</td>
<td>#trim(faxOther1_AreaCode)#</td>
<td>#trim(faxOther1)#</td>
<!---<td>#trim(faxOther2)#</td>--->
</tr></cfoutput>
</table>