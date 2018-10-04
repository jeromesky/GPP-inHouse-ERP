<cfsilent><cfinclude template="qry_timeManaged.cfm"></cfsilent>

<cfif qryTimeManage.recordcount GT 1>
<div class="row">
  <div class="date">Date</div>
  <div class="insert">Time</div>
  <div class="time">Duration</div>
  <div class="comment">Done</div>
</div>
<hr />
</cfif>
<cfoutput query="qryTimeManage"><div class="row">
            <div class="date">#dateFormat(qryTimeManage.TimeManagementDate, "dd.mm.yy")#</div>
            <div class="insert">#timeFormat(qryTimeManage.timeManagementInsertTime, "hh.mm")#</div> 
            <div class="time">#numberFormat(qryTimeManage.TimeManagementTime, "999")#</div>
            <div class="comment">#qryTimeManage.TimeManagementDesc#</div>
    </div></cfoutput>

<!---<cfif qryTimeManage.recordcount GT 1>
<div id="rowtotal">
  <div class="box">Total Hours (Minutes)</div>
  <cfoutput><div class="box">#hoursMinutes(qryTimeManageTotal.total)# (#qryTimeManageTotal.total#)</div></cfoutput>
</div>
</cfif>--->