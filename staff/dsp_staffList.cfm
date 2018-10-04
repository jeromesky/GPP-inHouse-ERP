<cfinclude template="qry_users.cfm">

<table border="0" cellspacing="4" cellpadding="3">
<tr bgcolor="#F4F4F4">
<td>User name</td>  
<td>Email</td>
<td width="16">edit</td><!--- <td width="60">delete</td>--->
</tr>
<cfoutput query="qryStaff"><tr>
<td>#qryStaff.staffName#</td>
<td>#qryStaff.emailPrivate#</td>
<td align="center"><a href="javascript:loadStaffForm(#qryStaff.staffID#);"><img src="../img/newS_edit.gif" border="0" /></a></td>
<!--- <td align="right"><a href="javascript:deleteusser(#qryStaff.staffID#);"><img src="../img/new_delete.gif" border="0" /></a></td>--->
</tr></cfoutput>       
</table>