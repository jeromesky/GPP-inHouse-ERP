<cfoutput><fieldset>
  <legend><a href="?">Announcements Menu<a/></legend>
  <table width=750>
    <tr>
      <td>
      Announcement: 
      <cfif QUERY_STRING neq 'FA=announcementCreate'><a href="?FA=announcementCreate"></cfif>Create</a> /
      <cfif QUERY_STRING neq 'FA=announcementListCurrent'><a href="?FA=announcementListCurrent"></cfif>Edit Current</a> / 
      <cfif QUERY_STRING neq 'FA=announcementListPast'><a href="?FA=announcementListPast"></cfif>Review Past</a><br/>

      Audience: 
      <cfif QUERY_STRING neq 'FA=audienceCreate'><a href="?FA=audienceCreate"></cfif>Create</a> /
      <cfif QUERY_STRING neq 'FA=audienceList'><a href="?FA=audienceList"></cfif>Edit</a>
      </td>
      <td>
      Schedules: 
      <cfif QUERY_STRING neq 'FA=schedulesCreate'><a href="?FA=schedulesCreate"></cfif>Create</a> / 
      <cfif QUERY_STRING neq 'FA=schedulesListCurrent'><a href="?FA=schedulesListCurrent"></cfif>Edit Current</a> /
      <cfif QUERY_STRING neq 'FA=schedulesListPast'><a href="?FA=schedulesListPast"></cfif>Review Past</a><br/>
      
      Test Sending: 
      <cfif QUERY_STRING neq '0'><a href=""></cfif>Internal</a> /
      <cfif QUERY_STRING neq '1'><a href=""></cfif>External</a><br>
      
      </td>
      <td>
      Templates: 
      <cfif QUERY_STRING neq 'FA=templateList'><a href="?FA=templateList"></cfif>Edit</a> /
      <cfif QUERY_STRING neq 'FA=templateCreate'><a href="?FA=templateCreate"></cfif>Create</a><br/>

      Files: 
      <cfif QUERY_STRING neq 'FA=filesload'><a href="?FA=filesLoad"></cfif>Load</a> /
      <cfif QUERY_STRING neq 'FA=filesedit'><a href="?FA=filesEdit"></cfif>Manage</a>
    </td>
    </tr>
  </table>
</fieldset></cfoutput>