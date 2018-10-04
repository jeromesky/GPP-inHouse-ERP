<cfinclude template="../application.cfm">
<cfset thisyear = (year(now()) + 1) >
<cfset lastyear =  (year(now()) - 1) >
<cfif parameterexists(url.year)>
	<cfset year = url.year>
    
<cfelse>
	<cfset year = #year(now())# >
</cfif>


<CFQUERY datasource="#gpp#" name="events"  >
   	SELECT 
    	webid AS  id, year(event_expire) AS event_year, event_abbr, event_cost_eu, econf_cost, 
        IngConference_ID, 
        event_type,
        CASE
        	WHEN event_name = ''
            THEN strConference_Name
            ELSE event_name
         END AS event_name
   	FROM 
    	tblAnnual_Conf
	WHERE 
    	event_type IN ('event' , 'eb', 'bu_pr')  AND
        year(event_expire) = #year#  AND
        event_expire < #dateAdd('d', 28, now())# AND
        live = 1
	ORDER BY event_expire desc
</cfquery>
<CFPARAM name=URL.show default=1 >
<html><head><title>Petro21.com / admin / events </title>
<link href="../styles/styles.css" rel="stylesheet" type="text/css">
<link href="../styles/indexV2.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../javascript/jquery.js" ></script>
<script type="text/javascript" src="../javascript/jquery.form.js"  ></script>
<script type="text/javascript" src="../javascript/Jeditable.js"  ></script>
<script type="text/javascript" src="../javascript/interface.js" ></script>

</head>
<body >
<cfinclude template="../nav/testNav2009V2.cfm">
<div id="outer">
	<div id="iner">

		<div class="row" >	 
			<div style="margin:0px;">
  				<div class="dailyNews_I_icon"></div> 
				<div class="dailyNews_I_title" style="height:35px; background-color:#F2F2F2" ><strong>Display e-conference's for</strong></div>
  				<div class="dailyNews_I_source" style="height:35px; width:300px "><a href="index.cfm?year=2001">2001</a> | <a href="index.cfm?year=2002">2002</a> | <a href="index.cfm?year=2003">2003</a> | <a href="index.cfm?year=2004">2004</a> | <a href="index.cfm?year=2005">2005</a> | <a href="index.cfm?year=2006">2006</a> | <a href="index.cfm?year=2007">2007</a> | <a href="index.cfm?year=2008">2008</a> | <a href="index.cfm?year=2009">2009</a> | <a href="index.cfm?year=2010">2010</a> </div> 
	
			    				 
			</div>
		</div>
		<div class="row" >	 
			<div style="margin:0px;">
  				<div class="dailyNews_I_icon">&nbsp;</div> 
				<div class="dailyNews_I_title" style="height:19px; background-color:#F2F2F2" ><strong>Discussion name </strong></div>
  				<div class="dailyNews_I_source" style="height:19px; background-color:#F2F2F2"><strong>Discussion code</strong></div> 
	
  				<div class="dailyNews_I_expire" style="height:19px; background-color:#F2F2F2"><strong>Web Displayed </strong></div>
                <div class="dailyNews_I_expire" style="height:19px; background-color:#F2F2F2"><strong>Currency</strong></div>   	
                <div class="dailyNews_I_expire" style="height:19px; background-color:#F2F2F2; width:130px"><strong>Price </strong></div>			 
			</div>
		</div>
		<cfoutput query="events">
		<div class="row" >	 
			<div style="margin:0px;">
  				<div class="dailyNews_I_icon" style="height:35px;"><a href="../econference/edit.cfm?eventid=#id#"><img src="../img/new_edit.gif" width="16" height="16" border="0" /></a></div> <!---<a href="dsp_edit.cfm?id=#id#">--->
				<div class="dailyNews_I_title"  style="height:35px;"><a href="../econference/edit.cfm?eventid=#id#">#event_name# #event_year# </a></div>
  				<div class="dailyNews_I_source" style="height:35px;">#event_abbr##event_year#</div> 
	
  				<div class="dailyNews_I_expire" style="height:35px;">#event_type#<!---<cfif webdisp EQ 1>Yes<cfelse>No</cfif>---></div> 
                
                <div class="dailyNews_I_expire" style="height:35px;display: inline" id="currency#id#"   > #event_cost_eu#</div> 
                <div class="dailyNews_I_expire" style="height:35px; width:130px"  id="#id#"  >#numberFormat(econf_cost, "9999")#</div>  
			</div>
		</div>
		</cfoutput>
	
	
	
	</div>
</div>



<script type="text/javascript">
$(function() {
<cfoutput query="events">        
  $("##currency#events.id#").editable("../econference/updateEconference.cfm", { 
    id   : 'id',
    name : 'event_cost_eu',
	indicator : '<img src="../img/indicator.gif">',
    data   : "{'$':'USD - $','£':'UK - &pound;','EUR':'EU - &euro;','ZAR':'SA - ZAR'}",
    type   : "select",
    submit : "OK",
    style  : "inherit",
    submitdata : function() {
      return {id : #id#};
    }
  });
  
    $('###events.id#').editable('../econference/updateEconference.cfm', { 
        	id   : 'id',
			name : 'econf_cost',
			submit    : 'OK',
			width		: 60,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});
			
</cfoutput>	
			  });
			
</script>
  
</body>
</html>