$(document).ready(function(){
	$("#send-question").fancybox({
    maxWidth	: 500,
		maxHeight	: 280,
		fitToView	: false,
		width		: 400, //'30%',
		height		: 280, //'45%',
		autoSize	: false
		//overlay : null
		//type : 'inside'
    //,helpers:  {
    //    overlay : null,
    //    title:  {
    //        type : 'inside'
    //    }
    // }
	});
	//Set default open/close settings
	$('.acc_container').hide(); //Hide/close all containers
	$('.acc_trigger:first').addClass('active').next().show();
	//Add "active" class to first trigger, then show/open the immediate next container

	//On Click
	$('.acc_trigger').click(function(){
		if( $(this).next().is(':hidden') ) { //If immediate next container is closed...
			$('.acc_trigger').removeClass('active').next().slideUp(); //Remove all .acc_trigger classes and slide up the immediate next container
			$(this).toggleClass('active').next().slideDown(); //Add .acc_trigger class to clicked trigger and slide down the immediate next container
		}
		return false; //Prevent the browser jump to the link anchor
	});
});
