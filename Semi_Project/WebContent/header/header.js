const toggleBtn = document.querySelector('.navbar_toogleBtn');
const menu = document.querySelector('.navbar_menu');
const search = document.querySelector('.navbar_search_bar');
const header = document.querySelector('.header');

toggleBtn.addEventListener('click',function(){
    
    menu.classList.toggle('active');
    search.classList.toggle('active');
});

$(function(){
	var $box = $("<div>").addClass("box");
	
	$(".navbar_submenu").on('click',function(){
		$(".navbar_submenu").each(function(){
			if($(this).parent().is(".box")){
				$(this).unwrap(".box");
				$(this).unwrap(".strong");
			}
                });
		$(this).wrap($box);
	});
});