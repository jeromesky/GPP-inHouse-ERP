<script type='text/javascript' src='../_js/fullcalendar.min.js'></script>
<link rel='stylesheet' type='text/css' href='../_css/fullcalendar.css' />
<script type='text/javascript'>

$(document).ready(function() {
	
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		
		$('#calendar').fullCalendar({
			
			eventRender: function(event, element) { 
            	element.find('.fc-event-title').append("<br/>" + event.description + "<br/>" + event.events + "<br/>job id: " + event.jobID);
				
				if(typeof event.completed != "undefined" && event.completed == 1 ) {
							element.addClass('fc-event-skin-completed').removeClass('fc-event-skin').find('.fc-event-skin').addClass('fc-event-skin-completed').removeClass('fc-event-skin');
					} 
        	},					
			eventClick: function(calEvent, jsEvent, view) {
					//alert('Event: ' + calEvent.id + ' id: ' + );
					openWindow({ url:'../tasks/index.cfm', param: {'packageID': calEvent.id, 'eventID': calEvent.eventid}, Args: modals.tasks});	
			 },
			eventSources: [
       	 		{
					url: '../tasks/JSON_tasks.cfm',
					type: 'POST'//,
					//color: 'blue',
					//textColor: 'white'
       	 		}
    		],
			loading: function(){ },
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,basicWeek,basicDay'
			}
		});
		////////	
});

</script>
<div class="c12">
	<div id='calendar' style="margin-top:10px"></div>
</div>
<div class="c2">

	<cfinclude template="dsp_menu.cfm">


</div>