<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
<script type="text/javascript" src="../javascript/jquery.js" ></script>
<script type="text/javascript" >

	window.onload = function()
	{
		var lis = document.getElementsByTagName('li');
		for(i = 0; i < lis.length; i++)
		{
			var li = lis[i];
			if (li.className == 'headlink')
			{
				li.onmouseover = function() { this.getElementsByTagName('ul').item(0).style.display = 'block'; }
				li.onmouseout = function() { this.getElementsByTagName('ul').item(0).style.display = 'none'; }
			}
		}
	}
	
	$(document).ready(function(){
		$('li.headlink').hover(
			function() { $('ul', this).css('display', 'block'); },
			function() { $('ul', this).css('display', 'none'); });
	});

</script>
<style type="text/css">
<!--
       li.headlink ul { display: none; }
       li.headlink:hover ul { display: block; }
	   .menuTopLeft {position: relative; float: left; padding:15px; margin-left:1px; background-color:#990000}
-->
</style></head>

<body>

<ul id="cssdropdown">
<li class="headlink">
	<div class="menuTopLeft"><a href="mine.html?search_engines">Search Engines</a></div>
	 <ul>
     		<ul>
            	  <li><a href="http://google.com/">Google</a></li>
                  <li><a href="http://yahoo.com/">Yahoo</a></li>
                  <li><a href="http://live.com/">Live Search</a></li>
      		</ul>
            <ul>
                  <li><a href="http://google.com/">Google</a></li>
                  <li><a href="http://yahoo.com/">Yahoo</a></li>
                  <li><a href="http://live.com/">Live Search</a></li>
            </ul>
	 </ul>
	 </li>
	  <li class="headlink">
	  <div class="menuTopLeft"><a href="mine.html?shopping">Shopping</a></div>
         <ul>
	  <li><a href="http://amazon.com/">Amazon</a></li>
	  <li><a href="http://ebay.com/">eBay</a></li>
	  <li><a href="http://craigslist.com/">CraigsList</a></li>
	 </ul>
 </li>
</ul>

</html>