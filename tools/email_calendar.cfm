<cfset firsthalf = 0 >
<cfset firstMonth = form.startmonth >
	<cfloop index="startloop" from="#firstMonth#" to="12">
		<cfset firsthalf = firsthalf + 1 >
	</cfloop>
<cfset totalMonths = (firsthalf + form.endmonth) >

<cfloop index ="ListElement" 
   list = #form.emailcolection# 
   delimiters = ",;:/"> 
<!---<cfset address = #trim(listGetAt(form.emailcolection, Ln))#>--->

	<cfmail to="#ListElement#"
		from="info@glopac.com"
		subject="Petro21 Event Calendar"
		type="html">
<style type="text/css">
<!--
body {font-family: Arial, Helvetica, sans-serif;font-size: 12px;color: ##333333;text-align: center;}
td {border-bottom-width: 1px;border-right-width: 1px;border-bottom-style: solid;border-right-style: solid;border-bottom-color: ##5F8EC9;border-right-color: ##5F8EC9;padding: 3px;text-align: center;}
.table{border:##E6E6E6 7px solid; background-color:##FFFFFF;}
.tableborder{border:1px solid ##666666;}
.DIN 	{background-color:##D5F3FD}
.EB		{background-color:##FAEDCF;}
.Event	{background-color:##C6F9DA;}
-->
</style>
<a href="http://www.petro21.com" target="_blank"><img src="http://petro21.com/img/p21logo.jpg" width="756" height="83" alt="Petro21.com" border="0" /></a>
<table border="0" width="100%" height="100%" cellspacing="1" style="border:##E6E6E6 7px solid; background-color:##FFFFFF;" >
 <cfloop index="y" from="1" to=#totalMonths#>
 			<cfif y EQ 1 ><cfset IsMonth = firstMonth ><cfset thisYear = form.startyear>
 			<cfelseif (firstMonth + y - 1) GREATER THAN 12><cfset IsMonth = (firstMonth + y - 1) -12 ><cfset thisYear = form.endyear>
 			<cfelse><cfset IsMonth = (firstMonth + y - 1)><cfset thisYear = form.startyear>
 			</cfif>
			<cfset isMonthPlus = (form.endmonth+1) >
  <cfset DynamicDate = DateFormat(createDate(thisYear, IsMonth, 1), "yyyy mm dd")>
  <cfset StartGetevents = createDate(form.startyear, form.startmonth, 1)>
  <cfset EndGetevents = createDate(form.endyear, isMonthPlus, 1) >
  <!--- get data from events --->
  <cfquery name="getevents" DATASOURCE="petro21" username="petro21" password="hashbrown" >
  	select event_type, event_name, event_expire
	   FROM events
   WHERE  (event_type = 'Event' OR event_type = 'EB' OR event_type = 'DIN') AND ((event_expire > #StartGetevents#) AND (event_expire < #EndGetevents#) )
  </cfquery>
  <cfset qx = 1 ><CFSET collectData=ArrayNew(1)>
   <tr bgcolor="##F7F7F7">
   <td >#MonthAsString(IsMonth)# </td>
   <cfloop index="x" from="1" to=#daysInMonth(DynamicDate)#>
      <td>#x#</td>
   </cfloop>
   </tr>
   <tr>
   <td>Event</td>
   <cfloop index="z" from="1" to=#daysInMonth(DynamicDate)#>
      <td>
	    	<cfloop query="getevents"  >
				<cfif #createDate(thisYear, IsMonth, z)# EQ getevents.event_expire><div class="<cfif event_type EQ "DIN">DIN<cfelseif event_type EQ "EB">EB<cfelseif event_type EQ "Event">Event</cfif>">#getevents.event_name#</div><cfelse>&nbsp;</cfif>
  			</cfloop>
	  </td>
   </cfloop>
   
   </tr>   
</cfloop>
  </table> 

	</cfmail>
	</cfloop>
	<cflocation url="calendar.cfm">