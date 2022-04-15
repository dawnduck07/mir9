<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="${pageContext.request.contextPath}/resources/plupload/js/plupload.full.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plupload/jquery-ui-1.12.1/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plupload/js/jquery.ui.plupload/jquery.ui.plupload.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plupload/js/i18n/ko.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plupload/js/jquery.ui.plupload/css/jquery.ui.plupload.css">
<script src="${pageContext.request.contextPath}/resources/plupload/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<link  href="${pageContext.request.contextPath}/resources/plupload/jquery-ui-1.12.1/jquery-ui.min.css" rel="stylesheet">
<script>
	function fncAddPost(){
		
		var postFile = $("input[id='postName']").length;
		var postName = new Array(postFile);
		
		for(var i = 0; i < postFile; i++){
			postName[i] = $("input[id='postName']")[i].value;
			//alert(postName[i])
		}
		alert("게시글이 등록 되었습니다.")
		$("form[name='addPostForm']").attr("method", "POST").attr("action", "/mir9/board/addPost?${_csrf.parameterName}=${_csrf.token}").submit();			
	}
	
	function fucAddFile(){
		$("div[name='listFile']").append('<input type="file" name="postName" id="postName" class="form-control input-sm" style="width:100%; display:inline; margin-bottom:10px;">');
	}
	
	$(function() {
	    $("#uploader").plupload({
	        // General settings
	        runtimes : 'html5,flash,silverlight,html4',
	        url : "/examples/upload",
	 
	        // Maximum file size
	        max_file_size : '2mb',
	 
	        chunk_size: '1mb',
	 
	        // Resize images on clientside if we can
	        resize : {
	            width : 200,
	            height : 200,
	            quality : 90,
	            crop: true // crop to exact dimensions
	        },
	 
	        // Specify what files to browse for
	        filters : [
	            {title : "Image files", extensions : "jpg,gif,png"},
	            {title : "Zip files", extensions : "zip,avi"}
	        ],
	 
	        // Rename files by clicking on their titles
	        rename: true,
	         
	        // Sort files
	        sortable: true,
	 
	        // Enable ability to drag'n'drop files onto the widget (currently only HTML5 supports that)
	        dragdrop: true,
	 
	        // Views to activate
	        views: {
	            list: true,
	            thumbs: true, // Show thumbs
	            active: 'thumbs'
	        },
	 
	        // Flash settings
	        flash_swf_url : '/plupload/js/Moxie.swf',
	     
	        // Silverlight settings
	        silverlight_xap_url : '/plupload/js/Moxie.xap'
	    });
	});	
</script>

<div class="modal fade" id="modalContent" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <form name="addPostForm" method="post" enctype="multipart/form-data">
            
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabelPortfolio">게시물 관리</h4>
            </div>
            <div class="modal-body">

            <h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> 글 <span id="board_sub_title">등록</span></p></h4>
            <table class="table table-bordered">
            <tbody>
            <tr>
                <td class="menu">작성자</td>
                <td align="left"><input type="text" name="name" id="name" class="form-control input-sm"></td>
            </tr>
            <c:if test="${board2.option.optionAddinfo eq 'y'}">
            <tr>
                <td class="menu">휴대전화</td>
                <td align="left"><input type="text" name="phone" id="phone" class="form-control input-sm" style="width:50%;"></td>
            </tr>
            <tr>
                <td class="menu">이메일</td>
                <td align="left"><input type="text" name="email" id="email" class="form-control input-sm" style="width:50%;"></td>
            </tr>
            </c:if>
            <tr>
                <td class="menu">제목</td>
                <td align="left">
                <span style="float:left;width:80%;"><input type="text" name="postTitle" id="postTitle" class="form-control input-sm"></span>
                <c:if test="${board2.option.optionNotice eq 'y'}">
	                <span>&nbsp;&nbsp;
	                	<input type="checkbox" name="titleNotice" value="y">공지사항
	                </span>
	            </c:if>
                </td>
            </tr>
			<tr>
                 <td class="menu">내용</td>
                 <td align="left">
                 	<textarea name="postContents" id="editor" rows="10" cols="80" style="visibility: hidden; display: none;"></textarea>
                 	<script type="text/javascript">
					 CKEDITOR.replace('editor'
					                , {filebrowserUploadUrl:'/mir9/board/imageUpload?${_csrf.parameterName}=${_csrf.token}'}
					 );
					</script>

                 </td>
            </tr>
            <c:if test="${board2.option.optionSecret eq 'y'}">
	            <td class="menu">비밀글</td>
	            <td align="left">
	                <span>&nbsp;&nbsp;
	                	<input type="checkbox" name="is_secret" value="y"></span>
	                </td>
	            <tr>
            </c:if>
                <td class="menu">썸네일 파일</td>
                <td align="left">
                <input type="file" name="ThombnailName" id="ThombnailName" class="form-control input-sm" style="width:80%; display:inline;">
                <span id="display_thumbnail" style="display:none;">
                <button type="button" onclick="winOpen('?tpf=common/image_view&amp;file_name=product/'+$('#code').val()+'_1');" class="btn btn-success btn-xs">보기</button>
                <button type="button" onclick="confirmIframeDelete('?tpf=common/image_delete&amp;file_name=product/'+$('#code').val()+'_1&amp;table=product&amp;code='+$('#code').val());" class="btn btn-danger btn-xs">삭제</button>
                </span>
                </td>
            </tr>
            <tr>
                <td class="menu">파일</td>
                <td align="left">
                <p>
                    <span id="file_list"></span>
                </p>
		<div id="uploader">
		    <p>Your browser doesn't have Flash, Silverlight or HTML5 support.</p>
		</div>
                <p style="padding-top:10px; float:left; width:100%;">
                    <button type="button" class="btn btn-primary btn-xs" onclick="fucAddFile();"><span class="glyphicon glyphicon-plus"></span> 파일추가</button><br>
                </p>
                    <div id="list_file" name="listFile">
                    	<input type="file" name="postName" id="postName" class="form-control input-sm" style="width:100%; display:inline; margin-bottom:10px;" >
                    </div>
                </td>
            </tr>
            </tbody>
            </table>
            <c:if test="${board2.option.optionComment eq 'y'}">
			<div id="displayMemo" style="">
            	<h4>
            		<p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> 댓글 관리</p>
            	</h4>
            </div>
            </c:if>
            </div>
            <div class="modal-footer">
            <button type="button" onclick="fncAddPost()" class="btn btn-primary">확인</button>&nbsp;&nbsp;&nbsp;
            </div>
            <input type="hidden" value="${board.boardNo}" name="boardNo">
        </form></div>
    </div>
</div>