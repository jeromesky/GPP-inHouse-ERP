<cfinclude template="../Application.cfm">

<cfquery name="get" datasource="#gpp#" >
	SELECT * 
	FROM 
    	CRM_WelcomeLetter_Form
	WHERE 
    	id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.secondaryid#" >

</cfquery>
<cfset lastRecord = "" >

<script type="text/javascript">
$(document).ready(function() { 	

$('#formProcess').submit(function() { 
		$(this).ajaxSubmit({ success: confirmation, clearForm: false });
		$('#sendWLButton').css({'visibility' : 'hidden'});
		$('#sendWLButtonArea').html("<img src=../img/ajax-loadBar.gif>");
		return false; 
    });

});


function confirmation(returnData){
		$("#formProcess").html("Letter Sent....." );
		<cfoutput>$("##button_Welcom_#get.id#").html('done');</cfoutput>
		$("#modalExternal").dialog("close");
}

function CollectData(){
  		var getemail = $('input[name=contactemailAddress]:checked').val() ;
		var getrec_id = $('input[name=rec_id]').val() ;
		var getuser_id = $('input[name=user_id]').val() ;
		var getconf_id = $('input[name=conf_id]').val() ;

      //alert("email: " + getemail  + "rec id: " + getrec_id + "userid: " + getuser_id + "Conf id: " + getconf_id );
  }
</script>
     

<cfoutput query="get">
<form action="../registration/Process_Letter_light.cfm" method="post" id="formProcess">
<table  border="0" cellspacing="1" cellpadding="8">
  <tr id="rec_#get.id#" class="hitArea" >
    <td valign="top" width="300"><strong>#get.title# #get.name# #get.surname#</strong>
      <br />#get.position#<br />#get.company#<br />
      <hr />
      #get.conference#<br /><br />
      <cfif get.chkDelegate eq 1 >Delegate</cfif>
      <cfif get.chkSpeaker eq 1 >Speaker</cfif>
      <cfif get.chkGuest eq 1 >Guest</cfif>
      <cfif get.chkModerator eq 1 >Moderator</cfif>
      <cfif get.chkExhibitor eq 1 >Exhibitor</cfif>
      <cfif get.chkPress eq 1 >Media / Press</cfif>
      <cfif get.chkSponsor eq 1 >Sponsor</cfif><br /><br />
      <!---<span style="color:##F00; font-weight:bold ">(Please do not send welcome letter right now,,, system is being tested, should be 5 minutes)</span>--->
          </td>

    <td width="430" valign="top"><strong>Send to following address<br />
    
    </strong>
    <label><input type="checkbox" name="contactemailAddress" value="#get.email#" checked="checked" />Main email  (#Lcase(get.email)#) </label><br />
     <label><input type="checkbox" name="contactemailAddress" value="#get.AltEmail#" />Alternative email (#LCase(get.AltEmail)#) </label><br />
    	<label><input type="checkbox" name="contactemailAddress" value="#get.SecEmail#" />#get.SecretaryName1# (#Lcase(get.SecEmail)# )</label><br />
       
         <label><input type="checkbox" name="contactemailAddress" value="#get.strSecretary_Email2#" />#get.SecretaryName2#  (#LCase(get.strSecretary_Email2)#) </label><br />
          <label><input type="checkbox" name="contactemailAddress" value="#get.strSecretary_Email2#" />#get.FinanceName#  (#LCase(get.FinanceEmail)#) </label><br />
        <label> <input type="text" name="other" style="width:150px" /> </label>
        <input type="hidden" name="rec_id" value="#get.id#">
        <input type="hidden" name="user_id" value="#get.user_id#">
        <input type="hidden" name="conf_id" value="#get.conf_id#"  />
        <cfif get.currentrow eq get.recordcount > <cfset lastRecord = #get.id# ></cfif>
        </td>
      </tr>
      <tr>
        <td colspan="2" align="right" id="sendWLButtonArea">  <span  style="font-size:9px; color:##666666"> record id = #get.id# //       user_id = #get.user_id# //      conf_id = #get.conf_id#  // </span> <input type="submit" value="send" id="sendWLButton" /></td>
  </tr>
  </table>
  </form>
</cfoutput>