<fieldset class="columnFieldset_Filter_Page">
  <legend>Role / BPA Designation</legend>
  <!---<div class="areaFilter"></div>--->
  <cfinclude template="dsp_BPA_Designation.cfm" >
  <input type="checkbox" name="" />
  visible
</fieldset>
<fieldset class="columnFieldset_Filter_Page">
  <legend>Industry Sector</legend>
  <ul class="checklist cl2">
    <li for="chkAF">
      <label>
        <input type="checkbox" name="sector_exp" value="chkExploration" />
        Exploartion & Production</label>
    </li>
    <!--- name="chkExploration" id="IndustrySector"in table tblIndividual --->
    <li for="chkAF">
      <label>
        <input type="checkbox" name="sector_power" value="chkPower" />
        Power</label>
    </li>
    <!--- name="chkPower" id="IndustrySector" in table tblIndividual --->
    <li for="chkAF">
      <label>
        <input type="checkbox" name="sector_drpc" value="chkRefining" />
        Downstream / Refining / PetroChemincal</label>
    </li>
    <!--- name="chkRefining" id="IndustrySector" in table tblIndividual --->
    <li for="chkAF">
      <label>
        <input type="checkbox" name="sector_gas" value="chkGas" />
        Gas</label>
    </li>
    <!--- name="chkGas" id="IndustrySector" in table tblIndividual --->
    <li for="chkAF">
      <label>
        <input type="checkbox" name="sector_green" value="chkRenBio" />
        Renewable / Biofield</label>
    </li>
    <!--- name="chkRenBio" id="IndustrySector" table tblIndividual --->
  </ul>
</fieldset>
<fieldset class="columnFieldset_Filter_Page">
  <legend>Regions of Interest Postal</legend>
  <ul class="checklist cl2">
    <li for="chkAF">
      <label>
        <input type="checkbox" id="chkAF" name="Region_interest_postal" value="chkAF" />
        Africa</label>
    </li>
    <!--Region of interest Postal is in table  tblIndividual  Value is the filed name-->
    <li for="chkMag">
      <label>
        <input type="checkbox" id="chkMag" name="Region_interest_postal" value="chkMag" />
        Maghreb</label>
    </li>
    <li for="chkEAF">
      <label>
        <input type="checkbox" id="chkEAF" name="Region_interest_postal" value="chkEAF" />
        East Africa</label>
    </li>
    <li for="chSAE">
      <label>
        <input type="checkbox" id="chSAE" name="Region_interest_postal" value="chSAE" />
        Southern Africa</label>
    </li>
    <li for="chkA">
      <label>
        <input type="checkbox" id="chkA"name="Region_interest_postal" value="chkA" />Asia</label>
    </li>
    <li for="chkIntPostAus">
      <label>
        <input type="checkbox" id="chkIntPostAus" name="Region_interest_postal" value="chkIntPostAus" />Australia</label>
    </li>
    <li for="chkME">
      <label>
        <input type="checkbox" id="chkME" name="Region_interest_postal" value="chkME" />Middle East</label>
    </li>
    <li for="chkNA">
      <label>
        <input type="checkbox" id="chkNA" name="Region_interest_postal" value="chkNA" />North America</label>
    </li>
    <li for="chkL">
      <label>
        <input type="checkbox" id="chkL" name="Region_interest_postal" value="chkL" />Latin America</label>
    </li>
    <li for="chkE">
      <label>
        <input type="checkbox" id="chkE" name="Region_interest_postal" value="chkE" />Europe</label>
    </li>
    <li for="chkW">
      <label>
        <input type="checkbox" id="chkW" name="Region_interest_postal" value="chkW" />Worldwide</label>
    </li>
  </ul>
  <!---<table width="100%" border="0" cellspacing="0" cellpadding="4">
        <tr>
            <td><label><input type="checkbox" name="Region_interest_postal" value="chkAF" />Africa</label></td>
<!--- Region of interest is in tblIndividual Value is the filed name --->
        </tr>
        <tr>
            <td><label><input type="checkbox" name="Region_interest_postal" value="chkMag" />Maghreb</label></td>
        </tr>
        <tr>
            <td><label><input type="checkbox" name="Region_interest_postal" value="chkEAF" />East Africa</label></td>
        </tr>
        <tr>
            <td><label><input type="checkbox" name="Region_interest_postal" value="chkWA" />West Africa</label></td>
        </tr>
        <tr>
            <td><label><input type="checkbox" name="Region_interest_postal" value="chSAE" />Southern Africa</label></td>
        </tr>
        <tr>
            <td><label><input type="checkbox" name="Region_interest_postal" value="chkA" /> Asia</label></td>
        </tr>
        <tr>
            <td><label><input type="checkbox" name="Region_interest_postal" value="chkIntPostAus" /> Australia</label></td>
        </tr>
        <tr>
            <td><label><input type="checkbox" name="Region_interest_postal" value="chkME" /> Middle East</label></td>
        </tr>
        <tr>
            <td><label><input type="checkbox" name="Region_interest_postal" value="chkNA" /> North America</label></td>
        </tr>
        <tr>
            <td><label><input type="checkbox" name="Region_interest_postal" value="chkL" /> Latin America</label></td>
        </tr>
        <tr>
            <td><label><input type="checkbox" name="Region_interest_postal" value="chkE" /> Europe</label></td>
        </tr>
        <tr>
            <td><label><input type="checkbox" name="Region_interest_postal" value="chkW" /> Worldwide</label></td>
        </tr>
    </table>--->
</fieldset>
<fieldset class="columnFieldset_Filter_Page">
  <legend>Postal Options</legend>
  <ul class="checklist cl2">
    <li>
      <label for="chkMail">
        <INPUT TYPE="checkbox" NAME="chkMail" id="chkMail">Do not Post</label>
    </li>
    <!--- field = chkMail & table = tblIndividual --->
    <li>
      <label for="chkPrioPost">
        <INPUT TYPE="checkbox" NAME="chkPrioPost"  id="chkPrioPost">Primary Post</label>
    </li>
    <!--- field = chkPrioPost & table = tblIndividual --->
    <li>
      <label for="chkSecPost">
        <INPUT TYPE="checkbox" NAME="chkSecPost" id="chkSecPost">Secondary Post</label>
    </li>
    <!--- field = chkSecPost & table = tblIndividual --->
  </ul>
</fieldset>
<fieldset class="columnFieldset_Filter_Page">
  <legend>Company Industry Types</legend>
  <!---div class="areaFilter"></div>--->
  <cfinclude template="dsp_company_industry_sectors.cfm" >
</fieldset>
<fieldset class="columnFieldset_Filter_Page">
  <legend>S & E Potential</legend>
  <ul class="checklist cl2">
    <li for="chkSE">
      <label>
        <input type="checkbox" id="chkSE" name="SEPotential" value="chkSE" />
        S&E Potential</label>
    </li>
    <!--table  tblIndOptions field = chkSE   -->
    <li for="chkSEW">
      <label>
        <input type="checkbox" id="chkSEW" name="SEPotential" value="chkSEW" />
        Worldwide</label>
    </li>
    <!--- table tblIndOptions field = chkSE --->
    <li for="chkSENA">
      <label>
        <input type="checkbox" id="chkSENA" name="SEPotential" value="chkSENA" />North America</label>
    </li>
    <!--- table tblIndOptions field = chkSE --->
    <li for="chkSELA">
      <label>
        <input type="checkbox" id="chkSELA" name="SEPotential" value="chkSELA" />Latin America</label>
    </li>
    <!--- table tblIndOptions field = chkSELA --->
    <li for="chkSEME">
      <label>
        <input type="checkbox" id="chkSEME" name="SEPotential" value="chkSEME" />Midle East</label>
    </li>
    <!--- table tblIndOptions field = chkSEME --->
    <li for="chkSEE">
      <label>
        <input type="checkbox" id="chkSEE" name="SEPotential" value="chkSEE" />Europe</label>
    </li>
    <!--- table tblIndOptions field = chkSEE --->
    <li for="chkSEAF">
      <label>
        <input type="checkbox" id="chkSEAF" name="SEPotential" value="chkSEAF" />Europe</label>
    </li>
    <!--- table tblIndOptions field = chkSEAF --->
    <li for="chkSEA">
      <label>
        <input type="checkbox" id="chkSEA" name="SEPotential" value="chkSEA" />Asia</label>
    </li>
    <!--- table tblIndOptions field = chkSEA --->
    <li for="chkSMag">
      <label>
        <input type="checkbox" id="chkSMag" name="SEPotential" value="chkSMag" />North Africa</label>
    </li>
    <!--- table tblIndOptions field = chkSMag --->
    <li for="chkSEEAF">
      <label>
        <input type="checkbox" id="chkSEEAF" name="SEPotential" value="chkSEEAF" />
        East Africa</label>
    </li>
    <!--- table tblIndOptions field = chkSEEAF --->
    <li for="chkSEWA">
      <label>
        <input type="checkbox" id="chkSEWA" name="SEPotential" value="chkSEWA" />
        West Africa</label>
    </li>
    <!--- table tblIndOptions field = chkSEWA --->
  </ul>
</fieldset>
<div class="clear"></div>