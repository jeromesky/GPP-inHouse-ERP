<cfset nocache = '#TimeFormat(Now(),"HHssmmhh")#'>

<cfoutput><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>Petro21:VO ~ Announcements</title>

<script src="/_js/jquery-1.4.3.min.js" type="text/javascript"></script>
<script src="/_js/jquery-ui-1.8.6.custom.min.js" type="text/javascript"></script>
<script src="_incl/fbautocomplete.js" type="text/javascript"></script>

<script type="text/javascript">
		$(function(){
			$('##fbautocomplete_id').fbautocomplete({
				selected: []	
			});
    });
</script>

<script language="javascript">
function toggle_visibility(hideme)
{
	var e = document.getElementById(hideme);
	if(e.style.display == 'block')
		e.style.display = 'none';
	else
		e.style.display = 'block';
}
</script>

<link href="/_css/ui-lightness/jquery-ui-1.8.6.custom.css" rel="stylesheet" type="text/css"></link>
<link rel="stylesheet" type="text/css" href="_incl/temp.css?nc=#nocache#" />
<link rel="stylesheet" type="text/css" href="_incl/fbautocomplete.css?nc=#nocache#"></link>

<style type="text/css">
  .hidden {display:none;}
  td {font-size:12px;}
</style>

</head>

<body></cfoutput>