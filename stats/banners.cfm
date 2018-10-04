<cfquery datasource="#dsnP21#" name="get">
SELECT vchDescription, iClicks, iImpressions
FROM fuseAds_Banners
ORDER by iBannerID
</cfquery>
	<div class="row">
		<div class="box1"><cfoutput>
		<div style="height:1px; margin:9px 0 20px 0; background-color:##cbcbcb"></div>
<cfloop query="get">
				<div class="columntag">#get.vchDescription#:</div>
				<div class="columndescription"><strong>#get.iClicks# </strong>/ #get.iImpressions#</div>
			<div class="break"></div>
</cfloop></cfoutput>
		</div>
		
		<div class="box2">
		<!---	<cfchart seriesplacement="stacked">
   <cfchartseries type="bar" paintstyle="shade" seriescolor="##388BCF"  >
<cfloop query="get">   
      <cfchartdata item="#get.vchDescription#" value="#get.iClicks#">
</cfloop>
   </cfchartseries>
</cfchart>--->

<cfchart xoffset="1"  chartwidth="500" rotated="yes" >
	<cfchartseries  type="bar"  serieslabel="Banner Clicks"  seriescolor="##388BCF" paintstyle="shade">
		<cfloop query="get">   
      		<cfchartdata item="#get.vchDescription#" value="#get.iClicks#">
		</cfloop>
	</cfchartseries>
	<cfchartseries  type="bar"  serieslabel="Banner Impressions"  seriescolor="##6BD850" paintstyle="shade">
		<cfloop query="get">   
      		<cfchartdata item="#get.vchDescription#" value="#get.iImpressions#">
		</cfloop>
	</cfchartseries>
</cfchart>
		</div>
	</div>