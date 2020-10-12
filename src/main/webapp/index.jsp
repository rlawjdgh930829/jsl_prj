<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<head>
<meta charset="utf-8">
<title>Welcome</title>
</head> 
<body>

	<jsp:include page="template/menu.jsp"/>
	
	<c:if test="${ BODY == null }">
		<jsp:include page="main/main.html"/>
	</c:if>
	<c:if test="${ BODY != null }">
		<jsp:include page="${ BODY }"/>
	</c:if>
		
	<jsp:include page="template/footer.jsp"/>

</body>
</html>
