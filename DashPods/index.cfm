<cfinclude template="../_display/dsp_header.cfm">

<cfinclude template="qry_migrationCount.cfm">

<script type="text/javascript" src="../javascript/jquery.qtip.R54.js"></script>
<cfsilent>
  <cfscript>
    datenow=CreateODBCDate(Now());
    theevent = "1";
    script = 0;
  </cfscript>
</cfsilent>

<script type="text/javascript">
	$(document).ready(function() { 
	$(".numeric").numeric();
	var growlMessage = "Changes have been made to the system,<br /><strong> You need clear your cache</strong><br />to clear your browser cache<br /> \n 1. press at the same time  (Control + Shift + Delete) \n 2. then select Everything from the dropdown select option \n 3. Then make sure only the tickbox for Cache is selected \n 4. Press clear now<br><br>Contact Jason or Jerome for help<br><br>Ignore this message if you have already done this";
	//growl("Message", growlMessage, 'master', 'ui-icon ui-icon-signal-diag', 'error');
	
	$(".widgit_InvoiceUnpaid ul").live('click', function() {
					
		  var get_id = $(this).attr('id');
		  
		  $(this).qtip({
			  content: { url: '../User_Edit/Invoices_details.cfm', data: { "id": get_id }, method: 'post' },
			  show: { ready: true, solo: true  },
			  overwrite: false,
			  hide: 'unfocus',
			  style: { padding: 5, background: '#ffffff', color: 'black', border: { width: 1, radius: 2 }, name: 'dark', tip: 'leftMiddle',  },
			  position: { corner: { target: 'topRight', tooltip: 'leftMiddle' } }
		  });
	});

//Expande dives
		$(".widgit_InvoiceUnpaid h4").live("click", function(){
						var getEventID = $(this).attr("id");
						//var content = $.trim($("#left-content).html()).length;
						if ($( "#unpaidInvoice_"+getEventID).html().length == 0 ){
						//if ($('#left-unpaidInvoice_'+getEventID+':empty') == true ){
								loadEvents(getEventID);
				}else{
						$('#unpaidInvoice_'+getEventID).toggle("fast");
				}
		});

	//growlNotice(true);
	
	new AjaxUpload('#upload_schedule', {
		  action: '../home/updateSchedule.cfm',
		  name: 'schedule',
		  data: {
		  id : '1',
		  for : 'Brochure',
		  field : 'file_update'
		  },
		  autoSubmit: true,
		  responseType: false,
		  onChange: function(file, extension){},
		  onSubmit: function(file, extension) {$('#upload_schedule').html("Loading File...");},
		  onComplete: function(file, response) {$('#upload_schedule').html("Loading Completed..."); }
});
	
	//$("a[rel*='colorbox']").colorbox({iframe:true, width: "100%", height: "97%"});

/////Tolltip Bubble for Unpaid invoices
$("h3").qtip({
   content: { text: false },
   show: 'mouseover',
   hide: 'mouseout',
   position: { adjust: { x: -40, y: 0 } },
   style: { padding: 5, background: '#ffffff', color: 'black', textAlign: 'left', border: { width: 1, radius: 2, color: '#046ed7' }, tip: 'leftMiddle', name: 'dark'}
});

$('#dashPod_DelegateCount a').each(function(){
$(this).qtip({
		content: {
		url: 'dsp_DelegateCountPerEvents.cfm',
		data:  { 'eventID' : $(this).attr('id') } , 
		method: 'post'
		},
		show: { 
		when: 'click', 
		hide: 'mouseout',
		solo: true 
		 },
		style: { padding: 5, background: '#ffffff', color: 'black', border: { width: 1, radius: 2}, name: 'dark', tip: 'leftMiddle', width: { min: 125 } },
	 	position: { corner: { target: 'rightMiddle', tooltip: 'leftMiddle' } }
});
});

//Click submited jobs
$('#submited_button').click(function(){
	var get_contactID = $('#submited').val();
		if (get_contactID.lenght >0 ){}
				//alert(get_contactID);
				$.post('../contracts/Jobupdate.cfm', {'submited': get_contactID }, function(){$('#submited').val("updated");} );	
	});
});  

function loadEvents(id){
	$.post('../DashPods/dsp_UnpaidInvoices_Items.cfm', {eventid: id},  function(data) {$('#unpaidInvoice_'+id).html(data)  }); <!---.OpenVertically(500); NEED JQ 1.4 --->
}

function addJob(responseText, statusText)  { 
		//alert("eventid");
		$('#accordion').append(responseText);
}
function loadJob(id)  { 
	  //alert("eventid");
	  $('#jobid'+id+"").load("JobToDo_LoadJob.cfm", {id: id});
}
</script>
<style type="text/css">
#dashPod_Invoice, #dashPod_DelegateCount, #dashPod_NewsCounts, #dashPod_NewsletterClickCount, #dashPod_Subs_2Check{ height: 200px; overflow:auto}
#dashBoard li#migration{
	background-color: #40BD36;
    color: #FFFFFF;
    padding: 4px 8px;
}
#dashPod_Subs_2Check{background-color:#ececff}
#dashPod_Subs_2Check div{font-size:13px}
</style>

<div id="outer">
	<div id="iner">
<div id="dashBoard">
	<div class="c_2 c_h">
                <div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title">Delegate Count</spam></div>
                <div class="ui-corner-bottom marginBottom15 ui-widget ui-widget-content podLink" id="dashPod_DelegateCount">
                	<cfinclude template="dsp_DelegateCount.cfm">
                </div>
                
                
							<cfinclude template="dsp_subs_toRemove.cfm">
              
    </div>

    <div class="c_2 c_h">
    	<cfif  listFind("duncan,babette,jerome,jason", trim(Session.staffName) )  NEQ 0>
        		<cfinclude template="dsp_news_select.cfm">
        </cfif> 
        <cfif NOT listFind("duncan,jason", trim(Session.staffName) )  NEQ 0>
				<div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title">Unpaid Invoices</spam></div>
                <div class="ui-corner-bottom marginBottom15 ui-widget ui-widget-content podForm" id="dashPod_Invoice"> 
                <cfinclude template="dsp_UnpaidInvoices.cfm">
                </div>
        </cfif>
   </div>

<div class="clear"></div>

 <cfif trim(Session.staffName)  EQ "jerome" OR trim(Session.staffName) EQ "babette" OR trim(Session.staffName) EQ "jason" OR trim(Session.staffName) EQ "duncan" >
    <div  class="c_2 c_h">

               <div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title">News Recipient Counts</spam></div>
               <div class="ui-corner-bottom marginBottom15 ui-widget ui-widget-content podForm" id="dashPod_NewsCounts">     
               		<cfinclude template="dsp_newsletterCounts.cfm">
               </div>
    </div>
    <div class="c_2 c_h">
   				<div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title">Newsletter Click Counts</spam></div>
                <div class="ui-corner-bottom marginBottom15 ui-widget ui-widget-content  podForm" id="dashPod_NewsletterClickCount"> 
                	<cfinclude template="dsp_NewsLettersClickCount.cfm">
                </div>
     </div></cfif>

<div class="clear"></div>
                <cfif trim(Session.staffName) EQ "jerome" OR trim(Session.staffName) EQ "babette" OR trim(Session.staffName) EQ "jason" OR trim(Session.staffName) EQ "duncan">
    <div class="c_1 c_h">
                    <div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title">Subscription Unregister Reason</spam></div>
                        <div class="ui-corner-bottom marginBottom15 ui-widget ui-widget-content" id="dashPod_Subscription_UnregisterReason">
							<cfinclude template="dsp_Subscription_UnregisterReason.cfm">
                    	</div>
    </div>
    
   <div class="c_1 c_h">
   		<cfinclude template="dsp_Subscription_Unreg-counts.cfm">
        <cfinclude template="dsp_topRatedNewsArticles.cfm">
   </div></cfif>

    <div class="c_1 c_h">
                <div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title">Currency</spam></div>
                 <div class="ui-corner-bottom marginBottom15 ui-widget ui-widget-content  podForm" id="dashPod_Currency">
   					<cfinclude template="dsp_fx_rates.cfm">
                </div>
                <!---<cfif session.userright NEQ 3 >---> 
                		<!--- CONTRACTS SUBMITED JOB FUNCTION --->
						 <!--- SCHEDULE Documents --->    
                         <div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title">Update Schedule PDF</spam></div>
                        <div class="ui-corner-bottom marginBottom15 ui-widget ui-widget-content podForm">
							 <button id="upload_schedule" class="ui-corner-all">Upload</button>
                            <div class="clear"></div>
                        </div>

                <!--- S&E Documents --->   
                <!---<cfif session.userright NEQ 3 >--->  
                <div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title">Latest S&E Documents</spam></div>
					<div class="ui-corner-bottom marginBottom15 ui-widget ui-widget-content podLinks">

<!---                <div id="dashPod_SEDocs" class="dashPod">
                <h3><a href="#">Latest S&E Documents</a></h3>--->
                <cfquery datasource="#gpp#" name="getSE" cachedWithin="#CreateTimeSpan(1,0,0,0)#">
                SELECT 
                	eventid AS id,
                    event_name, 
                    doc_SE_intern 
                FROM 
                CRM_events 
                WHERE 
                event_expire > #now()#  
                AND event_type = 'week'
                AND live  = 1
                 ORDER BY 
                 event_expire
                </cfquery>
                <ul class="listMenu">
                <cfoutput query="getSE">
                <li><img src="../img/home_pdf.gif" width="12" height="16" border="0" class="upload_SE" id="#getSE.id#"> <a href="http://www.petro21.com/docs/#getSE.doc_SE_intern#" target="_blank">#getSE.event_name#</a>  </li>
                </cfoutput>
                </ul>
                </div><!---</cfif>--->
    </div>
    <div class="c_1 c_h">

   <div class="ui-corner-all marginBottom15 ui-widget ui-widget-content podLinks">
    	<ul class="listMenu">
        <li id="migration"><strong> (<cfoutput>#qryMifration.total#</cfoutput>) </strong> Migrations needed Process</li>
    	<li><a href="javascript:openWindow({ url:'../TimeManagement/index.cfm', param: {}, Args:{  title : 'Time Management', height:550, width:820, modal:false}});">Time Management</a></li>
        <li><a href="javascript:openWindow({ url:'../projects/index.cfm', param: {}, Args:{  title : 'Projects', height:550, width:820, modal:false}});">Projects</a></li>
        </ul>
    </div>
	
<cfinclude template="../tasks/dsp_taskProcessed.cfm">

<!---<div id="dashPod_Schedule" class="dashPod">
  <h3 title="use the contract id in the field to submit"><a href="#">Contract Job Submited form</a></h3>
	<cfinclude template="dsp_ContractSubmit.cfm">
</div>--->

<div class="clear"></div>
</div>

<div class="clear"></div>
</div>
</div>
<cfinclude template="../_display/dsp_footer.cfm">