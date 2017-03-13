<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기수정렬</title>
<script type="text/javascript">
	var countingSort = function(array, k) {
		var count = [], result = [];
		for(var i=0; i<=k; i++) {
			count[i] = 0;
		}
		
		console.log(count, result, array.length);
		
		for(var j=0; j<array.length; j++) {
			count[array[j]] += 1;
		}
		
		console.log(count, result, k);
		
		for(i=0; i<k; i++) {
			count[i + 1] += count[i];
		}
		
		console.log(count, result);
		for(j=0; j<array.length; j++) {
			console.log(array[j], count[array[j]] - 1);
			result[count[array[j]] - 1] = array[j];
			count[array[j]] -= 1;
		}
		
		console.log(count, result);
		return result;
	};
	
	countingSort([3,4,0,1,2,4,2,4], 4);
</script>
</head>
<body>

</body>
</html>