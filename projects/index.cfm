
<script type="text/javascript">

function addProject(){
		var projectName = $("#projectName").val();
		postData({ url:'../projects/qry_addProject.cfm', callfunction:'projectAddReturn',  Args: {"projectName": projectName}  });
}

function projectAddReturn(){
	
}
</script>

<div class="c4">
	<div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title"> Add project</spam></div>
	<div  class="ui-corner-bottom marginBottom15  ui-widget ui-widget-content  podForm ">
    
    	<b>Project Name</b>
        <i class="NoFormat">
            <input type="text"  id="projectName"  class="ui-corner-all" />
        </i>
        <b></b>
        <i class="NoFormat">
        <button onclick="javascript:addProject();">Add</button>
        </i>
        <div class="clear"></div>
    </div>
 </div>