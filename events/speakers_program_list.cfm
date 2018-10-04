<cfinclude template="../Application.cfm">
<cfquery datasource="#dsnP21#" name="get">SELECT speakers_program.id, speakers_program.decription, speakers_program.comment, speakers_program.speakersession, speakers_program.speakertime, speakers_program.pos, speakers.name, speakers.delegation, speakers_program.speaker
                                                                            FROM speakers_program 
                                                                            LEFT outer JOIN speakers
																			ON speakers_program.clientid = speakers.id
																			WHERE speakers_program.eventid = #form.id#
                                                                            
                                                                           ORDER BY speakersession , speakertime
                                                                            </cfquery>

<table width="100%" border="0" cellspacing="0" cellpadding="4" >
  <tr>
    <td style="border-bottom:3px solid #CC3300 " ><strong>Confirmed speakers</strong>: <cfoutput>#get.recordcount#</cfoutput><input type="hidden" name="id" value="<cfoutput>#id#</cfoutput>" /><input type="hidden" name="groupby" value="<cfoutput>#groupby#</cfoutput>" /></td>
    <td width="20" style="border-bottom:3px solid #CC3300 " >&nbsp;</td>
    <td width="20" style="border-bottom:3px solid #CC3300 " >&nbsp;</td>
  </tr>
</table>
<div class="timebox" >Time</div>
<div class="headerbox">Description</div>
<div class="editbox">edit</div>
<div class="speakerB">presentation</div>
<div class="posbox">position</div>
<div class="delbox">del</div>
<cfset counters = 1 >
<ul id="categories" class="sortableList">
<cfoutput query="get">
<li id="item_#counters#" style="border-bottom:1px solid ##BBE7F3">
			<div class="clear" ></div>
        	<div class="timebox" ><cfif get.speakertime NEQ ""><span id="date#get.id#" >#timeformat(get.speakertime, "HH:mm")#</span><cfelse>&nbsp;</cfif></div>
        	<div class="headerbox" <cfif get.speaker EQ 1>style="font-weight:normal; color:##0099CC;" </cfif>><cfif get.decription NEQ ""><strong><span id="decription#get.id#" >#get.decription#</span></strong><cfelse>&nbsp;</cfif></div>
            <div class="editbox"><a href="speakers_program_edit.cfm?eventid=#eventid#&id=<cfif #get.id# NEQ "" >#get.id#<cfelse>0</cfif>&groupby=#groupby#&event_year=#url.event_year#"<!--- id="speaker#get.id#" onClick="return hs.htmlExpand(this, { contentId: 'speakersEd', objectType: 'iframe',	} )" class="highslide"--->><img src="../img/contract_report.gif"  border="0" /></a></div>
            <div class="speakerB"><span id="speak#get.id#" ><cfif get.speaker eq 0> yes<cfelse>no</cfif></span></div>
            <div class="posbox"><cfif get.speakertime NEQ ""><span id="pos#get.id#" >#get.pos#</span><cfelse>&nbsp;</cfif></div>
            <div class="delbox"><a href="speakers_delete.cfm?del=rego&id=#eventid#&recordid=#get.id#&groupby=#groupby#&event_year=#url.event_year#" ><img src="../img/new_delete.gif" border="0" /></a></div>
            <div class="clear"></div>
	
        	<div class="timebox">&nbsp;</div>
            <div class="headerbox">
                <cfif get.name NEQ "" ><div >#trim(get.name)#, #trim(get.delegation)#</div></cfif>
    			<cfif get.comment NEQ "" OR len(get.comment) GT 4 ><div style="font-size:11px;"><span id="extra#get.id#" >#get.comment#</span></div></cfif>
            </div>
            
             <div class="clear"></div>
<cfset counters = counters + 1 >
</li>
</cfoutput>
</ul>
<form action="" method="POST" onSubmit="populateHiddenVars();" name="sortableListForm" id="sortableListForm">
	categoriesListOrder: 			<input type="text" name="categoriesListOrder" id="categoriesListOrder" size="5" disabled="disabled"><input type="hidden" name="sortableListsSubmitted" value="true">			<input type="button" value="Lists" class="button" onClick="populateHiddenVars();">			<input type="submit" value="Submit" class="button"></form>
    
    <script type="text/javascript">
	Event.observe(window, 'load', init, false);
	function init() {
		// Over ride some of the default options.
		//EditInPlace.makeEditable( { id:'extra#get.id#', type: 'textarea', cols: '100' } );
		EditInPlace.defaults['type'] = 'text';
		EditInPlace.defaults['save_url'] = 'update.cfm';
		<cfoutput query="get">
		// Edit date.
		<cfif get.comment NEQ "">EditInPlace.makeEditable( { id:'extra#get.id#', select_text: true, max_size: '80' } );</cfif>
		<cfif get.speakertime NEQ "">EditInPlace.makeEditable( { id:'date#get.id#', select_text: true, max_size: '6' } );</cfif>
		EditInPlace.makeEditable( { id:'speak#get.id#', select_text: true, max_size: '1' } );
		<cfif get.speakertime NEQ "">EditInPlace.makeEditable( { id:'pos#get.id#', select_text: true, max_size: '2' } );</cfif>
		<cfif get.decription NEQ "">EditInPlace.makeEditable( { id:'decription#get.id#', select_text: true, max_size: '80' } );</cfif>
		</cfoutput>
	}
	</script>
		 <script type="text/javascript">
			// <![CDATA[
							Sortable.create('categories',{tag:'li'});
	
							// ]]>
		 </script>