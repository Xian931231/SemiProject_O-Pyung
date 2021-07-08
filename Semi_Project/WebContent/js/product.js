function likeProduct(id,product_no){
	$.ajax({
		url:"memberinfo.do?command=like",
		type:"post",
		data:{
			id : 'ADMIN',
			ptno : product_no
		},
		success : function(data){
			alert("성공");
			
		},
		error:function(){
			alert("실패");
		}
	})
}