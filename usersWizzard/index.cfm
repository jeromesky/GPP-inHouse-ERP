<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
<link type="text/css" href="../_js/UI/jquery-ui.css" rel="stylesheet" />	
<script type="text/javascript" src="../_js/jquery.js"></script>
<script type="text/javascript" src="../_js/UI/jquery-ui.js"></script>
<script type="text/javascript" src="../_js/jquery.jWizard.js"></script>
<script type="text/javascript" src="../_js/jquery.validate.js"></script>
<style type="text/css">
/* jWizard-specific configuration */
.jw-widget {
	overflow: hidden;
}
.jw-header {
	padding: 1em;
}
	.jw-header h2 {
		margin: 0;
		padding: .3em 0;
	}
	.jw-header .jw-counter {
		float: right;
	}
	.jw-title {
		padding: 0 1em;
	}

.jw-content {
	padding: .5em 0;
}
	.jw-menu-wrap {
		width: 10em;
		margin-right: -10em;
		float: left;
	}
		.jw-menu {
			margin: 0 .5em;
		}
			.jw-menu ol {
				list-style: none;
				margin: 0;
				padding: 0;
			}
			.jw-menu li {
				padding: .25em .5em;
				margin-bottom: .25em;
				cursor: pointer;
			}
	.jw-hasmenu .jw-steps-wrap {
		margin-left: 10em;
	}
	.jw-steps-wrap {
		height: 15em;
		overflow: auto;
		padding: .5em;
	}
		.jw-content p {
			margin-top: 0;
		}
		.jw-content div.jw-step {
		}

.jw-footer {
	padding: 1em;
}
	.jw-counter {
		float: left;
		padding: .2em;
	}
		/* Text: Left -- Bar: Right */
		.jw-counter.jw-left .jw-counter-text {
			float: left;
			padding: .4em;
		}
		.jw-counter.jw-left .jw-counter-progressbar {
			display: block;
			width: 6em;
			float: right;
		}
		/* Text Center-aligned over Progress Bar */
		.jw-counter.jw-center .jw-counter-text {
			float: left;
			width: 10em;
			padding: .4em;
			text-align: center;
		}
		.jw-counter.jw-center .jw-counter-progressbar {
			display: block;
		}
		/* Bar: Left -- Text: Right */
		.jw-counter.jw-right {
			text-align: right;
		}
		.jw-counter.jw-right .jw-counter-text {
			float: right;
			padding: .4em;
		}
		.jw-counter.jw-right .jw-counter-progressbar {
			display: block;
			width: 6em;
			float: left;
		}
	.jw-buttons {
		text-align: right;
	}
		.jw-buttons button {
			padding: .5em 1em;
			margin-left: 1em;
		}
</style>
<script type="text/javascript">
$(document).ready(function() {

	$("#jWizard").jWizard({
		//validate: false,	// [Dependency: jQuery Validation Plugin] (http://bassistance.de/jquery-plugins/jquery-plugin-validation/)
		//debug: false,	// Enables internal logging (Not fully implemented)

		titleHide: true,	// Determines whether or not to generate/use a title bar
		//menuEnable: true,	// Determines whether or not to generate/use a menu

		buttons: {
			cancelHide: true,	// Determines whether or not to generate/use a cancel <button>
			cancelType: "button",	// Determines the `type` attribute on the cancel <button> (http://www.w3schools.com/tags/att_button_type.asp)
			finishType: "button",	// Determines the `type` attribute on the finish <button> (http://www.w3schools.com/tags/att_button_type.asp)
			cancelText: "Cancel",	// Determines the text of the cancel <button>
			previousText: "Previous",	// Determines the text of the previous <button>
			nextText: "Next",	// Determines the text of the next <button>
			finishText: "Finish"	// Determines the text of the finish <button>
		},

		counter: {
			enable: true,	// Determines whether or not to generate/use a counter
			type: "percentage",	// Determines the type of counter (possible values: "count", "percentage")
			progressbar: true,	// [Dependency: jQuery UI ProgressBar] -- If true: Sets the background of the counter as a jQuery UI ProgressBar
			location: "footer",	// Determines where the counter is to be placed in the wizard (only "header" & "footer" supported)
			startCount: true,	// Determines whether or not to include the first step in determining progress
			startHide: false,	// Determines whether or not to show the counter on the first step
			finishCount: true,	// Determines whether or not to include the last step in determining progress
			finishHide: false,	// Determines whether or not to show the counter on the last step
			appendText: "Complete",	// The "appended text" of the counter (ie. 25% Complete)
			orientText: "right"	// Determines how to orient the text of the counter (possible values: left, center, right)
		}
	});
});
</script>

</head>

<body>
            <div id="jWizard">
                <div title="Welcome">
                    <p>Welcome to an official jWizard test page!</p>
                    <p>Feel free to play around with the many configuration options to see how the affect the behavior of the wizard. I'm sure you'll find that there are plenty of ways to use this tool and that it can fit anywhere you need it.</p>
                </div>
                <div title="Step 1">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nulla risus, luctus a pharetra eget, pretium id enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed auctor ultricies lacus, ut porta lacus vulputate at. Donec sed arcu a lorem dictum luctus. Fusce rhoncus nibh sed sapien eleifend ac dictum nibh sollicitudin. Aliquam quam nulla, placerat sed sodales feugiat, posuere a ligula. Pellentesque tristique dictum sem, in dictum tortor consequat at. Nam risus magna, varius non adipiscing sit amet, rhoncus aliquet neque. Duis nibh mauris, hendrerit nec cursus tempus, congue id nibh. Cras diam lorem, lobortis rhoncus accumsan nec, tristique sed nulla.</p>
                </div>
                <div title="Step 2">
                    <p>Pellentesque auctor, augue non commodo pharetra, felis elit rutrum orci, quis interdum eros odio quis urna. Mauris commodo turpis at quam tincidunt non accumsan purus convallis. Ut mollis, elit sit amet sodales cursus, ipsum dolor pellentesque augue, id feugiat risus nisl eget est. Vivamus malesuada, urna eget accumsan luctus, felis risus iaculis velit, et ornare lectus libero nec ante. Donec eget ligula eu libero tristique laoreet a sit amet lorem. Pellentesque eget lobortis leo. Quisque sit amet velit sapien, a ullamcorper enim. Sed vehicula turpis at lorem mattis eget convallis tortor iaculis. Mauris vehicula porttitor dui, vitae bibendum turpis porta eu. Vivamus ultricies interdum erat at varius. Mauris eu sagittis nisi. Pellentesque sed libero a lacus facilisis laoreet. Praesent ut sapien dapibus nisl mattis hendrerit at et erat. Nullam porta auctor arcu sed bibendum.</p>
                    <p>Suspendisse pharetra sem eget mauris placerat congue. Donec commodo justo nec dolor fringilla molestie. Fusce tellus purus, faucibus aliquam viverra sit amet, rutrum elementum nulla. In tellus risus, viverra sit amet molestie sed, rutrum quis tortor. Maecenas lacus diam, semper porta luctus a, egestas at diam. Proin cursus varius varius. Pellentesque lobortis pellentesque tortor, placerat posuere elit tempus vel. Nunc ac leo est, sit amet sagittis mi. Phasellus placerat hendrerit ante non dignissim. Suspendisse cursus lorem ut dolor sollicitudin tempus. Nulla tincidunt consectetur nulla, sit amet volutpat neque fringilla id. Maecenas ut libero risus, vitae pretium nibh. Phasellus congue lacus vitae tellus fermentum sit amet porttitor lorem facilisis. In fringilla interdum tellus, sit amet imperdiet eros convallis nec. Duis a vehicula ipsum. Proin tincidunt sapien a metus molestie sed condimentum leo placerat.</p>
                </div>
                <div title="Finish">
                    <p>You have completed all the steps of the wizard!</p>
                    <em>Click Finish below to Submit your Information</em>
                </div>
            </div>
</body>
</html>