<cfif NOT parameterexists(Session.staffName)>
  <cflocation url="http://www.petro21.com/my-office/index.cfm">
</cfif>
<cfif Session.staffType EQ 3 >
  <cfset menuItemVisible = false >
  <cfelse>
  <cfset menuItemVisible = true >
</cfif>

<!--- GET WEEK EVENTS FOR QUICK ACCESS --->
<cfquery name="weeks" datasource="#gpp#" cachedwithin="#CreateTimeSpan(0,2,0,0)#">
    SELECT webid, event_name, event_year, live
    FROM tblAnnual_Conf 
    WHERE event_type = 'week' 
    AND event_expire > #dateAdd("d", -7, now())#
    ORDER BY event_expire
</cfquery>
<cfscript>
	function NextDayOfWeek()
	{
	ThisDay = dayOfWeek(now());
	if ( ThisDay EQ 7 ){
			nextDay = 1;
	}else{
			nextDay = ThisDay + 1;
	}
	return nextDay;
	}
</cfscript>
<cfset newsSelectDay = 6>
<cfquery name="newsletters" datasource="#gpp#" cachedwithin="#CreateTimeSpan(0,2,0,0)#">
    SELECT sendDay, sendTime, newsletterName, live, newsletterID
    FROM newsletters
    WHERE sendDay LIKE '%#NextDayOfWeek(now())#%'
    ORDER BY sendTime, sendDay 
</cfquery>
<cfquery name="newsletterlist" datasource="#gpp#" cachedwithin="#CreateTimeSpan(0,2,0,0)#">
    SELECT sendDay, sendTime, newsletterName, live, newsletterID
    FROM newsletters
    ORDER BY sendTime, sendDay 
</cfquery>
<cfset column = 0 >
<cfset countDays = 1 >

<script type="text/javascript"> 
<!--
$(document).ready(function(){
	$(".downRegistrations").click(function(){		
		$("#Registrationsdropped").toggle("fast"); 
		$("#Eventsdropped, #Newsdropped, #Admindropped, #GPPdropped, #Stastdropped").hide();
	});
	$(".downEvents").click(function(){ 	
		$("#Eventsdropped").toggle("fast"); 
		$("#Registrationsdropped, #Newsdropped, #Admindropped, #GPPdropped, #Stastdropped").hide();	
	});
	$(".downNews").click(function(){ 	
		$("#Newsdropped").toggle("fast"); 
		$("#Registrationsdropped, #Eventsdropped, #Admindropped, #GPPdropped, #Stastdropped").hide();	
	});
	$(".downAdmin").click(function(){ 	
		$("#Admindropped").toggle("fast"); 
		$("#Registrationsdropped, #Eventsdropped, #Newsdropped, #GPPdropped, #Stastdropped").hide();
	});
	$(".downGPP").click(function(){ 	
		$("#GPPdropped").toggle("fast"); 
		$("#Registrationsdropped, #Stastdropped, #Admindropped, #Newsdropped, #Eventsdropped").hide();	
	});
	$(".downStats").click(function(){ 	
		$("#Stastdropped").toggle("fast"); 
		$("#Registrationsdropped, #GPPdropped, #Admindropped, #Newsdropped, #Eventsdropped").hide();
	});
	$(".downGPPAcc").click(function(){ 	
		$("#GPPAccdropped").toggle("fast"); 
	});
});
-->
</script>

<div class="megamenu">
  <ul>
    <li><a href="http://www.petro21.com/my-office/dashboard.cfm">Home</a></li><cfif menuItemVisible EQ true>
      <li class="downEvents"><a href="#">Events & Web Content</a></li>
      <li class="downNews"><a href="#">News & Advertisment</a></li>
      <li class="downAdmin"><a href="#">Administration</a></li>
      <li class="downGPP"><a href="#">GPP Database Management</a></li>
      <li class="downRegistrations"><a href="#">Registrations</a></li>
      <li class="downStats"><a href="#">Reports & Stats</a></li><cfelse>
      <li class="downGPPAcc"><a href="#">GPP Database Management</a></li></cfif>
    <li><a href="http://www.petro21.com/my-office/logout.cfm">Log out</a></li>
    <li id="WhoLogedIn" <cfif Session.staffName EQ "">style="color:#FFFFFF;background-color:#FF0000"</cfif>><cfif Session.staffName EQ ""><cfelse><cfoutput>#Session.staffName#</cfoutput></cfif></li>
  </ul>
</div>

<!--- PANE Events --->
<cfif menuItemVisible EQ true>
  <div id="Eventsdropped" class="NavPaneContent">
    <div class="NavColumnleft1">
      <h3>Quick Week Event Access</h3>
      <ul>
        <cfoutput query="weeks"><li><a href="http://www.petro21.com/my-office/events/dsp_edit_new.cfm?id=#weeks.webid#">#weeks.event_name# <cfif weeks.live EQ 1> <span class="navHighLighted">Live</span></cfif></a></li></cfoutput>
      </ul>
    </div>
    <div class="NavColumnleft2" style="width:160px">
      <h3>Editing Events</h3>
      <ul>
        <li><a href="http://www.petro21.com/my-officeX/conferences/?fa=layout-conferences">Conferences</a></li>
        <li><a href="http://www.petro21.com/my-office/gpp_events/SortingEvents.cfm">Create/Manage Events</a></li>
        <li><a href="http://www.petro21.com/my-officex/program/?fa=home" target="_blank">Program (new system)</a></li>
        <li><a href="http://www.petro21.com/my-office/events/">All events</a></li>
        <li><a href="http://www.petro21.com/my-office/presentations/">E-conferences Presentations</a></li>
        <!---<li><a href="http://www.petro21.com/my-office/Econference/">Old E-conferences page</a></li>--->
        <li><a href="http://www.petro21.com/my-office/events/OldEvents.cfm">Old Events</a></li>
        <!---<li><a href="http://www.petro21.com/my-office/Youtube/">Upload Videos from YouTub</a></li>--->
        <li><a href="http://www.petro21.com/my-office/events/ContentManagement.cfm">Content management</a></li>
        <!---<li><a href="http://www.petro21.com/my-office/right_index/">Right indexes</a></li>--->
      </ul>
    </div>
    <div class="NavColumnleft3" style="width:185px">
      <h3>Duncan Management</h3>
      <ul>
        <li><a href="http://www.petro21.com/my-officex/databank/">WORLD DATABANK</a></li>
        <li><a href="http://www.petro21.com/my-office/wso/">WSO</a></li>
        <li><a href="http://www.petro21.com/my-office/books/">Book Reviews</a></li>
        <li><a href="http://www.petro21.com/my-office/published_books/">Published Books</a></li>
        <li><a href="http://www.petro21.com/my-office/Columnist/">The Columnist</a></li>
        <li><a href="http://www.petro21.com/my-office/Delphi/">Delphi</a></li>
        <li><a href="http://www.petro21.com/my-office/media/">Media Couverage</a></li>
        <!--- <li><a href="http://www.petro21.com/clarkesblog/admin/index.cfm">Clarke s Comments</a></li> --->
        <li><a href="http://www.petro21.com/my-office/awards/">Awards</a></li>
        <li>==========</li>
        <li><a href="http://www.petro21.com/my-officex/contracts/" target="_blank">Contracts</a></li>
        <li><a href="http://www.petro21.com/my-office/components/EventGroup.cfm">Create & view event groups</a></li>
        <li><a href="http://www.petro21.com/my-office/pages/">CMS</a></li>
      </ul>
    </div>
    <div class="NavColumnleft4">
      <h3>Events On new System</h3>
      <ul><cfoutput query="weeks"><li><a href="http://www.petro21.com/my-officex/conferences/?fa=layout-events&eventID=#weeks.webid#">#weeks.event_name#
          <cfif weeks.live EQ 1> <span class="navHighLighted">Live</span></cfif></a></li></cfoutput>
      </ul>
    </div>
    <div class="NavColumnright"><img src="http://www.petro21.com/my-office/img/AppleCross.png" border="0" class="downEvents" /></div>
  </div>
  <!--- PANE News --->
  <div id="Newsdropped" class="NavPaneContent">
  <div class="NavColumnleft1">
    <h3>Emailing</h3>
    <ul>
      <li><a href="http://www.petro21.com/my-office/Mailing/index.cfm">Email system</a></li>
    </ul>
  </div>
  <div class="NavColumnleft2">
    <h3>Newsletters Options</h3>
    <ul>
      <li><a href="http://www.petro21.com/my-office/Newsletters/index.cfm">Manage newsletter Banners</a></li>
      <li><a href="http://www.petro21.com/my-officex/news/?fa=notice.display">Manage Notice board</a></li>
    </ul>
  </div>
  <div class="NavColumnright"><img src="http://www.petro21.com/my-office/img/AppleCross.png" border="0" class="downNews" /></div>
  <br style="clear: left" />
  <br style="clear: left" />
  <cfinclude template="nav.cfm">
  </div>
  <!--- PANE ADMIN --->
  <div id="Admindropped" class="NavPaneContent">
    <div class="NavColumnleft1">
      <h3>Admin</h3>
      <ul>
        <li><a href="javascript:openWindow({ url:'../companies/index.cfm', param: {'companyID': 0, 'userID':0}, Args:{ title: 'Manage company', height:490, width:690, modal:false}});">Companies</a></li>
        <li><a href="http://www.petro21.com/my-officex/bookings/?fa=bookings">Bookins</a></li>
         <li><a href="http://www.petro21.com/my-officex/people/?fa=users-layout">Users on New Interface</a></li>
         <li><a href="http://www.petro21.com/my-officex/profiles/?fa=home">Profiles</a></li>
        <li><a href="http://www.petro21.com/my-officex/contracts/" target="_blank">Contracts</a></li>
        <li><a href="http://www.petro21.com/my-office/gpp_bankaccounts/index.cfm">Bank Accounts</a></li>
        <li><a href="http://www.petro21.com/my-office/links/">Links</a></li>
      </ul>
    </div>
    <div class="NavColumnleft2">
      <h3>Site Configuration</h3>
      <ul>
        <li><a href="http://www.petro21.com/my-office/staff/">GPP User and Details</a></li>
        <li><a href="javascript:openWindow({ url:'../staff/index.cfm', param: {}, Args:{ title : 'Manage Staff', height:520, width:850, modal:false}});">Manage Staff</a></li>
        <li><a href="javascript:openWindow({ url:'../Directory_Source/index.cfm', param: {}, Args:{ title: 'Manage New Directory', height:520, width:820, modal:false}});">New Directory</a></li>
        <li><a href="javascript:openWindow({ url:'../Events_New/dsp_upcomingList.cfm', param: {}, Args:{ title: 'List conferences', height:520, width:820, modal:false}});">List Upcoming events</a></li>
        <li><a href="javascript:openWindow({ url:'../Venues/index.cfm', param: {}, Args:{ title: 'Manage Venues and hotel', height:655, width:680, modal:false}});">Hotels and Venues</a></li>
        <li><a href="javascript:openWindow({ url:'../Cities/index.cfm', param: {}, Args:{ title: 'Manage Venues and hotel', height:620, width:920, modal:false}});">Clean Cities</a></li>
      </ul>
    </div>
    <div class="NavColumnleft3">
      <h3>FTP Server</h3>
      <ul>
        <li><a href="http://www.petro21.com/ftp/list.cfm?user=gpp">Files available for download</a></li>
        <li><a href="http://www.petro21.com/ftp/?user=gpp">Upload files</a></li>
      </ul>
    </div>
    <div class="NavColumnright"><img src="http://www.petro21.com/my-office/img/AppleCross.png" border="0" class="downAdmin" /></div>
  </div>
  <!--- PANE GPP --->
  <div id="GPPdropped" class="NavPaneContent">
    <div class="NavColumnleft1">
      <h3>User management</h3>
      <ul>
        <!---<li><a href="http://www.petro21.com/my-office/User_Edit_test/">Users</a></li--->
        <li><a href="http://www.petro21.com/my-officex/people/?fa=users-layout">Users on New Interface (new layout)</a></li>
        <li><a href="http://www.petro21.com/my-office/User_Edit/">Users on Old Interface</a></li>
        <li><a href="http://www.petro21.com/my-officex/bookings/" target="_blank">Bookings</a></li>
        <li><a href="http://www.petro21.com/my-officex/invoices/" target="_blank">Invoices</a></li>
        <li><a href="http://www.petro21.com/my-officex/people/?fa=users-layout" target="_blank">New Users/people</a></li>
        <li><a href="http://www.petro21.com/my-officex/profiles/?fa=home" target="_blank">Profiles</a></li>
        <li><a href="javascript:openWindow({ url:'../noPost/index.cfm', param: {}, Args:{ title : 'remove users from post', height:500, width:940, modal:false}});">Remove Users from Post</a></li>
      </ul>
    </div>
    <div class="NavColumnleft2">
      <h3>Manage Events/Conferences</h3>
      <ul>
        <!---<li><a href="http://www.petro21.com/my-office/gpp_events/SortingEvents.cfm">Sorting Events and Groups</a></li>--->
        <!---<li><a href="http://www.petro21.com/my-office/gpp_bankaccounts/index.cfm">Bank Accounts</a></li>--->
      </ul>
    </div>
    <div class="NavColumnleft3">
<!---      <h3>Data Field Manipulation</h3>
      <ul>
        <li><a href="http://www.petro21.com/my-office/gppdata/EditGPPFeilds.cfm">Change Field Values</a></li>
        <li><a href="http://www.petro21.com/my-office/competitors/">Find Competitors</a></li>
        <li><a href="http://www.petro21.com/my-office/gppdata/flaged_users.cfm">Flaged Records for suspect emails</a></li>
        <li><a href="http://www.petro21.com/my-office/gppdata/remove_Mail_list.cfm">Move User to Archived Status</a></li>
        <li><a href="http://www.petro21.com/my-office/gppdata/Users_List.cfm">Manage User Region of Interest post</a></li>
      </ul>--->
    </div>
    <div class="NavColumnleft3">
      <h3>Lists</h3>
      <ul>
        <li><a href="http://www.petro21.com/my-office/List-Registered/">Registered List</a></li>
        <li><a href="http://www.petro21.com/my-office/List-Registered-address/">Registered List new branches</a></li>
        <li><a href="http://www.petro21.com/my-office/List-UserOptions/">User Option List</a></li>
        <!---<li><a href="http://www.petro21.com/my-office/List-Regions/">Regions List</a></li>--->
        <li><a href="http://www.petro21.com/my-office/event_registrations/find_All_Reg.cfm">Registration Check List</a></li>
      </ul>
      <h3>Reports</h3>
      <ul>
        <li><a href="http://www.petro21.com/my-officex/reports/" target="_blank">All Reports</a></li>
      </ul>
    </div>
    <div class="NavColumnright"><img src="http://www.petro21.com/my-office/img/AppleCross.png" border="0" class="downGPP" /></div>
  </div>
  <!--- PANE Registration --->
  <div id="Registrationsdropped" class="NavPaneContent">
    <div class="NavColumnleft1">
      <h3>Registrations</h3>
      <ul>
        <li><a href="http://www.petro21.com/my-office/event_registrations/registration.cfm?display=card">Registrations</a></li>
        <li><a href="http://www.petro21.com/my-office/event_registrations/oldTransaction.cfm">Completed registrations / transactions</a></li>
        <li><a href="http://www.petro21.com/my-office/event_registrations/list_transaction_error.cfm">Incomplete registrations</a></li>
      </ul>
    </div>
    <div class="NavColumnleft2">
      <h3>Payment system</h3>
      <ul>
        <li><a href="http://www.petro21.com/my-office/event_registrations/createPayment.cfm?action=card">Card Payment</a></li>
        <li><a href="http://www.petro21.com/my-office/event_registrations/conference_registration.cfm?action=user">Registered Users</a></li>
        <li><a href="http://www.petro21.com/my-office/event_registrations/createPayment.cfm?action=wire">Card&nbsp;Payment&nbsp;for&nbsp;WT</a></li>
      </ul>
    </div>
    <div class="NavColumnright"> <img src="http://www.petro21.com/my-office/img/AppleCross.png" border="0" class="downRegistrations" /></div>
  </div>
  <!--- PANE SATAS --->
  <div id="Stastdropped" class="NavPaneContent">
    <div class="NavColumnleft1">
      <h3>Web stats, Banners</h3>
      <ul>
        <li><a class="navlink" href="">Web site stats</a></li>
        <li><a class="navlink" href="http://www.petro21.com/my-office/control_ads/updateclients.cfm">Website banner stats</a></li>
        <li><a class="navlink" href="http://www.petro21.com/my-office/stats/?incl=mail">Mailout stats</a></li>
        <li><a href="http://www.petro21.com/my-office/ads.cfm">Website banners</a></li>
      </ul>
    </div>
    <div class="NavColumnleft2">
      <h3>Media and Sponsors</h3>
      <ul>
        <li><a href="http://www.petro21.com/my-office/contracts/companylogos.cfm">Edit Companies / approve jobs</a></li>
        <li><a href="http://www.petro21.com/my-office/contracts/reports.cfm">Media Reports</a></li>
        <li><a href="http://www.petro21.com/my-office/contracts/">Contracts Calendar</a></li>
        <hr class="navigator_hr" />
        <li><a href="http://www.petro21.com/my-office/contracts/ReportsSponsors.cfm">Sponsors Reports</a></li>
        <li><a href="http://www.petro21.com/my-office/contracts/indexSponsors.cfm">Sponsors Calendar</a></li>
      </ul>
    </div>
    <div class="NavColumnright"> <img src="http://www.petro21.com/my-office/img/AppleCross.png" border="0" class="downStats" /> </div>
  </div>
  <cfelse>
  <!--- PANE GPP Accounts --->
  <div id="GPPAccdropped" class="NavPaneContent">
    <div class="NavColumnleft1">
      <h3>User management</h3>
      <ul>
        <!---<li><a href="http://www.petro21.com/my-office/User_Edit_test/">Users</a></li--->
        <li><a href="http://www.petro21.com/my-office/User_Edit/">User / Invoicing</a></li>
        <li><a href="http://www.petro21.com/my-office/event_registrations/registration.cfm?display=card">Registrations</a></li>
        <li><a href="http://www.petro21.com/my-office/event_registrations/oldTransaction.cfm">Completed registrations / transactions</a></li>
      </ul>
    </div>
    <div class="NavColumnleft2">
      <h3> </h3>
      <ul>
      </ul>
    </div>
    <div class="NavColumnleft3">
      <h3> </h3>
      <ul>
      </ul>
    </div>
    <div class="NavColumnleft3">
      <h3>Reports and Lists</h3>
      <ul>
        <li><a href="http://www.petro21.com/my-office/List-Registered/">Registered List</a></li>
        <li><a href="http://www.petro21.com/my-office/List-Registered-address/">Registered List new branches</a></li>
        <li><a href="http://www.petro21.com/my-office/lists/">List</a></li>
        <li><a href="http://www.petro21.com/my-office/event_registrations/find_All_Reg.cfm">Registration Check List</a></li>
      </ul>
      <h3>Reports</h3>
      <ul>
        <li><a href="http://www.petro21.com/my-office/reports/">Reports</a></li>
      </ul>
    </div>
    <div class="NavColumnright"> <img src="http://www.petro21.com/my-office/img/AppleCross.png" border="0" class="downGPPAcc" /></div>
  </div>
</cfif>