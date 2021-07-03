$(document).ready(function(){
});

function getImage(imagename){
	var newimg = imagename.replace(/^.*\\/,"");
	$('#display-img').html(newimg);

	const [file] = imageupload.files;
	if(file){
		imgPreview.src = URL.createObjectURL(file);
	}

	$(".modal-img").show();
}