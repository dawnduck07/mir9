<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>


<script>

var Depth = 0;
var itemCategoryDepth = 0;
function getCategory(itemCategoryCode){
    itemCategoryDepth = itemCategoryCode.length/2;
    if(Depth < 0 || Depth > itemCategoryDepth ){
        return;
    }else if(Depth == 0){
        $('#category_depth').html('');
        parent_category_code = '';
        selectedValue = itemCategoryCode.substring(0, 2);
    }else{
        $('#category_depth').find('select'); //�ʱ�ȭ
        parent_category_code = itemCategoryCode.substring(0, Depth*2);
        selectedValue = itemCategoryCode.substring(0, Depth*2+2);
    }

    $.ajax({
        url:'/api/process.php',
        type:'post',
        dataType:'json',
        data:{
            method:'BizProduct.listCategory',
            category_code:parent_category_code
        },
        success:function(data, textStatus, jqXHR){
            var json_data = data.data;

            if (json_data.list != null) {
                createSelectBox('category_depth', Depth, json_data.list, selectedValue);
                Depth++;
                getCategory(itemCategoryCode);
            }else{
                Depth = -1;
            }
        },
        error:function(jqXHR, textStatus, errorThrown){
            console.log(textStatus);
            // $('#content').val(errorThrown);
        }
    });
}
function createSelectBox(targetId, category_code_depth, optionArray, selectedValue) {
    var selectboxName = 'category_select_box_'+category_code_depth;
    var selectBox = document.createElement('select');
    selectBox.name = selectboxName;
    selectBox.id = selectboxName;
    selectBox.className = 'form-control input-sm categorySelectBox';
    selectBox.style.width = '30%';
    selectBox.style.margin = '0 0 0 5px';
    selectBox.style.display = 'inline-block';
    selectBox.onchange = function(){
        Depth = 0;
        getCategory(this.value);
    };

    if(itemCategoryDepth == category_code_depth){
        var option = createOption('<�з� ����>', '', '');
        try{// for IE earlier than version 8
            selectBox.add(option,selectBox.options[null]);
        }catch (e){
            selectBox.add(option,null);
        }
    }

    $.each(optionArray, function(index, value) {
        var option = createOption(value['title'], value['category_code'], selectedValue);

        try{// for IE earlier than version 8
            selectBox.add(option,selectBox.options[null]);
        }catch (e){
            selectBox.add(option,null);
        }
    });

    $('#'+targetId).append(selectBox);
}
function createOption(option_text, option_value, selectedValue){
    var option = document.createElement('option');
    option.text = option_text;
    option.value = option_value;

    if(selectedValue == option_value){
        option.selected = true;
    }

    return option;
}
if (window.CKEDITOR) {  // CKEDITOR loading ���� üũ (Web ���������� ���)
    var objEditor = CKEDITOR.replace('content', {
        height: 300,
        extraPlugins : 'tableresize',
        filebrowserUploadUrl: '/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files',
        filebrowserImageUploadUrl: '/daemon/ckeditor_upload.php?command=QuickUpload&type=Images',
        fillEmptyBlocks : true,
        line_height : '0px'
    });
    CKEDITOR.on('dialogDefinition', function (ev) {
        var dialogName = ev.data.name;
        var dialog = ev.data.definition.dialog;
        var dialogDefinition = ev.data.definition;

        if (dialogName == 'image') {
            dialog.on('show', function (obj) {
                this.selectPage('Upload'); //���ε������� ����
            });
            dialogDefinition.removeContents('advanced'); // �ڼ����� ����
            dialogDefinition.removeContents('Link'); // ��ũ�� ����
        }
    });
}
$.fn.modal.Constructor.prototype.enforceFocus = function () {   // bootstrap & ckEdiotr �ҽ� ���� �ڵ�
    modal_this = this
    $(document).on('focusin.modal', function (e) {
        if (modal_this.$element[0] !== e.target && !modal_this.$element.has(e.target).length && !$(e.target.parentNode).hasClass('cke_dialog_ui_input_select') && !$(e.target.parentNode).hasClass('cke_dialog_ui_input_text')) {
        }
    })
}

function register() {
    var categorySelectBoxS = $("#category_depth").find(".categorySelectBox");

	if(categorySelectBoxS.length > 0){
		var categorySelectValue = $("#category_select_box_"+(categorySelectBoxS.length-1)+" option:selected").val();
		form_register.category_code.value = categorySelectValue;

		if(form_register.category_code.value == ''){
			alert('��ǰ ī�װ��� ���õ��� �ʾҽ��ϴ�.');
			return false;
		}
	}
    if(form_register.title.value == '') { alert('��ǰ���� �Էµ��� �ʾҽ��ϴ�.'); form_register.title.focus(); return false;}
    if(form_register.sale_price.value == '') { alert('������ �Էµ��� �ʾҽ��ϴ�.'); form_register.sale_price.focus(); return false;}
    if (objEditor.getData().length < 1) {
        alert('������ �Էµ��� �ʾҽ��ϴ�.');
        objEditor.focus();
        return false;
    }
    if(form_register.mode.value == 'insertProduct') {   // �Է��϶�
        if(form_register.file1.value == '') { alert('����Ʈ �̹����� �Էµ��� �ʾҽ��ϴ�.'); form_register.file1.focus(); return false;}
        if(form_register.file2.value == '') { alert('����Ʈ �̹����� �Էµ��� �ʾҽ��ϴ�.'); form_register.file2.focus(); return false;}
    }
    form_register.target = 'iframe_process';
    form_register.submit();
}

function optionManager(mode,code) {
	optionTabChange('1','/index.php?tpf=admin/product/option_manager');
	$('#modalContent2').modal({backdrop:'static', show:true});
}

function closeOptionManager() {
	$('#modal_iframe').attr('src','#')
	$('#modalContent2').modal('hide');
}

function optionTabChange(on_idx, url){
	$('#option_tab_btn1').attr('class','btn btn-default');
	$('#option_tab_btn2').attr('class','btn btn-default');
	$('#option_tab_btn3').attr('class','btn btn-default');
	$('#option_tab_btn'+on_idx).attr('class','btn btn-primary');

	$('#modal_iframe').attr('src',url);
}

function insertOption(option_name, option_value_arr, option_price_arr, is_necessary) {
    var check_necessary = '';
    if (is_necessary == true || is_necessary == 'y') check_necessary = 'checked';
	var last_class = $('#option_list tr:last').attr('id');
	var row_num = 0;
	if(!(typeof last_class == 'undefined')) {
		row_num = (last_class.replace('option_num_','')*1) + 1;
	}

	var create_txt = '<tr id="option_num_'+row_num+'" >';
	create_txt += '<td>';
	create_txt += '	<input type="text" name="option_name['+row_num+']" class="form-control input-sm" value="'+option_name+'" readonly />';
	create_txt += '	<input type="checkbox" name="is_necessary['+row_num+']" '+check_necessary+' value="y"> �ʼ� ���� �׸�';
	create_txt += '</td>';
	create_txt += '<td>';
	for(var i=0 ; i<option_value_arr.length ; i++){
		create_txt += '	<input type="text" name="option_value['+row_num+']['+i+']" class="form-control input-sm" value="'+option_value_arr[i]+'" readonly />';
	}
	create_txt += '</td>';
	create_txt += '<td>';
	for(var i=0 ; i<option_price_arr.length ; i++){
		create_txt += '	<input type="text" name="option_price['+row_num+']['+i+']" class="form-control input-sm" value="'+option_price_arr[i]+'" readonly />';
	}
	create_txt += '</td>';
	create_txt += '<td>';
	create_txt += '	<button type="button" class="btn btn-primary btn-xs" onclick="modifyOption('+row_num+');"><span class="glyphicon glyphicon-plus"></span> ����</button>';
	create_txt += '	<button type="button" class="btn btn-danger btn-xs" onclick="removeOption(this);"><span class="fa fa-minus-square"></span> ����</button>';
	create_txt += '</td>';
	create_txt += '</tr>';

	$('#option_list').append(create_txt);
}

function updateOption(option_name, option_value_arr, option_price_arr, row_num, is_necessary) {
	var tr = $('#option_num_'+row_num);
	$(tr).find('input[name^=option_name]').val(option_name);
	$(tr).find('input[name^=is_necessary]').prop("checked", is_necessary);  // �ʼ� ����

	var tm_option_value_arr = $(tr).find('input[name^=option_value]');
	var tm_option_price_arr = $(tr).find('input[name^=option_price]');

	for(var i=0 ; i<option_value_arr.length ; i++) {
		if(i >= tm_option_value_arr.length) { // ���ο� �ɼǰ��� �߰��� ���
			create_txt = '	<input type="text" name="option_value['+row_num+']['+i+']" class="form-control input-sm" value="'+option_value_arr[i]+'" readonly />';
			var befor_html = $(tr).find('td:nth-child(2)').html();
			$(tr).find('td:nth-child(2)').html(befor_html+create_txt);

			var create_txt2 = '	<input type="text" name="option_price['+row_num+']['+i+']" class="form-control input-sm" value="'+option_price_arr[i]+'" readonly />';
			var befor_html2 = $(tr).find('td:nth-child(3)').html();
			$(tr).find('td:nth-child(3)').html(befor_html2+create_txt2);
		} else {
			$(tm_option_value_arr).get(i).value = option_value_arr[i];
			$(tm_option_price_arr).get(i).value = option_price_arr[i];
		}
	}

	if(option_value_arr.length < tm_option_value_arr.length){ // �迭 ���� �񱳷� �� üũ
		var delete_cnt = tm_option_value_arr.length - option_value_arr.length;
		for(var i=0 ; i<delete_cnt ; i++){
			$(tr).find('input[name^=option_value]:last').remove();
			$(tr).find('input[name^=option_price]:last').remove();
		}
	}

}

function modifyOption(row_num) {
	optionTabChange('1', 'index.php?tpf=admin/product/option_manager&row_num='+row_num);
	$('#modalContent2').modal({backdrop:'static', show:true});
}

function removeOption(ta) {
	$(ta).parent().parent().remove();
}

function clearOptionList() {
	$('#option_list').html('');
}

// ��ǰ���� Ȯ�ι�ư
function registerCopyProduct() {
    if(formCopyProduct.product_locale.value == '') { alert('�� ���õ��� �ʾҽ��ϴ�.'); formCopyProduct.product_locale.focus(); return false;}
    formCopyProduct.target = 'iframe_process';
    formCopyProduct.submit();
}
function checkHeight() {
    var height = $(window).height() - 200;
    document.getElementById('iframe_tree').height = height;
    document.getElementById('iframe_list').height = height;
}
checkHeight();

</script>
</html>