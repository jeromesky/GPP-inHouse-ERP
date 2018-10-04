<!---<cfset UnregisterReason_firstDate =  dateAdd("d", -14, Now()) >--->
<cfset UnregisterReason_firstDate = CreateDate(2010, 04, 26)>
<cfquery name="getSubscription_UnregisterReason" datasource="#gpp#" cachedWithin="#CreateTimeSpan(0,6,0,0)#">
<!---SELECT 
[reason]
    ,[userName]
    ,[userSurname]
    ,[unregisterDate]
FROM DashPod_Subscription_Unregister
UNION--->

    SELECT TOP 40
    [reason]
        ,[userName]
        ,[userSurname]
        ,[unregisterDate]
    FROM DashPod_Subscription_Unregister_latest
    WHERE reason <> ''
    ORDER by unregisterDate DESC
</cfquery>

<cfquery name="getSubscription_ToRemove" datasource="#gpp#" cachedWithin="#CreateTimeSpan(0,6,0,0)#">
    SELECT distinct
    [reason]
        ,[userName]
        ,[userSurname]
        ,[unregisterDate]
        ,[userEmail]
    FROM DashPod_Subscription_Unregister_latest
    WHERE
    [unregisterDate] > (getdate() -6)
    ORDER by unregisterDate DESC
</cfquery>

<cfquery name="qrySubscriptionCount" datasource="#gpp#" cachedWithin="#CreateTimeSpan(0,6,0,0)#">
    SELECT 
        [subEndID]
        ,[reasonName]
    FROM DashPod_Subscription_Unregister_latest
    ORDER by subEndID ASC
</cfquery>

<cfquery dbtype="query" name="qrySt1">
    SELECT 
        COUNT(subEndID) AS total
        ,[reasonName]
    FROM qrySubscriptionCount
    WHERE subEndID = 1
    GROUP BY reasonName
</cfquery>

<cfquery dbtype="query" name="qrySt2">
    SELECT 
        COUNT(subEndID) AS total
        ,[reasonName]
    FROM qrySubscriptionCount
    WHERE subEndID = 2
    GROUP BY reasonName
</cfquery>

<cfquery dbtype="query" name="qrySt3">
    SELECT 
        COUNT(subEndID) AS total
        ,[reasonName]
    FROM qrySubscriptionCount
    WHERE subEndID = 3
    GROUP BY reasonName
</cfquery>

<cfquery dbtype="query" name="qrySt4">
    SELECT 
        COUNT(subEndID) AS total
        ,[reasonName]
    FROM qrySubscriptionCount
    WHERE subEndID = 4
    GROUP BY reasonName
</cfquery>

<cfquery dbtype="query" name="qrySt5">
    SELECT 
        COUNT(subEndID) AS total
        ,[reasonName]
    FROM qrySubscriptionCount
    WHERE subEndID = 5
    GROUP BY reasonName
</cfquery>

<cfquery dbtype="query" name="qrySt6">
    SELECT 
        COUNT(subEndID) AS total
        ,[reasonName]
    FROM qrySubscriptionCount
    WHERE subEndID = 6
    GROUP BY reasonName
</cfquery>

<cfquery dbtype="query" name="qrySt7">
    SELECT 
        COUNT(subEndID) AS total
        ,[reasonName]
    FROM qrySubscriptionCount
    WHERE subEndID = 7
    GROUP BY reasonName
</cfquery>

<cfquery dbtype="query" name="qrySt8">
    SELECT 
        COUNT(subEndID) AS total
        ,[reasonName]
    FROM qrySubscriptionCount
    WHERE subEndID = 8
    GROUP BY reasonName
</cfquery>