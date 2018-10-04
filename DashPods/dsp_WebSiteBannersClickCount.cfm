<cfinclude template="qry_WebSiteBannersClickCount.cfm">
<div class="widgit_NewsletterClickCount">
<table border="0" cellpadding="2" cellspacing="0">
		<tr>
			<td>Banner</td>
			<td>Clicks</td>
			<td>Impressions</td>
		</tr>
		<cfoutput query="getWebSiteBannersClickCount"><tr>
			<td>#vchDescription#</td>
			<td>#iClicks#</td>
			<td>#iImpressions#</td>
    </tr></cfoutput>
</table>
</div>