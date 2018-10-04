<cfinclude template="qry_newsletterCounts.cfm">
<ul class="listMenu"><cfoutput query="getNewsletterCounts">
<li>#getNewsletterCounts.newslettername# (<strong>#getNewsletterCounts.recipientCount#</strong>)</li></cfoutput><br />
</ul>