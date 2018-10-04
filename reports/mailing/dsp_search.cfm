<cfoutput>
<div id="reportSearchColumn">
	<div id="reportMenuLink"></div>
<div id="reportSearchContent">	
		<div class="accordion ">
        <cfinclude template="../qry_menu.cfm">
		</div>
        
        <form action="../reports/">
        <div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><span class="ui-dialog-title">Reports output</span></div>
		<div class="ui-corner-bottom ui-widget ui-widget-content  podForm ">
        		<label> <input type="radio" name="fa" id="html" class="external" value="mailing-result-html" checked="checked" />print to screen </label><br />
                <label> <input type="radio" name="fa" id="pdf" class="external" value="mailing-result-pdf"  />PDF </label><br />
      			<label> <input type="radio" name="fa" id="excel" class="external" value="mailing-result-xls" />Excel </label><br />
                <hr />
                <button class="ui-corner-all">Report</button>
        
        </div>
        
        
        <div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><span class="ui-dialog-title">Search parameters</span></div>
        <div class="accordion">
        		<h2>Mailling Report Regions</h2>
                <div class="podForm" >
                		<cfinclude template="../../areas/dsp_report_branchAreas.cfm">
                
                </div>
                <h2>Post status</h2>
                <div class="podForm" >
                		<select name="posting">
                        	<option value="1"  <cfif url.posting eq 1>selected="selected"</cfif>>Primary Post</option>
                            <option value="2" <cfif url.posting eq 2>selected="selected"</cfif>>Secondary Post</option>
                        </select>
                </div>
                <h2>User country</h2>
                <div class="podForm" >
                		<cf_country_suggest  country="#url.countryName#" countryfieldname="countryName"  countryID="#url.countryID#"  fieldname="countryID" random="2312">
                		
                </div>
                
		</div>
        

        
        </form>
</div></div></cfoutput>