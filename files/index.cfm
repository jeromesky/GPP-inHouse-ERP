<cfparam name="form.fileTable" default="">
<cfparam name="form.fileTableID" default="0">
<cfparam name="form.param3" default="0">
<cfoutput>
<script type="text/javascript">
	var files = {};
	files.fileTable 	= '#form.fileTable#';
	files.fileTableID	= #form.fileTableID#;
	files.fileID		= 0;
	var fileTable 		= '#form.fileTable#';
	var fileTableID 	= #form.fileTableID#;
	var fileID			= 0;

$(document).ready(function(){
			loadFileForm(files.fileTable , files.fileTableID ,  files.fileID )
			loadFileList(files.fileTable , files.fileTableID )
});

function loadFileForm(fileTable, fileTableID, fileID){
		$('##area_file').fadeIn("fast").load("../files/dsp_fileUpload.cfm", {'fileTable' : files.fileTable, 'fileTableID' : files.fileTableID, 'fileID' : files.fileID } );
}

function loadFileList(fileTable, fileTableID){
		$('##area_fileList').fadeIn("fast").load("../files/dsp_files.cfm", {'fileTable' : files.fileTable, 'fileTableID' : files.fileTableID } );
}

<!---function deleteFile(fileID){  
		alertUI({ title:"Warning", callfunction:'actionDeleteFile', type: "confirmation", param: {"fileID": files.fileID } , message: "To delete file select OK" })
}
function actionDeleteFile(data){	
		postData({ url:'../files/qry_delete.cfm', callfunction:'returnDeleteFile',  Args: {"fileID": data.fileID}  });	
}
function returnDeleteFile(data){
	removeRow('fileRow_', data );
}--->
</script>
</cfoutput>
<style type="text/css">
#fileLoading {position: absolute;top: 50px;	right: 355px;}
</style>
<div class="clear"></div>
<div id="area_file"></div>
<div class="clear"></div>
<div id="area_fileList"></div>