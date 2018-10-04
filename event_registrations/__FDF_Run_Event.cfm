<CFOUTPUT><CFSET date="#DateFormat(now())#"><cfset venue = "here is the name of the venue"></CFOUTPUT>
<CFSETTING ENABLECFOUTPUTONLY="YES" SHOWDEBUGOUTPUT="NO">
<CFCONTENT TYPE="APPLICATION/vnd.fdf">
<CFOUTPUT>%FDF-1.2
1 0 obj <<
/FDF <<
/Fields
[
<<
/T(event-date)
/V(#date#)
>>
<<
/T(venue)
/V(#venue#)
>>
]
/F(http://www.petro21.com/my-office/event_registrations/TemplateRegistration.pdf)
>>
>>
endobj
trailer
<</Root 1 0 R>>
%%EOF
</CFOUTPUT>