<cftry>
    <cfquery datasource="#dsnP21#" name="showFlashNews"  cachedWithin=#CreateTimeSpan(0,0,30,0)#  >
       SELECT title, content, link, img, brochure, speaker, displayIMG
       FROM newsletter_FlashNews
       WHERE   id IN (#getjob.flashnews#) <!---AND duedate > #now()#--->
       ORDER BY duedate
    </cfquery>
    <cfif showFlashNews.recordcount GT 0 >
<cfoutput>
                   
<table cellpadding="0" cellspacing="0" border="0" width="100%">
<cfloop query="showFlashNews"><tr>
<td valign="top" style="padding:0 0 0 5px; font-family:Arial, Helvetica, sans-serif;"><div style="font-size:13px; color:##444343; text-decoration:none; font-weight:bold">#showFlashNews.title#</div>
    	<cfif showFlashNews.speaker NEQ "">
      <cfquery datasource="#dsnP21#" name="Speaker">
        SELECT name, delegation, photo 
        FROM speakers 
        WHERE id = #showFlashNews.speaker# 
      </cfquery>
      <table border="0" cellpadding="0" cellspacing="2">
      <tr>
      <td valign="top" height="69" width="57"><img src="http://www.petro21.com/Speakers/photos/#Speaker.photo#" width="47" height="59"></td>
      <td valign="top"><span style="color:##2175bb; font-size:12px">#Speaker.name#</span><br>
      <span style=" font-size:12px;">#Speaker.delegation#</span></td>
      </tr>
      </table></cfif>
	  <cfif showFlashNews.displayIMG EQ 1>
      <table border="0" cellpadding="0" cellspacing="2">
      <tr>
      <td valign="top" height="69" width="57"><img src="http://www.petro21.com/advertising/#showFlashNews.img#" width="47" height="59" /> </td>
      <td valign="top"><span style="font-size:12PX; color:##2a2828;">#showFlashNews.content#</span></td>
      </tr>
      </table>
      <cfelse><span style="font-size:12PX; color:##2a2828;"><cfif showFlashNews.img NEQ ""><a href="http://www.petro21.com/advertising/#showFlashNews.img#" style="text-decoration:none">#showFlashNews.content#</a><cfelse>#showFlashNews.content#</cfif></span></cfif></td>
      </tr>
      <tr>
      <td height="15"></td>
      </tr></cfloop>
      </table>
</cfoutput>
</cfif>
<cfcatch type="any">
 <cfmail to="#contactAdmin#" FROM="web@glopac.com" SUBJECT="error on #CGI.SERVER_NAME# - #CGI.PATH_INFO#" type="html"><cfoutput>error message: #cfcatch.Message# <br>error Details: #cfcatch.Detail# <br>error in:  #cfcatch.Type# <br> error Native|:<cfif parameterexists(cfcatch.NativeErrorCode)> #cfcatch.NativeErrorCode#</cfif> <br>
 SQL state:<cfif parameterexists(cfcatch.SQLState)>  #cfcatch.SQLState#</cfif><br> 
 Root cause: <cfif parameterexists(cfcatch.RootCause)>#cfcatch.RootCause#</cfif>
 <br >#cgi.script_name#</cfoutput></cfmail>
 
</cfcatch>
</cftry>