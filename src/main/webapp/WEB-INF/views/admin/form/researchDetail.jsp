<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
<jsp:param value="폼 문항 관리" name="title"/>
</jsp:include>

<!-- content-wrapper -->
<div class="content-wrapper" style="min-height: 645px;">
	<section class="content-header">
	    <h1>폼 문항 관리<small>research detail</small></h1>
	    <ol class="breadcrumb">
	        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
	        <li class="active">폼 문항 관리</li>
	    </ol>
	</section><!-- /.content-header -->
	
	<section class="content">
	    <div class="row">
	        <div class="col-xs-12">
	            <div class="box">
	                <div class="box-body">
	                    <div align="center"><h2>문의사항</h2></div>
	                    <label style="margin-top:5px;">총 6 문항</label>
	                    <table class="table table-bordered table-hover">
	                    	<!--  
		                    <form name="form_list" method="post" action="?tpf=admin/form/process"></form>
				            -->
				            <input type="hidden" name="mode" id="mode">
		                    <thead>
			                    <tr>
			                        <td style="width:30px;"><input type="checkbox" name="select_all" onclick="selectAllCheckBox('form_list');"></td>
			                        <td style="width:80px; color:red;"><b>문항 번호</b></td>
			                        <td>문항명</td>
			                        <td style="width:140px;">입력 종류</td>
			                        <td style="width:100px;">필수항목</td>
			                        <td style="width:200px;">입력 예시</td>
			                        <td style="width:140px;">입력값 체크</td>
			                        <td style="width:100px;">리스트 표출</td>
			                        <td style="width:60px;">
			                        	<i onclick="changeOrder('down','form_item','?tpf=admin/form/item&amp;form_code=1',1);" class="fa fa-fw fa-arrow-circle-down cp" style="cursor:pointer;"></i>
			                        	<i onclick="changeOrder('up','form_item','?tpf=admin/form/item&amp;form_code=1',1);" class="fa fa-fw fa-arrow-circle-up cp" style="cursor:pointer;"></i>
			                        </td>
			                        <td style="width:80px;">명령</td>
			                    </tr>
		                    </thead>
		      				<tbody>
			      				<tr>
			                        <td><input type="checkbox" name="list[]" value="15"></td>
			                        <td>15</td>
			                        <td align="left">Name</td>
			                        <td>텍스트</td>
			                        <td></td>
			                        <td align="left"></td>
			                        <td></td>
			                        <td><i class="fa fa-check"></i></td>
			                        <td><input type="radio" name="order_code" value="1"></td>
			                        <td><button type="button" onclick="onclickUpdate(15);" class="btn btn-primary btn-xs">상세보기</button></td>
			                    </tr>      
			                    <tr>
			                        <td><input type="checkbox" name="list[]" value="16"></td>
			                        <td>16</td>
			                        <td align="left">E-mail</td>
			                        <td>이메일</td>
			                        <td></td>
			                        <td align="left"></td>
			                        <td></td>
			                        <td><i class="fa fa-check"></i></td>
			                        <td><input type="radio" name="order_code" value="2"></td>
			                        <td><button type="button" onclick="onclickUpdate(16);" class="btn btn-primary btn-xs">상세보기</button></td>
			                    </tr>      
			                    <tr>
			                        <td><input type="checkbox" name="list[]" value="17"></td>
			                        <td>17</td>
			                        <td align="left">Phone</td>
			                        <td>텍스트</td>
			                        <td></td>
			                        <td align="left"></td>
			                        <td></td>
			                        <td></td>
			                        <td><input type="radio" name="order_code" value="3"></td>
			                        <td><button type="button" onclick="onclickUpdate(17);" class="btn btn-primary btn-xs">상세보기</button></td>
			                    </tr>      
			                    <tr>
			                        <td><input type="checkbox" name="list[]" value="18"></td>
			                        <td>18</td>
			                        <td align="left">Subject</td>
			                        <td>텍스트</td>
			                        <td></td>
			                        <td align="left"></td>
			                        <td></td>
			                        <td></td>
			                        <td><input type="radio" name="order_code" value="4"></td>
			                        <td><button type="button" onclick="onclickUpdate(18);" class="btn btn-primary btn-xs">상세보기</button></td>
			                    </tr>      
			                    <tr>
			                        <td><input type="checkbox" name="list[]" value="19"></td>
			                        <td>19</td>
			                        <td align="left">Message</td>
			                        <td>텍스트에어리어</td>
			                        <td></td>
			                        <td align="left"></td>
			                        <td></td>
			                        <td></td>
			                        <td><input type="radio" name="order_code" value="5"></td>
			                        <td><button type="button" onclick="onclickUpdate(19);" class="btn btn-primary btn-xs">상세보기</button></td>
			                    </tr>      
			                    <tr>
			                        <td><input type="checkbox" name="list[]" value="35"></td>
			                        <td>35</td>
			                        <td align="left">주문자명</td>
			                        <td>텍스트</td>
			                        <td></td>
			                        <td align="left"></td>
			                        <td></td>
			                        <td></td>
			                        <td><input type="radio" name="order_code" value="6"></td>
			                        <td><button type="button" onclick="onclickUpdate(35);" class="btn btn-primary btn-xs">상세보기</button></td>
			                    </tr>                    
		                    </tbody>
		               	</table>
	                    <br>
	                    <span style="float:left;">
	                    	<button type="button" onclick="selectDelete('deleteItem');" class="btn btn-danger btn-sm"><i class="fa fa-minus-square"></i> 선택 삭제</button>
	                    	<button type="button" onclick="onclickInsert()" class="btn btn-primary btn-sm"><i class="fa fa-plus-square"></i> 문항 등록</button>
	                    </span>
	                    <span style="float:right;">
							<button type="button" onclick="javascript:onclickHtmlDesign('list','1')" class="btn btn-primary btn-sm"><i class="fa fa-list"></i> 폼 HTML 디자인 - 리스트</button>
							<button type="button" onclick="javascript:onclickHtmlDesign('write','1')" class="btn btn-primary btn-sm"><i class="fa fa-pencil"></i> 폼 HTML 디자인 - 쓰기</button>
	                    	<button type="button" onclick="javascript:history.back();" class="btn btn-primary btn-sm"><i class="fa fa-plus-square"></i> 폼 관리 바로 가기</button>
	                    </span>
	                </div><!-- /.box-body -->
	            </div><!-- /.box -->
	        </div><!-- /.col-xs-12 -->
	    </div><!-- /.row -->
	</section><!-- /.content -->
	
	<!-- 폼 문항 관리 모달 -->
	<div class="modal fade" id="modalContent" tabindex="-2" role="dialog" aria-labelledby="myModal" aria-hidden="true">
	    <div class="modal-dialog" style="width: 600px;">
	        <div class="modal-content">
	            <form name="form_register" method="post" action="?tpf=admin/form/process">
		            <input type="hidden" name="mode" id="mode">
		            <input type="hidden" name="form_code" value="1">
		            <input type="hidden" name="code">
		            
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		                <h4 class="modal-title" id="myModalLabelPortfolio">폼 문항 관리</h4>
		            </div><!-- /.modal-header -->
		            
		            <div class="modal-body">
			            <div class="row" style="margin:0">
			                <div class="col-xs-4">
			                	<span style="float:left;"><h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> 문항 정보</p></h4></span>
			                </div>
			                <div class="col-xs-8" style="padding:0"></div>
			            </div><!-- /.row -->
		
			            <table class="table table-bordered">
				            <tbody>
					            <tr>
					                <td class="menu">문항명</td>
					                <td align="left"><input type="text" name="label" class="form-control input-sm"></td>
					            </tr>
					            <tr>
					                <td class="menu">입력 종류</td>
					                <td align="left">
						                <span style="float:left">
						                	<select name="input_type" onchange="if(this.value) checkInputType(this.value)" class="form-control input-sm" style="width:150px;">
						      					<option value="text">텍스트</option>      
						      					<option value="tel">전화</option>      
						      					<option value="email">이메일</option>      
						      					<option value="textarea">텍스트에어리어</option>      
						      					<option value="webeditor">웹에디터</option>      
						      					<option value="select">콤보박스</option>      
						      					<option value="radio">라디오</option>      
						      					<option value="checkbox">체크박스</option>      
						      					<option value="date">날짜</option>      
						      					<option value="file">파일</option>                
						      				</select>
						                </span>
						                <span style="padding-left:10px; float:left">
						                	<input type="checkbox" name="is_require" value="y"> 필수항목 (※ 입력여부 체크)
						                </span>
					                </td>
					            </tr>
					            <tr id="displayPlaceholder">
					                <td class="menu">placeholder</td>
					                <td align="left">
					                	<input type="text" name="placeholder" class="form-control input-sm"> ※ 디폴트 표출 문구
					                </td>
					            </tr>
								<tr id="displayHtmlId">
					                <td class="menu">HTML ID</td>
					                <td align="left">
					                	<input type="text" name="html_id" class="form-control input-sm"> ※ 라디오, 체크박스, 날짜, 파일에서는 ID 사용 불가
					                </td>
					            </tr>
								<tr id="displayHtmlClass">
					                <td class="menu">HTML CLASS</td>
					                <td align="left">
					                	<input type="text" name="html_class" class="form-control input-sm">
					                </td>
					            </tr>
					            <tr id="displayInputExample" style="display:none;">
					                <td class="menu">입력 예시</td>
					                <td align="left">
						                <textarea name="input_example" rows="5" style="width:100%;" class="form-control input-sm" placeholder="매우 좋음, 좋음, 나쁨, 아주 나쁨"></textarea> ※ radio, checkbox 의 경우 선택 항목
					                </td>
					            </tr>
					            <tr>
					                <td class="menu">입력값 체크</td>
					                <td align="left">
						                <select name="check_type" class="form-control input-sm" style="width:150px;">
						                	<option value="">선택하기</option>
						      				<option value="email">이메일</option>      
						      				<option value="mobile">휴대폰</option>      
						      				<option value="tel">전화번호</option>      
						      				<option value="mobile_tel">휴대폰 or 전화번호</option>      
						      				<option value="number">숫자</option>      
						      				<option value="img">이미지파일</option>                
						      			</select>
					                </td>
					            </tr>
					            <tr>
					                <td class="menu">리스트</td>
					                <td align="left">
					                	<input type="checkbox" name="is_show" value="y"> 표출
					                </td>
					            </tr>
				            </tbody>
			            </table>
		            </div><!-- /.modal-body -->
		            
		            <div class="modal-footer">
		            	<!--<button type="button" onclick="" class="btn btn-danger">삭제</button>-->
		            	<button type="button" onclick="register()" class="btn btn-primary">확인/수정</button>
		            </div><!-- /.modal-footer -->
	            </form><!-- /.form_register -->
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal-dialog -->
	</div><!-- /.modal .fade -->
	
	<div class="modal fade" id="modalContentDesign" tabindex="-2" role="dialog" aria-labelledby="myModal" aria-hidden="true">
	    <div class="modal-dialog" style="width:90%">
	        <div class="modal-content">
	            <form name="form_html_design" method="post" action="?tpf=admin/form/process">
		            <input type="hidden" name="mode" id="mode" value="updateHtmlDesign">
		            <input type="hidden" name="form_code" value="1">
		            <input type="hidden" name="design_type">
		            <input type="hidden" name="code">
		            <input type="hidden" name="html_design_list" 
		            	   value="<table class=&quot;basic-board-row&quot;>
		            	   			<tr>
						  				<th>번호</th>
								  		<th>Name</th>
								  		<th>E-mail</th>
								  		<th>Phone</th>
								  		<th>Subject</th>
								  		<th>Message</th>
								  		<th>주문자명</th>
								  		<th>등록일</th>
									</tr>
									<for>
										<tr>
									   		<td>[no]</td>
									   		<td>[code:15]</td>
									   		<td>[code:16]</td>
									   		<td>[code:17]</td>
									   		<td>[code:18]</td>
									   		<td>[code:19]</td>
									   		<td>[code:35]</td>
									   		<td>[date]</td>
										</tr>
									</for>
								</table>">
		            <input type="hidden" name="html_design_write" 
		            	   value="<table class=&quot;basic-board-row&quot;>
									<colgroup>
									   <col width=&quot;220&quot; />
									   <col width=&quot;*&quot; />
									</colgroup>
									<tr>
									   <th>Name</th>
									   <td>[code:15]</td>
									</tr>
									<tr>
									   <th>E-mail</th>
									   <td>[code:16]</td>
									</tr>
									<tr>
									   <th>Phone</th>
									   <td>[code:17]</td>
									</tr>
									<tr>
									   <th>Subject</th>
									   <td>[code:18]</td>
									</tr>
									<tr>
									   <th>Message</th>
									   <td>[code:19]</td>
									</tr>
									<tr>
									   <th>주문자명</th>
									   <td>[code:35]</td>
									</tr>
									<tr>
									   <th>보안코드</th>
									   <td>[code:captcha]</td>
									</tr>
									<tr>
									   <th>개인정보 수집·이용 동의</th>
									   <td>[code:agree]</td>
									</tr>
								</table>">
								
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		                <h4 class="modal-title" id="myModalLabelPortfolio">폼 HTML 디자인 관리</h4>
		            </div><!-- /.modal-header -->
		            
		            <div class="modal-body">
						<table class="table table-bordered">
							<colgroup>
								<col width="*">
								<col width="25%">
							</colgroup>
							<tbody>
								<tr>
									<td class="menu">
			                        	폼 HTML 디자인 - <span id="design_type_txt"></span>
			                        	<span style="float:right">
			                        		<button type="button" onclick="setTableForm()" class="btn btn-warning btn-xs"><i class="fa fa-list"></i> 디폴트 폼</button>
			                        	</span>
			                        </td>
									<td class="menu">문항 목록</td>
								</tr>
								<tr>
									<td align="left" style="padding:0">
										<textarea name="html_design" id="content-editor" onfocus="javascript:this.value=""" rows="10" cols="80" style="visibility: hidden; display: none;"></textarea><div id="cke_content-editor" class="cke_1 cke cke_reset cke_chrome cke_editor_content-editor cke_ltr cke_browser_webkit" dir="ltr" lang="ko" role="application" aria-labelledby="cke_content-editor_arialbl"><span id="cke_content-editor_arialbl" class="cke_voice_label">리치 텍스트 편집기, content-editor</span><div class="cke_inner cke_reset" role="presentation"><span id="cke_1_top" class="cke_top cke_reset_all" role="presentation" style="height: auto; user-select: none;"><span id="cke_10" class="cke_voice_label">에디터 툴바</span><span id="cke_1_toolbox" class="cke_toolbox" role="group" aria-labelledby="cke_10" onmousedown="return false;"><span id="cke_13" class="cke_toolbar" aria-labelledby="cke_13_label" role="toolbar"><span id="cke_13_label" class="cke_voice_label">클립보드/실행 취소</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_14" class="cke_button cke_button__cut cke_button_disabled " href="javascript:void('잘라내기')" title="잘라내기 (컨트롤+X)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_14_label" aria-describedby="cke_14_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(2,event);" onfocus="return CKEDITOR.tools.callFunction(3,event);" onclick="CKEDITOR.tools.callFunction(4,this);return false;"><span class="cke_button_icon cke_button__cut_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -240px;background-size:auto;">&nbsp;</span><span id="cke_14_label" class="cke_button_label cke_button__cut_label" aria-hidden="false">잘라내기</span><span id="cke_14_description" class="cke_button_label" aria-hidden="false">키보드 단축키 컨트롤+X</span></a><a id="cke_15" class="cke_button cke_button__copy cke_button_disabled " href="javascript:void('복사')" title="복사 (컨트롤+C)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_15_label" aria-describedby="cke_15_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(5,event);" onfocus="return CKEDITOR.tools.callFunction(6,event);" onclick="CKEDITOR.tools.callFunction(7,this);return false;"><span class="cke_button_icon cke_button__copy_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -192px;background-size:auto;">&nbsp;</span><span id="cke_15_label" class="cke_button_label cke_button__copy_label" aria-hidden="false">복사</span><span id="cke_15_description" class="cke_button_label" aria-hidden="false">키보드 단축키 컨트롤+C</span></a><a id="cke_16" class="cke_button cke_button__paste cke_button_disabled " href="javascript:void('붙여넣기')" title="붙여넣기 (컨트롤+V)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_16_label" aria-describedby="cke_16_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(8,event);" onfocus="return CKEDITOR.tools.callFunction(9,event);" onclick="CKEDITOR.tools.callFunction(10,this);return false;"><span class="cke_button_icon cke_button__paste_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -288px;background-size:auto;">&nbsp;</span><span id="cke_16_label" class="cke_button_label cke_button__paste_label" aria-hidden="false">붙여넣기</span><span id="cke_16_description" class="cke_button_label" aria-hidden="false">키보드 단축키 컨트롤+V</span></a><a id="cke_17" class="cke_button cke_button__pastetext cke_button_disabled " href="javascript:void('텍스트로 붙여넣기')" title="텍스트로 붙여넣기 (컨트롤+시프트+V)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_17_label" aria-describedby="cke_17_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(11,event);" onfocus="return CKEDITOR.tools.callFunction(12,event);" onclick="CKEDITOR.tools.callFunction(13,this);return false;"><span class="cke_button_icon cke_button__pastetext_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -696px;background-size:auto;">&nbsp;</span><span id="cke_17_label" class="cke_button_label cke_button__pastetext_label" aria-hidden="false">텍스트로 붙여넣기</span><span id="cke_17_description" class="cke_button_label" aria-hidden="false">키보드 단축키 컨트롤+시프트+V</span></a><a id="cke_18" class="cke_button cke_button__pastefromword cke_button_disabled " href="javascript:void('MS Word 에서 붙여넣기')" title="MS Word 에서 붙여넣기" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_18_label" aria-describedby="cke_18_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(14,event);" onfocus="return CKEDITOR.tools.callFunction(15,event);" onclick="CKEDITOR.tools.callFunction(16,this);return false;"><span class="cke_button_icon cke_button__pastefromword_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -744px;background-size:auto;">&nbsp;</span><span id="cke_18_label" class="cke_button_label cke_button__pastefromword_label" aria-hidden="false">MS Word 에서 붙여넣기</span><span id="cke_18_description" class="cke_button_label" aria-hidden="false"></span></a><span class="cke_toolbar_separator" role="separator"></span><a id="cke_19" class="cke_button cke_button__undo cke_button_disabled " href="javascript:void('실행 취소')" title="실행 취소 (컨트롤+Z)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_19_label" aria-describedby="cke_19_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(17,event);" onfocus="return CKEDITOR.tools.callFunction(18,event);" onclick="CKEDITOR.tools.callFunction(19,this);return false;"><span class="cke_button_icon cke_button__undo_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -984px;background-size:auto;">&nbsp;</span><span id="cke_19_label" class="cke_button_label cke_button__undo_label" aria-hidden="false">실행 취소</span><span id="cke_19_description" class="cke_button_label" aria-hidden="false">키보드 단축키 컨트롤+Z</span></a><a id="cke_20" class="cke_button cke_button__redo cke_button_disabled " href="javascript:void('다시 실행')" title="다시 실행 (컨트롤+Y)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_20_label" aria-describedby="cke_20_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(20,event);" onfocus="return CKEDITOR.tools.callFunction(21,event);" onclick="CKEDITOR.tools.callFunction(22,this);return false;"><span class="cke_button_icon cke_button__redo_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -936px;background-size:auto;">&nbsp;</span><span id="cke_20_label" class="cke_button_label cke_button__redo_label" aria-hidden="false">다시 실행</span><span id="cke_20_description" class="cke_button_label" aria-hidden="false">키보드 단축키 컨트롤+Y</span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_21" class="cke_toolbar" aria-labelledby="cke_21_label" role="toolbar"><span id="cke_21_label" class="cke_voice_label">편집</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_22" class="cke_button cke_button__scayt cke_button_disabled" href="javascript:void('Spell Check')" title="Spell Check" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_22_label" aria-describedby="cke_22_description" aria-haspopup="true" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(23,event);" onfocus="return CKEDITOR.tools.callFunction(24,event);" onclick="CKEDITOR.tools.callFunction(25,this);return false;"><span class="cke_button_icon cke_button__scayt_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -864px;background-size:auto;">&nbsp;</span><span id="cke_22_label" class="cke_button_label cke_button__scayt_label" aria-hidden="false">Spell Check As You Type</span><span id="cke_22_description" class="cke_button_label" aria-hidden="false"></span><span class="cke_button_arrow"></span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_23" class="cke_toolbar" aria-labelledby="cke_23_label" role="toolbar"><span id="cke_23_label" class="cke_voice_label">링크</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_24" class="cke_button cke_button__link cke_button_disabled " href="javascript:void('링크 삽입/변경')" title="링크 삽입/변경 (컨트롤+L)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_24_label" aria-describedby="cke_24_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(26,event);" onfocus="return CKEDITOR.tools.callFunction(27,event);" onclick="CKEDITOR.tools.callFunction(28,this);return false;"><span class="cke_button_icon cke_button__link_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -504px;background-size:auto;">&nbsp;</span><span id="cke_24_label" class="cke_button_label cke_button__link_label" aria-hidden="false">링크 삽입/변경</span><span id="cke_24_description" class="cke_button_label" aria-hidden="false">키보드 단축키 컨트롤+L</span></a><a id="cke_25" class="cke_button cke_button__unlink cke_button_disabled " href="javascript:void('링크 지우기')" title="링크 지우기" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_25_label" aria-describedby="cke_25_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(29,event);" onfocus="return CKEDITOR.tools.callFunction(30,event);" onclick="CKEDITOR.tools.callFunction(31,this);return false;"><span class="cke_button_icon cke_button__unlink_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -528px;background-size:auto;">&nbsp;</span><span id="cke_25_label" class="cke_button_label cke_button__unlink_label" aria-hidden="false">링크 지우기</span><span id="cke_25_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_26" class="cke_button cke_button__anchor cke_button_disabled " href="javascript:void('책갈피')" title="책갈피" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_26_label" aria-describedby="cke_26_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(32,event);" onfocus="return CKEDITOR.tools.callFunction(33,event);" onclick="CKEDITOR.tools.callFunction(34,this);return false;"><span class="cke_button_icon cke_button__anchor_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -480px;background-size:auto;">&nbsp;</span><span id="cke_26_label" class="cke_button_label cke_button__anchor_label" aria-hidden="false">책갈피</span><span id="cke_26_description" class="cke_button_label" aria-hidden="false"></span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_27" class="cke_toolbar" aria-labelledby="cke_27_label" role="toolbar"><span id="cke_27_label" class="cke_voice_label">삽입</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_28" class="cke_button cke_button__image cke_button_disabled " href="javascript:void('이미지')" title="이미지" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_28_label" aria-describedby="cke_28_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(35,event);" onfocus="return CKEDITOR.tools.callFunction(36,event);" onclick="CKEDITOR.tools.callFunction(37,this);return false;"><span class="cke_button_icon cke_button__image_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -336px;background-size:auto;">&nbsp;</span><span id="cke_28_label" class="cke_button_label cke_button__image_label" aria-hidden="false">이미지</span><span id="cke_28_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_29" class="cke_button cke_button__table cke_button_disabled " href="javascript:void('표')" title="표" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_29_label" aria-describedby="cke_29_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(38,event);" onfocus="return CKEDITOR.tools.callFunction(39,event);" onclick="CKEDITOR.tools.callFunction(40,this);return false;"><span class="cke_button_icon cke_button__table_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -888px;background-size:auto;">&nbsp;</span><span id="cke_29_label" class="cke_button_label cke_button__table_label" aria-hidden="false">표</span><span id="cke_29_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_30" class="cke_button cke_button__horizontalrule cke_button_disabled " href="javascript:void('가로 줄 삽입')" title="가로 줄 삽입" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_30_label" aria-describedby="cke_30_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(41,event);" onfocus="return CKEDITOR.tools.callFunction(42,event);" onclick="CKEDITOR.tools.callFunction(43,this);return false;"><span class="cke_button_icon cke_button__horizontalrule_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -312px;background-size:auto;">&nbsp;</span><span id="cke_30_label" class="cke_button_label cke_button__horizontalrule_label" aria-hidden="false">가로 줄 삽입</span><span id="cke_30_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_31" class="cke_button cke_button__specialchar cke_button_disabled " href="javascript:void('특수문자 삽입')" title="특수문자 삽입" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_31_label" aria-describedby="cke_31_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(44,event);" onfocus="return CKEDITOR.tools.callFunction(45,event);" onclick="CKEDITOR.tools.callFunction(46,this);return false;"><span class="cke_button_icon cke_button__specialchar_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -840px;background-size:auto;">&nbsp;</span><span id="cke_31_label" class="cke_button_label cke_button__specialchar_label" aria-hidden="false">특수문자 삽입</span><span id="cke_31_description" class="cke_button_label" aria-hidden="false"></span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_32" class="cke_toolbar" aria-labelledby="cke_32_label" role="toolbar"><span id="cke_32_label" class="cke_voice_label">도구</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_33" class="cke_button cke_button__maximize cke_button_off" href="javascript:void('최대화')" title="최대화" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_33_label" aria-describedby="cke_33_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(47,event);" onfocus="return CKEDITOR.tools.callFunction(48,event);" onclick="CKEDITOR.tools.callFunction(49,this);return false;"><span class="cke_button_icon cke_button__maximize_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -648px;background-size:auto;">&nbsp;</span><span id="cke_33_label" class="cke_button_label cke_button__maximize_label" aria-hidden="false">최대화</span><span id="cke_33_description" class="cke_button_label" aria-hidden="false"></span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_34" class="cke_toolbar" aria-labelledby="cke_34_label" role="toolbar"><span id="cke_34_label" class="cke_voice_label">문서</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_35" class="cke_button cke_button__source cke_button_on" href="javascript:void('소스')" title="소스" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_35_label" aria-describedby="cke_35_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(50,event);" onfocus="return CKEDITOR.tools.callFunction(51,event);" onclick="CKEDITOR.tools.callFunction(52,this);return false;" aria-pressed="true"><span class="cke_button_icon cke_button__source_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -816px;background-size:auto;">&nbsp;</span><span id="cke_35_label" class="cke_button_label cke_button__source_label" aria-hidden="false">소스</span><span id="cke_35_description" class="cke_button_label" aria-hidden="false"></span></a><span class="cke_toolbar_separator" role="separator"></span><a id="cke_36" class="cke_button cke_button__searchcode cke_button_off" href="javascript:void('Search Source')" title="Search Source" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_36_label" aria-describedby="cke_36_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(53,event);" onfocus="return CKEDITOR.tools.callFunction(54,event);" onclick="CKEDITOR.tools.callFunction(55,this);return false;"><span class="cke_button_icon cke_button__searchcode_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/codemirror/icons/searchcode.png?t=H7HD');background-position:0 0px;background-size:16px;">&nbsp;</span><span id="cke_36_label" class="cke_button_label cke_button__searchcode_label" aria-hidden="false">Search Source</span><span id="cke_36_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_37" class="cke_button cke_button__autoformat cke_button_off" href="javascript:void('Format Selection')" title="Format Selection" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_37_label" aria-describedby="cke_37_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(56,event);" onfocus="return CKEDITOR.tools.callFunction(57,event);" onclick="CKEDITOR.tools.callFunction(58,this);return false;"><span class="cke_button_icon cke_button__autoformat_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/codemirror/icons/autoformat.png?t=H7HD');background-position:0 0px;background-size:16px;">&nbsp;</span><span id="cke_37_label" class="cke_button_label cke_button__autoformat_label" aria-hidden="false">Format Selection</span><span id="cke_37_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_38" class="cke_button cke_button__commentselectedrange cke_button_off" href="javascript:void('Comment Selection')" title="Comment Selection" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_38_label" aria-describedby="cke_38_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(59,event);" onfocus="return CKEDITOR.tools.callFunction(60,event);" onclick="CKEDITOR.tools.callFunction(61,this);return false;"><span class="cke_button_icon cke_button__commentselectedrange_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/codemirror/icons/commentselectedrange.png?t=H7HD');background-position:0 0px;background-size:16px;">&nbsp;</span><span id="cke_38_label" class="cke_button_label cke_button__commentselectedrange_label" aria-hidden="false">Comment Selection</span><span id="cke_38_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_39" class="cke_button cke_button__uncommentselectedrange cke_button_off" href="javascript:void('Uncomment Selection')" title="Uncomment Selection" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_39_label" aria-describedby="cke_39_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(62,event);" onfocus="return CKEDITOR.tools.callFunction(63,event);" onclick="CKEDITOR.tools.callFunction(64,this);return false;"><span class="cke_button_icon cke_button__uncommentselectedrange_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/codemirror/icons/uncommentselectedrange.png?t=H7HD');background-position:0 0px;background-size:16px;">&nbsp;</span><span id="cke_39_label" class="cke_button_label cke_button__uncommentselectedrange_label" aria-hidden="false">Uncomment Selection</span><span id="cke_39_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_40" class="cke_button cke_button__autocomplete cke_button_on" href="javascript:void('Enable/Disable HTML Tag Autocomplete')" title="Enable/Disable HTML Tag Autocomplete" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_40_label" aria-describedby="cke_40_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(65,event);" onfocus="return CKEDITOR.tools.callFunction(66,event);" onclick="CKEDITOR.tools.callFunction(67,this);return false;" aria-pressed="true"><span class="cke_button_icon cke_button__autocomplete_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/codemirror/icons/autocomplete.png?t=H7HD');background-position:0 0px;background-size:16px;">&nbsp;</span><span id="cke_40_label" class="cke_button_label cke_button__autocomplete_label" aria-hidden="false">Enable/Disable HTML Tag Autocomplete</span><span id="cke_40_description" class="cke_button_label" aria-hidden="false"></span></a><span class="cke_toolbar_separator" role="separator"></span><a id="cke_41" class="cke_button cke_button__print cke_button_disabled " href="javascript:void('인쇄')" title="인쇄" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_41_label" aria-describedby="cke_41_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(68,event);" onfocus="return CKEDITOR.tools.callFunction(69,event);" onclick="CKEDITOR.tools.callFunction(70,this);return false;"><span class="cke_button_icon cke_button__print_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -1104px;background-size:auto;">&nbsp;</span><span id="cke_41_label" class="cke_button_label cke_button__print_label" aria-hidden="false">인쇄</span><span id="cke_41_description" class="cke_button_label" aria-hidden="false"></span></a></span><span class="cke_toolbar_end"></span></span><span class="cke_toolbar_break"></span><span id="cke_42" class="cke_toolbar" aria-labelledby="cke_42_label" role="toolbar"><span id="cke_42_label" class="cke_voice_label">기본 스타일</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_43" class="cke_button cke_button__bold cke_button_disabled " href="javascript:void('굵게')" title="굵게 (컨트롤+B)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_43_label" aria-describedby="cke_43_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(71,event);" onfocus="return CKEDITOR.tools.callFunction(72,event);" onclick="CKEDITOR.tools.callFunction(73,this);return false;"><span class="cke_button_icon cke_button__bold_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -24px;background-size:auto;">&nbsp;</span><span id="cke_43_label" class="cke_button_label cke_button__bold_label" aria-hidden="false">굵게</span><span id="cke_43_description" class="cke_button_label" aria-hidden="false">키보드 단축키 컨트롤+B</span></a><a id="cke_44" class="cke_button cke_button__italic cke_button_disabled " href="javascript:void('기울임꼴')" title="기울임꼴 (컨트롤+I)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_44_label" aria-describedby="cke_44_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(74,event);" onfocus="return CKEDITOR.tools.callFunction(75,event);" onclick="CKEDITOR.tools.callFunction(76,this);return false;"><span class="cke_button_icon cke_button__italic_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -48px;background-size:auto;">&nbsp;</span><span id="cke_44_label" class="cke_button_label cke_button__italic_label" aria-hidden="false">기울임꼴</span><span id="cke_44_description" class="cke_button_label" aria-hidden="false">키보드 단축키 컨트롤+I</span></a><a id="cke_45" class="cke_button cke_button__strike cke_button_disabled " href="javascript:void('취소선')" title="취소선" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_45_label" aria-describedby="cke_45_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(77,event);" onfocus="return CKEDITOR.tools.callFunction(78,event);" onclick="CKEDITOR.tools.callFunction(79,this);return false;"><span class="cke_button_icon cke_button__strike_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -72px;background-size:auto;">&nbsp;</span><span id="cke_45_label" class="cke_button_label cke_button__strike_label" aria-hidden="false">취소선</span><span id="cke_45_description" class="cke_button_label" aria-hidden="false"></span></a><span class="cke_toolbar_separator" role="separator"></span><a id="cke_46" class="cke_button cke_button__removeformat cke_button_disabled " href="javascript:void('형식 지우기')" title="형식 지우기" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_46_label" aria-describedby="cke_46_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(80,event);" onfocus="return CKEDITOR.tools.callFunction(81,event);" onclick="CKEDITOR.tools.callFunction(82,this);return false;"><span class="cke_button_icon cke_button__removeformat_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -768px;background-size:auto;">&nbsp;</span><span id="cke_46_label" class="cke_button_label cke_button__removeformat_label" aria-hidden="false">형식 지우기</span><span id="cke_46_description" class="cke_button_label" aria-hidden="false"></span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_47" class="cke_toolbar" aria-labelledby="cke_47_label" role="toolbar"><span id="cke_47_label" class="cke_voice_label">단락</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_48" class="cke_button cke_button__numberedlist cke_button_disabled " href="javascript:void('순서 있는 목록')" title="순서 있는 목록" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_48_label" aria-describedby="cke_48_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(83,event);" onfocus="return CKEDITOR.tools.callFunction(84,event);" onclick="CKEDITOR.tools.callFunction(85,this);return false;"><span class="cke_button_icon cke_button__numberedlist_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -624px;background-size:auto;">&nbsp;</span><span id="cke_48_label" class="cke_button_label cke_button__numberedlist_label" aria-hidden="false">순서 있는 목록</span><span id="cke_48_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_49" class="cke_button cke_button__bulletedlist cke_button_disabled " href="javascript:void('순서 없는 목록')" title="순서 없는 목록" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_49_label" aria-describedby="cke_49_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(86,event);" onfocus="return CKEDITOR.tools.callFunction(87,event);" onclick="CKEDITOR.tools.callFunction(88,this);return false;"><span class="cke_button_icon cke_button__bulletedlist_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -576px;background-size:auto;">&nbsp;</span><span id="cke_49_label" class="cke_button_label cke_button__bulletedlist_label" aria-hidden="false">순서 없는 목록</span><span id="cke_49_description" class="cke_button_label" aria-hidden="false"></span></a><span class="cke_toolbar_separator" role="separator"></span><a id="cke_50" class="cke_button cke_button__outdent cke_button_disabled " href="javascript:void('내어쓰기')" title="내어쓰기" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_50_label" aria-describedby="cke_50_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(89,event);" onfocus="return CKEDITOR.tools.callFunction(90,event);" onclick="CKEDITOR.tools.callFunction(91,this);return false;"><span class="cke_button_icon cke_button__outdent_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -432px;background-size:auto;">&nbsp;</span><span id="cke_50_label" class="cke_button_label cke_button__outdent_label" aria-hidden="false">내어쓰기</span><span id="cke_50_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_51" class="cke_button cke_button__indent cke_button_disabled " href="javascript:void('들여쓰기')" title="들여쓰기" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_51_label" aria-describedby="cke_51_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(92,event);" onfocus="return CKEDITOR.tools.callFunction(93,event);" onclick="CKEDITOR.tools.callFunction(94,this);return false;"><span class="cke_button_icon cke_button__indent_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -384px;background-size:auto;">&nbsp;</span><span id="cke_51_label" class="cke_button_label cke_button__indent_label" aria-hidden="false">들여쓰기</span><span id="cke_51_description" class="cke_button_label" aria-hidden="false"></span></a><span class="cke_toolbar_separator" role="separator"></span><a id="cke_52" class="cke_button cke_button__justifyleft cke_button_disabled " href="javascript:void('왼쪽 정렬')" title="왼쪽 정렬" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_52_label" aria-describedby="cke_52_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(95,event);" onfocus="return CKEDITOR.tools.callFunction(96,event);" onclick="CKEDITOR.tools.callFunction(97,this);return false;"><span class="cke_button_icon cke_button__justifyleft_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -1056px;background-size:auto;">&nbsp;</span><span id="cke_52_label" class="cke_button_label cke_button__justifyleft_label" aria-hidden="false">왼쪽 정렬</span><span id="cke_52_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_53" class="cke_button cke_button__justifycenter cke_button_disabled " href="javascript:void('가운데 정렬')" title="가운데 정렬" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_53_label" aria-describedby="cke_53_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(98,event);" onfocus="return CKEDITOR.tools.callFunction(99,event);" onclick="CKEDITOR.tools.callFunction(100,this);return false;"><span class="cke_button_icon cke_button__justifycenter_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -1032px;background-size:auto;">&nbsp;</span><span id="cke_53_label" class="cke_button_label cke_button__justifycenter_label" aria-hidden="false">가운데 정렬</span><span id="cke_53_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_54" class="cke_button cke_button__justifyright cke_button_disabled " href="javascript:void('오른쪽 정렬')" title="오른쪽 정렬" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_54_label" aria-describedby="cke_54_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(101,event);" onfocus="return CKEDITOR.tools.callFunction(102,event);" onclick="CKEDITOR.tools.callFunction(103,this);return false;"><span class="cke_button_icon cke_button__justifyright_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -1080px;background-size:auto;">&nbsp;</span><span id="cke_54_label" class="cke_button_label cke_button__justifyright_label" aria-hidden="false">오른쪽 정렬</span><span id="cke_54_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_55" class="cke_button cke_button__justifyblock cke_button_disabled " href="javascript:void('양쪽 맞춤')" title="양쪽 맞춤" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_55_label" aria-describedby="cke_55_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(104,event);" onfocus="return CKEDITOR.tools.callFunction(105,event);" onclick="CKEDITOR.tools.callFunction(106,this);return false;"><span class="cke_button_icon cke_button__justifyblock_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -1008px;background-size:auto;">&nbsp;</span><span id="cke_55_label" class="cke_button_label cke_button__justifyblock_label" aria-hidden="false">양쪽 맞춤</span><span id="cke_55_description" class="cke_button_label" aria-hidden="false"></span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_56" class="cke_toolbar" aria-labelledby="cke_56_label" role="toolbar"><span id="cke_56_label" class="cke_voice_label">스타일</span><span class="cke_toolbar_start"></span><span id="cke_11" class="cke_combo cke_combo__font cke_combo_disabled" role="presentation" aria-disabled="true"><span id="cke_11_label" class="cke_combo_label">글꼴</span><a class="cke_combo_button" title="글꼴" tabindex="-1" href="javascript:void('글꼴')" hidefocus="true" role="button" aria-labelledby="cke_11_label" aria-haspopup="true" onkeydown="return CKEDITOR.tools.callFunction(108,event,this);" onfocus="return CKEDITOR.tools.callFunction(109,event);" onclick="CKEDITOR.tools.callFunction(107,this);return false;"><span id="cke_11_text" class="cke_combo_text cke_combo_inlinelabel">글꼴</span><span class="cke_combo_open"><span class="cke_combo_arrow"></span></span></a></span><span id="cke_12" class="cke_combo cke_combo__fontsize cke_combo_disabled" role="presentation" aria-disabled="true"><span id="cke_12_label" class="cke_combo_label">크기</span><a class="cke_combo_button" title="글자 크기" tabindex="-1" href="javascript:void('글자 크기')" hidefocus="true" role="button" aria-labelledby="cke_12_label" aria-haspopup="true" onkeydown="return CKEDITOR.tools.callFunction(111,event,this);" onfocus="return CKEDITOR.tools.callFunction(112,event);" onclick="CKEDITOR.tools.callFunction(110,this);return false;"><span id="cke_12_text" class="cke_combo_text cke_combo_inlinelabel">크기</span><span class="cke_combo_open"><span class="cke_combo_arrow"></span></span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_57" class="cke_toolbar" aria-labelledby="cke_57_label" role="toolbar"><span id="cke_57_label" class="cke_voice_label">색상</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_58" class="cke_button cke_button__textcolor cke_button_disabled" href="javascript:void('글자 색상')" title="글자 색상" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_58_label" aria-describedby="cke_58_description" aria-haspopup="true" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(113,event);" onfocus="return CKEDITOR.tools.callFunction(114,event);" onclick="CKEDITOR.tools.callFunction(115,this);return false;"><span class="cke_button_icon cke_button__textcolor_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -1176px;background-size:auto;">&nbsp;</span><span id="cke_58_label" class="cke_button_label cke_button__textcolor_label" aria-hidden="false">글자 색상</span><span id="cke_58_description" class="cke_button_label" aria-hidden="false"></span><span class="cke_button_arrow"></span></a><a id="cke_59" class="cke_button cke_button__bgcolor cke_button_disabled" href="javascript:void('배경 색상')" title="배경 색상" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_59_label" aria-describedby="cke_59_description" aria-haspopup="true" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(116,event);" onfocus="return CKEDITOR.tools.callFunction(117,event);" onclick="CKEDITOR.tools.callFunction(118,this);return false;"><span class="cke_button_icon cke_button__bgcolor_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -1152px;background-size:auto;">&nbsp;</span><span id="cke_59_label" class="cke_button_label cke_button__bgcolor_label" aria-hidden="false">배경 색상</span><span id="cke_59_description" class="cke_button_label" aria-hidden="false"></span><span class="cke_button_arrow"></span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_60" class="cke_toolbar cke_toolbar_last" aria-labelledby="cke_60_label" role="toolbar"><span id="cke_60_label" class="cke_voice_label">about</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_61" class="cke_button cke_button__about cke_button_off" href="javascript:void('CKEditor에 대하여')" title="CKEditor에 대하여" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_61_label" aria-describedby="cke_61_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(119,event);" onfocus="return CKEDITOR.tools.callFunction(120,event);" onclick="CKEDITOR.tools.callFunction(121,this);return false;"><span class="cke_button_icon cke_button__about_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 0px;background-size:auto;">&nbsp;</span><span id="cke_61_label" class="cke_button_label cke_button__about_label" aria-hidden="false">CKEditor에 대하여</span><span id="cke_61_description" class="cke_button_label" aria-hidden="false"></span></a></span><span class="cke_toolbar_end"></span></span></span></span><div id="cke_1_contents" class="cke_contents cke_reset" role="presentation" style="height: 800px;"><textarea dir="ltr" tabindex="0" role="textbox" aria-label="리치 텍스트 편집기, content-editor" class="cke_source cke_reset cke_enable_context_menu cke_editable cke_editable_themed cke_contents_ltr" title="리치 텍스트 편집기, content-editor" aria-describedby="cke_69" style="width: 100%; height: 100%; resize: none; outline: none; text-align: left; tab-size: 4; display: none;"></textarea><div class="CodeMirror cm-s-3024-night CodeMirror-wrap" style="height: 800px;"><div style="overflow: hidden; position: relative; width: 3px; height: 0px;"><textarea autocorrect="off" autocapitalize="off" spellcheck="false" tabindex="0" style="position: absolute; bottom: -1em; padding: 0px; width: 1000px; height: 1em; outline: none;"></textarea></div><div class="CodeMirror-vscrollbar" cm-not-content="true"><div style="min-width: 1px;"></div></div><div class="CodeMirror-hscrollbar" cm-not-content="true"><div style="height: 100%; min-height: 1px;"></div></div><div class="CodeMirror-scrollbar-filler" cm-not-content="true"></div><div class="CodeMirror-gutter-filler" cm-not-content="true"></div><div class="CodeMirror-scroll" tabindex="-1"><div class="CodeMirror-sizer" style="margin-left: 0px;"><div style="position: relative;"><div class="CodeMirror-lines" role="presentation"><div role="presentation" style="position: relative; outline: none;"><div class="CodeMirror-measure"><pre><span>xxxxxxxxxx</span></pre><div class="CodeMirror-linenumber CodeMirror-gutter-elt"><div>1</div></div></div><div class="CodeMirror-measure"></div><div style="position: relative; z-index: 1;"></div><div class="CodeMirror-cursors"></div><div class="CodeMirror-code" role="presentation"></div></div></div></div></div><div style="position: absolute; height: 30px; width: 1px;"></div><div class="CodeMirror-gutters"><div class="CodeMirror-gutter CodeMirror-linenumbers" style="width: 1px;"></div><div class="CodeMirror-gutter CodeMirror-foldgutter"></div></div></div></div><span id="cke_69" class="cke_voice_label">도움이 필요하면 ALT 0 을 누르세요</span></div><span id="cke_1_bottom" class="cke_bottom cke_reset_all" role="presentation" style="user-select: none;"><span id="cke_1_resizer" class="cke_resizer cke_resizer_vertical cke_resizer_ltr" title="크기 조절" onmousedown="CKEDITOR.tools.callFunction(0, event)">◢</span><span id="cke_1_path_label" class="cke_voice_label">요소 경로</span><span id="cke_1_path" class="cke_path" role="group" aria-labelledby="cke_1_path_label"><span class="cke_path_empty">&nbsp;</span></span></span></div></div>
									</td>
									<td align="left">
				                        <table class="table table-bordered">
					                        <colgroup>
					                            <col width="*">
					                            <col width="20%">
					                            <col width="30%">
					                        </colgroup>
					                        <tbody>
					                        	<tr>
					                            	<td class="menu">문항명</td>
					                            	<td class="menu">입력 종류</td>
					                            	<td class="menu">치환코드</td>
						                        </tr>          
						                        <tr>
						                            <td class="left">Name</td>
						                            <td class="left">텍스트</td>
						                            <td class="left">[code:15]</td>
						                        </tr>          
						                        <tr>
						                            <td class="left">E-mail</td>
						                            <td class="left">이메일</td>
						                            <td class="left">[code:16]</td>
						                        </tr>          
						                        <tr>
						                            <td class="left">Phone</td>
						                            <td class="left">텍스트</td>
						                            <td class="left">[code:17]</td>
						                        </tr>          
						                        <tr>
						                            <td class="left">Subject</td>
						                            <td class="left">텍스트</td>
						                            <td class="left">[code:18]</td>
						                        </tr>          
						                        <tr>
						                            <td class="left">Message</td>
						                            <td class="left">텍스트에어리어</td>
						                            <td class="left">[code:19]</td>
						                        </tr>          
						                        <tr>
						                            <td class="left">주문자명</td>
						                            <td class="left">텍스트</td>
						                            <td class="left">[code:35]</td>
						                        </tr>          
						                        <tr id="displayCaptcha">
						                            <td class="left" style="color:#ff0000;font-wighth:bode;">보안코드</td>
						                            <td class="left">-</td>
						                            <td class="left">[code:captcha]</td>
						                        </tr>          
						                        <tr id="displayAgree">
						                            <td class="left" style="color:#ff0000;font-wighth:bode;">개인정보수집</td>
						                            <td class="left">-</td>
						                            <td class="left">[code:agree]</td>
						                        </tr>              
						                        <tr id="displaySearch">
						                            <td class="left" style="font-wighth:bode;">검색폼</td>
						                            <td class="left">-</td>
						                            <td class="left"><button type="button" onclick="addForm('search')" class="btn btn-warning btn-xs"><i class="fa fa-plus"></i> 사용</button></td>
						                        </tr>
						                        <tr id="displayPage">
						                            <td class="left" style="font-wighth:bode;">페이지</td>
						                            <td class="left">-</td>
						                            <td class="left"><button type="button" onclick="addForm('page')" class="btn btn-warning btn-xs"><i class="fa fa-plus"></i> 사용</button></td>
						                        </tr>
					                        </tbody>
				                        </table><!-- /.table table-bordered -->
			                        	<span style="color:#ff0000">※ 붉은색 항목은 필수 항목 입니다.</span>						
			                        </td>
								</tr>
							</tbody>
						</table><!-- /.table table-bordered -->
		            </div><!-- /.modal-body -->
		            
		            <div class="modal-footer">
						<button type="button" onclick="registerHtmlDesign()" class="btn btn-primary">확인/수정</button>
		            </div><!-- /.modal-footer -->
	            </form><!-- /.form_html_design -->
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal-dialog -->
	</div><!-- /.modal .fade -->

<script src="//mir9.co.kr/resource/js/ckeditor4.7.2/ckeditor.js"></script>
</div><!-- /.content-wrapper -->

<script>
	
	// 모달 체크에디터
	if (window.CKEDITOR) {  // CKEDITOR loading 여부 체크 (Web 버젼에서만 사용)
	    var objEditor = CKEDITOR.replace("content-editor", {
	        height: 800,
	        extraPlugins : "tableresize",
	        extraPlugins: "codemirror",
	        //removeButtons: "Source",
	        filebrowserUploadUrl: "/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files",
	        filebrowserImageUploadUrl: "/daemon/ckeditor_upload.php?command=QuickUpload&type=Images",
	        contentsCss : ["/html/css/common.css','/html/css/style.css"]
	    });
	
	    CKEDITOR.on("dialogDefinition", function (ev) {
	        var dialogName = ev.data.name;
	        var dialog = ev.data.definition.dialog;
	        var dialogDefinition = ev.data.definition;
	
	        if (dialogName == "image") {
	            dialog.on("show", function (obj) {
	                this.selectPage("Upload"); //업로드텝으로 시작
	            });
	            dialogDefinition.removeContents("advanced"); // 자세히탭 제거
	            dialogDefinition.removeContents("Link"); // 링크탭 제거
	        }
	    });
	    
	    CKEDITOR.config.allowedContent = true;
	    CKEDITOR.config.wsc_left = 10;
	    CKEDITOR.config.startupMode = "source";
	    CKEDITOR.config.codemirror = {
	        // Set this to the theme you wish to use (codemirror themes)
	        theme: "3024-night",
	        // Whether or not to automatically format code should be done when the editor is loaded
	        autoFormatOnStart: false
	    };
	}

	// 문항 등록 버튼      
	function onclickInsert() {
	    $("form[name='form_register'] #mode").val("insertItem");
	    $("#modalContent").modal("show");
	    form_register.reset();
	}
	 
	// 상세보기 버튼
	function onclickUpdate(code) {
	    $("form[name='form_register'] #mode").val("updateItem");
	    $("#modalContent").modal({backdrop:"static", show:true});
	    setData(code);
	}	
	
	// 문항 정보 입력 종류에 따라 정보 입력창 변경
	function checkInputType(value) {
	    $("#displayPlaceholder").hide(); // placeholder : text, textarea 일 경우 표시
	    $("#displayInputExample").hide(); // inputExample : select, radio, checkbox 일 경우 표시 
	    if (value == "text" || value == "textarea") {
	    	$("#displayPlaceholder").show();
	    }
	    else if (value == "select" || value == "radio" || value == "checkbox") {
	    	$("#displayInputExample").show();
	    }
	}
	      
	// 상세보기 데이터 셋팅
	function setData(code) {
	    $.ajax({
	        url: "http://demoshop.mir9.kr/api/process.php",
	        type: "post",
	        dataType: "json",
	        data: {
	            method : "UtilForm.infoItem",
	            locale : $("[name=locale]").val(),
	            code : code
	        },
	        timeout: 5000,  // timeout : 5초
	        success: function(data, textStatus, jqXHR) {
	            var json_data = data.data;
	            $("[name=code]").val(json_data.code);
	            $("[name=label]").val(json_data.label);
	            $("[name=input_type]").val(json_data.input_type);
	            $("[name=placeholder]").val(json_data.placeholder);
	            checkInputType(json_data.input_type);
	            if(json_data.is_require == "y") {
	         	   $("[name=is_require]").prop("checked", true);
	            }
	            else {
	         	   $("[name=is_require]").prop("checked", false);
	            }
	            $("[name=placeholder]").val(json_data.placeholder);
	            $("[name=input_example]").val(json_data.input_example);
	            $("[name=check_type]").val(json_data.check_type);
	            if(json_data.is_show == "y") {
	         	   $("[name=is_show]").prop("checked", true);
	            }
	            else {
	         	   $("[name=is_show]").prop("checked", false);
	            }
				$("[name=html_id]").val(json_data.html_id);
				$("[name=html_class]").val(json_data.html_class);
			},
	        error: function(xhr, textStatus, errorThrown){
	            $("#result_area").val("request failed : " + errorThrown);
	        }
	    });
	}
	
	// 문항 정보 확인 및 수정 버튼
	function register() {
	    if(form_register.label.value == "") { 
	    	alert("문항명이 입력되지 않았습니다."); 
	    	form_register.label.focus(); 
	    	return false;
	    }
	    
	    /*
	         문항 정보 저장
	    form_register.target = "iframe_process";
	    form_register.submit();
	    */
	}	
	      	
	// 폼 HTML 디자인 리스트 및 쓰기 버튼
	function onclickHtmlDesign(design_type, code) {
	    $("[name=design_type]").val(design_type);
	    $("#modalContentDesign").modal({backdrop:"static", show:true});
	    // DB값 가져오기
	    $.ajax({
	        url: "http://demoshop.mir9.kr/api/process.php",
	        type: "post",
	        dataType: "json",
	        data: {
	            method : "UtilForm.infoForm",
	            code : code
	        },
	        timeout: 5000,  // timeout : 5초
	        success: function(data, textStatus, jqXHR) {
	            var json_data = data.data;
	            // 폼제목에 따른 문항 목록 설정
	            if (design_type == "list") {
	                $("#design_type_txt").text("리스트 폼"); // 폼 제목
	                var html = json_data.html_design_list; // 리스트 문항 목록 
	                $("#displayCaptcha").hide();
	                $("#displayAgree").hide();
	                $("#displaySearch").show();
	                $("#displayPage").show();
	            }
	            else {
	                $("#design_type_txt").text("쓰기 폼"); // 폼 제목
	                var html = json_data.html_design_write; // 쓰기 문항 목록
	                $("#displayCaptcha").show();
	                $("#displayAgree").show();
	                $("#displaySearch").hide();
	                $("#displayPage").hide();
	            }
	
	            setTimeout(function() {
	                objEditor.setData("\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n");
	            }, 200);
	
	            setTimeout(function() {
	                if(html != null) {
	                	objEditor.setData(html);
	                }
	            }, 200);
	        },
	        error: function(xhr, textStatus, errorThrown) {
	            $("#result_area").val("request failed : " + errorThrown);
	        }
	    });
	}
	
	// 디폴트 폼 버튼 : 히든 list 또는 write 데이터 셋팅
	function setTableForm() {
	    var design_type = $("[name=design_type]").val();
	    objEditor.setData($("[name=html_design_" + design_type + "]").val());
	}
	
	// 추가 문항 사용
	function addForm(type) {
	    var tag = "";
	    switch (type) {
	        case "search": 
	        	tag += "<form name='formSearch' method='post' action=''>\n";
      			tag += "<input type='hidden' name='url' value='[url]'>\n";
      			tag += "<input type='hidden' name='tpf' value='form/list'>\n";
		        tag += "<input type='hidden' name='form_code' value='[form_code]'>\n";
		        tag += "<select name='field'>\n";
		        tag += "";
		        tag += "</select>\n";
		        tag += "<input type='text' name='keyword' value='[keyword]'>\n";
		        tag += "<input type='button' value='확인' onclick='formSearch.submit();'>\n";
		        tag += "</form>"; break;
	        case "page": 
	        	tag += "<page>"; break;
	    }
	    objEditor.setData(objEditor.getData() + "\n\n" + tag);
	}	
	
	// 폼 HTML 디자인 리스트 및 쓰기 확인 및 수정 버튼
	function registerHtmlDesign() {
		var form = document.form_html_design;
		var html_design_value = parent.objEditor.getData();
		if(html_design_value.length > 1) {
			if($("[name=design_type]").val() == "write" && html_design_value.indexOf("[code:captcha]") < 0) { 
				alert("보안코드 문항이 등록되지 않았습니다."); 
				return; 
			} 
			if($("[name=design_type]").val() == "write" && html_design_value.indexOf("[code:agree]") < 0) { 
				alert("보안코드 문항이 등록되지 않았습니다."); 
				return; 
			} 
		}
	    if(confirm("폼 HTML 디자인을 저장하시겠습니까?")) {
			/*
	    	form.target = 'iframe_process';
			form.submit();
			*/
		}
	}
	
	/*
	언어 설정
	function setLocale(locale) {
	    $("button[id^=locale_]").attr("class", "btn btn-default");
	    $("#locale_" + locale).attr("class", "btn btn-primary");
	    $("[name=locale]").val(locale);
	    setData($("[name=code]").val());
	}
	*/	
	
</script>

<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"></jsp:include>