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

	<div class="container">    
		<div class="row">
	 	
	 	<c:if test="${ LIST == null }">
	 		<div class="col-sm-8"> 
	 			등록된 게시물이 없습니다
	 		</div>
	 	</c:if>
	 	<c:if test="${ LIST != null }">
	 		<c:forEach items="${ LIST }" var="item">
	 		<div class="col-sm-4"> 
		    	<div class="panel panel-success">
		    		<div class="panel-heading"><a href="../product/detail.html?no=${ item.product_no }">${ item.product_title }</a></div>
		       		<div class="panel-body" align="center"><a href="../product/detail.html?no=${ item.product_no }"><img src="../upload/${ item.product_img }" class="img-responsive" style="width:auto; height:300px;" alt="Image"></a></div>
		       	 	<div class="panel-footer" align="right"><fmt:formatNumber value="${ item.product_price }" pattern="#,###" />원</div>
	    		</div>
	    	</div>
	 		</c:forEach>
	 	</c:if>
		</div>
	</div><br>
	
	<div class="row">
        <div class="col-md-11">
			<a href="../product/writing.html" class="btn btn-primary pull-right">글쓰기</a>
    	</div>
    </div>
    
	<div class="container" align="center">          
	  <ul class="pagination">
	  	<c:if test="${ pageNo != 1 }">
	  		<li><a href="../main/list.html?pageNo=${ pageNo-1 }">Previous</a></li>
	  	</c:if>
	    <c:forEach var="page" begin="${ start }" end="${ end }">
	    	<c:if test="${ pageNo ==  page }">
	    		<li class="active"><a href="#">${ page }</a></li>
	    	</c:if>
	    	<c:if test="${ pageNo !=  page }">
	    		<li><a href="../main/list.html?pageNo=${ page }">${ page }</a></li>
	    	</c:if>
	    </c:forEach>
	    <c:if test="${ pageNo != PAGE_CNT }">
	    	<li><a href="../main/list.html?pageNo=${ pageNo+1 }">Next</a></li>
	    </c:if>
	  </ul>
	</div>
	
</body>
</html>