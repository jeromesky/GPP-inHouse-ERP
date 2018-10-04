<div id="sliderContainer">
  <div id="slidepanel">
        <div class="slideContent clearfix">
        <!--- START CONTENT HERE --->
        <div class="columns">
        			<b>Name</b>
                    <i class="NoFormat"><input type="text" name="name" id="searchValue" class="ui-corner-all"></i>
                    <b>Surname</b>
                    <i class="NoFormat"><input type="text" name="surname" id="searchValue" class="ui-corner-all"></i>
                    <b>Company</b>
                    <i class="NoFormat"><input type="text" name="company" id="searchValue" class="ui-corner-all"></i> 
                    <b>Email</b>
                    <i class="NoFormat"><input type="text" name="strEmail" id="searchValue" class="ui-corner-all"></i>
                    <b>Invoice No</b>
                    <i class="NoFormat"><input type="text" name="InvoiceNo_LNK" id="searchValue" class="ui-corner-all"></i>
                    <b>Country</b>
                    <i class="NoFormat"><input type="text" name="country" id="searchValue" class="ui-corner-all"></i>
                    <b>Status</b>
                    <i class="NoFormat">
                    <select name="STATUS" id="STATUS" class="selectLis">
                    <option value="C">Current</option>
                    <option value="A">Archived</option>
                    <option value="*" selected >ANY</option>
                    </select>
                    </i>
                    <b></b>
                    <i class="NoFormat"><input name="search" value="Search" type="submit"> &nbsp;&nbsp;&nbsp;<input type="reset" value="Clear"></i>
          </div>      
          <div class="columns">     
        		<ul class="slideMenu">
                	<li><a href="javascript:ExternalModalOpen('../staff/index.cfm', 0, 0, 820, 520, 'Manage Staff');">Manage Staff</a></li>
                    <li><a href="javascript:ExternalModalOpen('../Directory_Source/index.cfm', 0, 0, 820, 520, 'Add New Directory');">New Directory</a></li>
                    <li><a href="javascript:ExternalModalOpen('../Events_New/dsp_upcomingList.cfm', 0, 0, 820, 520, 'List conferences');">List Upcoming events</a></li>
                    <li><a href="javascript:ExternalModalOpen('../Venues/index.cfm', 0, 0, 920, 620, 'Event Venues and hotel lists');">Hotels and Venues</a></li>
                    <li><a href="javascript:ExternalModalOpen('../Cities/index.cfm', 0, 0, 920, 620, 'Clean Cities');">Clean Cities</a></li>
                    <li><a href="javascript:ExternalModalOpen('../contract/indexnew.cfm', 0, 0, 980, 620, 'Contracts');">Contracts</a></li>
                    <li><a href="javascript:ExternalModalOpen('../contacts/index.cfm', 0, 0, 960, 620, 'Contacts');">Contacts</a></li>
                 </ul>
        	</div>
            <div class="columns">
            </div>
          <!--- END CONTENT HERE ---->
          <div style="height:120px"></div>
        </div>
  </div>
  <!-- The tab to pull down -->
  <div class="slideTab">
        <ul class="tabButton">
          <li class="left">&nbsp;</li>
          <li id="slideToggle"> <a id="slideOpen" class="slideOpen" href="#">Open Panel</a> <a id="slideClose" style="display: none;" class="slideClose" href="#">Close Panel</a> </li>
          <li class="right">&nbsp;</li>
        </ul>
  </div>
</div>