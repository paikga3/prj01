<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>테스트</title>
<script src="js/jquery-3.1.1.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		$('#file').change(function() {
			
		});
		
		$('#btn').click(function() {
			var input = document.getElementById('file');
			var fReader = new FileReader();
			fReader.readAsDataURL(input.files[0]);
			fReader.onloadend = function(event) {
				document.getElementById('img').src = event.target.result;
				var image = new Image();
				image.src = document.getElementById('img').src;
				alert(image.width);
			};
		});
		
		var str = '<p style="width:100px;">오우오우 ㅋㅋ 짱짱</p>';
		
		
		$('#regex').click(function() {
			var replaceStr = str.replace(/<(\/?)\w+\b((?:[^>\"\']|\"[^\"]*\"|\'[^\']*\')*)>/g, '');
			alert(str);
			alert(replaceStr);
		});
	});
	
	
	
</script>
</head>
<body>
<input type="file" id="file" name="file" />
<button id="btn">파일명보기 버튼</button>
<img id="img" alt="이미지파일없음" style="display: none;"/>
<div>
	<button id="regex">태그치환</button>
</div>
</body>
</html>