<!---<cfdump var="#form#">--->
<cfparam name="form.userID" default="#form.userID#">
<cfinclude template="qry_userSave.cfm">
      <cfscript>
          thread = CreateObject("java", "java.lang.Thread");
          thread.sleep(1000);
      </cfscript>

<cfinclude template="../_display/dsp_header.cfm">
<!---  <cfdump var="#session#"> <cfdump var="#form#"> --->
<cfinclude template="dsp_userReview.cfm">
<cfinclude template="../_display/dsp_footer.cfm">