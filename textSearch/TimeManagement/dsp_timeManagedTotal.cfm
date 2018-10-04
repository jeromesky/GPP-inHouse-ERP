<cfinclude template="qry_timeManagedTotal.cfm">
<!--- <div id="rowtotal">
 <div class="box">Total Hours (Minutes)</div>--->
  <cfoutput><div class="box">#hoursMinutes(qryTimeManageTotal.total)# (#qryTimeManageTotal.total#)</div></cfoutput>
<!---</div>--->