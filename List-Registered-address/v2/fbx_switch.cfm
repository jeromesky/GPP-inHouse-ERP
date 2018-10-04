<!--- Module: fbx_Switch.cfm --->
<cfparam name='url.v2' default='yes'>

<cfswitch expression = "#fusebox.fuseaction#">

    <cfcase value="events">
      <cfinclude template="qry_events.cfm">
      <cfinclude template="dsp_events.cfm">
    </cfcase>
    
    <cfcase value="research">
      <cfinclude template="qry_research.cfm">
      <cfinclude template="dsp_research.cfm">
    </cfcase>

    <cfcase value="dinner">
      <cfinclude template="qry_dinner.cfm">
      <cfinclude template="dsp_dinner.cfm">
    </cfcase>
    
    <cfcase value="printing"> 
      <cfinclude template="qry_test_print.cfm">
      <cfinclude template="dsp_test_print.cfm">
    </cfcase>
    
    <cfcase value="badges"> 
      <cfinclude template="qry_test_print.cfm">
      <cfinclude template="dsp_badges.cfm">
    </cfcase>
    
    <cfcase value="badges2"> 
      <cfinclude template="qry_test_print2.cfm">
      <cfinclude template="dsp_badges2.cfm">
    </cfcase>    
    
    <cfcase value="exhibitors"> 
      <cfinclude template="qry_exhibitors.cfm">
      <cfinclude template="dsp_exhibitors.cfm">
    </cfcase>
    
    <cfcase value="regos"> 
      <cfinclude template="qry_regos.cfm">

      <cfif url.v2 EQ 'yes'>
        <cfinclude template="dsp_regos_v2.cfm">
      <cfelse>
        <cfinclude template="dsp_regos.cfm">
      </cfif>
    </cfcase>
    
    <cfcase value="combo"> 
      <cfinclude template="qry_regos.cfm">
      <cfinclude template="dsp_combo.cfm">
    </cfcase>
    
        <cfcase value="fixed"> 
      <cfinclude template="qry_regos.cfm">
      <cfinclude template="dsp_fixed.cfm">
    </cfcase>
    
    <cfcase value="pdf">
    
        <cfinclude template="qry_test_col2pdf.cfm">
        <cfparam name=url.eventName default="GPP Event">
    <cfscript>
      get.eventName = '#url.eventName#';
    </cfscript>
        <cfinclude template="dsp_test_col2pdf.cfm">
        <!--- orginal 34/ db example: 12 pages --->
    
    </cfcase>
    
    <cfcase value="onlyguests">
    
        <cfinclude template="qry_guestlist.cfm">
        <cfparam name=url.eventName default="GPP Event">
    <cfscript>
      get.eventName = '#url.eventName#';
    </cfscript>
        <cfinclude template="dsp_guestlist.cfm">
    
    </cfcase>    
    
     
    <cfcase value="pdf3">
    
        <cfinclude template="qry_test_print2.cfm">
        <cfparam name=url.eventName default="GPP Event">
    <cfscript>
      get.eventName = '#url.eventName#';
    </cfscript>
		<cfinclude template="dsp_badges3.cfm">
    
    </cfcase>
        
    <cfdefaultcase>

		<!---This will just display an error message and is useful in catching typos of fuseaction names while developing--->
        <cfoutput>
        Received UNDEFINED fuse-action called "#fusebox.fuseaction#"
        </cfoutput>
    </cfdefaultcase>
</cfswitch>