<cfoutput>
<div align="left" style="width: 500px;">

<fieldset><legend>AUDIENCE Added</legend>

#form.AUDIENCENAME# has 
<cfif sql.errors EQ 0>
been made sucessfully, without any errors.
<cfelse>
had a few errors.
</cfif>

</fieldset>
</div>
</cfoutput>