/*

[Main Script]

Project: Bluishost
Version: 1.1
Author : themelooks.com

*/

(function ($) {
    'use strict';
    
    
	$( function(){
			
		/* ------------------------------------------------------------------------- *
        * Mail Chimp ajax
        * ------------------------------------------------------------------------- */
				
        var $subscribeForm = $('#subscribe_submit');
     
		
        $subscribeForm.on('submit', function () {

			var $t = $(this),
			email = $('#sectsubscribe_email').val();
			$.ajax({
				
				type: 'POST',
				url: subscribeajax.action_url,
				data: {
				  sectsubscribe_email: email,
				  action: 'bluishost_subscribe_ajax'
				},
				success: function( data ){
					
					console.log( data );

				  $(".newsletter").append(data);
				  
				}
			});
          
          return false;
		  
        });

		
	} );
     
    
})(jQuery);
