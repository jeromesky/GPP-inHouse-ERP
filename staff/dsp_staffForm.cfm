<cfinclude template="qry_users.cfm">

<cfoutput>
<input type="hidden" name="staffID" value="#form.staffID#">
<div class="c4">
		<b>active</b>
        <i class="NoFormat">
        		<input type="checkbox" name="active" <cfif qryStaff.active eq 1>checked</cfif> >
        </i>
        <b>Name</b>
        <i class="NoFormat">
                <input type="text" name="staffName"  maxlength="80" value="#qryStaff.staffName#" class="ui-corner-all" />
        </i>

        <b>position</b>
        <i class="NoFormat">
                <input type="text" name="staffPossition"  maxlength="80" value="#qryStaff.staffPossition#" class="ui-corner-all" />
        </i>

        <b>email</b>
        <i class="NoFormat">
                <input type="text" name="emailPrivate"  maxlength="80" value="#qryStaff.emailPrivate#" class="ui-corner-all" />
        </i>

        <b>phone</b>
        <i class="NoFormat">
                <input type="text" name="staffPhone"  maxlength="80" value="#qryStaff.staffPhone#" class="ui-corner-all" />
        </i>

        <b>mobile</b>
        <i class="NoFormat">
                <input type="text" name="staffMobile"  maxlength="80" value="#qryStaff.staffMobile#" class="ui-corner-all" />
        </i>

        <cf_country_suggest country="#qryStaff.countryNameEN#" countryfieldname="CountryName" countryID="#qryStaff.countryID#" fieldname="countryID" random="#3443334#">
		<cf_city_suggest city="#qryStaff.CityNameEN#" cityfieldname="cityName" cityID="#qryStaff.cityID#" fieldname="cityID" countryFieldname="countryID" random="#3443334#">

        <b>staff Type</b>
        <i class="NoFormat">
                <select name="staffType" id="staffType" class="ui-corner-all">
                      <option value="1" <cfif qryStaff.staffType EQ 1>selected</cfif> >Administrator</option>
                      <option value="2" <cfif qryStaff.staffType EQ 2>selected</cfif> >User</option>
                      <option value="3" <cfif qryStaff.staffType EQ 3>selected</cfif> >Guest</option>
                      <option value="4" <cfif qryStaff.staffType EQ 4>selected</cfif> >DB Input</option>
                      <option value="5" <cfif qryStaff.staffType EQ 5>selected</cfif> >Accountant</option>
                </select>
        </i>

        <b>userName</b>
        <i class="NoFormat">
                <input type="text" name="staffUsername"  maxlength="80" value="#qryStaff.staffUsername#" class="ui-corner-all" />
        </i>

        <b>password</b>
        <i class="NoFormat">
                <input type="text" name="staffPassword"  maxlength="80" value="#qryStaff.staffPassword#" class="ui-corner-all" />
        </i>

        <b>Contact Reason</b>
        <i class="NoFormat">
                <input type="text" name="staffContactReason"  maxlength="80" value="#qryStaff.staffContactReason#" class="ui-corner-all" />
        </i>

        <b></b>
        <i class="NoFormat">
                <button class="ui-corner-all">Save</button>
        </i>
</div>
</cfoutput>