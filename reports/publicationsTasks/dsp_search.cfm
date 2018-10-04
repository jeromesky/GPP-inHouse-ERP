<cfoutput>
<div id="reportSearchColumn">
	<div id="reportMenuLink"></div>
<div id="reportSearchContent">	
		<div class="accordion ">
        <cfinclude template="../qry_menu.cfm">
		</div>
        
        <form action="../reports/">
        <div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><span class="ui-dialog-title">Reports output</span></div>
		<div class="ui-corner-bottom   ui-widget ui-widget-content  podForm ">
        		<label> <input type="radio" name="fa" id="html" class="external" value="publicationsTasks-result-html" checked="checked" />print to screen </label><br />
                <label> <input type="radio" name="fa" id="pdf" class="external" value="publicationsTasks-result-pdf"  />PDF </label><br />
      			<label> <input type="radio" name="fa" id="excel" class="external" value="publicationsTasks-result-xls" />Excel </label><br />
                <hr />
                <button class="ui-corner-all">Report</button>
        
        </div>
        
        
        <div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><span class="ui-dialog-title">Search parameters</span></div>
        <div class="accordion">
                <h2>Event</h2>
                <div class="podForm" >
                		<cf_events_dropDown eventID="#trim(url.eventID)#" fieldName="eventID" elapse="2" operator="=" eventType="week" order="1" width="300" >
                </div>
                
                <h2>Display Publication fields</h2>
                <div class="podForm" >

                        
                
                </div>
		</div>
        

         </form>
</div></div></cfoutput>