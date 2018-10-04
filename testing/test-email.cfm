<cftry>
<cfmail 
	to="babette@glopac-partners.com"
 	cc="jerome@glopac-partners.com" 
    bcc="babette@glopac-partners.com"
    subject="testing Form Submit " 
    from="web@petro21.com" 
    type="html">
test for Babette

</cfmail>

<cfcatch type="any">
<cfdump var="#cfcatch#">
</cfcatch></cftry>