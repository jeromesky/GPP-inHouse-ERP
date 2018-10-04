//$.editable.addInputType('TagDragonTitle', {
   // element : function(settings, original) {
    //    var input = $('<div id="Search_title" class="tagbox"><input type="text" name="Title" id="Title" style="width:170px"  /><input type="image" src="../img/CRM_button_OK.jpg" class="crm_button_OK"  /></div>');        
   //     $(this).append(input);
  //      return(input);
  //  },

    /* attach 3rd party plugin to input element */
//    plugin : function(settings, original) {
			//settings.onblur = 'cancel';
  //      	settings.onblur = 'submit';
			
 //          $('#Search_title', this).tagdragon({
//				'field':'Title',
//				'url':'../components/JSON_Titles.cfm',
//				'charMin' : 1, 
//				'cache' : true,
//				'max' : 10,
//				onSelectedItem: function(val) { 
						//var oldvalue = this.revert;
						//var newvalue = $('#Title').val();
						
       					//return {"value": newvalue, "oldValue" : oldvalue };
//				}
//		});
//	}
//});


/*$.editable.addInputType('autoComleteCountry', {
    element : function(settings, original) {
        var input = $('<input type="text" id="CountryName" name="CountryName" />');        
        $(this).append(input);
        return(input);
    }, */

    /* attach 3rd party plugin to input element */
   // plugin : function(settings, original) {
        //	settings.onblur = 'submit';
			
		//	$('#CountryName').autocomplete({
      							//source: '../components/JSON_country_UI.cfm',
	/*							source: function(request, response) {
        										$.ajax({
         										url: "../components/JSON_country_UI.cfm",
               									dataType: "json",
          										data: { term : request.term, nocache: randomnumber },
          										success: function(data) { response(data);  }
        										});
      										},
    							minLength: 3,
								select:function( event, ui ) { 
										$('#country_ID').val(ui.item.id);
										$(".phoneCode").html(ui.item.code);
										newcountryid = ui.item.id*/
										
										//clear city after change of Country
									/*	$.post('../user_edit/Update_Individual.cfm', {'value': 0, 'fieldname' : 'cityID' , id : userID, 'nocache': randomnumber },  function(){ $('.strCity').html(""); } ); 
										
								},*/
				/*				open: function() {
	
								},*/
							//	close: function() {
									//do something on close
									//$( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
	/*							}
			});
	}
});*/

/*
$.editable.addInputType('autoComleteCity', {
    element : function(settings, original) {
        var input = $('<input type="text" name="cityID" id="strCity" style="width:170px" class="ui-autocomplete-loading"  />');        
        $(this).append(input);
        return(input);
    },
*/
    /* attach 3rd party plugin to input element */
 /*   plugin : function(settings, original) {
			//settings.onblur = 'cancel';
        	settings.onblur = 'submit';
			
   			$('#strCity').autocomplete({
      							source: function(request, response) {
        										$.ajax({
         										url: "../components/JSON_CitiesUI.cfm",
               									dataType: "json",
          										data: { term : request.term, countryID : $('#country_ID').val(), nocache: randomnumber },
          										success: function(data) { response(data);  }
        										});
      										},
    							minLength: 3,
								select:function( event, ui ) {
										
										$('#cityID').val(ui.item.cityid);
										newcityID = ui.item.cityid
										newcityName = ui.item.cityname
								},
								change:function(event, ui) { 
										$('#strCity').val(ui.item.cityname); 
								}

		});
	}
});*/

	//		
	//$.editable.addInputType('TagDragonCountry', {
    //element : function(settings, original) {
      //  var input = $('<div id="Search_country" class="tagbox"><input type="text" name="CountryName" id="CountryName" style="width:170px"  /><input type="image" src="../img/CRM_button_OK.jpg" class="crm_button_OK"  />	</div>');        
        //$(this).append(input);
       // return(input);
   // },
    //plugin : function(settings, original) {
       // 	settings.onblur = 'submit';
         //  $('#Search_country', this).tagdragon({
			//	'field':'CountryName',
				//'url':'../components/JSON_country_TagDragon.cfm',
				//'charMin' : 3, 
				//'cache' : true,
				//'max' : 10,
				//onSelectedItem: function(val) { 
					//	$(".phoneCode").html(val.code);
					//	newcountryid = val.id
					//	newcountryname = val.tag
				//}
	//	});
//	}
//});