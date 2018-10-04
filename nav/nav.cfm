<cfquery name="newsletterlist" datasource="#gpp#" cachedwithin="#CreateTimeSpan(0,2,0,0)#">
SELECT sendDay, sendTime, newsletterName, newsletterID, live
FROM newsletters
ORDER BY sendTime
</cfquery>

<cfscript>
 colnum = 1;
 dow = DayOfWeek(now());
 tomorrow = dow +1;
 //tomorrow = 2;
 
 if (tomorrow eq 8) 
  tomorrow = 1;
 
 if (tomorrow eq 1) 
 {
 weekCycle1start = 1;
 weekCycle2start = 0;
 weekCycle2end = 0;
 }
 else
 {
 weekCycle1start = tomorrow;
 weekCycle2start = 1;
 weekCycle2end = tomorrow - 1;
 }
</cfscript>

<cfloop from=#weekCycle1start# to=7 index='ind'>
<cfoutput><div class="NavColumnleft#colnum#"><h3><cfif ind eq tomorrow>select news for </cfif>#DayOfWeekAsString(ind)#</h3></cfoutput>
<ul><cfoutput query='newsletterlist'>
  <cfif FindNoCase(ind, sendDay)><li><a href="../news/?id=#newsletterID#"<cfif newsletterlist.live EQ 0> class="warningText"</cfif>>#numberformat(sendTime, '00')#:00 <cfif newsletterlist.live EQ 0><font color="red">|</font><cfelse>|</cfif> #newsletterName#</a></li></cfif>
</cfoutput></ul>
</div>

<cfif colnum eq 4><br style="clear: left" /><br style="clear: left" /></cfif><cfset colnum = colnum +1>
</cfloop>

<cfif weekCycle2start NEQ 0 and weekCycle2end NEQ 0>
<cfloop from=1 to=#weekCycle2end# index='ind'>
<cfoutput><div class="NavColumnleft#colnum#"><h3>#DayOfWeekAsString(ind)#</h3></cfoutput>
<ul><cfoutput query='newsletterlist'>
  <cfif FindNoCase(ind, sendDay)><li><a href="../news/?id=#newsletterID#"<cfif newsletterlist.live EQ 0> class="warningText"</cfif>>#numberformat(sendTime, '00')#:00 <cfif newsletterlist.live EQ 0><font color="red">|</font><cfelse>|</cfif> #newsletterName#</a></li></cfif>
</cfoutput></ul>
</div>

<cfif colnum eq 4><br style="clear: left" /><br style="clear: left" /></cfif><cfset colnum = colnum +1>
</cfloop>
</cfif>