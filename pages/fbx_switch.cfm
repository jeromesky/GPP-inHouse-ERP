<!--- Module: fbx_Switch.cfm --->

<cfswitch expression = "#fusebox.fuseaction#">

    <cfcase value="list">
      <cfinclude template="qry_pages.cfm">
      <!---<cfinclude template="../nav/testNav2009V2.cfm"> --->
      <cfinclude template="dsp_pages.cfm">
    </cfcase>
    
    <cfcase value="edit"> 
      <cfinclude template="qry_page.cfm">
      <!---<cfinclude template="../nav/testNav2009V2.cfm">--->
      <cfinclude template="dsp_page.cfm">
    </cfcase>
    
    <cfcase value="add"> 
      <!---<cfinclude template="../nav/testNav2009V2.cfm">--->
      <cfinclude template="dsp_page.cfm">
    </cfcase>
    
    <cfcase value="remove"> 
      <cfinclude template="act_remove.cfm">
      <cfinclude template="url_home.cfm">
    </cfcase> 
        
    <cfdefaultcase>

		<!---This will just display an error message and is useful in catching typos of fuseaction names while developing--->
        <cfoutput>
        Received UNDEFINED fuse-action called "#fusebox.fuseaction#"

        </cfoutput>
    </cfdefaultcase>
</cfswitch>