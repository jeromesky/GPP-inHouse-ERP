<cfinclude template="qry_Subscription_UnregisterReason.cfm">
<div class="ui-corner-top ui-helper-clearfix podHeader" style="color:#fff; background-color:#1a1a9c !important"><spam class="ui-dialog-title">Subscription To check</spam></div>
<div class="ui-corner-bottom marginBottom15 ui-widget ui-widget-content" id="dashPod_Subs_2Check">
<div class=""><cfoutput query="getSubscription_ToRemove"><cfif getSubscription_ToRemove.reason NEQ ""><ul class="listMenu">
<li>#Ucase(getSubscription_ToRemove.userName)# #Ucase(getSubscription_ToRemove.userSurname)# [ #getSubscription_ToRemove.userEmail# ]<br />
Reason: <cfif getSubscription_ToRemove.reason NEQ "">#getSubscription_ToRemove.reason#<cfelse>none given</cfif><br />
Date: #dateFormat(getSubscription_ToRemove.unregisterDate, "dd mm yyyy")#</li>
</ul></cfif></cfoutput>
</div>
</div>