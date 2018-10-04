
<div class="c4">
		
		<div class="accordion marginBottom15">
        <cfinclude template="../qry_menu.cfm">
		</div>
        
        <form action="../reports/">
        <div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><span class="ui-dialog-title">Reports output</span></div>
		<div class="ui-corner-bottom marginBottom15  ui-widget ui-widget-content  podForm ">
        		<label> <input type="radio" name="fa" id="html" class="external" value="publicationsNoRegion-result-html" checked="checked" />print to screen </label><br />
                <label> <input type="radio" name="fa" id="pdf" class="external" value="publicationsNoRegion-result-pdf"  />PDF </label><br />
      			<label> <input type="radio" name="fa" id="excel" class="external" value="publicationsNoRegion-result-xls" />Excel </label><br />
                <hr />
                <button class="ui-corner-all">Report</button>
        
        </div>
        
        
        <div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><span class="ui-dialog-title">Search parameters</span></div>
        <div class="accordion">                
                <h2>Display Publication fields</h2>
                <div class="podForm" >
                		<b>Web address</b>
                        <i class="NoFormat"><input type="checkbox" name="publicationURL" value="1" <cfif url.publicationURL EQ 1>checked="checked"</cfif> /></i>
                		<b>User name</b>
                        <i class="NoFormat"><input type="checkbox" name="branchUserName" value="1" <cfif url.branchUserName EQ 1>checked="checked"</cfif> /></i>
                        <b>Password</b>
                        <i class="NoFormat"><input type="checkbox" name="branchPassword" value="1" <cfif url.branchPassword EQ 1>checked="checked"</cfif> /></i>
                </div>
		</div>
        

        
        </form>
</div>

