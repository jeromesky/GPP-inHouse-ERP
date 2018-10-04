<cfinclude template="../Application.cfm">

<cfquery datasource="#dsnP21#" name="get">
SELECT *
FROM Meal_Preference
WHERE eventid = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.eventid#">
</cfquery>

<script type="text/javascript">
$(document).ready(function() { 	
	    var options = { 
        success:  updateMealPreference,
		clearForm: false
    };  
    $('#formMealPreference').submit(function() { 
		$(this).ajaxSubmit(options); 
		return false; 
    }); 	
}); 

function updateMealPreference(data){
	$('#tableMealPreference tr:last').after(data);
} 
function DeleteMeal(id){
		$.post("http://www.petro21.com/my-office/Meal_Preference/manageMeals.cfm", { id: id}, function(){  $("#mealID_"+id).animate( { backgroundColor: "#fbc7c7" }, "fast").animate({ opacity: "hide" }, "slow"); });
	} 
</script>
<form name="form1" method="post" action="../Meal_Preference/manageMeals.cfm" id="formMealPreference">
<table width="500" border="0" cellspacing="1" cellpadding="4" style="margin:15px" id="tableMealPreference">
  <tr>
    <td colspan="2">Add a new meal</td>
  </tr>
  <tr>
    <td colspan="2">
      <input type="text" name="meal" id="meal">    </td>
    </tr>
  <tr>
    <td style="border-bottom:1px solid #CCCCCC"><input type="hidden" name="eventid" value="<cfoutput>#url.eventid#</cfoutput>"></td>
    <td style="border-bottom:1px solid #CCCCCC"><input type="submit" name="button" id="button" value="Add"></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
    </tr>
  <tr>
    <td  style="border-bottom:1px solid #EBEBEB">meal</td>
    <td width="40"  style="border-bottom:1px solid #EBEBEB">delete</td>
  </tr>
  <cfoutput query="get">
  <tr id="mealID_#get.id#">
    <td>#get.meal#</td>
    <td><a href="javascript:DeleteMeal(#get.id#);"><img src="../img/erro_crossr.gif" border="0"></a></td>
  </tr>
</cfoutput>
</table>
</form>