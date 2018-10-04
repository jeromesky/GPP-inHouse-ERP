<cfparam name="form.functionID" default="0">
<cfparam name="form.list" default="1">
<cfinclude template="qry_functions.cfm">
<ul class="listMenu"><cfoutput query="qryFunctions">  
  <li id="functionRow_#qryFunctions.functionID#">
    <span><a href="javascript:deleteFunction(#qryFunctions.functionID#);"><img src="../img/erro_crossr.gif" border="0" title="Delete"/></span>
     <a href="javascript:loadFunctionForm(#qryFunctions.eventid#, #qryFunctions.functionID#);" title="Edit">#qryFunctions.functionTitle#</a>
  </li></cfoutput>
</ul>
<!---<cfdump var="#qryFunctions#">--->