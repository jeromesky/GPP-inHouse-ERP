<script type="text/javascript">  
$(document).ready(function(){
	$('#bannerOrderSave').submit(function() { 
		$(this).ajaxSubmit({success: function(){ $("#message").html("Banner Order saved "); } <!---$("#message").html("Banner Order saved ");--->
	}); 
	return false; 
	});
});
</script>

<cfquery name="get" datasource="#dsnP21#">
SELECT  
         [link]
         ,[img]
         ,[id]
         ,[banners2NewsletterID]
         ,[bannerOrder]
FROM      
        [Newsletters_Get_Banneres] 
WHERE 
        [newsletterID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#"> 
        AND 
        [bannerType] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.secondaryid#"> 
</cfquery>   

<form action="../newsletters/update_Newsletters.cfm" method="post" id="bannerOrderSave">
<table border="0" cellspacing="1" cellpadding="0">
<cfoutput query="get"><tr>
    <td><img src="http://www.petro21.com/advertising/#get.img#"></td>
    <td><input name="#get.banners2NewsletterID#" type="text" style="width:25px" value="#get.bannerOrder#"></td>
  </tr></cfoutput>
  <tr>
    <td><div id="message"></div></td>
    <td><input type="submit" value="save"><input type="hidden" name="order" value="1"></td>
  </tr>
</table></form>