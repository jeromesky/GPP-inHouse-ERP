<cfinclude template="../files/qry_files.cfm">

<fieldset>
	<legend>Files</legend>
	<!---<input type="hidden" name="contractTypeGroup" id="contractTypeGroup" value="#form.contractTypeGroup#" />    --->



<div class="tableContainer">
	<div class="tableRow">
    		<div class="tableColData">file Date</div>
    		<div class="tableColData">file Place</div>
            <div class="tableColData">file Purpose</div>
            <div class="tableColData">file Quality</div>
            <div class="tableColData">Comment</div>
            <div class="tableColData">loaded By</div>
            <div class="tableColAction">view file</div>
            <div class="tableColAction">delete file/record</div>
            <div class="tableColAction">delete record</div>
    </div>
  <cfoutput query="get_files">
	<div class="tableRow" id="fileRow_#get_files.fileID#">
    		<div class="tableColData">#dateFormat(get_files.fileDate, "dd.mm.yyyy")#</div>
    		<div class="tableColData">#get_files.typeLabel#</div>
            <div class="tableColData">#get_files.filePurposeLabel#</div>
            <div class="tableColData">#get_files.fileQuality#</div>
            <div class="tableColData">#get_files.fileComment#</div>
            <div class="tableColData">#get_files.staffName#</div>
            <div class="tableColAction">
            	<a href="../files/act_viewFile.cfm?fileID=#get_files.fileID#" target="_blank">
                	<div class="ui-state-default ui-corner-all" style="padding: 0pt 0.1em;">
                    <em class="ui-icon ui-icon-arrowthickstop-1-s"></em>
                    </div>
                </a>
            </div>
            <div class="tableColAction">
            	<a href="javascript:deleteFile(#get_files.fileID#);">
                	<div class="ui-state-default ui-corner-all" style="padding: 0pt 0.1em;">
                    <em class="ui-icon ui-icon-circle-close"></em>
                    </div>
               </a>
           </div>
           <div class="tableColAction">
            	<a href="javascript:deleteFileRecord(#get_files.fileID#);">
                	<div class="ui-state-default ui-corner-all" style="padding: 0pt 0.1em;">
                    <em class="ui-icon ui-icon-circle-close"></em>
                    </div>
               </a>
           </div>
    </div>
</cfoutput>
</div>
</fieldset>