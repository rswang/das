var count = 0;
var show = '';
var hide = '';




	$(document).keydown(function(e){
    	if (e.keyCode == 39) { 
    		count += 1;

    		if (count == 1) {
				var hide = '.page2 p#first';
				var show = '.page2 p#second';
			}
			if (count == 2) {
				var hide = '.page2 p#second'
				var show = '.page2 p#third';
			}

    		$(hide).fadeOut(400);
      		$(show).delay(700).fadeIn(400);
      	}

      	if (count==0) {
			var show = '.page2 p#first'

			$('.page2 p#second').hide();
			$('.page2 p#third').hide();
      		$(show).show();
		}

      	if (e.keyCode == 38 || e.keyCode == 40) {
      		count = 0
      	} 

    });


