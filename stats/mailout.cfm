<cfif parameterexists(form.id)>
	<cfset id = form.id >
<cfelseif parameterexists(url.id)>
	<cfset id = url.id >
<cfelse>
	<cfquery datasource="stats" name="getdefault">
	Select  id, datesent
	FROM job 
	</cfquery>
	<cfset id = getdefault.datesent >
</cfif>
<cfquery datasource="stats" name="getlist">
Select  * 
FROM job
</cfquery>
<cfquery datasource="stats" name="total">
Select  * 
FROM job
Where datesent = '#id#' 
</cfquery>
<cfquery datasource="stats" name="ip">
SELECT COUNT(DISTINCT addr) AS ips  FROM host
WHERE referer = '#total.datesent#' 
</cfquery>
<!--- Distinct event, Count(event) AS addr --->

<cfquery datasource="stats" name="downloads">
SELECT count(event) AS downloads FROM downloads
WHERE event = '#total.datesent#'
</cfquery>
	<div id="head"><strong>Delete mailout Records </strong><a href="getdelete.cfm" onClick="return hs.htmlExpand(this, { contentId: 'highslide-html', objectType: 'iframe',		objectWidth: 600, objectHeight: 800} )" class="highslide"><img src="../../img/warning2.gif" width="27" height="30" border="0" />
	  </a>warning! selecting the checkbox will remove all records (only remove if old )<div class="highslide-html-content" id="highslide-html" style="width: 600px"><div class="highslide-move" style="border: 0; height: 18px; padding: 2px; cursor: default"><a href="##" onClick="return hs.close(this)" class="control">Close</a></div><div class="highslide-body"></div></div>
	
   			
	</div>
	<div id="head"><strong>Show mailout statistics for: </strong>
	  
	  <form name="form1" id="form1">
  <select name="id" onchange="MM_jumpMenu('parent.frames[\'content\']',this,0)" style="width:302px">
    <option value="">Select mailout to view</option>
	<cfloop query="getlist"><cfoutput>
	<option value="index.cfm?id=#getlist.datesent#&incl=mail">#getlist.name# "<cfset IndexOfOccurrence=REFind(":", #getlist.datesent#) ><cfoutput>#right(getlist.datesent, (len(getlist.datesent) - IndexOfOccurrence))#</cfoutput>"</option>
	</cfoutput></cfloop>
  </select>
</form>
   			
	</div>
<div class="row">
		<div class="box1">
 <cfif parameterexists(id) AND id NEQ " ">		
		<cfoutput>	
				<div class="columntitle">Job Name:</div>
				<div class="columntext"><strong> #total.name#</strong></div>
			<div class="break"></div>
				<div class="columntitle">Job Date:</div>
				<div class="columntext"> <strong><cfset IndexOfOccurrence=REFind(":", #total.datesent#) ><!---#right(total.datesent, (len(total.datesent) - IndexOfOccurrence))#--->#(len(total.datesent)-IndexOfOccurrence)#</strong></div>
			<div class="breakmargin"></div>
			<div style="height:1px; margin:9px 0 20px 0; background-color:##cbcbcb"></div>
				<div class="columntag">Total Emails Sent:</div>
				<div class="columndescription"><strong>#total.sent#</strong></div>
			<div class="break"></div>
				<div class="columntag">Total Emails Opened:</div>
				<div class="columndescription"> <strong>#total.counter#</strong></div>
			<div class="break"></div>	
				<div class="columntag">Total Unique ip address:</div>
				<div class="columndescription"> <strong>#ip.ips#</strong></div>
			<div class="break"></div>
				<div class="columntag">Total Brochure Downloads:</div>
				<div class="columndescription"> <strong>#downloads.downloads#</strong></div>
		</cfoutput>
</cfif>        
		</div>
		
		<div class="box2">
  <cfif parameterexists(id) AND id NEQ " ">
			<cfchart>
		    <cfchartseries type="bar" paintstyle="shade" seriescolor="##388BCF"  >
      			<cfchartdata item="Total Emails Sent" value="#total.sent#">
      			<cfchartdata item="Total Emails Opened" value="#total.counter#">
     			<cfchartdata item="Total Unique ip address" value="#ip.ips#">
	  			<cfchartdata item="Total Brochure Downloads" value="#downloads.downloads#">
   			</cfchartseries>
    </cfchart>
		</cfif>
  </div>
	</div>