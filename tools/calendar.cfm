<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>.</title>
<CFPARAM name="form.startmonth" default=0>
<CFPARAM name="form.startyear" default=0>
<CFPARAM name="form.endmonth" default=0>
<CFPARAM name="form.endyear" default=0>
<style type="text/css">
<!--
body {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #333333;
	text-align: center;
}
td {
	border-bottom-width: 1px;
	border-right-width: 1px;
	border-bottom-style: solid;
	border-right-style: solid;
	border-bottom-color: #5F8EC9;
	border-right-color: #5F8EC9;
	padding: 3px;
	text-align: center;
}
.table{border:##E6E6E6 7px solid; background-color:##FFFFFF;}
.tableborder{border:1px solid #666666;}
.DIN 	{background-color:#D5F3FD}
.EB		{background-color:#FAEDCF;}
.Event	{background-color: #C6F9DA;}
-->
</style>
</head>

<body>

<form action="#" method="post">
<div style=" float:left; width:400px">
<div><div style="width:100px; float:left;">start date</div>
		<div style="float:left"><select name="startmonth">
  <option value="1" <cfif form.startmonth EQ 1>selected</cfif>>january</option>
  <option value="2" <cfif form.startmonth EQ 2>selected</cfif> >february</option>
  <option value="3" <cfif form.startmonth EQ 3>selected</cfif>>march</option>
  <option value="4" <cfif form.startmonth EQ 4>selected</cfif>>april</option>
  <option value="5" <cfif form.startmonth EQ 5>selected</cfif>>may</option>
  <option value="6" <cfif form.startmonth EQ 6>selected</cfif>>june</option>
  <option value="7" <cfif form.startmonth EQ 7>selected</cfif>>july</option>
  <option value="8" <cfif form.startmonth EQ 8>selected</cfif>>august</option>
  <option value="9" <cfif form.startmonth EQ 9>selected</cfif>>september</option>
  <option value="10" <cfif form.startmonth EQ 10>selected</cfif>>october</option>
  <option value="11" <cfif form.startmonth EQ 11>selected</cfif>>november</option>
  <option value="12"<cfif form.startmonth EQ 12>selected</cfif> >december</option>
</select> <select name="startyear">
  <option value="2006" <cfif form.startyear EQ 2006>selected</cfif>>2006</option>
  <option value="2007" <cfif form.startyear EQ 2007>selected</cfif>>2007</option>
  <option value="2008" <cfif form.startyear EQ 2008>selected</cfif>>2008</option>
  <option value="2009" <cfif form.startyear EQ 2009>selected</cfif>>2009</option>
</select>
		</div>
</div>
<div><div style=" clear:both; width:100px; float:left; text-align:center;">end date</div>
		<div style="float:left"><select name="endmonth">
  <option value="1" <cfif form.endmonth EQ 1>selected</cfif>>january</option>
  <option value="2" <cfif form.endmonth EQ 2>selected</cfif>>february</option>
  <option value="3" <cfif form.endmonth EQ 3>selected</cfif>>march</option>
  <option value="4" <cfif form.endmonth EQ 4>selected</cfif>>april</option>
  <option value="5" <cfif form.endmonth EQ 5>selected</cfif>>may</option>
  <option value="6" <cfif form.endmonth EQ 6>selected</cfif>>june</option>
  <option value="7" <cfif form.endmonth EQ 7>selected</cfif>>july</option>
  <option value="8" <cfif form.endmonth EQ 8>selected</cfif>>august</option>
  <option value="9" <cfif form.endmonth EQ 9>selected</cfif>>september</option>
  <option value="10" <cfif form.endmonth EQ 10>selected</cfif>>october</option>
  <option value="11" <cfif form.endmonth EQ 11>selected</cfif>>november</option>
  <option value="12" <cfif form.endmonth EQ 12>selected</cfif>>december</option></select>
  </select> <select name="endyear">
  <option value="2006" <cfif form.endyear EQ 2006>selected</cfif>>2006</option>
  <option value="2007" <cfif form.endyear EQ 2007>selected</cfif>>2007</option>
  <option value="2008" <cfif form.endyear EQ 2008>selected</cfif>>2008</option>
  <option value="2009" <cfif form.endyear EQ 2009>selected</cfif>>2009</option></select> <input name="Submit" type="submit" value="Submit"  />
  		</div>
</div>
</div></form>
  <div style="float:left; width:200px;">
<div><div style=" clear:both;width:25px; float:left;" ><div style="height:15px; width:15px; background-color:#D5F3FD; border:1px solid #666666;"></div></div><div style="float:left;">Dinner</div></div>
<div><div style=" clear:both;width:25px; float:left;" ><div style="height:15px; width:15px; background-color:#C6F9DA; border:1px solid #666666;"></div></div><div style="float:left;">Conference</div></div>
<div><div style=" clear:both;width:25px; float:left;" ><div style="height:15px; width:15px; background-color:#FAEDCF; border:1px solid #666666;"></div></div><div style="float:left;">Briefing</div></div> 
  </div>
<cfif parameterexists(form.Submit)>  
<div style="margin:0 0 0 520px;  text-align:left;">
<b>Email Calendar</b><br /> Paste email addresses here to send to.<br /> U must use a comma after each address <form action="email_calendar.cfm" method="post"><textarea name="emailcolection"></textarea> 
 <input type="submit" value="email" /><input type="hidden" name="startmonth" value="<cfoutput>#form.startmonth#</cfoutput>" /><input type="hidden" name="startyear" value="<cfoutput>#form.startyear#</cfoutput>" /><input type="hidden" name="endmonth" value="<cfoutput>#form.endmonth#</cfoutput>" /><input type="hidden" name="endyear" value="<cfoutput>#form.endyear#</cfoutput>" /> </form>
</div>  

<div style="clear:both"></div>
<br />

<cfoutput>
<cfset firsthalf = 0 >
<cfset firstMonth = form.startmonth >
	<cfloop index="startloop" from="#firstMonth#" to="12">
		<cfset firsthalf = firsthalf + 1 >
	</cfloop>
<cfset totalMonths = (firsthalf + form.endmonth) >
<!--- get all records 
<cfloop index="y" from="1" to=#totalMonths#>
   <cfloop index="xdays" from="1" to=#daysInMonth(IsMonth)#>
   </cfloop>
</cfloop>
 end get all records
 #MonthAsString(form.startmonth)# #form.startyear# #firsthalf# months<br />
 #MonthAsString(form.endmonth)# #form.endyear# #form.endmonth# months<br /> ---><br />

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
  		<!---<CFSET collectData[qx]=getevents.event_expire>
	<cfset qx = qx +1 >--->
  <!--- end get data --->
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
	    	<cfloop query="getevents">
		<cfif #createDate(thisYear, IsMonth, z)# EQ getevents.event_expire><div class="<cfif event_type EQ "DIN">DIN<cfelseif event_type EQ "EB">EB<cfelseif event_type EQ "Event">Event</cfif>">#getevents.event_name#</div><cfelse>&nbsp;</cfif>
  			</cfloop>
	  </td>
   </cfloop>
   </tr>   
</cfloop>
  </table> 
<!--- #ArrayToList(collectData, ",")#--->
</cfoutput>
</cfif>

</body>
</html>
<!--- <cfif y EQ 1 >#MonthAsString(firstMonth)#<cfelseif (firstMonth + y - 1) GREATER THAN 12>#MonthAsString((firstMonth + y - 1) -12)#<cfelse>#MonthAsString(firstMonth + y - 1)#</cfif>
<CFSET collectData=ArrayNew(2)><CFSET collectData[x][1]=getevents.event_type><CFSET collectData[x][2]=getevents.event_name> 
<CFSET collectData[x][1]=getevents.event_type><CFSET collectData[x][2]=getevents.event_name>
<cfset ArrayClear(collectData)>--->