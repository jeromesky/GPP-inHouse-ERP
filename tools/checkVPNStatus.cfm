<cfexecute name="C:\VPNConnection\checkVPNStatus.bat" timeout="10" arguments="-s" 
outputfile="C:\VPNConnection\VPNTestConnection.txt"><cfdump var="#datathedate#"></cfexecute>
 
<cffile action="read" file="C:\VPNConnection\VPNTestConnection.txt" variable="Message">

<cfif #trim(Message)# contains "successfully">
    		
<cfelseif #trim(Message)# contains "Access was denied">
  <cfexecute name="C:\VPNConnection\GPPServer.bat" variable="data"><cfdump var="#data#"></cfexecute> <cfdump var="#data#"></cfexecute>
  <cfmail to="#contactAdmin#" from="web@petro21.com" subject="VPN connection to SERVER1 was recreated successfully">
  
  </cfmail>
</cfif>