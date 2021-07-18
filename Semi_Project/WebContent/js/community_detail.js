const CommenttoggleBtn = document.querySelector('.card-footer-comment');
const commumenu = document.querySelector('.card-commentlist');
const commusearch = document.querySelector('.card-footer');

//댓글 리스트 온오프
CommenttoggleBtn.addEventListener('click',function(){
    
    commumenu.classList.toggle('active');
    commusearch.classList.toggle('active');
});

//댓글 리스트 출력
function getCommentList(){
	$.ajax({
		url:"comment.do?command=list",
		type:"post",
		data:{
			cmb_no : $("#cmb_no").val()
		},
		dataType:"json",
		success : function(data){
			$('#commentul').empty();
			var id = $.trim($("#id").val())
			console.log(id);
			 $.each(data, function(key, val){
             <!-- 로그 찍어주는 부분 -->
             console.log('key:' + key + ' / ' + 'ccom_no:' + val['ccom_no'] + ', ccom_cmbno :' + val['ccom_cmbNo']
						 + ', ccom_id:' + val['ccom_id'] + ', ccom_content:' + val['ccom_content'] + ', ccom_date:' + val['ccom_date']);
			
			var ccomid = $.trim(val['ccom_id'])
			
			var append = '\
				<li class="card-comment-li">\
				<a href="#" class="comment-user-img">\
				<img src="./img/community/grphic.png" alt="" class="profile-user-img-img">\
				</a>\<div class="card-comment-li-div">\
				<div class="comment-user-text">\
				<a href="#" class="comment-user-name">'+val['ccom_id']+'</a>\
				<span class="comment-user-content">'+val['ccom_content']+'</span>\
				</div>\
				<div class="comment-data">\
				<span class="date-report">\
				<span class="comment-date">'+val['ccom_date']+'</span>'
				
			if(id.length != 0){	
				append+= '<a href="#" class="comment-report-btn" data-bs-toggle="modal" data-bs-target="#report-madal" data-bs-whatever='+val['ccom_id']+'>\
				<span class="comment-report">\
				<i class="fas fa-paper-plane"></i>\
				신고\
				</span>\
				</a>'
				}
				
				append+= '</span>'
			if(ccomid == id){	
				console.log(ccomid)
				append+=	'<span class="comment-oper">\
				<a href="javascript:commentUpdate('+val['ccom_no']+');" class="comment-update">\
				<span>\
				<i class="fas fa-pencil-alt"></i>\
				수정\
				</span>\
				</a>\
				<a href="javascript:commentDel('+val['ccom_no']+');" class="comment-delete">\
				<span>\
				<i class="fas fa-eraser"></i>\
				삭제\
				</span>\
				</a>'
			}	
			
				
			append+= '</span>\
				</div>\
				</div>\
				</li>\
				'	
			$('#commentul').append(append);		
			});
			
		},
		error:function(){
			alert("실패");
		}
	})
}
getCommentList();


//댓글 달기
$(document).on('click','#comment-btn',function(){
	if($("#comment-content").val().trim() ===""){
		alert("댓글을 입력해주세요");
		$("#comment-content").val("").focus();
	}else{
		$.ajax({
			url:"comment.do?command=insertMsg",
			type:"post",
			data:{
				cmb_no : $("#cmb_no").val(),
				id : $("#id").val(),
				content: $("#comment-content").val()
			},			
			success: function(data){
				$("#comment-content").val("");
				getCommentList();
			},
			error:function(data){
				alert("실패");
			}
		})
	}
});


//댓글수정폼
function commentUpdate(index){
	$('.card-comment-submit').remove();
	$('.card-comment-div').append('<input type="button" class="card-comment-submit" onclick="javascript:update('+index+');" value="수정">');
	$('#comment-content').val("").attr('placeholder',"댓글수정").focus();
}

//댓글수정요청
function update(index){
	$.ajax({
		url:"comment.do?command=update",
		type:"post",
		data:{
			content : $("#comment-content").val(),
			ccom_no : index
		},
		success : function(){
			$('.card-comment-submit').remove();
			$('.card-comment-div').append('<input type="button" class="card-comment-submit" id="comment-btn" value="게시">');
			$('#comment-content').val("");
			alert("성공");
			getCommentList();
		},
		error : function(){
			$('.card-comment-submit').remove();
			$('.card-comment-div').append('<input type="button" class="card-comment-submit" id="comment-btn" value="게시">');
			alert("실패");
		}
	})
}

//댓글삭제
function commentDel(index){
	$.ajax({
		url:"comment.do?command=delete",
		type:"post",
		data:{
			ccom_no : index
		},
		success : function(){
			alert("성공");			
			getCommentList();
		},
		error : function(){
			alert("실패");
		}
	})
}


//신고 모달에 대상 아이디보내기
var myModalEl = document.getElementById('report-madal')
myModalEl.addEventListener('show.bs.modal', function (event) {
	var button = event.relatedTarget
  	var recipient = button.getAttribute('data-bs-whatever')
	var input = document.getElementById('reportid')
  	input.value = recipient
})
