<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="1:1문의" name="title"/>
</jsp:include>
<!-- content-wrapper -->
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

	function fncPost(){
		
		$.ajax({
			
			url : "/mir9/board/json/getMemberData",
			method : "GET",
			dataType : "JSON",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"	 						
			} ,
			success : function(JSONData, status){
				
				$("#name").val(JSONData.lastName+JSONData.firstName);
				$("#phone").val(JSONData.phone);
				$("#email").val(JSONData.email);
				
			}
		})
		
	}

</script>

</head>


<div class="content-wrapper">
<section class="content-header">
    <h1>
    ${board2.boardTitle} 관리
    <small>${board2.boardTitle} list</small>
    </h1>

    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">${board2.boardTitle} 관리</li>
    </ol>
</section>

<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-body">
                    <label style="margin-top:5px;">총 ${resultPage.totalCount} 건</label>
                    <div class="box-tools pull-right" style="margin-bottom:5px;">
                    <form name="form_search" method="post" action="?tpf=admin/board/list">
                    <input type="hidden" name="board_code" value="3">
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
      <option value="b.title">제목</option>      <option value="b.name">작성자</option>                        </select>
                        </div>
                    </form>
                    </div>

                    <table class="table table-bordered table-hover">
                    <form name="form_list" method="post" action="?tpf=admin/board/process">
		            <input type="hidden" name="mode" id="mode">
		            <input type="hidden" name="board_code" value="3">
                    <thead>
                    <tr>
                        <td style="width:30px;"><input type="checkbox" name="select_all" onclick=selectAllCheckBox('form_list'); /></td>
                        <td style="width:60px;">NO</td>
                        <td>제목</td>
                        <td style="width:100px;">작성자</td>
                        <td style="width:140px;">등록일</td>
                        <td style="width:80px;">조회수</td>
                        <td style="width:100px;">다운로드수</td>
                        <td style="width:80px;">명령</td>
                    </tr>
                    </thead>
                    <tbody>
                    		<c:set var="i" value="0"/>
	                    	 <c:forEach var="post" items="${list}">
	                    	   <c:set var="i" value="${ i+1 }" />
	                    	   <c:if test="${empty post.postNo}">
	                    	   	<tr>
	                    	   		<td colspan="10"><br>등록된 자료가 없습니다.<br><br></td>
	                    	   	</tr>	
	                    	   </c:if>
	                    	   <c:if test="${!empty post.postNo}">
	                    		<tr>
	                    			<td><input type="checkbox" name="list[]" value="69"></td>
	                    			<td>${ i }</td>
	                    			<td align="left">${post.postTitle}</td>
	                    			<td>${member.lastName}${member.firstName}</td>
	                    			<td>${post.postDate}</td>
	                    			<td>${post.postViewCount}</td>
	                    			<td>${post.postNo }</td>
	                    			<td><button type="button" onclick="onclick_update(69);" class="btn btn-primary btn-xs">상세보기</button></td>
	                    		</tr>
	                    		</c:if>
	                    	 </c:forEach>                    	                   
      				</tbody>
      				
      				</form>
                    </table>
                    <br>

                    <button type="button" onclick="selectDelete()" class="btn btn-danger btn-sm"><i class="fa fa-minus-square"></i> 선택삭제</button>
                    <button type="button" onclick="fncPost()" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modalContent"><i class="fa fa-plus-square"></i> 글 등록</button>
                    <button type="button" onclick="onclickCopyData('copyData')" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#modalContent2"><i class="fa fa-random"></i> 게시물 복사</button>
                    <button type="button" onclick="onclickCopyData('moveData')" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#modalContent3"><i class="fa fa-random"></i> 게시물 이전</button>

                    <div style="text-align:right;">
                                            </div>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div><!-- /.col-xs-12 -->
    </div><!-- /.row -->
</section>





<div id="list_file_tag" class="sr-only">
    <input type="file" name="file[]" class="form-control input-sm" style="width:100%; display:inline; margin-bottom:10px;">
</div>
<jsp:include page="/WEB-INF/views/board/addPost.jsp"/>
<jsp:include page="/WEB-INF/views/board/boardCopy.jsp"/>
<jsp:include page="/WEB-INF/views/board/boardChange.jsp"/>
<script src="//mir9.co.kr/resource/js/ckeditor4.7.2/ckeditor.js"></script>
</div><!-- /.content-wrapper -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>