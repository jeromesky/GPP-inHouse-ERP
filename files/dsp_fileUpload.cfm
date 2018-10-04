<cfparam default="0" name="form.fileTableID">
<cfparam default="" name="form.fileTable">
<cfparam default="0" name="form.fileID">
<cfparam default="0" name="form.eventID">
<cfoutput>
<script type="text/javascript">
$(document).ready(function(){
	fileUploadDisable();
	
	var fileUpload = {};
		fileUpload.fileTable 	= '#form.fileTable#';
		fileUpload.fileTableID 	= #form.fileTableID#;
<!---		fileUpload.fileType 	= '';
		fileUpload.FilePurposeIDX 	= '';
		fileUpload.FilePurposeLabel = '';
		fileUpload.fileComment			= '';
		fileUpload.fileQuality				= 1;--->
		
		var postString = { 'fileTable' : fileUpload.fileTable, 'fileTableID' : fileUpload.fileTableID };
	
	<!---$('##fileName').uploadifive({
				'auto'             			: true,
				'uploadLimit'  				: 1,
				'formData'         			: { "fileTable" : "#form.fileTable#", "fileTableID" : #form.fileTableID#, "fileComment":$("##fileComment").val(),"FilePurposeID" : $("##FilePurposeIDX:selected").val(),  "fileType" : $("##fileType").val() ,  "FilePurposeLabel" :  $("##FilePurposeLabel").val(), "fileQuality" :  $("input[name=fileQuality]:checked").val() },
				'uploadScript'     			: '../files/qry_fileUpload_Save.cfm',
				'onUploadComplete' 	: function(file, data) {  loadFileList(files.fileTable , files.fileTableID ); },
				'onUploadFile' 				: function(file) { fileUploadDisable(); },
				'onError'      				: function(errorType) { fileUploadError(errorType); $("##uploadifive-fileName").css("display", "block"); },
				'onInit'       				: function(){
		//$("##fileName").uploadifive('settings','formData' ,{ 'fileType' : fileUpload.fileType, 'FilePurposeID' : fileUpload.FilePurposeIDX, 'fileQuality' : fileUpload.fileQuality, 'fileComment' : fileUpload.fileComment, 'FilePurposeLabel' : fileUpload.FilePurposeLabel });
				}
	})
			--->
	
    $('##uploadFileForm').submit( function() { 
			var get_FilePurposeID = $('##FilePurposeIDX :selected').val();
	
			if (  get_FilePurposeID == 176 && fileTable != 'tblIndividual' ){
					//alert("cant select this option from here, you need to open this window from users section ");
					alertUI({ title:"Update", callfunction:'', type: "message", param: {} , message: "You cant select this option from here, you need to open this window from users section" })
					
			} else if ( (get_FilePurposeID == 170  || get_FilePurposeID == 174 || get_FilePurposeID == 172 || get_FilePurposeID == 173) && fileTable != 'tblAnnual_Conf'  ) { 
					//alert("cant select this option from here, u need to open this window from events section ");
					alertUI({ title:"Update", callfunction:'', type: "message", param: {} , message: "You cant select this option from here, you need to open this window from events section" })
			} else if ( $("##fileName").val() == ''  ) { 
					alertUI({ title:"Update", callfunction:'', type: "message", param: {} , message: "You need to select a file to upload" })
			}else{
				//$('##uploadFileForm :input').attr('disabled', true);
				$('##fileLoading').show();
				$('##uploadFileForm ##fileUpload_button').attr('disabled', true);
				$("##uploadFileForm").css({ opacity: 0.1 });
				
		$(this).ajaxSubmit({ success: function(data){ 
						loadFileList(files.fileTable , files.fileTableID );
						loadFileForm(files.fileTable , files.fileTableID, files.fileID );
						$('##' +files.fileTable + '_fileID').val(data); 
						$('##loading').hide(); 
							} 
					});
			}
		return false; 
		
    }); 
	
	////STEP 1
	$("select##fileType").change(function(){
			$("##uploadifive-fileName").css("display", "none");
			//fileUpload.fileType = $(this).val();
			$("##FilePurposeIDX").removeAttr('disabled');
	});
	
	/////STEP 2
	$("##FilePurposeIDX").change(function(){
		$("##FilePurposeLabel").val( $('##FilePurposeIDX :selected').text());
		//fileUpload.FilePurposeIDX 	= $(this).val();
		//fileUpload.FilePurposeLabel = $('##FilePurposeIDX :selected').text();
		$("##fileComment").removeAttr('disabled');
		if ( $(this).val() ==  175 || $(this).val() == 178 ){
			$("##fileQuality_1").attr('checked', 'checked');
		}else{
			$("##fileQuality_2").attr('checked', 'checked');
		}
	});
	
	///STEP 3
	$("##fileComment").focusout(function(){
		//fileUpload.fileComment = $(this).val();
		$(".uploadifive-button").css("display", "block");
		$("##fileQuality_1, ##fileQuality_2, ##fileName").removeAttr('disabled');
	});
	
	////STEP 4
	$("input:radio[name=fileQuality]").click(function(){
			//fileUpload.fileQuality = $(this).val();
	});
	
});////end document

function fileUploadDisable(){
	
	$("##FilePurposeIDX, ##fileComment, ##fileQuality_1, ##fileQuality_2, ##fileName").attr('disabled', 'disabled');
	$(".uploadifive-button, ##uploadifive-fileName").css("display", "none");
}

function fileUploadError(errorType){
	alert(errorType);
}
</script>
<div id='fileLoading' style='display:none'><img src="../img/loaderBar_blue.gif" alt="loading...."></div>
<form action="../files/qry_fileUpload_Save.cfm" id="uploadFileForm" method="post">
<div class="c4">
        <b>File Place</b>
        <i class="NoFormat">
        <cf_Types name="fileType" cat="file" catid="0" id="0">
        </i>

        <b>File Purpose</b>
        <i class="NoFormat">
        <select name="FilePurposeID" id="FilePurposeIDX" class="ui-corner-all" ></select>
        <!---<cf_Types name="FilePurposeID" cat="file Purpose" id="0">--->
        <input type="hidden" name="FilePurposeLabel" id="FilePurposeLabel" />
        </i>
        
        <b></b>
        <i class="NoFormat">
        </i>
</div>

<div class="c4">
		<b style="width:62px">Description</b>
        <i class="NoFormat">
        <input type="text" name="fileComment" id="fileComment" class="ui-corner-all" >
        </i>
        
        <b style="width:62px">File</b>
        <i class="NoFormat">
        	<input type="radio" name="fileQuality" id="fileQuality_1" value="1" class="fileQuality" />To be treated
          <input type="radio" name="fileQuality" id="fileQuality_2" value="2"  class="fileQuality" checked="checked" />Final
        </i>
</div>
<div class="c2">
    <input type="file" name="fileName" id="fileName" />
   <button id="fileUpload_button" class="ui-corner-all">Upload</button>
    <input type="hidden" name="fileTable" id="fileTable" value="#form.fileTable#">
    <input type="hidden" name="fileTableID" id="fileTableID" value="#form.fileTableID#">
</div>

</form></cfoutput>