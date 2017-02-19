<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>테스트</title>
<script src="js/jquery-3.1.1.js"></script>
<script type="text/javascript">
(function (factory) {
	if (typeof define === "function" && define.amd) {
		define("inputmask", ["inputmask.dependencyLib"], factory);
	} else if (typeof exports === "object") {
		module.exports = factory(require("./inputmask.dependencyLib"));
	} else {
		factory(window.dependencyLib || jQuery);
	}
}
(function ($) {
	alert($);
}
));
</script>
</head>
<body>

</body>
</html>