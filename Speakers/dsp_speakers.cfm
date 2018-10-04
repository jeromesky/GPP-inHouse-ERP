<cfparam name="form.eventID" default="689, 688, 687">
<cfinclude template="qry_program.cfm">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
<style type="text/css">
img {clear:both; float:left; margin:0 15px 0 5px}
div {float:left; width: 300px}
body{font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#333}
</style>
</head>

<body>

<cfoutput query="qry_program">
	<cfif qry_program.fileName NEQ "">
          <img src="http://www.petro21.com/_files/client/#qry_program.fileName#" width="86" height="110" class="list_sortable_handle" alt="move" />
      <cfelse>
          <img src="http://www.petro21.com/_files/client/MugShots.jpg" width="86" height="110" class="list_sortable_handle" alt="move" />
      </cfif>
      <div>
        <strong>#qry_program.speakerName#</strong><br />
        #qry_program.userPosition# <br />
        #qry_program.companyName#
     </div>
</cfoutput>

</body>
</html>