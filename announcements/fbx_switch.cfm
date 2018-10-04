<!--- <cfdump var="#fusebox#"><cfabort> --->

<cfswitch expression="#fusebox.fuseAction#">
  
	<cfcase value="home,menu">
		<!--- default page ---->
	</cfcase>
	
	<cfcase value="announcementCreate">	
    	<cfinclude template="qry_announcementCreate.cfm">
    	<cfinclude template="dsp_announcementCreate.cfm">
	</cfcase>
	
	<cfcase value="announcementAdd">
    	<cfinclude template="act_announcementAdd.cfm">
      <cfinclude template="dsp_announcementAdd.cfm">
	</cfcase>
	
	<cfcase value="announcementUpdate">
    	<cfinclude template="act_announcementUpdate.cfm">
      <cfinclude template="dsp_announcementUpdate.cfm">
	</cfcase>	

	<cfcase value="announcementListCurrent">
    	<cfinclude template="qry_announcementsList.cfm">	
    	<cfinclude template="dsp_announcementsList.cfm">
	</cfcase>

	<cfcase value="announcementListPast">
      <cfset var.past= 1>
    	<cfinclude template="qry_announcementsList.cfm">	
    	<cfinclude template="dsp_announcementsList.cfm">
	</cfcase>

	<cfcase value="announcementEdit">
    	<cfinclude template="qry_announcementEdit.cfm">	
    	<cfinclude template="dsp_announcementEdit.cfm">
	</cfcase>
	
	<cfcase value="audienceCreate">
    	<cfinclude template="qry_audienceCreate.cfm">
    	<cfinclude template="dsp_audienceCreate.cfm">
	</cfcase>
	
	<cfcase value="audienceAdd">
    	<cfinclude template="act_audienceAdd.cfm">
    	<cfinclude template="dsp_audienceAdd.cfm">
	</cfcase>	
	
	<cfcase value="audienceList">
    	<cfinclude template="qry_audiencesList.cfm">
    	<cfinclude template="dsp_audiencesList.cfm">
	</cfcase>
	
	<cfcase value="audienceEdit">
    	<cfinclude template="qry_audienceList.cfm">	
    	<cfinclude template="dsp_audienceList.cfm">
	</cfcase>

	<cfcase value="schedulesCreate">
    	<cfinclude template="qry_schedulesCreate.cfm">	
    	<cfinclude template="dsp_schedulesCreate.cfm">
	</cfcase>

	<cfcase value="schedulesListCurrent">
    	<cfinclude template="qry_schedulesList.cfm">	
    	<cfinclude template="dsp_schedulesList.cfm">
	</cfcase>	

	<cfcase value="schedulesListPast">
      <cfset var.past= 1>
    	<cfinclude template="qry_schedulesList.cfm">	
    	<cfinclude template="dsp_schedulesList.cfm">
	</cfcase>	

  <cfcase value="schedulesEdit">
    	<cfinclude template="qry_scheduleEdit.cfm">	
    	<cfinclude template="dsp_scheduleEdit.cfm">
	</cfcase>

	<cfcase value="templateList">
    	<cfinclude template="qry_templatesList.cfm">	
    	<cfinclude template="dsp_templatesList.cfm">
	</cfcase>

	<cfcase value="templateEdit">
    	<cfinclude template="qry_edit_template.cfm">	
    	<cfinclude template="dsp_edit_template.cfm">
	</cfcase>

	<cfcase value="templateCreate">
    	<cfinclude template="qry_templateCreate.cfm">	
    	<cfinclude template="dsp_templateCreate.cfm">
	</cfcase>
	
  <cfcase value="templateLoad">
    	<cfinclude template="act_templateLoad.cfm">	
    	<cfinclude template="dsp_templateLoad.cfm">
	</cfcase>

	<cfcase value="filesLoad">
    	<cfinclude template="qry_filesload.cfm">	
    	<cfinclude template="dsp_filesload.cfm">
	</cfcase>

  <cfcase value="filesEdit">
    	<cfinclude template="qry_fileslist.cfm">	
    	<cfinclude template="dsp_fileslist.cfm">
	</cfcase>
	
  <cfcase value="fileUpdate">
      <cfinclude template="dsp_filesload.cfm">
	</cfcase>
	
  <cfcase value="fileFTP">
      <cfinclude template="act_fileFTP.cfm">
	</cfcase>
	
  <cfcase value="mailsendEXt">
      <cfinclude template="xact_sendInt">
	</cfcase>
	
	<cfcase value="mailsendInt">
      <cfinclude template="xact_sendInt">
	</cfcase>
	
	<cfcase value="mailLive">
      <cfinclude template="xact_sendInt">
	</cfcase>
	
	<cfcase value="-mailsendInt">
      <cfinclude template="xact_sendInt">
	</cfcase>
	
	<cfcase value="-mailsendExy">
      <cfinclude template="xact_sendInt">
	</cfcase>
	
	<cfcase value="-mailLive">
      <cfinclude template="xact_sendInt">
	</cfcase>

	<cfdefaultcase>
		<cf_defaultcase>
	</cfdefaultcase>

</cfswitch>