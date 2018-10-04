<cfinclude template="../Application.cfm">
<cfquery name="card" datasource="#dsnP21#">
select id, title, name, surname, company, gemail, event, TransDate, netbanx_reference, eventid, userid
from Registrations 
where approved = 0  AND Transtype ='card' AND cardpass = 1
ORDER BY id DESC
</cfquery>
<!--- where approved = 0 AND cardpass = 1 AND Transtype ='card' --->
<cfquery name="wire" datasource="#dsnP21#">
select id, title, name, surname, company, gemail, event, TransDate, netbanx_reference, eventid, userid
from Registrations 
where approved = 0 AND  Transtype ='wire'
ORDER BY id DESC
</cfquery>

<cfquery name="all" datasource="#dsnP21#">
select id, title, name, surname, company, gemail, event, TransDate, netbanx_reference, eventid, userid
from Registrations 
where (approved = 0) AND  (Transtype ='netbanx' OR Transtype ='WT')
ORDER BY id DESC
</cfquery>

<cfquery name="requesti" datasource="#dsnP21#">
   SELECT * FROM MoreInfo
</cfquery>

<cfif parameterexists(display)>
<cfif display EQ "requesti">
<cfset programe = "" >
<cfquery name="prog" datasource="#dsnP21#">
   SELECT id, file_program 
   FROM events
   Where file_program <> ''
</cfquery>
<cfloop query="prog">
<cfset programe = programe & "," & id >
</cfloop>
</cfif></cfif>