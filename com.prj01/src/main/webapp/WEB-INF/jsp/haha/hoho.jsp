<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/js/jquery-3.1.1.js"></script>
<title>간단한 예제</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.css"/>
<script type="text/javascript">
	$(function() {
		$('input[name=fnc]').click(function(e) {
			e.preventDefault();
			$('#radio').trigger('click', true);
		});
		
		$('#chkall').click(function() {
			var state = $(this).prop('checked');
			$('input[name=fnc]').prop('checked', state);
			
		});
		
		var radioState = false;
		
		$('#radio').click(function(e, sts) {
			if(sts == true) {
				alert('이빛나가 섹스하자고 조릅니다.');
				return false;
			}
			
			if(radioState == false) {
				radioState = true;
			} else {
				radioState = false;
				$(this).prop('checked', false);
			}

			var notChecked = $('input[name=fnc]:not(:checked)').length;
			if(notChecked == 0) {
				$('#chkall').prop('checked', true);
			} else {
				$('#chkall').prop('checked', false);
			}
			
		});
	});

</script>
</head>
<body>
<form class="form-inline">
	<div class="form-group">
		<div><label for="fnc">기능</label></div>
		<label for="fnc1">기능1</label><input type="checkbox" name="fnc" class="form-control" id="fnc1"/>
		<label for="fnc2">기능2</label><input type="checkbox" name="fnc" class="form-control" id="fnc2"/>
		<label for="fnc3">기능3</label><input type="checkbox" name="fnc" class="form-control" id="fnc3"/>
	</div>
</form>

<div style="margin-top:30px;" class="input-group">
	<label for="chkall" class="input-group-addon">전부선택</label>
	<input type="checkbox" id="chkall" class="form-control" />
</div>

<button>체크박스 상태체크</button>
<input type="radio" id="radio" /><label for="radio">라디오버튼</label>


</body>
</html>