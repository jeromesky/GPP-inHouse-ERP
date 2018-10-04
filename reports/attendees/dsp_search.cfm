
<div class="c4">
		
		<div class="accordion marginBottom15">
        <cfinclude template="../qry_menu.cfm">
		</div>
        
        <form action="../reports/">
        <div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><span class="ui-dialog-title">Reports output</span></div>
		<div class="ui-corner-bottom marginBottom15  ui-widget ui-widget-content  podForm ">
        		<label> <input type="radio" name="fa" id="html" class="external" value="attendee-result-html" checked="checked" />print to screen </label><br />
                <label> <input type="radio" name="fa" id="pdf" class="external" value="attendee-result-pdf"  />PDF </label><br />
      			<label> <input type="radio" name="fa" id="excel" class="external" value="attendee-result-xls" />Excel </label><br />
                <hr />
                <button class="ui-corner-all">Report</button>
        
        </div>
        
        
        <div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><span class="ui-dialog-title">Search parameters</span></div>
        <div class="accordion">
                <h2>Event</h2>
                <div class="podForm" >
                		<cf_events_dropDown eventID="#trim(url.eventID)#" fieldName="eventID" elapse="2" operator="" eventType="" multiple="1" size="10" order="1" width="300" >
                
                </div>
                
                <h2>Attendee Type</h2>
                <div>
                	<div class="c2" style="width:132px">
                            <b>Speakers</b>    
                            <i class="NoFormat"><input type="checkbox" name="AttendType" id="AttendType" value="2" <cfif listContains(url.AttendType, 2)>checked="checked"</cfif> /></i>
                            <b>Guest</b>
                            <i class="NoFormat"><input type="checkbox" name="AttendType" id="AttendType" value="3" <cfif listContains(url.AttendType, 3)>checked="checked"</cfif> /></i>
                            <b>Delegates</b>
                            <i class="NoFormat"><input type="checkbox" name="AttendType" id="AttendType" value="1" <cfif listContains(url.AttendType, 1)>checked="checked"</cfif> /></i>
                            <b>Moderator</b>
                            <i class="NoFormat"><input type="checkbox" name="AttendType" id="AttendType" value="4" <cfif listContains(url.AttendType, 4)>checked="checked"</cfif> /></i>
                    </div>
                    <div class="c2" style="width:132px">
                            <b>Exhibitor</b>
                            <i class="NoFormat"><input type="checkbox" name="AttendType" id="AttendType" value="5" <cfif listContains(url.AttendType, 5)>checked="checked"</cfif> /></i>
                            <b>Sponsors</b>
                            <i class="NoFormat"><input type="checkbox" name="AttendType" id="AttendType" value="7" <cfif listContains(url.AttendType, 7)>checked="checked"</cfif> /></i> 
                            <b>Press</b>
                            <i class="NoFormat"><input type="checkbox" name="AttendType" id="AttendType" value="6" <cfif listContains(url.AttendType, 6)>checked="checked"</cfif> /></i> 
                	</div>
                </div>
                
               
                
                <h2>Display fields</h2>
                <div>
                		<div class="c2" style="width:132px">
                                <b>Title</b>
                                <i class="NoFormat"><input type="checkbox" name="Title" value="1" <cfif url.Title EQ 1>checked="checked"</cfif> /></i>
                                <b>email</b>
                                <i class="NoFormat"><input type="checkbox" name="email"  value="1"  <cfif url.email EQ 1>checked="checked"</cfif> /></i>
                                <b>Email&nbsp;secretary </b>
                                <i class="NoFormat"><input type="checkbox" name="email_sec" value="1"  <cfif url.email_sec EQ 1>checked="checked"</cfif>/></i>
                                
                                <b>Phone</b>
                                <i class="NoFormat"><input type="checkbox" name="phone" value="1" <cfif url.phone EQ 1>checked="checked"</cfif>/></i>
            <!---                    <b>Fax</b>
                                <i class="NoFormat"><input type="checkbox" name="fax" value="1" /></i>--->
                                <b>Mobile</b>
                                <i class="NoFormat"><input type="checkbox" name="mobile" value="1" <cfif url.mobile EQ 1>checked="checked"</cfif>/></i>
                                <b>Address details</b>
                                <i class="NoFormat"><input type="checkbox" name="address" value="1" <cfif url.address EQ 1>checked="checked"</cfif>/></i>
                               <b>City</b>
                                <i class="NoFormat"><input type="checkbox" name="city" value="1" <cfif url.city EQ 1>checked="checked"</cfif>/></i>
                                <b>Country</b>
                                <i class="NoFormat"><input type="checkbox" name="country" value="1" <cfif url.country EQ 1>checked="checked"</cfif>/></i>
                                <b>Zip</b>
                                <i class="NoFormat"><input type="checkbox" name="zip" value="1" <cfif url.zip EQ 1>checked="checked"</cfif>/></i>        
                    	</div>
                        
                        <div class="c2" style="width:132px">
                        		<b>Comment</b>
                                <i class="NoFormat"><input type="checkbox" name="comment" value="1" <cfif url.comment EQ 1>checked="checked"</cfif>/></i>
                                
                                <b>Pub Comment</b>
                                <i class="NoFormat"><input type="checkbox" name="Comment_Public" value="1" <cfif url.Comment_Public EQ 1>checked="checked"</cfif>/></i>
                                <b>Invoice No</b>
                                <i class="NoFormat"><input type="checkbox" name="invoiceNo" value="1" <cfif url.invoiceNo EQ 1>checked="checked"</cfif>/></i>
                                <b>Attend type</b>
                                <i class="NoFormat"><input type="checkbox" name="dsp_type" value="1"<cfif url.dsp_type EQ 1>checked="checked"</cfif> /></i>
                        
                        </div>
                </div>
                
                <h2>Attend status</h2>
                <div class="podForm">
                	<b>payment</b>
                    <i class="NoFormat">
                    	<select name="paid" style="width:40px;">
                        	<option value="*" selected="selected">Both</option>
                            <option value="yes">Paid</option>
                            <option value="no">Unpaid</option>
                        </select></i>  
                    <b>Attended</b>
                    <i class="NoFormat">
                    	<select name="attend" style="width:40px; max-width:40px;">
                            <option value="*">Both</option>
                            <option value="!= 1">Attended</option>
                            <option value="= 1">Cancelled</option>
                        </select></i>
                </div>
		</div>
        

        
        </form>
</div>

