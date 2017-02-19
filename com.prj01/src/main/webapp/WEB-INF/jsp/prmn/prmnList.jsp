<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/js/jquery-3.1.1.js"></script>
<script type="text/javascript" src="/js/jquery-template.js"></script>
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
		var err;
		$.ajax({
			url: "<c:url value='/prmn/list.do'/>",
			method: "POST",
			dataType: "json",
			async: false,
			success: function(json) {
				$("#shop-template").tmpl(json.list).appendTo($('#result').empty());
			},
			error: function(jqXH, textStatus, errorThrown) {
				alert(errorThrown);
			}
		});
		
		$('#add-low').click(function() {
			var pk = $('#result').children("tr").length + 1;
			$("#add-low-template").tmpl({"pk" : pk}).appendTo($('#result'));
		});
		
		$('#result').on('click', '#save', function() {
			
		});
		
		$('#btn').click(function() {
			
			$.ajax({
				url : "<c:url value='/prmn/merge.do'/>",
				method : 'POST',
				async : false,
				data : /* JSON.stringify({
					"shopList" : 
						[
						{"shopNo" : 2, "shopName" : "Mom Store", "shopLocation" : "CC Tower Seocho dong", "shopStatus" : "Y"},
						{"shopNo" : 3, "shopName" : "Sex Store", "shopLocation" : "D Tower Seocho dong", "shopStatus" : "Y"},
						{"shopNo" : 4, "shopName" : "Toy Store", "shopLocation" : "A Tower Seocho dong", "shopStatus" : "Y"}]
				}) */ {"param" : JSON.stringify(
						[
						{"shopNo" : 1, "shopName" : "Mom Store", "shopLocation" : "CC Tower Seocho dong", "shopStatus" : "Y"},
						{"shopNo" : 2, "shopName" : "Sex Store", "shopLocation" : "D Tower Seocho dong", "shopStatus" : "Y"},
						{"shopNo" : 3, "shopName" : "Toy Store", "shopLocation" : "A Tower Seocho dong", "shopStatus" : "Y"}]
				)},
				/* contentType: 'application/json; charset=UTF-8', */
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
<script id="shop-template" type="text/x-jquery-tmpl">
	<tr class="align-c">
		<td>\${shopNo}</td>
		<td>\${shopName}</td>
		<td>\${shopLocation}</td>
		<td>\${shopStatus}</td>
		<td><input type="checkbox" name="shop" id="\${shopNo}" value="\${shopName}"/><label for="\${shopNo}">선택</label></td>
	</tr>
</script>
<script id="add-low-template" type="text/x-jquery-tmpl">
	<tr class="align-c">
		<td>\${pk}</td>
		<td><input type="text" name="shopName" style="width:190px;"/></td>
		<td><input type="text" name="shopLocation" style="width:190px;"/></td>
		<td><input type="text" name="shopStatus" style="width:190px;"/></td>
		<td><button id="save">save</button><input type="checkbox" name="shop" id="\${pk}"/><label for="\${pk}">선택</label></td>
	</tr>
</script>
<h2>Shop List</h2>
<button id="add-low">add low</button>
<button id="btn">merge</button>
<table>
	<colgroup>
		<col width="200px">
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
			<th>Selection</th>
		</tr>
	</thead>
	<tbody id="result">

	</tbody>
</table>

</body>
</html>