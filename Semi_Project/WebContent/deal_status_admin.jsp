<!-- 거래상태 관리자 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 인코딩 처리 -->
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="./css/deal_status_admin.css">
    <link rel="icon" type="image/x-icon" href="./img/product/assets/2222.ico" />
    <script src="./js/deal_status.js" defer></script>
    <script src="https://cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>
    <title>O_PYUNG</title>
</head>
<body>
	<!-- header 추가 -->
	<%@ include file="header/header.jsp" %> 

		<!-- 관리자 확인 -->
	<%
		if(role == null ||!role.equals("ADMIN")){
			response.sendRedirect("index.jsp");
		}
	%>

	
   	<!-- header 공간 확보 -->
    <article class="container">
        <form action="deal.do?command=adminChk&dealno=${dealdto.deal_no }" method="post">
        <input type="hidden" name="id" value="${id }">

            <section class="status">

                <h3>진행 상태</h3>
                <div class="status-img">
                    <img src="#" alt="">
                </div>

                <h3>검수 내역</h3>
                <!-- web_edotor -->
		        <div class="web_editor">
		            <!--업로드 api-->
		            <input type="hidden" role="uploadcare-uploader" name="my_file" id="uploadedImage" />
		            
		            <textarea id="ckeditor" class="ckeditor" name="content" >${chkdto.check_content }</textarea>
		            <script type="text/javascript">
		                
		                CKEDITOR.replace( 'ckeditor' ,
		                                {height: 400});
		                
		            </script>
		            <script>
					  UPLOADCARE_PUBLIC_KEY = 'b0d4d56a64e1f511c63f';
					</script>
		            <script src="https://ucarecdn.com/libs/widget/3.x/uploadcare.full.min.js" charset="utf-8"></script>
		            <script type="text/javascript">
	
			            var singleWidget = uploadcare.SingleWidget('[role=uploadcare-uploader]')
			            	
			            singleWidget.onUploadComplete(function(info){
			                var oEditorData = CKEDITOR.instances.ckeditor.getData();
			                var imgUrl = '<br><img src="'+info.cdnUrl+'" style="width:100%;object-fit:cover;">';
			                CKEDITOR.instances.ckeditor.setData(oEditorData + imgUrl);	    
	
			            });
			            
		            
		            </script>
		        </div>
                
            
            </section>
            
            <section class="right">
                <div>
                    <div class="deal-info">
                        <h3>거래 상세정보</h3>
                        <table>
                            
                            <col style="width:40%;">
                            <col >

                            <tr>
                                <td >상품</td>
                                <td class="td2"><a href="#" style="color: white;">${ptdto.product_title }</a></td>
                            </tr>
                            <tr>
                                <td >판매자</td>
                                <td class="td2">${siddto.mb_id }</td>
                            </tr>
                            <tr>
                                <td >구매자</td>
                                <td class="td2">${biddto.mb_id }</td>
                            </tr>
                            <tr>
                                <td>배송상태</td>
                                <td class="td2">${dealdto.schedule_status }</td>
                            </tr>      
                            <tr class="tr-price">
                                <td>검수자</td>
                                <td class="td2">${id }</td>
                            </tr>
                            
                        </table>      
                        
                    </div>
            
                    <div class="btns order gap-2">
                        <input type="submit" class="btn btn-danger" value="완료"></input>
                        <button class="btn btn-primary">취소</button>
                    </div>
                </div>
                

            </section>
        </form>
    </article>

    
</body>
</html>