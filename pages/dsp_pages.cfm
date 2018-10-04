<link rel="stylesheet" type="text/css" href="../_css/table.css" />

  <div class="Wider">
   <div class="table">
    <div class="th">
     <div class="td"><a href="?fa=add">Add</a></div>
     <div class="td">Content Name</div>
     <div class="td">Content Label</div>
     <div class="td">Updated/Added</div>
     <div style="clear: both;"></div>
    </div><cfoutput query="qryPages">   
    <div class="tr">
     <div class="td"><a href="?fa=edit&id=#contentID#">Edit</a></div>
     <div class="td">#contentName#</div>
     <div class="td">#contentLabel#</div>
     <div class="td"><cfif #contentDateUpdated# EQ ''>#contentDateUpdated#<cfelse>#contentDateAdded#</cfif></div>
     <div style="clear: both;"></div>
    </div></cfoutput>  
   </div>
  </div>