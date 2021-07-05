window.onload = function(){
	
}

var msnry = new Masonry('.card-list',{
    itemSelector: '.card-post',
    percentPosition: true,
    gutter : 20
});

imagesLoaded('.card-list').on('progress',function(){
    msnry.layout();
});



$(function(){
	var $box = $("<div>").addClass("box");
	$(".commu-p:first").wrap($box);
    
	$(".commu-p").on('click',function(){
		$(".commu-p").each(function(){
			if($(this).parent().is(".box")){
				$(this).unwrap(".box");
				$(this).unwrap(".strong");
			}
                });
		$(this).wrap($box);
	});
});



var myModal = document.getElementById('modal')
var myInput = document.getElementById('textarea')

myModal.addEventListener('shown.bs.modal', function () {
	$(this).find('form')[0].reset();
	imgPreview.src = "";
	$('.modal-img').hide();
	myInput.focus();
})


function getImage(imagename){
	var newimg = imagename.replace(/^.*\\/,"");
	$('#display-img').html(newimg);

	const [file] = imageupload.files;
	if(file){
		imgPreview.src = URL.createObjectURL(file);
	}

	$(".modal-img").show();
}
