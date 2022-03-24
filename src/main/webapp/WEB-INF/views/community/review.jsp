<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="주문후기 관리" name="title"/>
</jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- content-wrapper -->
<div class="content-wrapper">
<section class="content-header">
    <h1>
        주문후기 관리
        <small>주문후기 list</small>
    </h1>

    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">주문후기 관리</li>
    </ol>
</section>

<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-body">
                    <label style="margin-top:5px;">총 0건</label>
                    <div class="box-tools pull-right" style="margin-bottom:5px;">
                        <form name="form_search" method="post" action="?tpf=admin/community/review">
                        <div class="has-feedback">
                            <span>
                                <input type="text" name="keyword" id="keyword" value="" class="form-control input-sm" placeholder="검색"/>
                                <span class="glyphicon glyphicon-search form-control-feedback"></span>
                            </span>
                        </div>
                    </div>

                    <div class="box-tools pull-right" style="margin-bottom:5px;">
                        <div class="has-feedback">
                            <select name="field" class="form-control input-sm" style="float:left; width:130px;">
      							<option value="writer">작성자</option>      
      							<option value="productName">제품명</option>                            
      						</select>
                        </div>
                        </form>
                    </div>

                    <table class="table table-bordered table-hover">
                        <form name="form_list" method="post" action="?tpf=admin/community/review_process">
                            <input type="hidden" name="mode" id="mode">
                            <input type="hidden" name="review_code" value="<br /><b>Notice</b>:  Undefined variable: review_code in <b>/home/demoshop/public_html/html/admin/community/review.html</b> on line <b>45</b><br />">
                            <thead>
	                            <tr>
	                                <td style="width:30px;"><input type="checkbox" name="select_all" onclick="selectAllCheckBox('form_list');" /></td>
	                                <td style="width:60px;">NO</td>
	                                <td style="width:100px;">작성자</td>
	                                <td style="width:150px;">구입상품</td>
	                                <td>내용</td>
	                                <td style="width:100px;">후기종류</td>
	                                <td style="width:120px;">등록일</td>
	                                <td style="width:120px;">명령</td>
	                            </tr>
                            </thead>
                            <!-- 리뷰가 있을 경우 조회하기 -->
                            <tbody>
                                <c:choose>
                                    <c:when test="${ empty reviewList }">
                                    	<tr>
                                        	<td colspan="10"><br>등록된 자료가 없습니다.<br><br></td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="review" items="${ reviewList }"> 
                                        	<tr>
	                                            <td><input type="checkbox" name="select_review" /></td> <!-- common.js에 name 값이 list[] 로 되어있음 -->
	                                            <td>${ review.reviewNo }</td>
	                                            <td>${ review.writer }</td> 
	                                            <td>${ review.productName }</td> 
	                                            <td>${ review.reviewContent }</td> 
	                                            <td>${ review.reviewCategoryName }</td>
	                                            <td><fmt:formatDate value="${ review.reviewDate }" pattern="yyyy-MM-dd"/></td> 
	                                            <td><button type="button" class="btn btn-primary btn-xs" onclick="review_detail(${ review.reviewNo })">상세보기</button></td>
                                            </tr>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>     
                            </tbody>     
                            <!-- 리뷰 조회 완료 -->            
                       	</form>
                    </table>
                    <br>

                    <button type="button" onclick="selectDelete();" class="btn btn-danger btn-sm"><i class="fa fa-minus-square"></i> 선택삭제</button>

                    <div style="text-align:right;"></div>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div><!-- /.col-xs-12 -->
    </div><!-- /.row -->
</section>

<!-- 상세보기 버튼 클릭 시 모달 -->
<div class="modal fade" id="modalContent" tabindex="-2" role="dialog" aria-labelledby="myModal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form name="form_register" method="post" action="?tpf=admin/community/review_process" enctype="multipart/form-data">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabelPortfolio">주문후기 관리</h4>
            </div>
            <div class="modal-body" style="background:white;">

            <h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> 글 <span id="board_sub_title">등록</span></p></h4>
            <table class="table table-bordered">
                <tr>
                    <td class="menu">작성자</td>
                    <td align="left"><input type="text" name="name" id="name" class="form-control input-sm" readonly></td>
                </tr>
                <tr>
                    <td class="menu">한줄후기</td>
                    <td align="left"><input type="text" name="title" id="title" class="form-control input-sm" readonly></td>
                </tr>
                <tr>
                    <td class="menu">구매후기</td>
                    <td align="left"><input type="text" name="content" id="content" class="form-control input-sm" readonly></td>
                </tr>
                <tr>
                    <td class="menu">이미지</td>
                    <td align="left">
                    <p>
                        <span id="file_list"></span>
                    </p>
                    </td>
                </tr>
            </table>

            </div>
            </form>
        </div>
    </div>
</div>
</div><!-- /.content-wrapper -->

<script>

	// 모달 띄우기
	function review_detail(reviewNo){
		$("#modalContent").modal({backdrop:"static", show:true}); // backdrop : 모달 영역 밖 클릭 시 닫힘 방지 
		// console.log(reviewNo); 리뷰 번호 찍힘
		setData(reviewNo);
	}
	
	// 비동기로 모달에 값 불러오기
	function setData(reviewNo){
		$.ajax({
			url: "${pageContext.request.contextPath}/comm/review_modal",
			type: 'get',
			data: { reviewNo : reviewNo },
			success: function(result){
				// 해당 회원의 리뷰 정보 조회하기
				// console.log(result.review);
				// console.log(result.reviewImg.length);
				
				// 작성자, 한줄 후기, 구매 후기
				$("#name").val(result.review[0].writer);
				$("#title").val(result.review[0].reviewTitle);
				$("#content").val(result.review[0].reviewContent);
				
				/* 이미지
				var imgList = '';
				if(result.reviewImg.length > 0) { // 이미지가 있는 경우
					var imgSrc = '';
					for(var i = 0; i < result.reviewImg.length; i++) {
						imgSrc = result.reviewImg[i].reviewImgUrl;
						imgList += "<a download=''><img src='" + imgSrc + "' style='width:80px; cursor:pointer;'></a>";
					}
					$('#file_list').html(imgList);
				}
				else { // 이미지가 없는 경우
					$('#file_list').html('');
				}
				*/
				
			},
			error: function(textStatus, errorThrown){
				console.log("리뷰 상세 조회에 실패했습니다.");
				// console.log(textStatus);
				// console.log(errorThrown);
			}
		});
		
	}
	
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>