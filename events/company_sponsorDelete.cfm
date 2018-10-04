<cfinclude template="../Application.cfm">


	<cfquery datasource="#gpp#" name="get">SELECT    #form.field# FROM tblAnnual_Conf WHERE webid = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventid#">	</cfquery>
    <cfset fieldToUpdate =  ListDeleteAt(evaluate("get.#form.field#"), ListFind(evaluate("get.#form.field#"), form.id , ",") , ",")    >
    <cfquery datasource="#gpp#" >UPDATE   tblAnnual_Conf SET   #form.field#  = '#fieldToUpdate#'  
      WHERE webid = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventid#"> </cfquery>




  


  

