<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>테스트</title>
<script src="js/jquery-3.1.1.js"></script>
<script src="js/inputmask/inputmask.js"></script>
<!-- <script src="js/inputmask/inputmask.numeric.extensions.js"></script> -->
<script src="js/inputmask/jquery.inputmask.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#t').inputmask("9{1,}");  //static mask */
		
		$('#tt').on('input', function(e) {
			$('#tt').attr('readonly', true);
			var inputVal = $('#tt').val();
            $('#tt').val(inputVal.replace(/[^0-9]/gi,''));
			$('#tt').removeAttr('readonly');
			
		});
		$('#tt').keydown(function(e) {
			if((e.which >= 48 && e.which <=57) || (e.which>=96 && e.which<=105)) {
				return true;
			} else {
				switch(e.which) {
					case 8:
					case 13:
					case 16:
					case 37:
					case 39:
						return true;
				}
				return false;
			}
		});
	});
</script>
</head>
<body>
<label for="t">커스텀이벤트</label><input type="text" id="t"/>
<label for="tt">기존이벤트</label><input type="text" id="tt"/>
</body>
</html>