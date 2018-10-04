<div class="">
<div class="dashPod_resultCount">Comments Left since <cfoutput>#dateformat(UnregisterReason_firstDate, "dd mmm yyyy")#</cfoutput>: <span><cfoutput>#getSubscription_UnregisterReason.recordcount#</cfoutput></span></div>
<cfoutput query="getSubscription_UnregisterReason"><cfif getSubscription_UnregisterReason.reason NEQ ""><ul class="listMenu">
<li>#Ucase(getSubscription_UnregisterReason.userName)# #Ucase(getSubscription_UnregisterReason.userSurname)#<br />
Reason: <cfif getSubscription_UnregisterReason.reason NEQ "">#getSubscription_UnregisterReason.reason#<cfelse>none given</cfif><br />
Date: #dateFormat(getSubscription_UnregisterReason.unregisterDate, "dd mm yyyy")#</li>
</ul></cfif></cfoutput>
</div>