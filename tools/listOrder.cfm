<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Scriptaculous Lists with PHP</title>
<link rel="stylesheet" type="text/css" href="http://www.gregphoto.net/sortable/css/lists.css"/>
		<script src="../Javascript/prototype.js" type="text/javascript"></script>
		<script src="../Javascript/scriptaculous.js" type="text/javascript"></script>
		<script language="JavaScript" type="text/javascript"><!--
			function populateHiddenVars() {
									document.getElementById('categoriesListOrder').value = Sortable.serialize('categories');

									return true;
			}
			//-->
		</script>
	
<style>
#update {
	border: 1px solid #000000;
	margin-bottom: 10px;
}
#update h2 {
	background: orange;
	color: #FFFFFF;
	margin: 0;
	border: 0;
	border-bottom: 1px solid #000000;
}
h1 {
	margin-bottom: 5px;
}
</style>
</head>
<body>





<p>&nbsp;</p>

<br>
<ul id="categories" class="sortableList">
	<li id="item_1">Galleries</li>
	<li id="item_2">Art</li>
	<li id="item_3">Roadtrip</li>
	<li id="item_4">Yosemite</li>
	<li id="item_5">Animals</li>

	<li id="item_6">Australia</li>
	<li id="item_7">Wesleyan</li>
	<li id="item_8">
    	This is the seventh div.  It also has a table below with some form inputs
		<table>

			<tr><td>First Name:</td><td><input type="text"></td></tr>
			<tr><td>Nice Demo?</td><td><input type="radio"> Yes<br><input type="radio"> No</td></tr>
		</table>
    </li>
</ul>

<form action="/sortable/index.php" method="POST" onSubmit="populateHiddenVars();" name="sortableListForm" id="sortableListForm">
			<br>categoriesListOrder: 			<input type="text" name="categoriesListOrder" id="categoriesListOrder" size="60">


			<br>			<input type="hidden" name="sortableListsSubmitted" value="true">
			<input type="button" value="View Serialized Lists" class="button" onClick="populateHiddenVars();"><br>			<input type="submit" value="Submit" class="button">
		</form>
		
<br>

	

	<br><br><br>




		 <script type="text/javascript">
			// <![CDATA[
							Sortable.create('categories',{tag:'li'});
	
							// ]]>
		 </script>

		</body>

</html>
