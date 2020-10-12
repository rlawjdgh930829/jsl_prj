<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	  <h2>로그인</h2>
	  <form:form modelAttribute="person" class="form-horizontal" action="../main/signin.html" method="post">
		<form:hidden path="person_name" value="null"/>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="email">이메일:</label>
	      <div class="col-sm-10">
	        <form:input type="text" path="person_email" class="form-control" id="email" placeholder="Email" name="email"/>
	      	<font color="red"><form:errors path="person_email"/></font><br/>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="pwd">비밀번호:</label>
	      <div class="col-sm-10">          
	        <form:input type="password" path="person_pwd" class="form-control pwd" id="pwd1" placeholder="Password" name="pwd"/>
	      	<font color="red"><form:errors path="person_pwd"/></font><br/>
	      </div>
	    </div>
	    <div class="form-group">        
	      <div class="col-sm-offset-2 col-sm-10">
	      	<c:if test="${ MESSAGE != null}">
	      		<font color="red">이메일이나 비밀번호가 잘못되었습니다</font><br/>
	      	</c:if>
	        <button type="submit" class="btn btn-primary" id="submit">로그인</button>
	        <button type="reset" class="btn btn-danger">취소</button>
	      </div>
	    </div>
	  </form:form>
	</div>
</body>
</html>