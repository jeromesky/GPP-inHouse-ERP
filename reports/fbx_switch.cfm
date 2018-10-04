

<cfswitch expression="#fusebox.fuseAction#">
  
	<cfcase value="home">
    	<cfinclude template="../_display/dsp_header.cfm">
		<cfinclude template="./home/index.cfm">
        <cfinclude template="../_display/dsp_footer.cfm">
	</cfcase>
	
	
    <cfcase value="attendee">
		<cfinclude template="../_display/dsp_header.cfm">
		<cfinclude template="./attendees/dsp_header.cfm">
    	<cfinclude template="./attendees/qry_result.cfm">
    	<cfinclude template="./attendees/dsp_layout_html.cfm">
      <cfinclude template="../_display/dsp_footer.cfm">
	</cfcase>

  <cfcase value="attendee-result-html">
		<cfinclude template="../_display/dsp_header.cfm">
        <cfinclude template="./attendees/dsp_header.cfm">
		<cfinclude template="./attendees/qry_result.cfm">
    	<cfinclude template="./attendees/dsp_layout_html.cfm">
        <cfinclude template="../_display/dsp_footer.cfm">
	</cfcase>
	
    
  <cfcase value="attendee-result-xls">
		<cfinclude template="./attendees/qry_result.cfm">
    	<cfinclude template="./attendees/dsp_layout_xls.cfm">
	</cfcase>		

  <cfcase value="attendee-result-pdf">
		<cfinclude template="./attendees/qry_result.cfm">
    	<cfinclude template="./attendees/dsp_layout_pdf.cfm">
	</cfcase>		
    
 <!---    Publications By Region ------------------------>
    
        <cfcase value="publicationsByRegion">
		<cfinclude template="../_display/dsp_header.cfm">
		<cfinclude template="./publicationsByRegion/dsp_header.cfm">
    	<cfinclude template="./publicationsByRegion/qry_result.cfm">
    	<cfinclude template="./publicationsByRegion/dsp_layout_html.cfm">
      <cfinclude template="../_display/dsp_footer.cfm">
	</cfcase>

  <cfcase value="publicationsByRegion-result-html">
		<cfinclude template="../_display/dsp_header.cfm">
        <cfinclude template="./publicationsByRegion/dsp_header.cfm">
		<cfinclude template="./publicationsByRegion/qry_result.cfm">
    	<cfinclude template="./publicationsByRegion/dsp_layout_html.cfm">
        <cfinclude template="../_display/dsp_footer.cfm">
	</cfcase>
	
    
  <cfcase value="publicationsByRegion-result-xls">
		<cfinclude template="./publicationsByRegion/qry_result.cfm">
    	<cfinclude template="./publicationsByRegion/dsp_layout_xls.cfm">
	</cfcase>		

  <cfcase value="publicationsByRegion-result-pdf">
		<cfinclude template="./publicationsByRegion/qry_result.cfm">
    	<cfinclude template="./publicationsByRegion/dsp_layout_pdf.cfm">
	</cfcase>	
    
 <!---    Publications By EVENT ------------------------>
    
     <cfcase value="publicationsByEvent">
        <cfinclude template="../_display/dsp_header.cfm">
        <cfinclude template="./publicationsByEvent/dsp_header.cfm">
        <cfinclude template="./publicationsByEvent/qry_result.cfm">
        <cfinclude template="./publicationsByEvent/dsp_layout_html.cfm">
        <cfinclude template="../_display/dsp_footer.cfm">
	</cfcase>

  <cfcase value="publicationsByEvent-result-html">
		<cfinclude template="../_display/dsp_header.cfm">
        <cfinclude template="./publicationsByEvent/dsp_header.cfm">
		<cfinclude template="./publicationsByEvent/qry_result.cfm">
    	<cfinclude template="./publicationsByEvent/dsp_layout_html.cfm">
        <cfinclude template="../_display/dsp_footer.cfm">
	</cfcase>
	
    <cfcase value="publicationsByEvent-result-xls">
    	<cfinclude template="./publicationsByEvent/dsp_header.cfm">
		<cfinclude template="./publicationsByEvent/qry_result.cfm">
    	<cfinclude template="./publicationsByEvent/dsp_layout_xls.cfm">
	</cfcase>

  <cfcase value="publicationsByEvent-result-pdf">
  		<cfinclude template="./publicationsByEvent/dsp_header.cfm">
		<cfinclude template="./publicationsByEvent/qry_result.cfm">
    	<cfinclude template="./publicationsByEvent/dsp_layout_pdf.cfm">
	</cfcase>	

 <!---    Publications By NO REgions ------------------------>
    
     <cfcase value="publicationsNoRegion">
        <cfinclude template="../_display/dsp_header.cfm">
        <cfinclude template="./publicationsNoRegion/dsp_header.cfm">
        <cfinclude template="./publicationsNoRegion/qry_result.cfm">
        <cfinclude template="./publicationsNoRegion/dsp_layout_html.cfm">
        <cfinclude template="../_display/dsp_footer.cfm">
	</cfcase>

  <cfcase value="publicationsNoRegion-result-html">
		<cfinclude template="../_display/dsp_header.cfm">
        <cfinclude template="./publicationsNoRegion/dsp_header.cfm">
		<cfinclude template="./publicationsNoRegion/qry_result.cfm">
    	<cfinclude template="./publicationsNoRegion/dsp_layout_html.cfm">
        <cfinclude template="../_display/dsp_footer.cfm">
	</cfcase>
	
    <cfcase value="publicationsNoRegion-result-xls">
    	<cfinclude template="./publicationsNoRegion/dsp_header.cfm">
		<cfinclude template="./publicationsNoRegion/qry_result.cfm">
    	<cfinclude template="./publicationsNoRegion/dsp_layout_xls.cfm">
	</cfcase>

  <cfcase value="publicationsNoRegion-result-pdf">
  		<cfinclude template="./publicationsNoRegion/dsp_header.cfm">
		<cfinclude template="./publicationsNoRegion/qry_result.cfm">
    	<cfinclude template="./publicationsNoRegion/dsp_layout_pdf.cfm">
	</cfcase>	
    
 <!---    Publications By  TASKS ------------------------>
    
     <cfcase value="publicationsTasks">
        <cfinclude template="../_display/dsp_header.cfm">
        <cfinclude template="./publicationsTasks/dsp_header.cfm">
        <cfinclude template="./publicationsTasks/qry_result.cfm">
        <cfinclude template="./publicationsTasks/dsp_layout_html.cfm">
        <cfinclude template="../_display/dsp_footer.cfm">
	</cfcase>

  <cfcase value="publicationsTasks-result-html">
		<cfinclude template="../_display/dsp_header.cfm">
        <cfinclude template="./publicationsTasks/dsp_header.cfm">
		<cfinclude template="./publicationsTasks/qry_result.cfm">
    	<cfinclude template="./publicationsTasks/dsp_layout_html.cfm">
        <cfinclude template="../_display/dsp_footer.cfm">
	</cfcase>
	
    <cfcase value="publicationsTasks-result-xls">
    	<cfinclude template="./publicationsTasks/dsp_header.cfm">
		<cfinclude template="./publicationsTasks/qry_result.cfm">
    	<cfinclude template="./publicationsTasks/dsp_layout_xls.cfm">
	</cfcase>

  <cfcase value="publicationsTasks-result-pdf">
  		<cfinclude template="./publicationsTasks/dsp_header.cfm">
		<cfinclude template="./publicationsTasks/qry_result.cfm">
    	<cfinclude template="./publicationsTasks/dsp_layout_pdf.cfm">
	</cfcase>	
	
  <!---    Mailing List --------------------------------------------------------------->
    
     <cfcase value="mailing">
        <cfinclude template="../_display/dsp_header.cfm">
        <cfinclude template="./mailing/dsp_header.cfm">
        <cfinclude template="./mailing/qry_result.cfm">
        <cfinclude template="./mailing/dsp_layout_html.cfm">
        <cfinclude template="../_display/dsp_footer.cfm">
	</cfcase>

  <cfcase value="mailing-result-html">
		<cfinclude template="../_display/dsp_header.cfm">
        <cfinclude template="./mailing/dsp_header.cfm">
		<cfinclude template="./mailing/qry_result.cfm">
    	<cfinclude template="./mailing/dsp_layout_html.cfm">
        <cfinclude template="../_display/dsp_footer.cfm">
	</cfcase>
	
    <cfcase value="mailing-result-xls">
    	<cfinclude template="./mailing/dsp_header.cfm">
		<cfinclude template="./mailing/qry_result.cfm">
    	<cfinclude template="./mailing/dsp_layout_xls.cfm">
	</cfcase>

  <cfcase value="mailing-result-pdf">
  		<cfinclude template="./mailing/dsp_header.cfm">
		<cfinclude template="./mailing/qry_result.cfm">
    	<cfinclude template="./mailing/dsp_layout_pdf.cfm">
	</cfcase>	
	
	<cfdefaultcase>
    	<cfinclude template="../_display/dsp_header.cfm">
		<cfinclude template="./home/index.cfm">
        <cfinclude template="../_display/dsp_footer.cfm">
	</cfdefaultcase>
    
    
     <!---    Sponsors By EVENT ------------------------>
    
     <cfcase value="contractsByEvent">
        <cfinclude template="../_display/dsp_header.cfm">
        <cfinclude template="./contractsByEvent/dsp_header.cfm">
        <cfinclude template="./contractsByEvent/qry_result.cfm">
        <cfinclude template="./contractsByEvent/dsp_layout_html.cfm">
        <cfinclude template="../_display/dsp_footer.cfm">
	</cfcase>

  	<cfcase value="contractsByEvent-result-html">
		<cfinclude template="../_display/dsp_header.cfm">
        <cfinclude template="./contractsByEvent/dsp_header.cfm">
		<cfinclude template="./contractsByEvent/qry_result.cfm">
    	<cfinclude template="./contractsByEvent/dsp_layout_html.cfm">
        <cfinclude template="../_display/dsp_footer.cfm">
	</cfcase>
	
    <cfcase value="contractsByEvent-result-xls">
    	<cfinclude template="./contractsByEvent/dsp_header.cfm">
		<cfinclude template="./contractsByEvent/qry_result.cfm">
    	<cfinclude template="./contractsByEvent/dsp_layout_xls.cfm">
	</cfcase>

  <cfcase value="contractsByEvent-result-pdf">
  		<cfinclude template="./contractsByEvent/dsp_header.cfm">
		<cfinclude template="./contractsByEvent/qry_result.cfm">
    	<cfinclude template="./contractsByEvent/dsp_layout_pdf.cfm">
	</cfcase>	

 <!---    Exhibitors By EVENT ------------------------>
    
     <cfcase value="exhibitorByEvent">
        <cfinclude template="../_display/dsp_header.cfm">
        <cfinclude template="./exhibitorByEvent/dsp_header.cfm">
        <cfinclude template="./exhibitorByEvent/qry_result.cfm">
        <cfinclude template="./exhibitorByEvent/dsp_layout_html.cfm">
        <cfinclude template="../_display/dsp_footer.cfm">
	</cfcase>

  	<cfcase value="exhibitorByEvent-result-html">
		<cfinclude template="../_display/dsp_header.cfm">
        <cfinclude template="./exhibitorByEvent/dsp_header.cfm">
		<cfinclude template="./exhibitorByEvent/qry_result.cfm">
    	<cfinclude template="./exhibitorByEvent/dsp_layout_html.cfm">
        <cfinclude template="../_display/dsp_footer.cfm">
	</cfcase>
	
    <cfcase value="exhibitorByEvent-result-xls">
    	<cfinclude template="./exhibitorByEvent/dsp_header.cfm">
		<cfinclude template="./exhibitorByEvent/qry_result.cfm">
    	<cfinclude template="./exhibitorByEvent/dsp_layout_xls.cfm">
	</cfcase>

  <cfcase value="exhibitorByEvent-result-pdf">
  		<cfinclude template="./exhibitorByEvent/dsp_header.cfm">
		<cfinclude template="./exhibitorByEvent/qry_result.cfm">
    	<cfinclude template="./exhibitorByEvent/dsp_layout_pdf.cfm">
	</cfcase>	
	
</cfswitch>
