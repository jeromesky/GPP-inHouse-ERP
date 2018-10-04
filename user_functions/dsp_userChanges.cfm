<cfinclude template="qry_userChanges.cfm"><cfoutput>
<table border="0" cellpadding="2" cellspacing="4">
  <tr>
    <th>User</th>
    <th>Date change</th>
    <th>Field</th>
    <th>New Value</th>
    <th>Old Value</th>
  </tr><cfloop query="qryUserChanges">
  <tr>
    <td>#qryUserChanges.EditedBy#</td>
    <td>#DateFormat(CreateDate(left(qryUserChanges.EditedDate, 4), left(right(qryUserChanges.EditedDate, 4), 2), right(qryUserChanges.EditedDate, 2)), "dd mmm yyyy")#</td>
    <td>#qryUserChanges.Field#</td>
    <td>#qryUserChanges.NewValue#</td>
    <td>#qryUserChanges.OriginalValue#</td>
  </tr></cfloop>
</table></cfoutput>