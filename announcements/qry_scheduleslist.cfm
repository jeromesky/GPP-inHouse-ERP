<cfparam name="var.past"default=0>

<cfif var.past EQ '0'>

  <cfset switch = '>='>

<cfelse>

  <cfset switch = '<='>

</cfif>

<cfquery name="qrySchedulesList" datasource="#mainDSN#"> 
  SELECT
    *
  FROM
    gpp.dbo.ann_schedules
</cfquery>

<cfdump var="#qrySchedulesList#">