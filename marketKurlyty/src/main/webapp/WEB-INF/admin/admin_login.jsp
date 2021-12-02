<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/admin/login.css">
<script src="jquery-3.6.0.min.js"></script>

<script> // 아이디 or 비밀번호를 입력하지 않고 login버튼을 눌렀을때 입력하라는 문구가 뜨는 함수
	let id = $('#id');
	let pw = $('#pw');
	let bnt = $('#bnt');

	$(bnt).on('click', function() {
		if ($(id).val() == "") {
			$(id).next('label').addClass('warning');
			setTimeout(function() {
				$('label').removeClass('warning');
			}, 1500);
		} else if ($(pw).val == "") {
			$(pw).next('label').addClass('warning');
			setTimeout(function() {
				$('label').removeClass('warning');
			}, 1500);
		}
	});
</script>
<title>마켓컬리티 :: 내일의 장보기, 마켓컬리티</title>
</head>
<body>
    <section class="login-form">
        <h1>Market Kurlyty</h1>
        
        <form action="loginProc.mdo" method="post" name="formAdminLogin">
            <div class="int-area">
                <input type="text" name="admin_id" id="id" autocomplete="off" required>
                <label for="id">ID</label>
            </div>
            
            <div class="int-area">
                <input type="password" name="admin_pw" id="pw" autocomplete="off" required>
                <label for="pw">PASSWORD</label>
            </div>
            
            <div class="bnt-area">
                <button id="bnt" type="submit">LOGIN</button>
            </div>
        </form>
        
    </section>
</body>
</html>