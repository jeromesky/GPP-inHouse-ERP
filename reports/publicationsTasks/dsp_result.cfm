 
 <table width="100%" style="font-family:Arial, Helvetica, sans-serif; color:#666; font-size:12px">
 <cfoutput query="qryResult" group="branchName">
 	<tr>
    	<td colspan="4" class="company">#Ucase(qryResult.branchName)# </td>
    </tr>
    <cfoutput>
 	<tr>
        <td>#qryResult.typeLabel#  </td>
        <td>#dateFormat(qryResult.taskDateDue, "dddd, dd mmm yyyy")#</td>
        <td>#qryResult.contactName#</td>
        <td>
        <a href="javascript:openTasksWindow(#qryResult.packageID#, #qryResult.eventID#);">
        <cfif taskCompleted EQ "" AND qryResult.taskDateDue LT now()>
        		<div class="ui-state-error ui-corner-all">Task not done</div>
        <cfelse>
        		#dateFormat(qryResult.taskCompleted, "dddd, dd mmm yyyy")#
        </cfif>
        </a>
        </td>
   </tr></cfoutput></cfoutput>
</table>
       