<cfinclude template="../Application.cfm">







<cftry>



	<cfsilent>



    



    <cfquery name="newsletters" datasource="#gpp#" >



        SELECT TOP 1



        	newsletterID, 



            numrecordsDisplay



        FROM 



        	newsletters 



        WHERE 



        	newsletterID = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.newsletterID#">



    </cfquery>





	<!---<cfif newsletters.numrecordsDisplay mod 2 is 0 >--->

	<cfif 20 mod 2 is 0 >



    	<!--- The number is even.--->



        <cfset countPerColumn = 20  \ 2 ><!---<cfset countPerColumn = newsletters.numrecordsDisplay  \ 2 >--->



    <cfelse>



    	<!--- The number is odd.--->



        <!---<cfset countPerColumn = (Round((newsletters.numrecordsDisplay \ 2 )) +1) >--->

        <cfset countPerColumn = (Round((20 \ 2 )) +1) >



    </cfif>







	<!--- set properties --->



    <cfset newsletterID = #url.newsletterID# >



    <cfset newsNumber = 20>



    <cfset cont="0">



    <cfparam name="numrecloop" default="0">



    



    </cfsilent>







	<!--- Get News from the DB cachedwithin="#CreateTimeSpan(0, 2, 0, 0)#" --->



	<cfquery name="get_news" datasource="#gpp#" >



		SELECT



        	newsID,



        	newsUrl AS url, 



            newsExpire AS expire, 



            newsSource AS source, 



            newsHeadline AS headline, 



            newsHarvest AS harvest



		FROM	



        	news



		WHERE     



		<cfif newsletterID eq 1 OR newsletterID eq 33>



			(newsExpire >= GETDATE() - 1) 



    	<cfelse>



    		(newsExpire >= GETDATE() - 6) 



		</cfif>	



		AND 



        	newsletterID = <cfqueryparam cfsqltype="cf_sql_integer" value="#newsletterID#" >



		ORDER BY 



        	addedDate, newsHarvest DESC



	</cfquery>







	<!--- if no news are selected, collect on the FLY --->



	<cfif get_news.recordcount LT newsNumber>



		<!--- get data titles --->



		<cfquery name="get" datasource="#dsnP21#" >



			SELECT * 



            FROM



            	MoreOverTitles



            WHERE 



            	toplevel = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.newsletterID#" >



		</cfquery>



		<cfset getSearchList = valuelist(get.newsName, ",") >



	</cfif>







<table border="0" cellpadding="0" cellspacing="0">



	<tr>



		<td width="319" valign="top" style="border-right:1px solid #eee">



			<table width="318" border="0" cellspacing="0" cellpadding="4" style="font-size:12px; color:#939393; font-family:Arial, Helvetica, sans-serif;">



			<cfloop query="get_news" startrow="1" endrow="#countPerColumn#"><cfoutput><tr>



     <td bgcolor="##336193" valign="top" align="center" style="color:##FFF" height="20" width="18"><b>#get_news.currentRow#</b></td>



     <td></td>



		</tr>



    <tr>



      <td>&nbsp;</td>



    <td valign="top" style="border:1px solid ##a7a7a7; border-bottom:1px solid ##f6f6f6; border-right:1px solid ##f6f6f6"><a href="http://www.petro21.com/refer/?z=NLA&id=#get_news.newsID#" style="color:##404040; font-size:13px; text-decoration:none; width:100%; padding:3px 0 3px 0;"><cfif LEN(get_news.headline) LT 67>#get_news.headline#<cfelse>#left(get_news.headline, 64)# ...</cfif></a><br>



     <span style="font-size:10px"><span style="color:##336193">#get_news.source#</span>: #DATEFORMAT(get_news.harvest, "dd mm yyyy")#</span></td>



		</tr></cfoutput><cfset cont=cont + 1></cfloop>



     <!--- if no news are selected, collect on the FLY --->



		<cfif get_news.recordcount LT newsNumber>



			<cfloop list="#getSearchList#" delimiters="," index="i">



				<cfset getOnly = 0 >



					<cfif cont LTE newsNumber>



                		<cfset QueryString = #Replace(urlencodedformat(i),"%20","+","ALL")#>



                <!--- Get WDDX XML datafeed <cfhttp method="GET" url="http://p.moreover.com/cgi-local/page?query=&k=#QueryString#&o=cf"></cfhttp>--->



				<cfhttp method="GET" url="http://p.moreover.com/page?o=cf&query=#QueryString#"></cfhttp>



                <!--- Deserialize it here --->



                <CFWDDX action="WDDX2CFML" input="#CFHTTP.FileContent#" output="NewsResult">                



                 <!--- Show news! --->



                 <cfloop query="NewsResult" startrow=1 endrow="#numrecloop#">



                 <cfif Find('Ad - ', #NewsResult.source#) NEQ 1>



                 <cfif DateCompare( now(), newsResult.harvest_time, "d") EQ 0>



                 <cfif getOnly LTE 2><cfoutput>



			<tr>



		<td bgcolor="##336193" valign="top" align="center" style="color:##FFF" height="20" width="18"></td>



        <td></td>



			</tr>



            <tr>



        <td>&nbsp;</td>



        <td valign="top" style="border:1px solid ##a7a7a7; border-bottom:1px solid ##f6f6f6; border-right:1px solid ##f6f6f6"><a href="#NewsResult.url#" style="color:##404040; font-size:13px; text-decoration:none; width:100%; padding:3px 0 3px 0;"><cfif LEN(NewsResult.headline_text) LT 67>#NewsResult.headline_text#<cfelse> #left(NewsResult.headline_text, 64)# ...</cfif></a><br>



        <span style="font-size:10px"><span style="color:##336193">#NewsResult.source#</span>: #DATEFORMAT(NewsResult.harvest_time, "dd mm yyyy")#</span></td>



            </tr></cfoutput><cfset cont=cont + 1><cfset getOnly = getOnly + 1></cfif>



            </cfif></cfif></cfloop></cfif></cfloop></cfif></table>



</td>



<td width="319" valign="top">



	<table width="318" border="0" cellspacing="0" cellpadding="4" style="font-size:12px; color:#939393; font-family:Arial, Helvetica, sans-serif">



		<cfloop query="get_news" startrow="#(countPerColumn+1)#" endrow="#newsNumber#"><cfoutput><tr>



			<td height="20" bgcolor="##336193" valign="top" align="center" style="color:##FFF" width="18"><b>#get_news.currentRow#</b></td>



			<td></td>



		</tr>



		<tr>



			<td></td>



            <td valign="top" style="border:1px solid ##a7a7a7; border-bottom:1px solid ##f6f6f6; border-right:1px solid ##f6f6f6"><a href="http://www.petro21.com/refer/?z=NLA&id=#get_news.newsID#" style="color:##404040; font-size:13px; text-decoration:none; width:100%; padding:3px 0 3px 0;"><cfif LEN(get_news.headline) LT 67>#get_news.headline#<cfelse> #left(get_news.headline, 64)# ...</cfif></a><br>



           <span style="font-size:10px"><span style="color:##336193">#get_news.source#</span>: #DATEFORMAT(get_news.harvest, "dd mm yyyy")#</span></td>



        </tr></cfoutput>



		<cfset cont=cont + 1></cfloop></table>



</td>



</tr>



</table>







<!--- see if total collected new is enough --->



<cfset numrecloop = newsNumber - cont >



<!--- if total less then news number --->



<cfif numrecloop gt 0>







<!--- get data titles --->



<cfquery name="get" datasource="#dsnP21#">



	SELECT * 



	FROM



        MoreOverTitles



	WHERE 



    	toplevel = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.newsletterID#">



</cfquery>







<cfset getSearchList = valuelist(get.newsName, ",") >







<cfloop list="#getSearchList#" delimiters="," index="i" >



	<cfset getOnly = 0>



    <cfif cont LTE newsNumber>



	<cfset QueryString = #Replace(urlencodedformat(i),"%20","+","ALL")#>







	<!--- Get WDDX XML datafeed <cfhttp method="GET" url="http://p.moreover.com/cgi-local/page?query=&k=#QueryString#&o=cf"></cfhttp>--->



	<cfhttp method="GET" url="http://p.moreover.com/page?o=cf&query=#QueryString#"></cfhttp>



    <!--- Deserialize it here --->



    <CFWDDX action="WDDX2CFML" input="#CFHTTP.FileContent#" output="NewsResult">







	<!--- Show news! --->



	<cfloop query="NewsResult" startrow=1 endrow="#numrecloop#">



      <cfif DateCompare( now(), newsResult.harvest_time, "d") EQ 0>



      <cfif getOnly LTE 2>



		<cfoutput><a href="#NewsResult.url#" style="color:##3d3d3d; font-size:13px; text-decoration:none; width:100%; padding:3px 0 3px 0;">#NewsResult.headline_text#</a><br />



        <span style="color:##4585c2; font-size:11px">#NewsResult.source#</span> <span style="color:##9a9a9a; font-size:10px">: #DATEFORMAT(NewsResult.harvest_time, "dd mm yyyy")#</span><br /><br /></cfoutput>



       <cfset cont=cont + 1>



       <cfset getOnly = getOnly + 1>



       </cfif>



	</cfif>



		</cfloop>



     </cfif>



</cfloop>



</cfif>







<cfset numrecloop = newsNumber - cont>







<!--- & run again if not enough --->



<cfif numrecloop gt 0>



  <cfparam name="finding" default="petroleum exploration"> 



  <cfset finding =#Replace(urlencodedformat(finding),"%20","+","ALL")#>



  <!--- Get WDDX XML datafeed <cfhttp method="GET" url="http://p.moreover.com/cgi-local/page?c=Oil%20and%20gas%20news&o=cf"></cfhttp>--->



		<cfhttp method="GET" url="http://p.moreover.com/page?o=cf&query=Oil%20and%20gas%20news"></cfhttp>



  <!--- Deserialize it here --->



  <CFWDDX action="WDDX2CFML" input="#CFHTTP.FileContent#" output="qGetNews2">



  <!--- Show news! --->



  	<cfloop query="qGetNews2" startrow=1 endrow="#numrecloop#"><cfoutput><a href="#url#" style="color:##3d3d3d; font-size:13px; text-decoration:none; width:100%; padding:3px 0 3px 0;">#headline_text#</a><br/>



       <span style="color:##4585c2; font-size:11px">#source#</span> <span style="color:##9a9a9a; font-size:10px">: #harvest_time#</span><br/><br/></cfoutput></cfloop>



</cfif>







<cfcatch type="any">



	<cfmail to="#contactAdmin#" from="web@petro21.com" subject="error on collect newsletter items">



    	<cfdump var="#cfcatch#">



    	<!---<cfdump var="#get_news#">--->



    </cfmail>



    <cfabort>



</cfcatch>



</cftry>







<!--- Loop throught collected news 



<cfloop query="get_news" startrow=1 endrow="#newsNumber#">



	<cfoutput><a href="http://www.petro21.com/refer/?z=NLA&id=#get_news.newsID#" style="color:##3d3d3d; font-size:13px; text-decoration:none; width:100%; padding:3px 0 3px 0;">#get_news.headline#</a><br />



			<span style="color:##4585c2; font-size:11px"> #get_news.source#</span> <span style="color:##9a9a9a; font-size:10px">: #DATEFORMAT(get_news.harvest, "dd mm yyyy")#</span><br /><br />



			<cfset cont=cont + 1>



	</cfoutput>



</cfloop> --->