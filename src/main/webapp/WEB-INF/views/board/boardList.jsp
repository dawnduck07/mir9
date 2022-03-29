<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="게시판 관리" name="title"/>
</jsp:include>
 <!-- content-wrapper -->
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet" href="/html/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="/html/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="//mir9.co.kr/resource/js/AdminLTE-2.4.2/bower_components/Ionicons/css/ionicons.min.css">
<!-- jvectormap -->
<link rel="stylesheet" href="//mir9.co.kr/resource/js/AdminLTE-2.4.2/bower_components/jvectormap/jquery-jvectormap.css">
<!-- Theme style -->
<link rel="stylesheet" href="//mir9.co.kr/resource/js/AdminLTE-2.4.2/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="//mir9.co.kr/resource/js/AdminLTE-2.4.2/dist/css/skins/_all-skins.min.css">
<link href="//mir9.co.kr/resource/css/admin.css" rel="stylesheet" type="text/css">
<link href="//mir9.co.kr/resource/css/jquery-ui.css" rel="stylesheet">
<!-- fullcalendar -->
<link href="//mir9.co.kr/resource/css/bootstrap-colorselector.css" rel="stylesheet">
<link href="//mir9.co.kr/resource/js/AdminLTE-2.4.2/bower_components/fullcalendar/dist/fullcalendar.min.css" rel="stylesheet" type="text/css">
<link href="//mir9.co.kr/resource/js/AdminLTE-2.4.2/bower_components/fullcalendar/dist/fullcalendar.print.css" rel="stylesheet" type="text/css" media="print">

<!-- Google Font -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<style>.cke{visibility:hidden;}</style><script type="text/javascript" src="http://mir9.co.kr/resource/js/ckeditor4.7.2/config.js?t=H7HD"></script><style type="text/css">.jqstooltip { position: absolute;left: 0px;top: 0px;visibility: hidden;background: rgb(0, 0, 0) transparent;background-color: rgba(0,0,0,0.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";color: white;font: 10px arial, san serif;text-align: left;white-space: nowrap;padding: 5px;border: 1px solid white;box-sizing: content-box;z-index: 10000;}.jqsfield { color: white;font: 10px arial, san serif;text-align: left;}</style><link rel="stylesheet" type="text/css" href="http://mir9.co.kr/resource/js/ckeditor4.7.2/skins/office2013/editor.css?t=H7HD"><script type="text/javascript" src="http://mir9.co.kr/resource/js/ckeditor4.7.2/lang/ko.js?t=H7HD"></script><script type="text/javascript" src="http://mir9.co.kr/resource/js/ckeditor4.7.2/styles.js?t=H7HD"></script><script type="text/javascript" src="http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/tableresize/plugin.js?t=H7HD"></script><link rel="stylesheet" type="text/css" href="http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/scayt/dialogs/dialog.css"><link rel="stylesheet" type="text/css" href="http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/tableselection/styles/tableselection.css">

<script type="text/javascript">

	$(function(){
		
		//board 선택삭제 시작
		$("#deleteChoiceBoard").on("click", function(){
			
			var boardArr = new Array();
			alert("asd")
			
			$("input[class='boardNo']:checked").each(function(){
				boardArr.push($(this).val());
			});
			
	  		$.ajax({
  			 	 url : "/mir9/board/deleteChoiceBoard",
	  		  	 type : "POST",
  		  	 	 data : { boardNo : boardArr },
    		 	 success : function(result){
   		   	 		
  		  	 	 }
  		  	 	 
	  		});		
	  		alert("삭제가 완료되었습니다.")
	  		location.href = "mir9/board/listBoard";
		})	
		//board 선택삭제 종료
		
		
		
		// board 상세보기 시작
		$("button[name='updateBoard']").on("click", function(){
			
			var boardNo = $(this).find('input').val();
			
			
			
			$.ajax({
				url : "/mir9/board/json/getBoardAllData/"+boardNo,
				method : "GET",
				dataType : "JSON",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"	 						
				} ,
				success : function(JSONData, status){
					var a = JSONData.boardNo * 1
					
					$("#boardNo2").val(a);
					$("#boardTitle2").val(JSONData.boardTitle);
					$("#boardType2").val(JSONData.boardType);
					$("#boardCategory2").val(JSONData.boardCategory);
					$("#boardEmail2").val(JSONData.boardEmail);
					$("#authorityList2").val(JSONData.authority.authorityList)
					$("#authorityView2").val(JSONData.authority.authorityView)
					$("#authorityWrite2").val(JSONData.authority.authorityWrite)
					$("#authorityUpdate2").val(JSONData.authority.authorityUpdate)
					$("#authorityDelete2").val(JSONData.authority.authorityDelete)
					$("#authorityAnswer2").val(JSONData.authority.authorityAnswer)
					$("#authorityNotice2").val(JSONData.authority.authorityNotice)
					$("#authorityComment2").val(JSONData.authority.authorityComment)
					if(JSONData.option.optionNotice == "y"){
						$("#optionNotice2").prop("checked", true)
					}
					if(JSONData.option.optionComment == "y"){
						$("#optionComment2").prop("checked", true)
					}
					if(JSONData.option.optionSecret == "y"){
						$("#optionSecret2").prop("checked", true)
					}
					if(JSONData.option.optionAnswer == "y"){
						$("#optionAnswer2").prop("checked", true)
					}
					if(JSONData.option.optionCaptcha == "y"){
						$("#optionCaptcha2").prop("checked", true)
					}
					if(JSONData.option.optionMass == "y"){
						$("#optionMass2").prop("checked", true)
					}
					if(JSONData.option.optionOrder == "y"){
						$("#optionOrder2").prop("checked", true)
					}
					if(JSONData.option.optionAddinfo == "y"){
						$("#optionAddinfo2").prop("checked", true)
					}
					if(JSONData.option.optionPopup == "y"){
						$("#optionPopup2").prop("checked", true)
					}
				}
			})			
		})
		// board 상세보기 종료		
	})
	
	function fncUpdateBoard(){
		
		var boardNo2 = $("#boardNo2").val()
		
		$("form[name='updateBoardForm']").attr("method", "POST").attr("action", "/mir9/board/updateBoard").submit();
	}
	


</script>

</head>
 
<div class="content-wrapper">
<style>
.option_tab { display:inline-block; width:130px;}
</style>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<section class="content-header">
    <h1>
    게시판 관리
    <small>게시판 list</small>
    </h1>

    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li>게시판 관리</li>
        <li class="active">게시판 리스트</li>
    </ol>
</section>

<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-body">
                    <label style="margin-top:5px;">총 ${resultPage.totalCount} 건</label>

                    <table class="table table-bordered table-hover">
                    <form name="form_list" method="post" action="?tpf=admin/board/manage_process">
		            <input type="hidden" name="mode" id="mode">
		            <thead>
                    <tr>
                        <td style="width:30px;">
                      		<div class="allCheck">
								<input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck"></label>
									<script>
										$("#allCheck").click(function() {
											var chk = $("#allCheck").prop("checked");
											if (chk) {
												$('.boardNo').prop("checked", true);
											} else {
												$('.boardNo').prop("checked", false);
											}
										});
									</script>
							</div>
                        </td>
                        <td style="width:60px;">NO</td>
                        <td>제목</td>
                        <td style="width:250px;">연결주소</td>
                        <td style="width:100px;">type</td>
                        <td style="width:80px;">등록 글수</td>
                        <td style="width:220px;">명령</td>
                    </tr>
                    </thead>
                    <tbody id="boardTable" >
                    	<c:set var="i" value="0"/>
                    	 <c:forEach var="board" items="${list}">
                    	   <c:set var="i" value="${ i+1 }" />
							<tr>
		                        <td>
			                        <div>
			                        	<input type="checkbox" class="boardNo" name="boardNo"  value="${board.boardNo}" />
			                        	<script>
											$(".boardNo").click(function() {
												$("#allCheck").prop("checked", false);
											});
										</script>
									</div>
		                        </td>
							  <td>${i}</td>
							  <td align="left">${board.boardTitle}</td>
							  <td align="left">[include:tpf=board/list=${board.boardNo}]</td>
							  <td>
								<c:if test="${board.boardType == 'list'}">
							  		일반
							  	</c:if>
							  	<c:if test="${board.boardType == 'gallery'}">
							  		갤러리
							  	</c:if>
							  	<c:if test="${board.boardType == 'qna'}">
							  		FAQ
							  	</c:if>
							  	<c:if test="${board.boardType == 'webzine'}">
							  		웹진
							  	</c:if>
							  	<c:if test="${board.boardType == 'movie'}">
							  		동영상
							  	</c:if>
								<c:if test="${board.boardType == 'event'}">
							  		이벤트
							  	</c:if>
							  	<c:if test="${board.boardType == 'manual'}">
							  		메뉴얼
							  	</c:if>
							  	<c:if test="${board.boardType == 'brochure'}">
							  		브로슈어
							  	</c:if>	
							  </td>
							  <td>1</td>
							  <td>
		                        <button type="button" onclick="_onclickView('board',1);" class="btn btn-success btn-xs">바로가기</button>
		                        <button type="button" onclick="onclickCopy(1);" class="btn btn-warning btn-xs">링크복사</button>
		                        <button type="button" class="btn btn-primary btn-xs" name="updateBoard" data-toggle="modal" data-target="#updateBoardModal">
		                        	<input type="hidden" name="hiddenBoardNo" value="${board.boardNo}" />
		                        	상세보기
		                        </button>							  
							  </td>
							</tr>
						 </c:forEach>
                    </tbody>
                    </table>
                    </form>
                    <br>

                    <button type="button" id="deleteChoiceBoard" class="btn btn-danger btn-sm"><i class="fa fa-minus-square"></i> 선택삭제</button>
                    <button type="button" onclick="onclickInsert()"  class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modalRegister"><i class="fa fa-plus-square"></i> 게시판 생성</button>

                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div><!-- /.col-xs-12 -->
    </div><!-- /.row -->
</section>
<!-- addBoard 모달 시작 -->
<jsp:include page="/WEB-INF/views/board/addBoard.jsp"/>
<!-- updateBoard 모달 시작 -->
<jsp:include page="/WEB-INF/views/board/updateBoard.jsp"/>


</div><!-- /.content-wrapper -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>