<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-sm-12">
		<hr>
		<h2>${ DETAIL.product_title }</h2>
		<h5><small><span class="glyphicon glyphicon-time"></span> ${ DETAIL.product_date }</small></h5>
		<div align="center"><img src="../upload/${ DETAIL.product_img }" style="max-width: 30%;height: auto;"></div>
		${ DETAIL.product_content }
		<br/><br/>
		<div align="right">
			<c:if test="${ DETAIL.person_no == USER.person_no }">
				<a href="../product/delete.html?no=${ DETAIL.product_no }" class="btn btn-danger">삭제</a>
				<a href="../product/modify.html?no=${ DETAIL.product_no }" class="btn btn-warning">수정</a>
			</c:if>
			<a href="../main/list.html" class="btn btn-info">List</a>
		</div>
	</div>
	<br><br>
	<%@ include file="/body/comment.jsp" %>
</body>
</html>