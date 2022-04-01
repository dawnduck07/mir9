<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | list_sub</title>
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet" href="/html/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="/html/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://mir9.co.kr/resource/js/AdminLTE-2.4.2/bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="https://mir9.co.kr/resource/js/AdminLTE-2.4.2/dist/css/AdminLTE.min.css">
<link href="//mir9.co.kr/resource/css/admin.css" rel="stylesheet" type="text/css" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<!-- Google Font -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>

<body class="hold-transition login-page">
<!-- content-wrapper -->
<iframe name="iframe_process" width="0" height="0" frameborder="0"></iframe>
<section class="content" style="padding:15px 15px 0 15px;">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-body">
                    <div class="btn-group pull-right">
      <button type="button" id="locale_ko" onclick="location.href='?tpf=admin/product/list_sub&category_code=&locale=ko'" class="btn btn-primary"><i class="fa fa-globe" aria-hidden="true"></i> 한국어</button>      <button type="button" id="locale_en" onclick="location.href='?tpf=admin/product/list_sub&category_code=&locale=en'" class="btn btn-default"><i class="fa fa-globe" aria-hidden="true"></i> ENG</button>      <button type="button" id="locale_zh" onclick="location.href='?tpf=admin/product/list_sub&category_code=&locale=zh'" class="btn btn-default"><i class="fa fa-globe" aria-hidden="true"></i> 中国</button>      <button type="button" id="locale_vn" onclick="location.href='?tpf=admin/product/list_sub&category_code=&locale=vn'" class="btn btn-default"><i class="fa fa-globe" aria-hidden="true"></i> Tiếng việt</button>                    </div>
                    <br>
                    <br>

                    <div class="box-tools pull-right" style="margin-top:20px;">
                    <form id="form_search" name="form_search" method="post" action="?tpf=admin/product/list_sub">
                    <input type="hidden" name="locale" value="ko">
                    <input type="hidden" name="category_code" value="">
                    <input type="hidden" name="is_best" value="">
                    <input type="hidden" name="is_new" value="">
                    <input type="hidden" name="is_event" value="">
                    <input type="hidden" name="status" value="">
                        <div class="has-feedback">
                        <span>
                        <input type="text" name="keyword" value="" class="form-control input-sm" placeholder="상품 검색"/>
                        <span class="glyphicon glyphicon-search form-control-feedback"></span>
                        </span>
                        </div>
                    </div>
                    <div class="box-tools pull-right" style="margin-top:20px;">
                        <div class="has-feedback">
                        <span style="float:left; width:180px;">
                        <input type="checkbox" name="is_best" onclick="location.href='index.php?tpf=admin/product/list_sub&status=&is_new=&is_event=&is_best=y'" value="y"> BEST
                        <input type="checkbox" name="is_new" onclick="location.href='index.php?tpf=admin/product/list_sub&status=&is_best=&is_event=&is_new=y'" value="y"> NEW
                        <input type="checkbox" name="is_event" onclick="location.href='index.php?tpf=admin/product/list_sub&status=&is_best=&is_new=&is_event=y'" value="y"> EVENT
                        </span>

                        <select name="field" onchange="location.href='index.php?tpf=admin/product/list_sub&is_best=&is_new=&is_event=&status='+this.value" class="form-control input-sm" style="float:left; padding-right:0; margin-right:5px; width:80px;">
                        <option value="">상태</option>
                        <option value="y">보임</option>
                        <option value="n">숨김</option>
                        </select>

                        <select name="field" class="form-control input-sm" style="float:left; padding-right:0; width:100px;">
      <option value="title">상품명</option>                        </select>
                        </div>
                    </form>
                    </div>

                    <p class="text-light-blue"><i class="fa fa-fw fa-list-ul"></i> <a href="?tpf=admin/product/list_sub&locale=ko">ROOT</a> </p>
                    <label>총 7 건</label>
                    <table class="table table-bordered table-hover">
                    <form name="form_list" method="post" action="?tpf=admin/product/process">
		            <input type="hidden" name="mode" id="mode">
                    <thead>
                    <tr>
                        <td style="width:30px;"><input type="checkbox" name="select_all" onclick=selectAllCheckBox('form_list'); /></td>
                        <td style="width:50px;">CODE</td>
                        <td>제품 이미지</td>
                        <td>카테고리</td>
                        <td>상품명</td>
                        <td>리스트 타이틀</td>
                        <td>가격</td>
                        <td style="width:90px;">등록일</td>
                        <td style="width:55px;">상태</td>
                        <td style="width:60px;">
                        <i onclick="changeOrder('down','product','?tpf=admin/product/list_sub','','',);" class="fa fa-fw fa-arrow-circle-down cp"></i>
                        <i onclick="changeOrder('up','product','?tpf=admin/product/list_sub','','',);" class="fa fa-fw fa-arrow-circle-up cp"></i>
                        </td>
                        <td style="width:60px;">명령</td>
                    </tr>
                    </thead>
      <tr>
                        <td><input type="checkbox" name="list[]" value="292" /></td>
                        <td>292</td>
                        <td><img src="/user/product/292_1.jpg" style="width:90px;"></td>
                        <td>Dental Treats sub - sub</td>
                        <td>상품명23 (BEST,NEW - 보임)</td>
                        <td>리스트 문구</td>
                        <td>40,000</td>
                        <td>2021-12-10</td>
                        <td><button type="button" class="btn btn-success btn-xs">보임</button></td>
                        <td><input type="radio" name="order_code" value="10" /></td>
                        <td><button type="button" onclick="onclickUpdate(292);" class="btn btn-primary btn-xs">수정하기</button></td>
                    </tr>      <tr>
                        <td><input type="checkbox" name="list[]" value="290" /></td>
                        <td>290</td>
                        <td><img src="/user/product/290_1.jpg" style="width:90px;"></td>
                        <td>Dental Treats sub - sub</td>
                        <td>하루다섯팩</td>
                        <td>리스트 문구</td>
                        <td>10,000</td>
                        <td>2020-01-29</td>
                        <td><button type="button" class="btn btn-success btn-xs">보임</button></td>
                        <td><input type="radio" name="order_code" value="9" /></td>
                        <td><button type="button" onclick="onclickUpdate(290);" class="btn btn-primary btn-xs">수정하기</button></td>
                    </tr>      <tr>
                        <td><input type="checkbox" name="list[]" value="288" /></td>
                        <td>288</td>
                        <td><img src="/user/product/288_1.png" style="width:90px;"></td>
                        <td>Dental Treats sub - sub</td>
                        <td>로즈플라워캔들</td>
                        <td>로즈플라워캔들</td>
                        <td>1,000</td>
                        <td>2020-01-13</td>
                        <td><button type="button" class="btn btn-success btn-xs">보임</button></td>
                        <td><input type="radio" name="order_code" value="8" /></td>
                        <td><button type="button" onclick="onclickUpdate(288);" class="btn btn-primary btn-xs">수정하기</button></td>
                    </tr>      <tr>
                        <td><input type="checkbox" name="list[]" value="285" /></td>
                        <td>285</td>
                        <td><img src="/user/product/285_1.png" style="width:90px;"></td>
                        <td>Dental Treats sub - sub</td>
                        <td>Yellow&Brown Oriental</td>
                        <td>바닐라베리 판매1위 테라피 클렌저</td>
                        <td>15,000</td>
                        <td>2020-01-08</td>
                        <td><button type="button" class="btn btn-success btn-xs">보임</button></td>
                        <td><input type="radio" name="order_code" value="6" /></td>
                        <td><button type="button" onclick="onclickUpdate(285);" class="btn btn-primary btn-xs">수정하기</button></td>
                    </tr>      <tr>
                        <td><input type="checkbox" name="list[]" value="283" /></td>
                        <td>283</td>
                        <td><img src="/user/product/283_1.png" style="width:90px;"></td>
                        <td>Dental Treats sub - sub</td>
                        <td>상품명 500 (best,event-숨김)</td>
                        <td>리스트 문구2</td>
                        <td>500</td>
                        <td>2019-10-29</td>
                        <td><button type="button" class="btn btn-success btn-xs disabled">숨김</button></td>
                        <td><input type="radio" name="order_code" value="5" /></td>
                        <td><button type="button" onclick="onclickUpdate(283);" class="btn btn-primary btn-xs">수정하기</button></td>
                    </tr>      <tr>
                        <td><input type="checkbox" name="list[]" value="278" /></td>
                        <td>278</td>
                        <td><img src="/user/product/278_1.png" style="width:90px;"></td>
                        <td>Dental Treats sub - sub</td>
                        <td>하루한팩 (보임)</td>
                        <td>하루한팩</td>
                        <td>3,000</td>
                        <td>2019-07-13</td>
                        <td><button type="button" class="btn btn-success btn-xs">보임</button></td>
                        <td><input type="radio" name="order_code" value="3" /></td>
                        <td><button type="button" onclick="onclickUpdate(278);" class="btn btn-primary btn-xs">수정하기</button></td>
                    </tr>      <tr>
                        <td><input type="checkbox" name="list[]" value="273" /></td>
                        <td>273</td>
                        <td><img src="/user/product/273_1.jpg" style="width:90px;"></td>
                        <td>Dental Treats sub - sub</td>
                        <td>상품명23 (BEST,NEW - 보임)</td>
                        <td>리스트 문구</td>
                        <td>40,000</td>
                        <td>2019-06-21</td>
                        <td><button type="button" class="btn btn-success btn-xs">보임</button></td>
                        <td><input type="radio" name="order_code" value="2" /></td>
                        <td><button type="button" onclick="onclickUpdate(273);" class="btn btn-primary btn-xs">수정하기</button></td>
                    </tr>                    </form>
                    </table>
                    <br>

                    <button type="button" onclick="selectDelete('deleteProduct');" class="btn btn-danger btn-sm"><i class="fa fa-minus-square"></i> 선택삭제</button>
                    <button type="button" onclick="onclickCopyProduct()" class="btn btn-warning btn-sm"><i class="fa fa-copy"></i> 제품 복제</button>
                    <button type="button" onclick="downloadExcel();" class="btn btn-warning btn-sm" style="margin-left:20px;"><i class="fa fa-file-excel-o"></i> Excel 다운로드</button>
                    <form name="form_download" method="post" action="?tpf=admin/product/process">
                        <input type="hidden" name="mode" value="downloadExcel">
                        <input type="hidden" name="search_data">
                    </form>

                    <div style="text-align:right;">
                        <ul class="pagination" style="margin:0;">
<li class="active"><a href="?tpf=admin/product/list_sub&locale=ko&page=1">1</a></li>
</ul>                    </div>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div><!-- /.col-xs-12 -->
    </div><!-- /.row -->
</section>
<!-- jQuery 3 -->
<script src="https://mir9.co.kr/resource/js/AdminLTE-2.4.2/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="https://mir9.co.kr/resource/js/AdminLTE-2.4.2/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="/html/js/common.js" type="text/javascript" charset="utf-8"></script>

<script>
        function downloadExcel() {  // Excel 다운로드
            form_download.target = 'iframe_process';
            form_download.search_data.value = $('#form_search :input').serialize();
            form_download.submit();
        }
        function setData(code) {
            $.ajax({
				url:'http://demoshop.mir9.kr/api/process.php',
				type:'post',
				dataType:'json',
				data:{
					method:'BizProduct.infoProduct',
                    code:code
				},
				success:function(data, textStatus, jqXHR){
                    var json_data = data.data;
                    parent.clearOptionList();

                    parent.$('form[name="form_register"] #mode').val('updateProduct');
                    parent.$('#code').val(code);

                    var itemCategoryCode = json_data.category_code;

					//제품 카테고리 불러오기
					parent.$('#category_depth').html('');
					parent.Depth = 0
					parent.getCategory(itemCategoryCode);
                    parent.$('[name=model]').val(json_data.model);
                    parent.$('[name=title]').val(json_data.title);
                    parent.$('[name=title_eng]').val(json_data.title_eng);
                    parent.$('[name=list_title]').val(json_data.list_title);
                    parent.$('[name=list_title_eng]').val(json_data.list_title_eng);
                    parent.$('[name=brief]').val(json_data.brief);
                    parent.$('[name=keyword]').val(json_data.keyword);
                    parent.$('[name=brief_eng]').val(json_data.brief_eng);
                    parent.$('[name=consumer_price]').val(json_data.consumer_price);
                    parent.$('[name=sale_price]').val(json_data.sale_price);
                    parent.$('[name=point]').val(json_data.point);
                    parent.objEditor.setData(json_data.content);
                    //parent.$('[name=is_main]').val(json_data.is_main);
					if (json_data.is_best == 'y') parent.$('input:checkbox[id="is_best"]').prop('checked',true);
                    if (json_data.is_new == 'y') parent.$('input:checkbox[id="is_new"]').prop('checked',true);
                    if (json_data.is_event == 'y') parent.$('input:checkbox[id="is_event"]').prop('checked',true);
                    if (json_data.is_soldout == 'y') parent.$('input:checkbox[id="is_soldout"]').prop('checked',true);
                    parent.$('[name=status]').val(json_data.status);
                    parent.$("span[id^='display_file']").css('display','none');
                    if (typeof json_data.files == 'object') {
                        var img_tag = '';
                        $.each(json_data.files, function(index, value) {
                            var arrTmp = value.split('/');
                            var arrValue = arrTmp[arrTmp.length-1].split('?');
                            var url = '?tpf=common/image_view&file_name=product/'+arrValue[0];
                            var url2 = '?tpf=common/image_delete&file_name=product/'+arrValue[0]+'&table=product&code='+index;
                            img_tag = '<button type="button" onclick="winOpen(\''+url+'\');" class="btn btn-success btn-xs">보기</button>&nbsp;';
                            img_tag += '<button type="button" onclick="confirmIframeDelete(\''+url2+'\');" class="btn btn-danger btn-xs">삭제</button>';
                            parent.$('#display_file'+index).html(img_tag);
                            parent.$('#display_file'+index).css('display','');
                        });
                    }

                    // 옵션 처리
					if(json_data.option.total > 0){
						$.each(json_data.option.list, function(index, row) {
                            parent.insertOption(row.option_name, row.option_value, row.option_price, row.is_necessary);
						});
					}
				},
				error:function(jqXHR, textStatus, errorThrown){
					console.log(textStatus);
					// $('#content').val(errorThrown);
				}
			});
        }
        function onclickInsert() {
            parent.$('#modalContent').modal({backdrop:'static', show:true});
            parent.$('#option_list').html('');
            parent.form_register.reset();
            parent.objEditor.setData('');
            parent.form_register.mode.value = 'insertProduct';
            parent.form_register.locale.value = 'ko';
            parent.form_register.category_code.value = '';
            parent.$('#category_depth').html('');
            parent.$('[id^=display_file]').css('display','none');
        }
        function onclickUpdate(code) {
            parent.$('#modalContent').modal({backdrop:'static', show:true});
            parent.form_register.reset();
            setData(code);
        }
        // 제품복제 체크버튼 및 모달레이어창
        function onclickCopyProduct() {
            var count = $(":input[name = 'list[]']").length;
            if (count > 0) {
                if (isCheckedBox('form_list')) {

                    var f = eval('form_list');
                    var chkBox = document.getElementsByName('list[]');
                    var chkLen = chkBox.length;
                    var code = '';

                    // 선택된 파일이 있는지 체크
                    for (i = 0; i < chkLen; i++) {
                        if (chkBox[i].checked) code += chkBox[i].value+',';
                    }
                    parent.$('#modalCopyProduct').modal({backdrop:'static', show:true});
                    parent.formCopyProduct.code.value = code;
                }
                else {
                    alert('항목을 선택하여야 합니다.');
                    return false;
                }
            }
            else {
                alert('항목이 없습니다.');
                return false;
            }
        }
</script>
</body>
</html>