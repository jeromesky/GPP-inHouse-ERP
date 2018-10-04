
    
<cfinclude template="qry_newsletters.cfm">
<cfsavecontent variable = "BuildNewsletterDrop">
<select id="news_cat" class="newsletterid" name="news_cat">
	<cfoutput query="qry_newsletters"><option value="#qry_newsletters.newsletterid#" <cfif qry_newsletters.newsletterid EQ form.newsletterid>selected="selected"</cfif>>#qry_newsletters.newsletterName#</option></cfoutput>
</select></cfsavecontent><!---style="width:60px; min-width:60px; max-width:60px"--->