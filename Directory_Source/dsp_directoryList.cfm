<cfinclude template="qry_directoryList.cfm">

<table  border="0" cellspacing="1" cellpadding="2" id="directoryList_table" width="100%">
  <tr>
    <td style="background-color:#F4F4F4">Directory Name</td>
    <td style="background-color:#F4F4F4">Directory Publish Source</td>
<!---    <td style="background-color:#F4F4F4">Directory Publish Date</td>--->
  </tr>
  <cfoutput query="get_List">
  <tr>
    <td>#get_List.directoryName#</td>
    <td>#get_List.DirectorySource#</td>
<!---    <td>#DateFormat(get_List.DirectoryDate, "dd mmmm yyyy")#</td>--->
  </tr>
  </cfoutput>
</table>
