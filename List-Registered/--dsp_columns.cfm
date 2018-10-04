<cfoutput>
  <table width="100%" border="0" id="TableEdit" cellpadding="2" cellspacing="1" 
  style="font-family:Arial, Helvetica, sans-serif; color:##000000; font-size:12px; text-align:left;">
    <cfif parameterexists(form.count)>
      <tr>
        <td colspan="#fieldcount#" id="header">#get.eventName# Count: #get.recordcount#</td>
      </tr>
    </cfif>
    <tr>
      <cfif form.format EQ "pdf">
        <th>Name</th>
        <th>Position</th>
        <cfelse>
        <th width="50">ID</th>
        <cfif parameterexists(form.title)>
          <th width="40">Title</th>
        </cfif>
        <th width="150">Name</th>
        <th width="180">Surname</th>
        <th width="600">Position</th>
        <th width="450">Company</th>
      </cfif>
      <cfif parameterexists(form.address)>
        <th>Address</th>
      </cfif>
      <cfif parameterexists(form.city)>
        <th>City</th>
      </cfif>
      <cfif parameterexists(form.country)>
        <th>Country</th>
      </cfif>
      <cfif parameterexists(form.zip)>
        <th>Zip / Postal Code</th>
      </cfif>
      <cfif parameterexists(form.email)>
        <th width="300">Email</th>
      </cfif>
      <cfif parameterexists(form.email_sec)>
        <th width="300">Email&nbsp;Secretary</th>
      </cfif>
      <cfif parameterexists(form.phone)>
        <th width="150">Phone&nbsp;No</th>
      </cfif>
      <cfif parameterexists(form.fax)>
        <th width="150">Fax&nbsp;No</th>
      </cfif>
      <cfif parameterexists(form.phone_ALT)>
        <th width="150">Phone&nbsp;Alt</th>
      </cfif>
      <cfif parameterexists(form.mobile)>
        <th width="150">Mobile</th>
      </cfif>
      <cfif parameterexists(form.comment)>
        <th>Comment</th>
      </cfif>
      <cfif parameterexists(form.Comment_Public)>
        <th>Comment&nbsp;Public</th>
      </cfif>
      <cfif parameterexists(form.invoiceNo)>
        <th width="60">Invoice&nbsp;No</th>
      </cfif>
      <cfif form.paid EQ "yes" OR form.paid EQ "no" OR form.paid EQ "all">
        <th width="60">Paid</th>
      </cfif>
      <cfif form.ChkCancelled EQ "= 1" OR form.ChkCancelled EQ "*">
        <th width="80">Attendance&nbsp;type</th>
      </cfif>
      <cfif parameterexists(form.chkCompGuest)>
        <th width="60">3rd Guest</th>
      </cfif>
      <cfif parameterexists(form.attend_type)>
        <th width="60">Attendance Type</th>
      </cfif>
      <cfif parameterexists(form.discount)>
        <th width="100">Discounted</th>
      </cfif>
    </tr>
    <cfloop query="get">
      <tr>
        <cfif form.format EQ "pdf">
          <td><strong>#Ucase(get.company)#</strong><br>
            <span class="words">#Ucase(get.name)#</span> <span class="words">#Ucase(get.surname)#</span></td>
          <td><span class="words">#ucase(ReplaceNoCase(get.possition, '&AMP;', '&'))#</span></td>
          <cfelse>
          <td>#get.userID#</td>
          <cfif parameterexists(form.title)>
            <td>#Ucase(get.title)#</td>
          </cfif>
          <td>#Ucase(get.name)#</td>
          <td>#Ucase(get.surname)#</td>
          <td>#ucase(ReplaceNoCase(get.possition, '&AMP;', '&'))#</td>
          <td>#Ucase(get.company)#</td>
        </cfif>
        <cfif parameterexists(form.address)>
          <td>#get.address#</td>
        </cfif>
        <cfif parameterexists(form.city)>
          <td>#get.city#</td>
        </cfif>
        <cfif parameterexists(form.country)>
          <td>#get.country#</td>
        </cfif>
        <cfif parameterexists(form.zip)>
          <td>#get.zip#</td>
        </cfif>
        <cfif parameterexists(form.email)>
          <td>#Lcase(get.email)#</td>
        </cfif>
        <cfif parameterexists(form.email_sec)>
          <td>#Lcase(get.email_sec)#</td>
        </cfif>
        <cfif parameterexists(form.phone)>
          <td>#get.phone#</td>
        </cfif>
        <cfif parameterexists(form.fax)>
          <td>#get.fax#</td>
        </cfif>
        <cfif parameterexists(form.phone_ALT)>
          <td>#get.phone_ALT#</td>
        </cfif>
        <cfif parameterexists(form.mobile)>
          <td>#get.mobile#</td>
        </cfif>
        <cfif parameterexists(form.comment)>
          <td>#get.comment#</td>
        </cfif>
        <cfif parameterexists(form.Comment_Public)>
          <td>#get.Comment_Public#</td>
        </cfif>
        <cfif parameterexists(form.invoiceNo)>
          <td>#get.invoiceNo#</td>
        </cfif>
        <cfif form.paid EQ "yes" OR form.paid EQ "no" OR form.paid EQ "all">
          <td><cfif get.paid EQ "yes">
              Yes
              <cfelse>
              No
            </cfif></td>
        </cfif>
        <!--- <cfif form.ChkCancelled EQ "= 1" OR form.ChkCancelled EQ "*">
      <td><cfif get.ChkCancelled EQ 1>Cancel<cfelse>Attended</cfif></td></cfif> --->
        <cfif parameterexists(form.chkCompGuest)>
          <td><cfif get.chkCompGuest EQ 1 >
              Yes
            </cfif></td>
        </cfif>
        <cfif parameterexists(form.attend_type)>
          <td><cfif get.chkDelegate EQ 1 >
              Delegate
              <cfelseif get.chkSpeaker EQ 1>
              Speaker
              <cfelseif get.chkGuest EQ 1>
              Guest
              <cfelseif get.chkModerator EQ 1>
              Moderator
              <cfelseif get.chkExhibitor EQ 1>
              Exhibitor
              <cfelseif get.chkPress EQ 1>
              Press
              <cfelseif get.chkSponsor EQ 1>
              Sponsor
            </cfif></td>
        </cfif>
        <cfif parameterexists(form.discount)>
          <td><cfif get.discount EQ 1 >
              Yes
            </cfif></td>
        </cfif>
      </tr>
    </cfloop>
  </table>
</cfoutput>