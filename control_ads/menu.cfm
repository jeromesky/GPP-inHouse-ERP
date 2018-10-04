<html><head>
<title>Menu</title>
</head>

<style type="text/css">
a.menu { text-decoration: none }
a:hover.menu { text-decoration: underline }
</style>

<body bgcolor="#B9C2C9" background="ii/background.gif" link="white" alink="white" vlink="white">
<center>
<table border="0" cellpadding="0" cellspacing="0"><tr><td><font face="Tahoma,Arial" size="2" color="#6D9CBF">
&nbsp;&nbsp;<a href="main.cfm" target="main" class="menu">Main Settings</a><br />
<CFIF USER_USERLEVEL eq "1">
 &nbsp;&nbsp;<a href="bannersizes.cfm" target="main" class="menu">Banner Sizes</a><br />
 &nbsp;&nbsp;<a href="category.cfm" target="main" class="menu">Categories</a><br />
 &nbsp;&nbsp;<a href="generator.cfm" target="main" class="menu">Tag Generator</a><br />
 <p>
 <font face="Verdana, Arial" size="2" color="#4CA3E7"><b>Client Menu</b></font><br />
<!---  &nbsp;&nbsp;<a href="addclient.cfm" target="main" class="menu">Add Client</a><br />--->
 &nbsp;&nbsp;<a href="updateclient.cfm" target="main" class="menu">Banner Stats</a><br />
 <!--- &nbsp;&nbsp;<a href="main.cfm" target="main" class="menu">Delete Client</a><br /> --->
 <p>
 <font face="Verdana, Arial" size="2" color="#4CA3E7"><b>Banner Menu</b></font><br />
 &nbsp;&nbsp;<a href="loadbanner.cfm" target="main" class="menu">Add Banner</a><br />
 &nbsp;&nbsp;<a href="updatebanner.cfm" target="main" class="menu">Update Banner</a><br />
<!---  &nbsp;&nbsp;<a href="deletebanner.cfm" target="main" class="menu">Delete Banner</a><br />--->
</CFIF>

<!--- <p>
<font face="Verdana, Arial" size="2" color="#4CA3E7"><b>Reporting Menu</b></font><br />
&nbsp;&nbsp;<font face="Verdana, Arial" size="2" color="FCFCFC"><b>Impressions</b></font><br />
&nbsp;&nbsp;<a href="reports/impanalysis.cfm" target="main" class="menu">Analysis</a><br />
&nbsp;&nbsp;<a href="reports/imppageviewed.cfm" target="main" class="menu">Page Views</a><br />
<p>
&nbsp;&nbsp;<font face="Verdana, Arial" size="2" color="FCFCFC"><b>Click Throughs</b></font><br />
&nbsp;&nbsp;<a href="reports/clkanalysis.cfm" target="main" class="menu">Analysis</a><br />
&nbsp;&nbsp;<a href="reports/clkpageviewed.cfm" target="main" class="menu">Page Views</a><br /><br /><br />
&nbsp;&nbsp;<a href="logout.cfm" target="main" class="menu"><b>Logout</b></a><br /><br /> --->
</font></td></tr></table>
</center>

</body></html>