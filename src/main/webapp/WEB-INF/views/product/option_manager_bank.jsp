<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Dashboard</title>
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
<section class="content" style="padding-top:0;">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-body">
                    <table class="table table-bordered table-hover">
						<colgroup>
							<col width="30px" />
							<col width="30%" />
							<col width="*" />
							<col width="10%" />
						</colgroup>
                    <thead>
                    <tr>
                        <td>순번</td>
                        <td>옵션명</td>
                        <td>옵션값</td>
                        <td>명령</td>
                    </tr>
                    </thead>
      <tr>
                        <td>3</td>
                        <td>악세사리</td>
                        <td>2단, 3단, 4단</td>
                        <td>
							<button type="button" onclick="setOption(9);" class="btn btn-primary btn-xs">선택하기</button>
						</td>
                    </tr>      <tr>
                        <td>2</td>
                        <td>색상</td>
                        <td>빨강, 노랑, 파랑</td>
                        <td>
							<button type="button" onclick="setOption(8);" class="btn btn-primary btn-xs">선택하기</button>
						</td>
                    </tr>      <tr>
                        <td>1</td>
                        <td>사이즈</td>
                        <td>S, L, XL</td>
                        <td>
							<button type="button" onclick="setOption(7);" class="btn btn-primary btn-xs">선택하기</button>
						</td>
                    </tr>                    </form>
                    </table>
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
			function setOption(bank_code){
				parent.optionTabChange('1', '/index.php?tpf=admin/product/option_manager&bank_code='+bank_code);
			}

		
</script>
</body>
</html>