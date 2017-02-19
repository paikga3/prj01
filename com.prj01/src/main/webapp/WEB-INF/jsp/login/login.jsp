<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.1.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#btnLogin').click(function() {
			var girls = [];
			$('input[name=girl]:checked').each(function() {
				girls.push($(this).val());
			});
			
			var data = {
				id: $('#id').val(),
				pw: $('#pw').val(),
				girl: girls.join(',')
			};
			
			$.ajax({
				url: '/loginPrc.do',
				dataType: 'json',
				type: 'POST',
				data: data,
				async: false,
				success: function(json) {
					if(json.res == 'success') {
						alert('로그인 성공');
					} else {
						alert('로그인 실패');
					}
				},
				error: function(jqXH, textStatus, errorThrown) {
					alert(errorThrown);
				}
				
			});
			return false;
		});
	});
</script>
</head>
<body>

<form action="" id="form">
	<label>아이디:</label><input type="text" id="id" name="id" /><br/>
	<label>비번:</label><input type="password" id="pw" name="pw" /><br/>
	<button id="btnLogin">로그인</button>
	<div>
		<input type="checkbox" name="girl" value="이민정" id="leeminjung"/><label for="leeminjung">이민정</label>
		<input type="checkbox" name="girl" value="이빛나" id="leebitna"/><label for="leebitna">이빛나</label>
		<input type="checkbox" name="girl" value="윤아" id="yuna"/><label for="yuna">유나</label>
		<input type="checkbox" name="girl" value="유리" id="yuri"/><label for="yuri">유리</label>
		<input type="checkbox" name="girl" value="수영" id="suyeong"><label for="suyeong">수영</label>
</div>
</form>



</body>
</html>