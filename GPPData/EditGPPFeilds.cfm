<CFINCLUDE template="../Application.cfm">
<!---<cfinclude template="../tools/checkVPN.cfm" >--->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="../styles/styles.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="../javascript/jquery.js" ></script>
<script type="text/javascript" src="../javascript/jquery.form.js"  ></script>
<script type="text/javascript" src="../Javascript/jeditable.js" ></script>
<script type="text/javascript" src="../javascript/interface.js" ></script>
<script language="javascript">
//////////################## Load Form

$(document).ready(function(){
	$('#tableSelect :selected').val();
		$("#tableSelect").change(function(){
			var tableSelect = $('#tableSelect').val() ;
			$('#AreaFormSelect').fadeIn("slow").load("EditGPPFeilds_loadForm.cfm" , { tableSelect: tableSelect });
		});	
});

//////////################## load search Result fpor Field
$(document).ready(function() { 

	    var options = {		success: showSearchResponse,		clearForm: false    };  
	
    $('#postFieldSearch').submit(function() { 
		$(this).ajaxSubmit(options); 
		$("#searchValue").val("");
		$("#progressSearch").html("<img src=../img/ajax-loadBar.gif>"); 
		return false; 
    }); 
}); 
	function showSearchResponse(data){
	$("#areaFieldResult").html(data).fadeIn("slow");
	$("#progressSearch").html(""); 
	}
	
///////################# Do the change to the DB
$(document).ready(function() { 

	 var options = { 		success: showChangeResponse,	clearForm: true    };  
    $('#postFieldChange').submit(function() { 
		$(this).ajaxSubmit(options); 
		$("#progressSearch").html("<img src=../img/ajax-loadBar.gif>");  
		return false; 
    }); 	
});  
function showChangeResponse(data){
	$("#areaFieldResult").html(data).fadeIn("slow"); 
	//, function(data){document.getElementById('text_box').innerHTML = data;   });
	$("#progressSearch").html(""); 
	}


</script>
<style type="text/css" >
fieldset { padding:20px}
legend {font-weight:bold }

</style>

</head>

<body>
<cfinclude template="../nav/testNav2009V2.cfm">
<cfoutput>
<div id="header">GPP datamase management:  -- <span class="header_title"></span></div>
<div id="outer">
	<div id="iner">

<cfif Security.AdministratorManagement CONTAINS Session.username >

    
<!---  <cfparam name="Attributes.DataSource" default=""> 
<cfparam name="Attributes.ColumnList" default="*">
<cfparam name="Attributes.table" default="tblIndividual">
<cfparam name="Attributes.Constraints" default="">
<cfparam name="Attributes.GroupBy" Default="">
<cfparam name="Attributes.OrderBy" Default="#Attributes.ColumnList#">

<cfquery name="getList" datasource="#gpp#" >
    SELECT TOP 1  #Attributes.ColumnList#
    FROM #Attributes.Table#
  <cfif Attributes.Constraints neq "">WHERE #PreserveSingleQuotes(Attributes.Constraints)#</cfif>
    <cfif Attributes.GroupBy neq "">GROUP BY #Attributes.GroupBy#</cfif>
    <cfif Attributes.OrderBy neq "">ORDER BY #Attributes.OrderBy#</cfif>
</cfquery>--->

        	  <table border="0" cellpadding="15" cellspacing="4" width="100%">
        <tr>
          <td width="640" bgcolor="##C90900">
          <fieldset>
	<legend>Field Search </legend>
    	<table cellpadding="2" cellspacing="6" border="0" style="color:##FFFFFF; font-size:12px; font-family:Arial, Helvetica, sans-serif">
        	<tr>
            	<td>Select Table to edit </td>
                <td>
                	         <select name="tableSelect" id="tableSelect">
                            <option value="" >Select Table to Edit</option>
                            <option value="tblIndividual" >Table Individual Details</option>
                            <option value="tblIndOptions" >Table Individual Options</option>
                           	</select>  
                </td>
           </tr>
        </table>
    						
                        <form action="EditGPPFeilds_Search.cfm" method="post" id="postFieldSearch">
                        <div id="AreaFormSelect">
       <!---                 <table  border="0" cellpadding="2" cellspacing="6" style="color:##FFFFFF; font-size:12px; font-family:Arial, Helvetica, sans-serif">
                          <tr>
                            <td>Select Field to Search</td>
                            <td>
                            <select name="field" id="field">
                            <cfloop index="ColumnHeadings" list="#Evaluate(LoopList)#">
                            <option value="#ColumnHeadings#" >#ColumnHeadings#</option>
                            </cfloop>
                            </select>                            </td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td>Type Value to search</td>
                            <td ><label>
                            	<input type="text" name="TableToChange" id="searchValue" value="" />
                              <input type="text" name="searchValue" id="searchValue" />
                            </label></td>
                            <td><button >Search </button> &nbsp;</td>
                          </tr>
                       <tr>
                       		<td>&nbsp;</td>
                            <td  ><div id="progressSearch"></div></td>
                            <td>&nbsp;</td>
                          </tr>
                        </table>--->
                        </div>
            </form>
   </fieldset>
          </td>
    </tr>

<tr>
	<td bgcolor="##CCCCCC">
<form action="EditGPPFeilds_Change.cfm" method="post" id="postFieldChange">
<div id="areaFieldResult">
                                   
</div>
</form>
   </td>
</tr>                 


</table>
<!-------- DISPLAY AND LOAD HERE THE RESULT OF THE FEILD SEARCH __------------>
       

<cfelse >

Only Members of the Management Admin group can access this page

</cfif>        

    </div>
</div>
</cfoutput>
</body>
</html>
