<cfquery datasource="#gpp#" name="qryTopRatedNewsArticles" cachedWithin="#CreateTimeSpan(1,0,0,0)#">
SELECT     TOP (20) newsID, newsHeadline, newsClickCount, newsletterID
FROM         news
WHERE     (addedDate >= GETDATE() - 7) AND (newsClickCount <> 0)
ORDER BY newsClickCount DESC


</cfquery>