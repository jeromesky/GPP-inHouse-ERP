<cfparam name="form.searchStatus" default="">
<cfparam name="form.printStatus" default="presentations">
<cfparam name="form.speakerID" default="0">
<script type="text/javascript">
$(".upload").each(function(){
	
		var speakerID 		= $(this).attr("id");
		var eventType 	= $('#event_type').val();
		var abbr 				= $('#event_abbr').val();
		var speakerType =$(this).attr("title");  
		//speakerID : $(this).attr("id") , eventType: $('#event_type').val(), abbr: $('#event_abbr').val()
		//uploader(speakerID, eventType, abbr, speakerType);
	new AjaxUpload(this, {
			action: '../presentations/qry_uploadFile.cfm',
			name: 'fieldName',
			data: {  "speakerID" : speakerID , "eventType": eventType, "abbr": abbr, "speakerType":speakerType}, 
			autoSubmit: true,
			responseType: false,
			onChange: function(file, extension){},
			onSubmit: function(file, extension) { fileProgress(speakerID); },
			onComplete: function(file, response) { fileLoaded(speakerID, file); $('#check').html(response);}
		});	
	
});
</script>

<cfinclude template="../Program/qry_program.cfm">
<cfoutput>
<div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader">
    	load your files here<br />
</div>
<cfloop query="qry_program">
<cfparam name="form.speakerID" default="#qry_program.speakerID#">
<cfswitch expression="#qry_program.speakerType#">
	
    <cfcase value="1">
    	<div class="slot slot_1" id="s_#qry_program.speakerID#">
        	<div class="remove"><a href="javascript:removeSpeaker(#qry_program.speakerID#);"><img src="../_images/Delete_banners.png" border="0" /></a></div>
        	<div class="time">
            	#timeFormat(qry_program.speakerTime, "hh:mm")#
            </div>
            <div class="presentation">
            	<div class="topic" id="#qry_program.speakerID#">#qry_program.speakerTopic#</div>
				<div class="speaker">#qry_program.speakerName# #qry_program.userPosition#</div>
                <div class="company">#qry_program.companyName#</div>
            </div>
            
            <div class="loader">
            	<div class="upload" id="#qry_program.speakerID#" title="#qry_program.speakerType#">Load File <!---(#qry_program.speakerID#)---></div>
                <div id="loader_#qry_program.speakerID#"></div>
                <div id="loaderComplete_#qry_program.speakerID#">                   
                    <cfinclude template="dsp_files.cfm">
                </div>
            
            
            </div>
            
        <div class="clear"></div>
		</div>
    </cfcase>
    
    <cfcase value="2">
    	<div class="slot slot_2">
        	#qry_program.speakerTopic#<br>
		</div>
    </cfcase>
    
        <cfcase value="4">
    	<div class="slot slot_4">
        	<div class="time">
            	&nbsp;
            </div>
            <div class="presentation">
            	<div class="topic" id="#qry_program.speakerID#">#qry_program.speakerTopic#</div>
				<div class="speaker">#qry_program.speakerName# #qry_program.userPosition#</div>
                <div class="company">#qry_program.companyName#</div>
            </div>
            
            <div class="loader">
            	<div class="upload" id="#qry_program.speakerID#" title="#qry_program.speakerType#">Load File</div>
                <div id="loader_#qry_program.speakerID#"></div>
                <div id="loaderComplete_#qry_program.speakerID#">
                    <cfinclude template="dsp_files.cfm">
                </div>
            
            
            </div>
            
        <div class="clear"></div>
		</div>
    </cfcase>
    
</cfswitch>

</cfloop>
</cfoutput>