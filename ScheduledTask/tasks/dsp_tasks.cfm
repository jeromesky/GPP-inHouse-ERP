<cfparam name="returnType" default="emailTask">
<cfscript>
function EpochTimeToDate(epoch) {
    return DateAdd("s", epoch, "January 1 1970 00:00:00");
}

	var.dateMonthBack = dateAdd("d", -30, now());
	var.dateDayBack = dateAdd("d", -1, now());
</cfscript>

<cfquery datasource="#gpp#" name="qryTasks">

SELECT 
	   [eventName]
      ,[taskDateDue]
      ,[emailPrivate]
      ,[typeLabel]
      ,[staffName]
      ,[taskComment]
      ,[taskSpecs]
      ,[branchName]
      ,[contactName]
      ,[taskID]
      ,[packageID]
      ,[eventID]
<!---      ,[contactPhoneAreaCode]
      ,[contactPhoneNumber]
      ,[countryPhoneCode]
      ,[LeadTime]--->
	,[contactNumber]
      ,[taskCompleted]
      ,[taskManager]
      ,[contactEmail]
      ,[taskTypeID]
      ,[publicationURL]
      ,[branchPassword]
      ,[branchUserName]
      ,[publicationRules]
  FROM 
  	[TASKS_tasks]
WHERE
	[taskDateDue] <= getDate() and [taskDateDue] >= getDate()-1
    and taskCompleted IS NULL
</cfquery>

<!---<cfloop query="qryTasks">--->

<cfmail to="#qryTasks.emailPrivate#" from="web@petro21.com" subject="Contract due: #dateFormat(qryTasks.taskDateDue, 'dddd, dd mmm yyyy')#" type="html" query="qryTasks" >
<div style="padding:20px; border:1px solid ##cacaca; border-top:none; background-color:##fcfcfc">
<table  border="0" cellspacing="1" cellpadding="3">
  <tr>
    <td colspan="2">
    	<p>Dear #qryTasks.contactName#</p>
      <p>As part of the contract that Global Pacific & Partners has with you on the #qryTasks.eventName#,<br>
            please find attached the files for your urgent attention.<br>
            Jerry has organized this to be completed on #dateFormat(qryTasks.taskDateDue, "dddd, dd mmmm yyyy")# and requested me to send this through directly to you.</p>
      
      <p>If you have any specific queries regarding the fulfillment of this contract please direct them to jerry@glopac-partners.com.</p>

    <cfif qryTasks.taskTypeID EQ 101 >
      <p>Could you please send a proof to jerome@glopac-partners.com before sending out on agreed date <br />
      and include jerry@glopac-partners.com to receive the email blast.<br />
      </p>
    </cfif>

    <cfif qryTasks.taskTypeID EQ 100 OR qryTasks.taskTypeID EQ 102>
      <p>Please use the following link back to our site for the supplied banner http://www.globalpacific-partners.com/refer/?z=r&id=#qryTasks.taskID#</p>
	</cfif>
      
      Kind regards<br>
      <br>
   </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td></td>
  </tr>
  <tr>
    <td width="100"><strong>Task Type</strong></td>
    <td>#qryTasks.typeLabel#</td>
  </tr>
  <tr>
    <td><strong>Due Date</strong></td>
    <td>#dateFormat(qryTasks.taskDateDue, "dd mmmm yyyy")#</td>
  </tr>
  <tr>
    <td><strong>Event</strong></td>
    <td>#qryTasks.eventName#</td>
  </tr>
  <tr>
    <td><strong>Job Manager</strong></td>
    <td>#qryTasks.taskManager#</td>
  </tr>
  <tr>
    <td><strong>Job ID</strong></td>
    <td>#qryTasks.taskID#</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><strong>Publication</strong></td>
    <td>#qryTasks.branchName#</td>
  </tr>
  <tr>
    <td><strong>Contact name</strong></td>
    <td>#qryTasks.contactName#</td>
  </tr>
  <tr>
    <td><strong>Phone</strong></td>
    <td>#qryTasks.contactNumber#</td>
  </tr>
  <tr>
    <td><strong>Email</strong></td>
    <td>#qryTasks.contactEmail#</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><strong>Task Specs</strong></td>
    <td>#qryTasks.taskSpecs#</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><strong>Comment</strong></td>
    <td>#qryTasks.taskComment#</td>
  </tr>
 <cfif qryTasks.taskTypeID EQ 110 >
    <tr>
    <td>&nbsp;</td>
    <td>Listing access details</td>
  </tr>
  <tr>
    <td><strong>address</strong></td>
    <td>#qryTasks.publicationURL#</td>
  </tr>
  <tr>
    <td><strong>username</strong></td>
    <td>#qryTasks.branchUserName#</td>
  </tr>
  <tr>
    <td><strong>password</strong></td>
    <td>#qryTasks.branchPassword#</td>
  </tr>
  <tr>
    <td><strong>Publication Overall Specs</strong></td>
    <td>#qryTasks.publicationRules#</td>
  </tr>
  </cfif>
</table>

</div>
</cfmail>
<!---</cfloop>--->


<cfquery datasource="#gpp#" name="qryIncopleted">
SELECT 
	   [eventName]
      ,[taskDateDue]
      ,[typeLabel]
      ,[staffName]
      ,[taskComment]
      ,[taskSpecs]
      ,[branchName]
      ,[contactName]
      ,[taskManager]
      ,[taskID]
  FROM 
  	[TASKS_tasks]
WHERE
	[taskDateDue] >= <cfqueryparam cfsqltype="cf_sql_date" value="#var.dateMonthBack#">
	AND
	[taskDateDue] <= <cfqueryparam cfsqltype="cf_sql_date" value="#var.dateDayBack#">
    and taskCompleted IS NULL
ORDER BY
	[typeLabel], 
    [taskDateDue]
</cfquery>

<cfsavecontent variable="content">
    	<table>
        	<cfoutput query="qryIncopleted" group="typeLabel">
            <tr>
            	<td colspan="9" style="border-bottom:1px solid ##666; font-weight:bold; font-size:14px">#typeLabel#</td>
            </tr>
            <cfoutput>
            <tr> 
            	<td>(#taskID#)</td>
            	<td>#branchName#</td> 
                <td>#contactName#</td>
                <td>#eventName#</td>
                <td>#staffName#</td>
                <td>#taskComment#</td>
                <td>#dateformat(taskDateDue, "dd mmmm yy")#</td>
                <td>#taskManager#</td>
                <td>#taskSpecs#</td>
                
           </tr></cfoutput></cfoutput>
       </table>
</cfsavecontent>


<cfmail 
	to="jerome@glopac.com;alex@glopac.com; jodee@glopac.com;hello@davidsmeulders.com" 
    from="web@petro21.com" 
    subject="Incompleted Tasks for the last month" type="html" >
	
	#content#
        
        
</cfmail>
jerry@glopac.com; tanya@glopac.com; jodee@glopac.com;

<cfdump var="#qryTasks#">

