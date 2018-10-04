<cfsetting enablecfoutputonly="true" />
<cfparam name="url.open" default =no>

<cfif url.open EQ 'y3s'>

<cfexecute name = "C:\Windows\System32\ipconfig.exe"
  arguments = "/all"
  variable = "dos"
  timeout = "2" />

<cfscript>
  dos = trim(dos);
  dos = Replace(dos, chr(13) & chr(10), "","ALL");
  
  clean = '';
  line = 'IP Address. . . . . . . . . . . . : 192.168.254.';
  lenline = len(line);
  start = findNocase(line, dos);
  clean = trim(Mid(dos, start+lenline, 3));
  
</cfscript>

<cfoutput>#clean#</cfoutput>

</cfif>