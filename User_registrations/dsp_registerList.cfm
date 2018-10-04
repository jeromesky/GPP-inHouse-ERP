<cfinclude template="../user_registrations/qry_registerList.cfm">
<script type="text/javascript">
 $(document).ready(function() {
		$('input#searchRecords').quicksearch('#area_newUserList .tableContainer .tableRow');
 });
 </script>
<div style="">Search new user on list<input id="searchRecords" /> (<cfoutput>#get.recordCount#</cfoutput>) new Users to check</div>
<div class="tableContainer">
  <cfoutput query="get">   
	<div class="tableRow" id="newReg_#get.userID#">
    		<div class="tableColData">#get.userName# #get.userSurname#</div>
    		<div class="tableColData">#get.companyName# (#get.holdingCompanyName#)</div>
            <div class="tableColData"></div>
            <div class="tableColButton">(#get.userID#)</div>
            <div class="tableColAction">
            	<a href="javascript:loadNewUser(#get.userID#);">
                	<div class="ui-state-default ui-corner-all" style="padding: 0pt 0.1em;">
                    <em class="ui-icon ui-icon-arrowthickstop-1-s"></em>
                    </div>
                </a>
            </div>
            <div class="tableColAction"><cfif get.duplicate eq 1><div class="ui-state-error ui-corner-all" style="padding: 0pt 0.1em;"><em class="ui-icon ui-icon-alert"></em></div></cfif></div>
            
            <div class="tableColAction">
            	<a href="javascript:DeleteUser(#get.userID#);">
                	<div class="ui-state-default ui-corner-all" style="padding: 0pt 0.1em;">
                    <em class="ui-icon ui-icon-circle-close"></em>
                    </div>
               </a>
           </div>
            
    </div>
</cfoutput>
</div>