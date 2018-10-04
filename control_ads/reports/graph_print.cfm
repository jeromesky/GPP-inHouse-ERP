<table border="0" width="100%" cellpadding="2" cellspacing="0">
	<tr>
		<td <cfif CGI.USER_AGENT CONTAINS "MSIE">background="i/cross.gif"</cfif>>
			<cfoutput query="qGetReport">
			<cfif cgi.script_name contains "imp">
				<cfif ImpressionCount eq "0">
					<cfset percent = 0>
					<cfset pickpercent = 0>
				<cfelse>
					<cfset percent = ImpressionCount  / Total>
					<cfset pickpercent = (round((ImpressionCount / Total)* 200))>
				</cfif>
			<cfelse>
				<cfif ClickCount eq "0">
					<cfset percent = 0>
					<cfset pickpercent = 0>
				<cfelse>				
					<cfset percent = ClickCount / Total>
					<cfset pickpercent = (round((ClickCount / Total)* 200))>
				</cfif>
			</cfif>
			
			<cfif pickpercent gt 90>
				<cfset widthplus = ((pickpercent / '.85') - 2 )>
				<cfset widthchange = (pickpercent + widthplus)>
			<cfelse>
				<cfset widthplus = ((pickpercent / '.66') - 6 )>
				<cfset widthchange = (pickpercent + widthplus)>
			</cfif>
			<cfif widthchange lt 1>
				<cfset widthchange = 1>
			</cfif>
			<cfset Width = round(widthchange)>
			<table border="0" cellspacing="0" cellpadding="4" width="100%">
				<tr>
			<td align="left"><cfif currentrow eq "1"><font face="Tahoma, Arial" size="2"><b>Graphical Report</b></font></cfif>
						<table border="0" cellspacing="0" cellpadding="2">
						<tr>
			<td align="left"><font color="black" face="Tahoma,Arial, Helvetica, sans-serif" size="1">#Evaluate(GraphField)#</b></font></td>		
						</tr>
						</table>
			<table border="0" height="15" cellpadding="0" cellspacing="0" width="" border="0">
							<tr>
			<td><img src="i/bar.gif" width="#width#" height="15"></td>
			<td bgcolor="ffffff" nowrap><font color="black" face="Arial, Helvetica, sans-serif" size="2"><b>
									<cfif cgi.script_name contains "imp">
										&nbsp;#ImpressionCount#
									<cfelse>
										&nbsp;#ClickCount#
									</cfif></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			</cfoutput>
		</td>
	</tr>
</table>			