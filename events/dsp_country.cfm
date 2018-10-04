<CFSETTING ENABLECFOUTPUTONLY="no"><cfsilent>
<CFPARAM NAME="Attributes.SelectName" DEFAULT="country">
<CFPARAM NAME="Attributes.Size" DEFAULT="1">
<CFPARAM NAME="Attributes.onFocus" DEFAULT="">
<CFPARAM NAME="Attributes.onBlur" DEFAULT="">
<CFPARAM NAME="Attributes.onChange" DEFAULT="">
<CFPARAM NAME="Attributes.defaultSelected" DEFAULT="">
<CFPARAM NAME="Attributes.Selected" DEFAULT="">
<CFPARAM NAME="Attributes.Filter" DEFAULT="">
<CFPARAM NAME="Attributes.OptionValue" DEFAULT="1">
<CFPARAM NAME="Attributes.OptionText" DEFAULT="2">
<CFPARAM NAME="Attributes.Add_Value" DEFAULT="">
<CFPARAM NAME="Attributes.Add_Text" DEFAULT="">
<CFSET SelectThis = ''>
<CFSET Select = ''>
<CFSET defaultSelect = ''></cfsilent>

<CFIF (Attributes.OptionValue IS 1 OR Attributes.OptionValue IS 2) AND (Attributes.OptionText IS 1 OR Attributes.OptionText IS 2) AND Attributes.Size GT 0 AND Attributes.SelectName IS NOT ''>

<cfinclude template="qry_country.cfm">

<CFIF Attributes.defaultSelected IS NOT '' OR Attributes.Selected IS NOT ''>

<CFLOOP INDEX=Loop FROM=1 TO=236>
<CFIF Attributes.Selected IS '#this_country[Loop][1]#'><CFSET Select = '#this_country[Loop][1]#'></CFIF>
<CFIF Attributes.defaultSelected IS '#this_country[Loop][1]#'><CFSET defaultSelect = '#this_country[Loop][1]#'></CFIF>
</CFLOOP>

<CFSET SelectThis = IIF(Select IS NOT '', DE(Select), DE(defaultSelect))>
</CFIF>
<CFOUTPUT><SELECT NAME=#Attributes.SelectName# SIZE=#Attributes.Size# <CFIF Attributes.onFocus IS NOT ''>onFocus="#PRESERVESINGLEQUOTES(Attributes.onFocus)#"</CFIF><CFIF Attributes.onBlur IS NOT ''> onBlur="#PRESERVESINGLEQUOTES(Attributes.onBlur)#"</CFIF><CFIF Attributes.onChange IS NOT ''> onChange="#PRESERVESINGLEQUOTES(Attributes.onChange)#"</CFIF>></CFOUTPUT>

<CFIF Attributes.Add_Text IS NOT ''><CFOUTPUT><OPTION<CFIF Attributes.Add_Value IS NOT ''> VALUE="#PRESERVESINGLEQUOTES(Attributes.Add_Value)#"</CFIF>>#Attributes.Add_Text#</OPTION>
</CFOUTPUT></CFIF>

<CFLOOP INDEX=Loop FROM=1 TO=236><CFIF Attributes.Filter DOES NOT CONTAIN '#this_country[Loop][1]#'>
<CFOUTPUT><OPTION VALUE="#this_country[Loop][Attributes.OptionValue]#"<CFIF SelectThis IS '#this_country[Loop][1]#'> SELECTED</CFIF>>#this_country[Loop][Attributes.OptionText]#</OPTION></CFOUTPUT></CFIF></CFLOOP>
<CFOUTPUT></SELECT></CFOUTPUT>

<CFELSE>
<CFOUTPUT>You have specified an invalid parameter:<BR>
<CFIF Attributes.SelectName IS ''>Invalid SelectName.<BR></CFIF>
<CFIF Attributes.Size LTE 0>Invalid Size.<BR></CFIF>
<CFIF Attributes.OptionValue IS NOT 1 AND Attributes.OptionValue IS NOT 2>Invalid OptionValue.<BR></CFIF>
<CFIF Attributes.OptionText IS NOT 1 AND Attributes.OptionText IS NOT 2>Invalid OptionText.<BR></CFIF></CFOUTPUT>
</CFIF>

<CFSETTING ENABLECFOUTPUTONLY="no">