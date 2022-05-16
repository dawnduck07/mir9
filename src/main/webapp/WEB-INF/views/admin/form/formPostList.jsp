<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
<jsp:param value="문의사항 관리" name="title"/>
</jsp:include>

<!-- content-wrapper -->
<div class="content-wrapper" style="min-height: 595px;">
	<section class="content-header">
	    <h1>문의사항 관리<small>문의사항 list</small></h1>
	    <ol class="breadcrumb">
	        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
	        <li class="active">문의사항 관리</li>
	    </ol>
	</section><!-- /.content-header -->

	<section class="content">
	    <div class="row">
	        <div class="col-xs-12">
	            <div class="box">
	                <div class="box-body">
	                    <label style="margin-top:5px;">총 4 건</label>
	
	                    <table class="table table-bordered table-hover">
		                    <form name="form_list" method="post" action="?tpf=admin/form/process"></form>
				            <input type="hidden" name="mode" id="mode">
				            <input type="hidden" name="form_code" value="1">
		                    <thead>
		                    <tr>
		                        <td style="width:30px;"><input type="checkbox" name="select_all" onclick="selectAllCheckBox('form_list');"></td>
		                        <td style="width:60px;">NO</td>
		      					<td>Name</td>      
		      					<td>date</td>                        
		      					<td style="width:200px;">등록일</td>
		                        <td style="width:80px;">
		                            <i onclick="changeOrder('down','form_reply','?tpf=admin/form/list&amp;form_code=1',1,'ko','',);" class="fa fa-fw fa-arrow-circle-down cp" style="cursor:pointer;"></i>
		                            <i onclick="changeOrder('up','form_reply','?tpf=admin/form/list&amp;form_code=1',1,'ko','',);" class="fa fa-fw fa-arrow-circle-up cp" style="cursor:pointer;"></i>
		                        </td>
		                        <td style="width:60px;">명령</td>
		                    </tr>
		                    </thead>
			      			<tbody>
			      			  <c:set var="i" value="0"/>
		      				  <c:forEach var="formPost" items="${list}" varStatus="status" >
		      				  <c:set var="i" value="${ i+1 }" />
			      				<tr>
			                        <td><input type="checkbox" name="list[]" value="11"></td>
			                        <td>${i}</td>  
			                        <td style="text-align:left;">${formPost.name}</td>
			                        <td>?</td>          
			                        <td>${formPost.date}</td>
			                        <td><input type="radio" name="order_code" value="-5"></td>
			                        <td><button type="button" onclick="onclickUpdate(11);" class="btn btn-primary btn-xs">수정하기</button></td>
			                    </tr> 
			                  </c:forEach>                         
		                    </tbody>
	                    </table>
	                    <br>
	
	                    <button type="button" onclick="selectDelete('deleReply');" class="btn btn-danger btn-sm"><i class="fa fa-minus-square"></i> 선택삭제</button>
	                    <button type="button" onclick="onclickInsert();" class="btn btn-primary btn-sm"><i class="fa fa-plus-square"></i> 등록</button>
	                    <button type="button" onclick="onclickCopyContent();" class="btn btn-warning btn-sm" style="margin-left:20px;"><i class="fa fa-copy"></i> 리스트 복사</button>
	                    <button type="button" onclick="downloadExcel();" class="btn btn-warning btn-sm"><i class="fa fa-file-excel-o"></i> Excel 다운로드</button>
	                    
	                    <form name="form_download" method="post" action="?tpf=admin/form/process">
	                        <input type="hidden" name="mode" value="downloadExcel">
	                        <input type="hidden" name="form_code" value="1">
	                        <input type="hidden" name="search_data">
	                    </form>
	                    
						<!-- page -->
	                    <div style="text-align:right;">
	                        <ul class="pagination" style="margin:0;">
								<li class="active"><a href="?tpf=admin/form/list&amp;form_code=1&amp;locale=ko&amp;code=1&amp;page=1">1</a></li>
							</ul>                    
						</div><!-- /.page -->
	                </div><!-- /.box-body -->
	            </div><!-- /.box -->
	        </div><!-- /.col-xs-12 -->
	    </div><!-- /.row -->
	</section><!-- /.content -->

	<div class="modal fade" id="modalContent" tabindex="-2" role="dialog" aria-labelledby="myModal" aria-hidden="true">
	    <div class="modal-dialog" style="width:800px;">
	        <div class="modal-content">
	            <form name="formRegister" method="post" onsubmit="return false;" action="/admin/form/addFormPost?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
		            <input type="hidden" name="mode" id="mode" value="insertReply">
		            <input type="hidden" name="formNo" id="formNo" value="${formNo}">
		            <input type="hidden" name="locale" id="locale">
		            
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		                <h4 class="modal-title" id="myModalLabelPortfolio">정보 등록</h4>
		            </div><!-- /.modal-header -->
		            
		            <div class="modal-body">
		            	<h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> 정보 등록</p></h4>
		            	<table class="table table-bordered">
		      				<tbody>
			      				<tr>
			                        <td class="menu">Name</td>
			                        <td align="left">  
			                        	<input type="text" name="name" placeholder="" class="form-control input-sm">          
			                        </td>
			                    </tr>      
			                    <tr>
			                        <td class="menu">E-mail</td>
			                        <td align="left">  
			                        	<input type="text" name="email" placeholder="" class="form-control input-sm">          
			                        </td>
			                    </tr>      
			                    <tr>
			                        <td class="menu">Phone</td>
			                        <td align="left">  
			                        	<input type="text" name="phone" placeholder="" class="form-control input-sm">          
			                        </td>
			                    </tr>      
			                    <tr>
			                        <td class="menu">Subject</td>
			                        <td align="left">  
			                        	<input type="text" name="subject" placeholder="" class="form-control input-sm">          
			                        </td>
			                    </tr>      
			                    <tr>
			                        <td class="menu">Message</td>
			                        <td align="left">  <textarea name="message" placeholder="" class="form-control input-sm" style="padding:5px; line-height:20px; width:100%; height:200px;"></textarea>          </td>
			                    </tr>      
			                    <tr>
			                        <td class="menu">주문자명</td>
			                        <td align="left">  
			                        	<input type="text" name="orderName" placeholder="주문자명 입력" class="form-control input-sm">          
			                        </td>
			                    </tr>            
		                    </tbody>
		            	</table>
		            </div><!-- /.modal-body -->
		            
		            <div class="modal-footer">
		            	<button type="button" onclick="registerForm();" class="btn btn-primary">저장하기</button>
		            </div><!-- /.modal-footer -->
	            </form><!-- /.formRegister -->
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal-dialog -->
	</div><!-- /.modal .fade -->

	<div class="modal fade" id="modalCopyList" tabindex="-2" role="dialog" aria-labelledby="myModal" aria-hidden="true">
	    <div class="modal-dialog" style="width:400px;">
	        <div class="modal-content">
	            <form name="formCopyContent" method="post" action="?tpf=admin/form/process">
	                <input type="hidden" name="mode" id="mode" value="copyContent">
	                <input type="hidden" name="form_code" value="1">
	                <input type="hidden" name="code" id="code">
	                
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
	                    <h4 class="modal-title" id="myModalLabelPortfolio">리스트 복사</h4>
	                </div><!-- /.modal-header -->
	                
	                <div class="modal-body">
	                    <h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> 리스트 <span id="board_sub_title">복사</span></p></h4>
	                    <table class="table table-bordered">
	                        <tbody>
	                            <tr>
	                                <td class="menu">폼메일 선택</td>
	                                <td align="left">
	                                    <select name="to_form_code" class="form-control input-sm">
	                                        <option value="">선택</option>
	                          				<option value="10">폼메일이 뭐죠??</option>                                    
	                          			</select>
	                                </td>
	                            </tr>
	                        </tbody>
	                    </table>
	                </div><!-- /.modal-body -->
	                
	                <div class="modal-footer">
	                    <button type="button" onclick="registerCopyContent()" class="btn btn-primary">확인</button>
		            </div><!-- /.modal-footer -->
	            </form><!-- /.formCopyContent -->
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal-dialog -->
	</div><!-- /.modal .fade -->

	<form name="formFileDelete" method="post" action="?tpf=admin/form/process">
		<input type="hidden" name="mode" id="mode" value="deleteFile">
		<input type="hidden" name="code" id="code">
	</form>

<script src="//mir9.co.kr/resource/js/ckeditor4.7.2/ckeditor.js"></script>
</div><!-- /.content-wrapper -->

<script>

    // 등록 버튼
    function onclickInsert() {
        $("#modalContent").modal({backdrop:"static", show:true});
        formRegister.reset();
        formRegister.mode.value = "insertReply";
        formRegister.form_code.value = "1";
        formRegister.locale.value = "ko";
        $("[id^='displayFile']").css("display","none");
    }	
	
    // 등록 모달 저장
    function registerForm() {
        
        formRegister.target = 'iframe_process';
        formRegister.submit();
        
    }
    
    // 모달 데이터 셋팅
    function setData(code) {
        $.ajax({
			url:"http://demoshop.mir9.kr/api/process.php",
			type:"post",
			dataType:"json",
			data:{
				method:"UtilForm.infoReply",
		                code:code
			},
			success:function(data, textStatus, jqXHR) {
		                 var json_data = data.data;
		                 $("form[name='formRegister'] #mode").val("updateReply");
		                 $("#code").val(code);
		                 $("#form_code").val(json_data.form_code);
		                 var find_text = "";
		                 $.each(json_data.arrData, function(index, value) {
		                     find_text = String(index);
		                     if ($.inArray(find_text, json_data.arrRadio) >= 0) {
		                         $("input[name=data" + index + "][value='" + value + "']").prop("checked", true);
		                     }
		                     else if ($.inArray(find_text, json_data.arrCheckbox) >= 0) {
		                         var arrCheckbox = value.toString().split(",");
		                         $.each(arrCheckbox, function(index2, value2) {
		                             $("[id^=label" + index + "_][value='" + value2 + "']").prop("checked", true);
		                         });
		                     }
		                     else {
		                         if ($.inArray(find_text, ) >= 0) {
		                             var objEditor = eval("objEditor" + find_text);
		                             console.log(objEditor);
		                             objEditor.setData(value);
		                         }
		                         else $("[name=data" + index).val(value);
		                     }
		                 });
		                 $("[id^='displayFile']").css("display","none");
		                 if (json_data.files != null && json_data.files.length > 0) {
		                     $.each(json_data.files, function(index, value) {
		                         var file_tag = "<button type='button' onclick='location.replace(\"?tpf=common/save_as&file_path=" + value.file_path + "&file_name=" + value.file_name + "&orig_name=" + encodeURI(value.orig_name) + "\");' class='btn btn-success btn-xs'>보기</button>";
		                         file_tag += "<button type='button' onclick='deleteFile(" + value["code"] + ");' class='btn btn-danger btn-xs'>삭제</button>";
		                         $("#displayFile" + value["plupload_id"]).css("display","");
		                         $("#displayFile" + value["plupload_id"]).html(file_tag);
		                     });
		                 }
			},
			error: function(jqXHR, textStatus, errorThrown) {
				console.log(textStatus);
				// $("#content").val(errorThrown);
			}
		});
    }
    
    // 수정하기 버튼
    function onclickUpdate(code) {
        $("#modalContent").modal({backdrop:"static", show:true});
        formRegister.reset();
        
        setData(code);
    }    
    
    // 리스트 복사 체크버튼 및 모달창
    function onclickCopyContent() {
        var count = $(":input[name = 'list[]']").length;
        if(count > 0) {
            if(isCheckedBox("form_list")) {
                var f = eval("form_list");
                var chkBox = document.getElementsByName("list[]");
                var chkLen = chkBox.length;
                var code = "";

                for(i=0;i<chkLen;i++) {
                    if(chkBox[i].checked) {
                        code += chkBox[i].value + ",";
                    }
                }
                $("#modalCopyList").modal({backdrop:"static", show:true});
                formCopyContent.code.value = code.substr(0, code.lastIndexOf(","));
            }
            else {
                alert("항목을 선택하여야 합니다.");
                return false;
            }
        }
        else {
            alert("항목이 없습니다.");
            return false;
        }
    }
    
    // 리스트 복사 확인
    function registerCopyContent() {
        if(formCopyContent.to_form_code.value == "") { 
        	alert("폼메일이 선택되지 않았습니다."); 
        	formCopyContent.to_form_code.focus(); 
        	return false;
        }
        /*
        formCopyContent.target = 'iframe_process';
        formCopyContent.submit();
        */
    }    
    
	// 엑셀 다운로드 
    function downloadExcel() {  
		/*
        form_download.target = 'iframe_process';
        form_download.search_data.value = $('#form_search :input').serialize();
        form_download.submit();
        */
    }    
      
    /* 
    datepicker 
    $('[id^=datepicker]').datepicker({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dayNames: ['일','월','화','수','목','금','토'],
        dayNamesShort: ['일','월','화','수','목','금','토'],
        dayNamesMin: ['일','월','화','수','목','금','토'],
        showMonthAfterYear: true,
        yearSuffix: '년'
    });
    
    $('[id^=datepicker]').datepicker({
        dateFormat: 'yy-mm-dd'
    });
    */
    
    /* 
         파일 삭제
    function deleteFile(code) {
        if (confirm('해당 파일을 정말 삭제 하시겠습니까?')) {
            formFileDelete.code.value = code;
            formFileDelete.target = 'iframe_process';
            formFileDelete.submit();
        }
    }
	*/   
</script>

<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"></jsp:include>