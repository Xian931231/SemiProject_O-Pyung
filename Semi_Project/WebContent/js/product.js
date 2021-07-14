function likeProduct(id,product_no){
	if(id == null || id == ""){
		location.href='main.do?command=login';
	}else{
	$.ajax({
		url:"memberinfo.do?command=like",
		type:"post",
		data:{
			id : id,
			ptno : product_no
		},
		success : function(data){
			alert("성공");
			location.reload();
		},
		error:function(){
			alert("실패");
		}
	})
	}
}

function isLike(id,ptno){
	$.ajax({
		url:"memberinfo.do?command=isLike",
		type:"post",
		data:{
			id : id,
			ptno : ptno
		},
		success : function(data){
			console.log(data);
			if(data == 'true'){
				$('#ptno'+ptno).append('<i class="fas fa-bookmark"></i>');
			}else{
				$('#ptno'+ptno).append('<i class="far fa-bookmark"></i>');
			}
		},
		error:function(){
			alert("실패");
		}
	})
}


function isLikeList(id,listNo,ptno){
	$.ajax({
		url:"memberinfo.do?command=isLike",
		type:"post",
		data:{
			id : id,
			ptno : ptno
		},
		success : function(data){
			console.log(data);
			if(data == 'true'){
				$('#'+listNo+'ptno'+ptno).append('<i class="fas fa-bookmark"></i>');
			}else{
				$('#'+listNo+'ptno'+ptno).append('<i class="far fa-bookmark"></i>');
			}
		},
		error:function(){
			alert("실패");
		}
	})
}