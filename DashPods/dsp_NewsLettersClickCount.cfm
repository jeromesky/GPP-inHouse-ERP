<cfinclude template="qry_NewsLettersClickCount.cfm">
<div class="widgit_NewsletterClickCount">
<cfoutput query="getNewsClickCount">
<h4 id="#getNewsClickCount.newsid#">#getNewsClickCount.newsletterName#</h4>
<div id="NewsClickCount_#getNewsClickCount.newsid#"></div></cfoutput>
</div>
<script type="text/javascript">
$(document).ready(function(){
		$(".widgit_NewsletterClickCount h4").click(function(){
						var getEventID = $(this).attr("id");
						//clean div
						//var content = $.trim($("#left-content).html()).length;
						if ($( "#NewsClickCount_"+getEventID).html().length == 0 ){
						//if ($('#left-NewsClickCount_'+getEventID+':empty') == true ){
								loadEvents(getEventID);
				}else{
						$('#NewsClickCount_'+getEventID).toggle("fast");
				}
		});

	function loadEvents(id){
		$.post('../DashPods/dsp_NewsLettersClickCount_Items.cfm', {newsleterID: id}, function(data) {$('#NewsClickCount_'+id).html(data).OpenVertically(500); });
		}
});
</script>