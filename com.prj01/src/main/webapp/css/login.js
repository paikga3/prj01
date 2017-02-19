$(function() {
	
	var footerHeight = $('footer').outerHeight();
	var mainHeight = $(document).height() - footerHeight;
	
	$('main').css('height', mainHeight + 'px');

	$(window).resize(function() {
		var footerHeight = $('footer').outerHeight();
		var mainHeight = $(document).height() - footerHeight;

		$('main').css('height', mainHeight + 'px');
	});
	
	$('.login').position({
		of: $('main')
	});
	
	$(window).resize(function() {
		$('.login').position({
			of: $('main')
		});
	});
	
	// 로그인
	$('.login-button').click(function() {
		var userData = {
			id: $('#id').val(),
			pw: $('#pw').val(),
			is_ajax: 1
		};
		$.ajax({
			type: 'POST',
			dataType: 'json',
			url: action,
			data: userData,
			success: function(res) {
				if (res == 'success') {
					alert('로그인에 성공하였습니다.');
				}
				else {
					alert('입력한 아이디와 비밀번호가 일치하지 않습니다.');
				}
			}
		});
		return false;
	});
				
});