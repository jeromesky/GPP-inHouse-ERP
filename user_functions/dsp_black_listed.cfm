<cfinclude template="qry_black_listed.cfm">
<script type="text/javascript">
 $('.Black_Listed_comment').editable('Update_Individual.cfm?fieldname=Black_Listed_comment', { 
	  type : "textarea",
	  height : 48,
	  width	:172,
	  style: 'display: inline',
	  indicator : '<img src="../img/indicator.gif">',
	  onblur : 'submit',
	  callback : function(value) {
			  $(".Black_Listed_Date").html(JavaDateToday);
		   },
	  submitdata : function(value, settings) {
			var oldvalue = this.revert;
			$("#pinBoardArea").append(oldvalue + "<br />");
			return {"fieldname": 'Black_Listed_comment', "oldValue" : oldvalue };
		  }
});	
</script>
<cfoutput><fieldset id="area_blackList" style=" padding:5px;"> 
<legend>Black listed <span class="functionRemove"></span></legend>       
<b>Black List</b> <i id="#qryBlackListed.userID#" class="field_button_container"><input type="checkbox" name="Black_Listed" id="Black_Listed" value="1" <cfif qryBlackListed.Black_Listed EQ 1>checked</cfif>></i> 
<b>On date</b> <i class="Black_Listed_Date" id="#qryBlackListed.userID#">#dateFormat(qryBlackListed.Black_Listed_Date, "dd mmm yyyy")#</i> 
<b>Comment</b> <i class="Black_Listed_comment" id="#qryBlackListed.userID#">#qryBlackListed.Black_Listed_comment#</i>
</fieldset><!---<cfif qryBlackListed.Black_Listed  EQ 1 >background-color:##ffe5e5</cfif>class="fieldsetHighLight"---></cfoutput>