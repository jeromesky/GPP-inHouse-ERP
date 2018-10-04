<!--- CLEAN PAST BANERS FROM BANNERS TO NEWSLETTERS --->
        <cfquery name="find_expired_Baneers" datasource="#dsnp21#">
        SELECT  id
        FROM  newsletter_banners 
        WHERE eventdate <= <cfqueryparam cfsqltype="cf_sql_date" value="#now()#"> 
        </cfquery>
        
        <cfif ListLen(valuelist(find_expired_Baneers.id, ","), ",") >
        <cfquery name="find_expired_Baneers" datasource="#dsnp21#">
        DELETE 
        FROM banners2Newsletter 
        WHERE bannerid IN (#valuelist(find_expired_Baneers.id, ",")# )
        </cfquery>
        </cfif>

<!--- SELECT NEWSLETTERS --->
<cfquery name="newsletter" datasource="#gpp#">
        SELECT  newsletterName, newsletterid
        FROM newsletters 
        GROUP BY areaID, newsletterName, newsletterid
</cfquery>

<cfset bannerTypes = "1,2,11,10">
<cfset Available_banners = "">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Newsletter Admin</title>
<link href="../styles/indexV2.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="../Javascript/jquery1.4.js"></script>
<script type="text/javascript" src="../javascript/jquery.form.js"></script>
<script type="text/javascript" src="../javascript/jquery.qtip.R54.js"></script>

<!---<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.min.js"></script>
<link type="text/css" href="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.css" rel="stylesheet" />
<link type="text/css" href="http://www.petro21.com/my-office/javascript/UI/jquery.ui.all.css" rel="stylesheet" />--->

<link type="text/css" href="http://www.petro21.com/my-office/javascript/UI-1.8/jquery-ui-1.8rc3.custom.css" rel="stylesheet" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/UI-1.8/jquery-ui-1.8rc3.custom.min.js"></script>

<!---<link type="text/css" href="http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/jquery-ui-1.7.2.custom.css" rel="stylesheet" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/jquery-ui-1.7.2.custom.min.js"></script>--->
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/jquery.jeditable.UIdatepicker.js"></script>

<script type="text/javascript">
$(document).ready(function() { 

<!---    $('form').live("submit" , function() { 
		$(this).ajaxSubmit( { clearForm: false, success: function(){  $(this).html("");   }}); 
		return false; 
    }); --->

	$("#Newsletter_tabs").tabs();
	$("a", "#toolbar").button();
  
$("span").qtip({
   content: {text:  $(this).attr('alt') },
   show: 'mouseover',
   hide: 'mouseout',
   position: { corner: {target: 'bottomMiddle', tooltip:'topMiddle' }  },
   style: { padding: 5, background: '#ffffff', color: 'black', textAlign: 'left', border: { width: 1, radius: 2, color: '#046ed7' },
   name: 'dark' ,
   tip:'topMiddle'
   }
});

var max1 = 6;
var max2 = 6;
var max10 = 1;
var max11 = 3;

$('input:checkbox').change(function(){
	var checkboxValue			= $(this).attr("checked") ? $(this).val() : 0
	var get_newsletterID		= $(this).attr("name");
	var get_bannerID	 		= $(this).attr("id");
	var get_bannerType 			= $(this).attr("alt");
		if(checkboxValue == 1 ){
				//alert("On");
				$.post("update_Newsletters.cfm", { "newsletterID": get_newsletterID, "bannerid": get_bannerID, "bannerType": get_bannerType,  "value" : 1 });
				$(this).parent().css('background-color', '#66FF99');
			}else{
				//alert("Off");
				$.post("update_Newsletters.cfm", {"newsletterID": get_newsletterID, "bannerid": get_bannerID, "bannerType": get_bannerType, "value" : 0 });
				$(this).parent().css('background-color', '#FFCC66');
			}
});
});

 ////////////MODAL EXTERNAL CONTENT 
 		function ExternalModalOpen(URLToLoad, id, otherid, width, height, title){		
					$("#modalExternal").dialog("open");
					$("#modalExternal").load(URLToLoad, {id:id, secondaryid: otherid }).dialog( {
					 		'modal' : true,
							'title' : title, 
							forcePlaceholderSize: true , 
							height : height, 
							width : width
							//buttons: {	OK: function() {	$(this).dialog('close');	 , Cancel: function() {	$(this).dialog('close');	}, }
							});		
			}
function loadform(bannerID){
				$("#formArea").load("../newsletters/banners.cfm", {"bannerID" : bannerID })
}
function loadLists(bannerType){
				$("#listArea").load("../newsletters/dsp_bannerList.cfm", {"bannerType" : bannerType })
}

function deleteRecord(id, table){
			$.post("../newsletters/qry_DeleteBanner.cfm", { id: id, table: table }, function(){ 
			$("#rec_"+id).animate( { backgroundColor: "#fbc7c7" }, "fast").animate({ opacity: "hide" }, "slow").remove("");
			 });
		}
</script>
<style type="text/css">
td {border-left:1px dotted #c6e4fc; border-bottom:1px dotted #c6e4fc}
th {border-left:1px dotted #333333; border-bottom:1px dotted #333333; padding:2px}
table{}
.newsletterActive{ background-color:#66FF99}
</style>
</head>
<cfoutput>
<body>
   
<cfinclude template="../nav/testNav2009V2.cfm">
<div id="outer">
	<div id="iner">
    <div id="Newsletter_tabs">
			<ul>
				<li><a href="##tabs-1">Event Banners</a></li>
				<li><a href="##tabs-2">External Banners</a></li>
                <li><a href="##tabs-11">Feature Banners</a></li>
                <li><a href="##tabs-10">Corporate Banner</a></li>
                <li><a href="##banners">Manage Banners</a></li>           
			</ul>    

<cfloop list="#bannerTypes#" index="T" delimiters=",">    
   <cfquery name="banners" datasource="#dsnP21#">
      SELECT  id 
            ,title AS bannerDescription
            ,id AS BannerID
            ,img AS filename
            ,bannerType
      FROM         newsletter_banners 
      WHERE 
          eventdate > #now()# 
          AND BannerType = #T#
      ORDER BY 
          eventdate
  </cfquery>

<div id="tabs-#T#">
    <table border="0" cellpadding="0" cellspacing="0" id="bannersButton">
    	<tr>
			<th style="background-color:##DFF1FF; color:##000"><cfif T EQ 1>GPP Button 
				<cfelseif T Eq 2>External Button 
                <cfelseif T Eq 10>Corporate
                <cfelseif T Eq 11>Top Banner</cfif></th>
<cfloop query="banners"><th><span alt="<img src=http://www.petro21.com/advertising/#banners.filename# alt=Loading...>"><cfif len(banners.bannerDescription) GT 10>#Left(banners.bannerDescription, len(banners.bannerDescription)-5)#<cfelse>#banners.bannerDescription#</cfif></span></th>
                <cfset Available_banners = listAppend(Available_banners, banners.id,",")></cfloop>
            </tr><cfloop query="newsletter"><cfsilent>
       <cfquery name="selectedBanners" datasource="#dsnP21#">
         	SELECT [bannerID]
			FROM banners2Newsletter 
        	WHERE newsletterID = #newsletter.newsletterID# 
            AND bannerType = <cfqueryparam cfsqltype="cf_sql_integer" value="#T#">  
        </cfquery>
        <cfset Selected_Banner_List = valueList(selectedBanners.bannerID, ",")>
        	</cfsilent><tr onMouseOver="style.backgroundColor='##D8E2F9';style.cursor='hand'" onMouseOut="style.backgroundColor='##ffffff';">
            	<td><a href="javascript:ExternalModalOpen('../newsletters/dsp_BannerOrder.cfm', #newsletter.newsletterid#, #T#, 900, 450, 'Order Banners');">#newsletter.newsletterName#</a></td>
<cfloop list="#Available_banners#" index="i" delimiters=","><td<cfif ListFindNoCase(Selected_Banner_List, i, ",") NEQ 0> class="newsletterActive"</cfif>><input type="checkbox" name="#newsletter.newsletterid#" id="#i#" value="1" alt="#T#"<cfif ListFindNoCase(Selected_Banner_List, i, ",") NEQ 0> checked</cfif> /></td></cfloop>
    		</tr></cfloop>
    	</table>
 </div><!--- /pane ---><cfset Available_banners = ""></cfloop>
<div id="banners">
		<div id="toolbar" class="ui-widget-header ui-corner-all">
        	<a href="javascript:loadform(0);">New Banner</a>
            <a href="javascript:loadLists(1);">Event Banners</a>
            <a href="javascript:loadLists(2);">External Banners</a>
            <a href="javascript:loadLists(11);">Feature Banners</a>
            <a href="javascript:loadLists(10);">Corporate Banners</a>
        </div>
      	<div id="formArea"></div>
        <div id="listArea"></div>
</div>
</div>
    </div>
 </div>
 <div id="modalExternal"></div>
</body></cfoutput>  
</html>