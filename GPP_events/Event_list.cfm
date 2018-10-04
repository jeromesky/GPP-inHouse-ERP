<cfinclude template="../application.cfm">

     <cfquery datasource="#gpp#" name="get"> 	
     select  IngConference_ID, event_name AS eventName	
     FROM tblAnnual_Conf 
     WHERE merge Is NULL OR merge = 0  
     ORDER BY IngConference_ID  DESC
     </cfquery>
     	<ul id="sortable1" class="connectedSortable">
        	<cfoutput query="get">
    		<li class="ui-state-default" id="#get.IngConference_ID#">#get.eventName#  (#get.event_type#)</li>
    		</cfoutput>
        </ul>