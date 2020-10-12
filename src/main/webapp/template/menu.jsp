<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.navbar {
      margin-bottom: 50px;
      border-radius: 0;
    }
</style>
</head>
<body>
	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>                        
	      </button>
	      <a class="navbar-brand" href="#">Logo</a>
	    </div>
	    <div class="collapse navbar-collapse" id="myNavbar">
	      <ul class="nav navbar-nav">
	        <li class="active"><a href="../index.jsp">Home</a></li>
	        <li><a href="../main/list.html">List</a></li>
	      </ul>
	      <form class="navbar-form navbar-right" role="search" action="../main/list.html">
	        <div class="form-group input-group">
	          <input type="text" class="form-control" name="search" placeholder="Search..">
	          <span class="input-group-btn">
	            <button class="btn btn-default" type="submit">
	              <span class="glyphicon glyphicon-search"></span>
	            </button>
	          </span>        
	        </div>
	      </form>
	      <ul class="nav navbar-nav navbar-right">
	      	<c:if test="${ USER == null }">
	      		<li><a href="../main/signup.html"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
     			<li><a href="../main/signin.html"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
	      	</c:if>
	     	<c:if test="${ USER != null }">
	     		<li><a href="../main/logout.html"><span class="glyphicon glyphicon-user"></span> ${ USER.person_name }</a></li>
	     	</c:if>
	      </ul>
	    </div>
	  </div>
	</nav>
</body>
</html>