<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Help</title>
</head>

<body bgcolor="ffffff" marginwidth=0 marginheight=0 topmargin=0 leftmargin=0>

<table width="100%" cellpadding="0" cellspacing="0" border="0">
 <tr>
  <td bgcolor="#29496B"><img src="../i/fuseads.gif" border="0"></td>
  <td bgcolor="#29496B">
   <font face="Tahoma,Arial" color="White" size="3"><b>
   <cfif Action eq "ClkAnalysis">CLICK THROUGHS ANALYSIS
   <cfelseif Action eq "ClkViews">CLICK THROUGHS PAGE VIEWS
   <cfelseif Action eq "ImpViews">IMPRESSION PAGE VIEWS
   <cfelse>IMPRESSION ANALYSIS</cfif>
  </td>
 </tr>
</table>
<center>
<table border="0" width="98%">
<tr><td><font face="Tahoma,Arial" color="Black" size="2">
<cfif Action eq "ClkAnalysis">

This report gives you the number of click throughs each banner had matching the selected criteria(s).

<table border="0" width="100%">
 <tr><td nowrap valign="top"><font face="Tahoma,Arial" color="Black" size="2"><b>Banner</b>:</td><td><font face="Tahoma,Arial" color="Black" size="2">The description of the banner displayed on the row.</td></tr>
 <tr><td nowrap valign="top"><font face="Tahoma,Arial" color="Black" size="2"><b>Client Name</b>:</td><td><font face="Tahoma,Arial" color="Black" size="2">The name of the client for the banner.</td></tr>
 <tr><td nowrap valign="top"><font face="Tahoma,Arial" color="Black" size="2"><b>Total for Period</b>:</td><td><font face="Tahoma,Arial" color="Black" size="2">Total Click Throughs for the selected criteria(s).</td></tr>
 <tr><td nowrap valign="top"><font face="Tahoma,Arial" color="Black" size="2"><b>Avg for Period</b>:</td><td><font face="Tahoma,Arial" color="Black" size="2">Average Click Throughs for the selected period.</td></tr>
 <tr><td nowrap valign="top"><font face="Tahoma,Arial" color="Black" size="2"><b>% of total Clks</b>:</td><td><font face="Tahoma,Arial" color="Black" size="2">Percentage of Click Throughs for the selected period.</td></tr>
 <tr><td nowrap valign="top"><font face="Tahoma,Arial" color="Black" size="2"><b>Remaining Clicks</b>:</td><td><font face="Tahoma,Arial" color="Black" size="2">The amount of Click Throughs left for the banner, if n/a unlimited Click Throughs are available.</td></tr>
 <tr><td nowrap valign="top"><font face="Tahoma,Arial" color="Black" size="2"><b>Ratio</b>:</td><td><font face="Tahoma,Arial" color="Black" size="2">Ration between Click Through and Impressions</td></tr>   
</table>
<cfelseif Action eq "ClkViews">
This report gives you the number of click throughs each page had matching the selected criteria(s).
<table border="0" width="100%">
 <tr><td nowrap valign="top"><font face="Tahoma,Arial" color="Black" size="2"><b>Page</b>:</td><td><font face="Tahoma,Arial" color="Black" size="2">The page that fuseAds is running on.</td></tr>
 <tr><td nowrap valign="top"><font face="Tahoma,Arial" color="Black" size="2"><b>Total for Period</b>:</td><td><font face="Tahoma,Arial" color="Black" size="2">Total Click Throughs for the selected criteria(s).</td></tr>
 <tr><td nowrap valign="top"><font face="Tahoma,Arial" color="Black" size="2"><b>Avg per Day</b>:</td><td><font face="Tahoma,Arial" color="Black" size="2">Average Click Throughs per day.</td></tr>
 <tr><td nowrap valign="top"><font face="Tahoma,Arial" color="Black" size="2"><b>% of total</b>:</td><td><font face="Tahoma,Arial" color="Black" size="2">Percentage of Click Throughs for the selected period.</td></tr>
 <tr><td nowrap valign="top"><font face="Tahoma,Arial" color="Black" size="2"><b>Impressions</b>:</td><td><font face="Tahoma,Arial" color="Black" size="2">The total amount of Impressions the page had.</td></tr>
 <tr><td nowrap valign="top"><font face="Tahoma,Arial" color="Black" size="2"><b>Ratio</b>:</td><td><font face="Tahoma,Arial" color="Black" size="2">Ration between Click Through and Impressions</td></tr>   
</table>
<cfelseif Action eq "ImpViews">
This repot give you the number of Impressions each page had matching the selected criteria(s).
<table border="0" width="100%">
 <tr><td nowrap valign="top"><font face="Tahoma,Arial" color="Black" size="2"><b>Page</b>:</td><td><font face="Tahoma,Arial" color="Black" size="2">The page that fuseAds is running on.</td></tr>
 <tr><td nowrap valign="top"><font face="Tahoma,Arial" color="Black" size="2"><b>Total for Period</b>:</td><td><font face="Tahoma,Arial" color="Black" size="2">Total Click Throughs for the selected criteria(s).</td></tr>
 <tr><td nowrap valign="top"><font face="Tahoma,Arial" color="Black" size="2"><b>Avg per Day</b>:</td><td><font face="Tahoma,Arial" color="Black" size="2">Average Click Throughs per day.</td></tr>
 <tr><td nowrap valign="top"><font face="Tahoma,Arial" color="Black" size="2"><b>% of total</b>:</td><td><font face="Tahoma,Arial" color="Black" size="2">Percentage of Click Throughs for the selected period.</td></tr>
 <tr><td nowrap valign="top"><font face="Tahoma,Arial" color="Black" size="2"><b>Clicks</b>:</td><td><font face="Tahoma,Arial" color="Black" size="2">The total amount of Click Throughs the page had.</td></tr>
 <tr><td nowrap valign="top"><font face="Tahoma,Arial" color="Black" size="2"><b>Ratio</b>:</td><td><font face="Tahoma,Arial" color="Black" size="2">Ration between Click Through and Impressions</td></tr>   
</table>
<cfelse>
This report gives you the number of Impressions  each banner had matching the selected criteria(s).
<table border="0" width="100%">
 <tr><td nowrap valign="top"><font face="Tahoma,Arial" color="Black" size="2"><b>Banner</b>:</td><td><font face="Tahoma,Arial" color="Black" size="2">The description of the banner displayed on the row.</td></tr>
 <tr><td nowrap valign="top"><font face="Tahoma,Arial" color="Black" size="2"><b>Client Name</b>:</td><td><font face="Tahoma,Arial" color="Black" size="2">The name of the client for the banner.</td></tr>
 <tr><td nowrap valign="top"><font face="Tahoma,Arial" color="Black" size="2"><b>Total for Period</b>:</td><td><font face="Tahoma,Arial" color="Black" size="2">Total Click Throughs for the selected criteria(s).</td></tr>
 <tr><td nowrap valign="top"><font face="Tahoma,Arial" color="Black" size="2"><b>Avg for Period</b>:</td><td><font face="Tahoma,Arial" color="Black" size="2">Average Click Throughs for the selected period.</td></tr>
 <tr><td nowrap valign="top"><font face="Tahoma,Arial" color="Black" size="2"><b>% of total Impression</b>:</td><td><font face="Tahoma,Arial" color="Black" size="2">Percentage of Impressions for the selected period.</td></tr>
 <tr><td nowrap valign="top"><font face="Tahoma,Arial" color="Black" size="2"><b>Remaining Impression</b>:</td><td><font face="Tahoma,Arial" color="Black" size="2">The amount of Impression left for the banner, if n/a unlimited Impressions are available.</td></tr>
 <tr><td nowrap valign="top"><font face="Tahoma,Arial" color="Black" size="2"><b>Ratio</b>:</td><td><font face="Tahoma,Arial" color="Black" size="2">Ration between Click Through and Impressions</td></tr>   
</table>
</cfif>

</td></tr>
<tr><td>

<table border="0" width="100%">
 <tr><td><font face="Tahoma,Arial" color="Black" size="2"><b>Number of days in selection</b>:</td><td><font face="Tahoma,Arial" color="Black" size="2">The day span between the start and end date.</td></tr>
 <tr><td><font face="Tahoma,Arial" color="Black" size="2"><b>Total Impressions</b>:</td><td><font face="Tahoma,Arial" color="Black" size="2">Total Impressions for your selection.</td></tr>
 <tr><td><font face="Tahoma,Arial" color="Black" size="2"><b>Start date</b>:</td><td><font face="Tahoma,Arial" color="Black" size="2">The Start Date of the report</td></tr>
 <tr><td><font face="Tahoma,Arial" color="Black" size="2"><b>End date</b>:</td><td><font face="Tahoma,Arial" color="Black" size="2">The End Date of the report</td></tr>
</table>

</td></tr>
<tr><td><font face="Tahoma,Arial" color="Black" size="2">If you select a Category, Banner Size, Client, or Server are criteria(s) you can base your reports on.  They give you the flexibility to run distinct reports on-line.</td></tr>
<tr><td>

<table border="0" width="100%">
 <tr><td valign="top"><font face="Tahoma,Arial" color="Black" size="2"><b>Refresh</b>:</td><td><font face="Tahoma,Arial" color="Black" size="2">Since these reports are completly live, you can refresh the page to see new stats.</td></tr>
 <tr><td valign="top"><font face="Tahoma,Arial" color="Black" size="2"><b>Print</b>:</td><td><font face="Tahoma,Arial" color="Black" size="2">This option will give you the same report but in a printable format.</td></tr>
 <tr><td valign="top"><font face="Tahoma,Arial" color="Black" size="2"><b>Export </b>:</td><td><font face="Tahoma,Arial" color="Black" size="2">This option lets you export the data your are viewing into a comma delimited file.</td></tr>
 <tr><td valign="top"><font face="Tahoma,Arial" color="Black" size="2"><b>Help </b>:</td><td><font face="Tahoma,Arial" color="Black" size="2">This page</td></tr>
</table>

</td></tr>

</table>

</center>
</body>
</html>