<script type="text/javascript">
//submit form slot
    $('#form_newSlot').submit(function() { 
				$(this).ajaxSubmit({ success : addSlotToProgram, clearForm: false }); 
						return false; 
    });
	var instanceName = 'extraDetails';
			var instance = CKEDITOR.instances[instanceName];
				if( instance ) { 
					instance.destroy(true);
				}
				//set editor in slot manager
			$( '#extraDetails' ).ckeditor({toolbar: 'Basic', width : 265, height: 150, toolbarStartupExpanded : false, removePlugins : 'elementspath'});

$(document).ready(function() { 
			$("#ProgramExtraDetailsField, #programSaveChangesMessage").css({display: 'none' });	
			$("fieldset.Collapsible").collapse({ closed: true });	
});
</script>

<div id="programSaveChangesMessage" class="ui-corner-all marginBottom15 ui-widget ui-widget-content">
          <button id="button_saveProgram">Save changes</button>
          <div class="clear"></div>
</div>

<!--- SLOT PANEL START HERE --->
<div class="ui-corner-all marginBottom15 ui-widget ui-widget-content podForm podBgFade_bl">

			<!---<b>event</b>--->
            <i class="NoFormat">
            	<cf_events_dropDown eventID="0" fieldName="eventid" elapse="0" operator="IN" eventType="event,eb,bu_pr,din"> <button id="load_program">load program</button>
            </i>
            <div class="clear" style=" height:15px"></div>
            	<div class="c3" style="width:165px">
            <fieldset class="Collapsible">
            	<legend>Search options</legend>
                <div>
                    <label>
                    <input type="checkbox" name="searchStatus[]" class="searchStatus" value="1" /> 
                      contacted</label>
                      <label>
                    <input type="checkbox" name="searchStatus[]" class="searchStatus" value="2" /> 
                      in progress</label>
                    <label>
                    <input type="checkbox" name="searchStatus[]" class="searchStatus" value="3" /> 
                      confirmed</label>
                     <label>
                    <input type="checkbox" name="searchStatus[]" class="searchStatus" value="10" /> <!--4-->
                      declined</label>
                      <hr />
                      <label>
                    <input type="checkbox" name="searchStatus[]" class="searchStatus" value="6" /><!-- 10,11-->
                      finalized</label>
                </div>
            </fieldset>
            </div>
            <div class="c3" style="width:165px">
            <fieldset class="Collapsible">
            	<legend>Format options</legend>
     			<div>
                        <label>
                    <input type="radio" name="print" class="print" value="screan" checked="checked" /> 
                      screen</label>
                    <label>
                    <input type="radio" name="print" class="print" value="basic" /> 
                      pdf basic</label>
                      <label>
                    <input type="radio"  name="print" class="print" value="full" /> 
                      pdf print</label>
                    <label>
                    <input type="radio" name="print" class="print" value="excel" /> 
                      excel</label>
               </div>
            </fieldset>
            </div>
<div class="clear"></div>
</div>

      <!--- <div id="programToolBar">--->

    <!--- SLOT PANEL START HERE ---->
<div id="programPaneSlot" class="ui-corner-all marginBottom15 ui-widget ui-widget-content podForm">
		<!---<div id="indexPanel2" class="indexDivPanel">--->
        <form id="form_newSlot" action="../program/qry_addSlot.cfm" method="post">
        <input type="hidden" name="eventID" id="eventID" />
                <div class="c4" style="width:260px">
                    <b id="topicLabel">session Title</b>
                    <i class="NoFormat"> 
                        <input type="text" name="speakerTopic" id="speakerTopic" class="ui-corner-all" />
                    </i>
                    <b>slot type</b>
                    <i class="NoFormat">
                        <select name="speakerType" id="speakerType" class="ui-corner-all">
                        <option value="2" selected="selected">Session</option>
                        <option value="3">Information</option>
                        <option value="5">Moderator</option>
                        <option value="6">End of day</option>
                        <option value="1">Briefing topics</option>
                        <option value="4">File</option>
                        </select>
                    </i>
                    <b>slot duration</b>
                    <i class="NoFormat">
                        <select name="speakerUnit" id="speakerUnit" class="ui-corner-all">
                        <option value="0" selected="selected">0 minutes</option>
                        <option value="1">5 minutes</option>
                        <option value="2">10 minutes</option>
                        <option value="3">15 minutes</option>
                        <option value="4">20 minutes</option>
                        <option value="6">30 minutes</option>
                        <option value="9">45 minutes</option>
                        <option value="12">1 hour</option>
                        <option value="14">1 hour 10 minutes</option>
                        <option value="15">1 hour 15 minutes</option>
                        <option value="16">1 hour 20 minutes</option>
                        <option value="17">1 hour 25 minutes</option>
                        <option value="18">1 hour 30 minutes</option>
                        <option value="21">1 hour 45 minutes</option>
                        <option value="24">2 hour </option>
                        <option value="26">2 hour 10 minutes</option>
                        <option value="27">2 hour 15 minutes</option>
                        <option value="28">2 hour 20 minutes</option>
                        <option value="30">2 hour 30 minutes</option>
                        </select>
                    </i>
                    <cf_user_search fieldIDname="programUserID" hiddenFieldName="userID" userID="0" active="1" userName="" random="2323344">
                    <b></b>
                    <i class="NoFormat"><button id="buttonLabel">Add Session</button></i>
                     <div class="clear"></div>
                    <div id="ProgramExtraDetailsField">
                    <textarea id="extraDetails" name="extraDetails"></textarea>
                 	</div> 
                </div>
        </form>
 <div class="clear"></div>
</div>

<div id="speakerExtraInfo_" class="ui-corner-all marginBottom15 ui-widget ui-widget-content podForm"></div>