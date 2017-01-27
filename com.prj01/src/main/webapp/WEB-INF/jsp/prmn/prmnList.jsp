<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/js/jquery-3.1.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로모션 리스트</title>
<style type="text/css">
	td, th {
		border:1px solid blue;
	}
	.align-c {text-align:center;}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('#btn').click(function() {
			$.ajax({
				url : "<c:url value='/prmn/merge.do'/>",
				method : 'POST',
				async : false,
				data : JSON.stringify({
					"shopList" : 
						[
						{"shopNo" : 2, "shopName" : "Mom Store", "shopLocation" : "CC Tower Seocho dong", "shopStatus" : "Y"},
						{"shopNo" : 3, "shopName" : "Sex Store", "shopLocation" : "D Tower Seocho dong", "shopStatus" : "Y"},
						{"shopNo" : 4, "shopName" : "Toy Store", "shopLocation" : "A Tower Seocho dong", "shopStatus" : "Y"}]
				}),
				contentType: 'application/json; charset=UTF-8',
				success: function() {
					window.location.reload();
				},
				error: function(jqXH, textStatus, errorThrown) {
					alert(errorThrown);
				}
			});
		});
	});
</script>
</head>
<body>

<h2>Shop List</h2>
<table>
	<colgroup>
		<col width="200px">
		<col width="200px">
		<col width="200px">
		<col width="200px">
	</colgroup>
	<thead>
		<tr>
			<th>ShopNo</th>
			<th>ShopName</th>
			<th>ShopLocation</th>
			<th>ShopStatus</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${list }" var="item">
		<tr class="align-c">
			<td>${item.shopNo }</td>
			<td>${item.shopName }</td>
			<td>${item.shopLocation }</td>
			<td>${item.shopStatus }</td>
		<tr>
	</c:forEach>
	</tbody>
</table>
<button id="btn">merge 버튼</button>
</body>
</html>