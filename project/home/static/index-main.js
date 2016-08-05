$('header ul').on('mouseover','li',function(){
	$(this).find('em').addClass('wi1');
});
$('header ul').on('mouseout','li',function(){
	$(this).find('em').removeClass('wi1');
});

$(function() {
    $('.banner').unslider({
    	animation: 'fade', autoplay: true, arrows: false
    });
});