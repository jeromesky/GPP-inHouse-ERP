<script type='text/javascript'>

$(document).ready(function() {
					var self = this;
				self.input = $("#heighlight").select().focus();   
				self.performSearch = function() {//handles searching the document
					var phrase = self.input.val().replace(/^\s+|\s+$/g, "");//create a search string				
					phrase = phrase.replace(/\s+/g, "|");
					if (phrase.length < 3) { return; }	//make sure there are a couple letters					
					phrase = ["\\b(", phrase, ")"].join("");//append the rest of the expression
					var count = 0;//search for any matches
					$("h1, h3, p, div").each(function(i, v) {
						//replace any matches
						var block = $(v);
						block.html(
							block.text().replace(
								new RegExp(phrase, "gi"), 
								function(match) {
									count++;
									return ["<span class='highlight'>", match, "</span>"].join("");
								}));
					});
					$(".result-count").text(count + " results on this page!");//update the count
					self.search = null;//clear this search attempt//should be gone anyways...
				};
				self.search;
				self.input.keyup(function(e) {
					if (self.search) { clearTimeout(self.search); }
						self.search = setTimeout(self.performSearch, 300);
				});
});
</script>
 	<div  class="ui-corner-all marginBottom15  ui-widget ui-widget-content  podForm podBgFade">
        	<fieldset>
            	<legend>search page</legend>
                    <input type="text" id="heighlight" />
            </fieldset>
        </div>