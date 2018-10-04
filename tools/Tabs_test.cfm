<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>.</title>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function() {
// setting the tabs in the sidebar hide and show, setting the current tab
	$('div.tabbed div').hide();
	$('div.t1').show();
	$('div.tabbed ul.tabs li.t1 a').addClass('tab-current');

// SIDEBAR TABS
$('div.tabbed ul li a').click(function(){
	var thisClass = this.className.slice(0,2);
	$('div.tabbed div').hide();
	$('div.' + thisClass).show();
	$('div.tabbed ul.tabs li a').removeClass('tab-current');
	$(this).addClass('tab-current');
	});
});
</script>
<style type="text/css">
<!--
/* Contains the entire tabbed section */
.tabbed {
	}

/* List of tabs */.tabbed ul.tabs {
	float: left;
	display: inline;
	width: 100%;
	margin: 0;
	padding: 0;
	}
.tabbed ul.tabs li {
	list-style: none;
	float: left;
	margin: 0;
	padding: 0;
	}
.tabbed ul.tabs li a {
	overflow: hidden;
	display: block;
	margin: 0 2px 0 0;
	padding: 10px 12px;
	}
.tabbed ul.tabs li a:hover {
	}

/* The current selected tab */
.tabbed ul.tabs li a.tab-current {
	}

/* The content shown when a tab is selected */
.tabbed div {
	float: left;
	display: block;
	width: 100%;
	}

/* Set the CSS to make sure the other tabs' content isn't shown other than the first */
.tabbed div.t2, .tabbed div.t3, .tabbed div.t4 {
	display: none;
	}

/* Content for inside your tabs' divs */
.tabbed div ul {
	}
.tabbed div p {
	}
.tabbed div div {
	}
-->
</style></head>

<body>

<div class="tabbed">
	<!-- The tabs -->
	<ul class="tabs">
	<li class="t1"><a class="t1 tab" >Tab 1</a></li>
	<li class="t2"><a class="t2 tab" >Tab 2</a></li>
	<li class="t3"><a class="t3 tab" >Tab 3</a></li>
	<li class="t4"><a class="t4 tab" >Tab 4</a></li>
	</ul>

	<!-- tab 1 -->
	<div class="t1">
	<!-- Put what you want in here.  For the sake of this tutorial, we'll make a list.  -->
	<ul>
		<li>List item</li>
		<li>List item</li>
		<li>List item</li>
		<li>List item</li>
		<li>List item</li>
	</ul>
	</div>

	<!-- tab 2 -->
	<div class="t2">
	<!-- Or, we could put a paragraph -->
		<p>This is a paragraph about the jQuery tabs tutorial.</p>
	</div>

	<!-- tab 3 -->
	<div class="t3">
	<!-- Or, wesdsdsdsd could add a div -->
		<div>Something needs to go in here!</div>xcxcxcxcxcc
	</div>

	<!-- tab 4 -->
	<div class="t4">
	<!-- Why not put a few images in here? -->
		<p>
			<img src="image.gif" alt="Sample" />cxxcxcxc
			<img src="image.gif" alt="Sample" />
			<img src="image.gif" alt="Sample" />
		</p>
	</div>

</div><!-- tabbed -->
</body>
</html>
