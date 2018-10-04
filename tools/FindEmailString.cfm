
 <cfif parameterexists(form.comments)>
 
<cffunction name="getEmailAddresses">
  <cfargument name="stringToParse" type="string" />
  <cfargument name="emailArray" type="array" default="#ArrayNew(1)#" />
  <cfif REFind("([a-zA-Z0-9_\.=-]+@[a-zA-Z0-9_\.-]+\.[[:alpha:]]{2,6})",stringToParse)>
    <cfset sLenPos=REFind("([a-zA-Z0-9_\.=-]+@[a-zA-Z0-9_\.-]+\.[[:alpha:]]{2,6})",stringToParse,1,true) />
    <cfset emailAddress = mid(stringToParse, sLenPos.pos[1], sLenPos.len[1]) />
    <cfset arrayAppend(emailArray, emailAddress)>
    <cfset stringToParse = Mid(stringToParse, sLenPos.pos[1] + sLenPos.len[1], len(stringToParse))>
    <cfif REFind("([a-zA-Z0-9_\.=-]+@[a-zA-Z0-9_\.-]+\.[[:alpha:]]{2,6})",stringToParse)>
      <cfset emailArray = getEmailAddresses(stringToParse, emailArray)>
    </cfif>
  </cfif>
  <cfreturn emailArray />
</cffunction>

<cfset someString = "#form.comments#">
<cfset emails = getEmailAddresses(someString)>

</cfif>
<HTML>
<HEAD>
<TITLE>Burello Design - ColdFusion Code Examples - Extract Email Address from Text String</TITLE>
<META NAME="Keywords" CONTENT="website, design, e-commerce, joseph, burello, affordable, cheap, la jolla, california, coldfusion, java, html">
<META NAME="Description" CONTENT="Market driven, customer focused, e-commerce solutions.">
<META NAME="Author" CONTENT="burello@burellodesign.com">
<link href="style.css" rel="stylesheet" type="text/css">
</HEAD>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">


<table width="100%" border="0" cellspacing="0" cellpadding="0" class=BodyText>
  <FORM action="FindEmailString.cfm" method="post" name="Email_Extractor">
         <tr>
      <td width="50%">TEXT STRING:
        <textarea name="comments" rows="5" id="comments" style="width:100%;"></textarea></td>

      <td>EMAILS:
       <cfif parameterexists(form.comments)> <textarea name="email" rows="5" id="email" style="width:100%;"><cfoutput><cfdump var=#emails#></cfoutput></textarea></cfif></td>
    </tr>
    <tr>
      <td colspan="2"><div align="center">
        <input type="submit" name="button" id="button" value="Submit">
      </div></td>
    </tr>
  </FORM>
  <cfif parameterexists(form.comments)><cfoutput>#emails[1]#</cfoutput></cfif>
</table>

</body>
</HTML>