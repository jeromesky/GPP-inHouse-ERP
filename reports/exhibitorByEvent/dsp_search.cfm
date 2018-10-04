
<div class="c4">
		
		<div class="accordion marginBottom15">
        <cfinclude template="../qry_menu.cfm">
		</div>
        
        <form action="../reports/">
        <div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><span class="ui-dialog-title">Reports output</span></div>
		<div class="ui-corner-bottom marginBottom15  ui-widget ui-widget-content  podForm ">
        		<label> <input type="radio" name="fa" id="html" class="external" value="exhibitorByEvent-result-html" checked="checked" />print to screen </label><br />
                <label> <input type="radio" name="fa" id="pdf" class="external" value="exhibitorByEvent-result-pdf"  />PDF </label><br />
      			<label> <input type="radio" name="fa" id="excel" class="external" value="exhibitorByEvent-result-xls" />Excel </label><br />
                <hr />
                <button class="ui-corner-all">Report</button>
        
        </div>
        
        
        <div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><span class="ui-dialog-title">Search parameters</span></div>
        <div class="accordion">
                <h2>Event</h2>
                <div class="podForm" >
                		<cf_events_dropDown eventID="#trim(url.eventID)#" fieldName="eventID" elapse="2" operator="=" eventType="week" order="1" width="300" >
                </div>
		</div>
        

        
        </form>
</div>

