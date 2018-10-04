<cfinclude template="../Application.cfm">
<cfif parameterexists(url.edit)>
<cfquery datasource="#dsnP21#" name="get">SELECT * FROM gppusers WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.edit#"></cfquery>
<cfoutput>
  <table width="800" border="0" cellspacing="4">
        <tr>
          <td width="115">Name</td>
          <td width="228"><input type="text" name="name" maxlength="45" value="#get.name#" /></td>
          <td width="199">login  name</td>
          <td width="230"><input type="text" name="username" maxlength="20" value="#get.username#"/></td>
        </tr>
        <tr>
          <td valign="top">User email</td>
          <td><input name="email" maxlength="80" value="#get.email#" /></td>
          <td>Password</td>
          <td valign="top"><input type="text" name="password" value="#get.password#" /></td>
        </tr>
        <tr>
          <td>User telephone</td>
          <td><input type="text" name="tel" maxlength="80" value="#get.tel#" /></td>
          <td>User Type</td>
          <td><label>
            <select name="usertype" id="select">
              <option value="1" <cfif get.usertype EQ 1>selected</cfif> >Administrator</option>
              <option value="2" <cfif get.usertype EQ 2>selected</cfif> >User</option>
              <option value="3" <cfif get.usertype EQ 3>selected</cfif> >Guest</option>
              <option value="4" <cfif get.usertype EQ 4>selected</cfif> >DB Input</option>
            </select>
          </label></td>
        </tr>
        <tr>
          <td>Mobile no</td>
          <td><input type="text" name="mobile"  maxlength="80" value="#get.mobile#" /></td>
          <td>Contact Reason</td>
          <td><input type="text" name="contactReason"  value="#get.contactReason#" /></td>
        </tr>
        <tr>
          <td>Possition</td>
          <td><input type="text" name="Possition" value="#get.Possition#" maxlength="60" /></td>
          <td><input type="hidden" name="id" value="#url.edit#"></td>
          <td><input name="save" type="submit" value="save" /></td>
        </tr>
      </table>
</cfoutput>
<cfelse>
  <table width="800" border="0" cellspacing="4">
        <tr>
          <td width="115">Name</td>
          <td width="228"><input type="text" name="name" maxlength="45" /></td>
          <td width="199">login name</td>
          <td width="230"><input type="text" name="username" maxlength="20" /></td>
        </tr>
        <tr>
          <td valign="top">User email</td>
          <td><input  name="email"  maxlength="80" /></td>
          <td>Password</td>
          <td valign="top"><input type="text" name="password" /></td>
        </tr>
        <tr>
          <td>User telephone</td>
          <td><input type="text" name="tel"  maxlength="80" /></td>
          <td>User Type</td>
          <td><label>
            <select name="usertype" id="select">
              <option value="1">Administrator</option>
              <option value="2">User</option>
              <option value="3">Guest</option>
              <option value="4">DB Input</option>
            </select>
          </label></td>
        </tr>
        <tr>
          <td>Mobile no</td>
          <td><input type="text" name="mobile" maxlength="80" /></td>
          <td>Contact Reason</td>
          <td><input type="text" name="contactReason" /></td>
        </tr>
        <tr>
          <td>Possition</td>
          <td><input type="text" name="Possition"  maxlength="60" /></td>
          <td>&nbsp;</td>
          <td><input name="save" type="submit" value="save" /></td>
        </tr>
      </table>
</cfif>