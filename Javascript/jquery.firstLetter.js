/*
 * firstLetter - jQuery plugin
 *
 * Customize first letter
 *
 * copyright (c) 2009 devzone.fr
 *
 * url http://www.devzone.fr/jquery-plugin-firstletter
 * author Fabrice PLANCHETTE (alias DevZone)
 * author-uri http://www.fabriceplanchette.fr
 * version 1.0
 *
 * params effect
 *  big			: Augmente la taille de la police
 *  bold		: En gras
 *  italic		: En italique
 *  lowercase	: En minuscule
 *  uppercase	: En majascule
 *
 * Exemple
 *  javascript :
 *     $('.upper')
 *	       .firstLetter({effect: 'uppercase'})
 *		   .firstLetter({effect: 'bold'});
 *  xhtml
 *     <p class="upper">du texte</p>
 *     <p class="upper"><span>du texte</span></p>
 */

(function($){

	$.fn.firstLetter = function(params){
		// paramètres par défaut
		var params = $.extend({
			effect: ''
		}, params);
		
		// process en returnant l'object
		return this.each(function(){
			// init.
			var string = $(this).html();	// chaîne à analyser
			var length = string.length;		// longueur de la chaîne à analyser
			var balise = false;				// permet de détecter si notre chaîne commence par du html
			
			// boucle sur notre chaîne caractère par caractère
			for (var i=0 ; i<length ; i++) {
				var this_letter = string.charAt(i);
				
				// on détecte une ouverture de balise html
				if (this_letter.match(new RegExp("^<$", "g"))) {
					balise = true;
				}
				// on attend sa fermeture
				else if (balise==true && this_letter.match(new RegExp("^>$", "g"))) {
					balise = false;
				}
				// ok, on a bien un caractère
				else if (balise==false) {
					// quel effet on applique ?
					if ( params.effect=='big' ) 		{ this_letter = this_letter.big(); 			}
					if ( params.effect=='bold' ) 		{ this_letter = this_letter.bold(); 		}
					if ( params.effect=='italic' ) 		{ this_letter = this_letter.italics(); 		}
					if ( params.effect=='lowercase' ) 	{ this_letter = this_letter.toLowerCase(); 	}
					if ( params.effect=='uppercase' ) 	{ this_letter = this_letter.toUpperCase(); 	}
					
					// hop, on transforme
					$(this).html( 
						string.substring(0, i) +
						this_letter +
						string.substring((i+1), length)
					);
					
					// et on arrête de boucler
					break;
				}	
			}
		});
	};
		
})(jQuery)