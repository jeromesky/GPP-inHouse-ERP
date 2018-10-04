<cfinclude template="../Application.cfm">
<CFQUERY datasource="#dsnP21#">
  DELETE 
  FROM events
  WHERE id = #url.id#
</cfquery>
<!---
<CFHTTP URL="http://www.petro21.com/my-office/events/indexCreate.cfm" METHOD="Get"></CFHTTP> 
<CFFILE ACTION="WRITE" FILE="G:\websites\my-office\events\index.cfm" OUTPUT="#CFHTTP.FileContent#" NAMECONFLICT="overwrite">--->

<cflocation url="index.cfm">