<cfinclude template="../Application.cfm">
        <cfquery datasource="#dsnP21#" name="insert">
        INSERT INTO speakers (name, delegation)
        VALUES('#form.name#','#form.delegation#')
        </cfquery>