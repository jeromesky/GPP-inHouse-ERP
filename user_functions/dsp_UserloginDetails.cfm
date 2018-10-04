<cfinclude template="qry_UserloginDetails.cfm"><cfoutput>
<form action="../user_edit/Update_Individual.cfm" method="post" >
<fieldset >
  <legend>User Login details</legend>        
    <b>UserName</b> <i class="NoFormat"><input type="text" name="" value="#get.username#"></i>
    <b>Password</b> <i class="NoFormat"><input type="text" name="" value="#get.password#"></i>
    <input type="hidden" name="oldValue" value="#Trim(get.username)#" />
    <input type="hidden" name="fieldname" value="username" />
    <input type="hidden" name="id" value="#form.userid#" />
    <b></b><i class="NoFormat"><button style="">Save</button></i>
</fieldset>
</form></cfoutput>