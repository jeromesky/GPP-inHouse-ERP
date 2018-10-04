<cfinclude template="../application.cfm">
<cfquery datasource="#gpp#" name="get">
 	select  *
	from CRM_ContactSecondary
	WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#" >
</cfquery>

<script type="text/javascript">
 $(document).ready(function() {

var editableFields = '.strSecretary_Email, .SecretaryName1, .strSecretary_Email2, .SecretaryName2,    .FinanceName, .FinanceEmail';

	$(editableFields).editable(submitEdit, { 
		height 		: 20,
		width			:172,
		indicator 	: '<img src="../img/indicator.gif">',
		tooltip   		: "Click to edit...",
		onblur 		: 'submit',
		style			: 'display: inline'
		//url				: "../User_Edit/Update_Individual.cfm"
	});

	function submitEdit(value, settings)
	{ 
	   var postValue 	= new Object();
	   var newValue 		= value;
	   var oldvalue 		= this.revert;
	   var fieldname 		= $(this).attr("class");
	   var id 				= $(this).attr("id");
	   //var result = value; // this is back to editable
	   postValue = {"id" : id, "value": value,  "fieldname" : fieldname, "oldvalue" : oldvalue}; 
	   var returned = $.ajax({
			   url			: "../User_Edit/Update_Individual.cfm", 
			   type		: "POST",
			   data 		: postValue,
			   cache		: "false",
			   dataType : "json",
			   success	: function(data, textStatus, jqXHR) {
									var jsonData = eval(data);
									if ( jsonData.status == 1 ) {
									alert(jsonData.data);
										//var newValue = value; // this is back to editable
										//return(data.status);
									}
									if ( jsonData.status == 2 ) {
										//do growl here growl("Message", growlMessage, 'callback', 'ui-icon ui-icon-signal-diag', 'error');
										//var newValue = oldvalue; // this is back to editable
										$("."+fieldname).html(oldvalue);
									}
			   },
			   error		: function(jqXHR, textStatus, errorThrown){
			   				//do growl here growl("Message", growlMessage, 'callback', 'ui-icon ui-icon-signal-diag', 'error');
							$("."+fieldname).html(oldvalue);
			   }<!---,
			   complete : function (xhr, textStatus) 
			   {
				   //var response =  eval(xhr.responseText);
				   if (value == newValue ) 
				   {
					   alert(xhr.responseText.status);
					   var newValue = newValue; // this is back to editable
				   }
			   }--->
			   });
	   return(newValue);
	 }
});
</script>
<cfoutput>
<table cellpadding="0" cellspacing="0" border="0" >
 <tr>
		<td valign="top">
        <fieldset>
                <legend>Secretary</legend>
                <b>Name</b> <i class="SecretaryName1" id="#get.id#">#get.SecretaryName1#</i>
                <b> Email</b> <i class="strSecretary_Email" id="#get.id#">#get.strSecretary_Email#</i>    
        </fieldset>
        
        <fieldset>
                <legend>Secretary 2</legend>
                <b>Name</b> <i class="SecretaryName2" id="#get.id#">#get.SecretaryName2#</i>
                <b>Email</b> <i class="strSecretary_Email2" id="#get.id#">#get.strSecretary_Email2#</i>      
        </fieldset>
        
        <fieldset>
                <legend>Finance Department</legend>
        		<b>Name</b> <i class="FinanceName" id="#get.id#">#get.FinanceName#</i>
                <b>Email</b> <i class="FinanceEmail" id="#get.id#">#get.FinanceEmail#</i>   
        </fieldset>           
		</td>
</tr>
</table>  
<!----- PIN BOARD DIV --->
<div id="pinBoard">
	<div id="pinBoardHeader"></div>
	<div id="pinBoardArea"></div>
</div>
</cfoutput>
 <!--- $(editableFields).editable('Update_Individual.cfm', { 
			height : 20,
			width		:172,
         	indicator : '<img src="../img/indicator.gif">',
			submitdata : function(value, settings) {
									var fieldname = $(this).attr("class");
									var oldvalue = this.revert;
									$("#pinBoardArea").append(oldvalue + "<br />");
       								return {"fieldname": fieldname, "oldValue" : oldvalue };
   								},
         	tooltip   : 'Click to add',
			onblur 	: 'submit',
			style: 'display: inline'
     		});--->