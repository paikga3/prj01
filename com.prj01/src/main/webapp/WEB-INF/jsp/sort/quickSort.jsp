<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>퀵정렬</title>
<script type="text/javascript">


	var partition = function(array, left, right, pivotIndex) {
		
		var temp;
		// 기준값
		var pivot = array[pivotIndex];
		// left인덱스가 right인덱스보다 작거나 같은가?
		while(left <= right) {
			// 기준값과 비교해서 큰수가 나올때까지 left의 인덱스를 증가시킨다.
			while(array[left] < pivot) {
				left++;
			}
			
			// 기준값과 비교해서 작은수가 나올때까지 right의 인덱스를 감소시킨다. 
			while(array[right] > pivot) {
				right--;
			}
			
			// left인덱스가 right인덱스보다 작거나 같다면 left인덱스의 값과 right인덱스의 값을 바꿔치기한 후
			// left의 인덱스는 1증가시키고 right의 인덱스는 1감소시킨다.
			if(left <= right) {
				
				temp = array[left];
				array[left] = array[right];
				array[right] = temp;
				left++;
				right--;
			}
		}
		// left가 right보다 커지게 되면
		// left인덱스의 값과 pivotIndex의 값을 바꿔치기하고 left인덱스의 값을 리턴한다.
		temp = array[left];
		array[left] = array[pivotIndex];
		array[pivotIndex] = temp;
		return left;
	};
	
	var a = 0; // quickSort의 호출횟수
	
	var quickSort = function(array, left, right) {
		a++;
		var ccs = a + '번째 -- ';
		
		console.log(a + '번째 호출입니다.');
		console.log(ccs + '호출당시 array : ' + array.toString());
		// left로 전달된 파라미터가 없다면 0으로 셋팅한다.
		if(!left) {
			left = 0;
		}
		
		// right로 전달된 파라미터가 없다면 배열의 마지막 인덱스로 셋팅한다.
		if(!right) {
			right = array.length - 1;
		}
		
		// pivotIndex는 배열의 마지막 인덱스이다.
		var pivotIndex = right;
		
		console.log(ccs + 'left할당 : ' + left);
		console.log(ccs + 'right할당 : ' + right);
		console.log(ccs + 'pivotIndex할당 : ' + pivotIndex);
		
		// 새로운 pivotIndex의 값은 partition함수가 반환하는 left의 값이다.
		pivotIndex = partition(array, left, right - 1, pivotIndex);
		
		console.log(ccs + '새롭게 할당된 pivotIndex : ' + pivotIndex);
		
		// left (여기서는 0이다.)의 값이 새로운pivotIndex에서 1을 뺀 값보다 작다면
		// pivotIndex의 값이 1이 될때까지 이 if문은 실행된다. 정렬되어지는 배열값의 개수가 2개를 나타낸다.
		if(left < pivotIndex - 1) {
			console.log(ccs + 'left < pivotIndex - 1 진입');
			quickSort(array, left, pivotIndex - 1);
			console.log(ccs + 'left < pivotIndex - 1 진입 재귀호출 후의 변수값들 ');
			console.log(ccs + 'left : ' + left);
			console.log(ccs + 'right : ' + right);
			console.log(ccs + 'array : ' + array.toString());
		}
		
		
		// pivotIndex + 1의 값이 right값과 같거나 커질때까지 실행된다. 여기서 right는 7이다.
		
		if(pivotIndex + 1 < right) {
			console.log(ccs + 'pivotIndex + 1 < right');
			quickSort(array, pivotIndex + 1, right);
			console.log(ccs + 'pivotIndex + 1 < right 진입 재귀호출 후의 변수값들 ');
			console.log(ccs + 'left : ' + left);
			console.log(ccs + 'right : ' + right);
			console.log(ccs + 'array : ' + array.toString());
		}
		
		
		return array;
	};
	
	
</script>
</head>
<body>
	<span id="res"></span>
	
	<script type="text/javascript">
		document.getElementById('res').textContent = quickSort([1,3,2,4,5,8,7,6]).toString();
		
	</script>
</body>
</html>