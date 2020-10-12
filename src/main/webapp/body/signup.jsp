<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<div class="container">
	  <h2>회원가입</h2>
	  <form:form modelAttribute="person" class="form-horizontal" action="../main/signup.html" method="post">
	  	<div class="form-group">
	      <label class="control-label col-sm-2" for="nickname">닉네임:</label>
	      <div class="col-sm-10">
	        <form:input type="text" path="person_name" class="form-control" id="nickname" placeholder="Nickname" name="nickname"/>
	      	<font color="red"><form:errors path="person_name"/></font><br/>
	      </div>
	    </div>
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
	      <label class="control-label col-sm-2" for="pwd2">비밀번호 확인:</label>
	      <div class="col-sm-10">          
	        <input type="password" class="form-control pwd" id="pwd2" placeholder="Password" name="pwd">
	      	<span id="alert-success" style="display: none;">비밀번호가 일치합니다.</span>
	   		<span id="alert-danger" style="display: none; color: red;">비밀번호가 일치하지 않습니다.</span>
	     	<input type="hidden" value="false" id="pwd3"/>
	     	<script>
			    $('.pwd').keyup(function () {
			        var pwd1 = $("#pwd1").val();
			        var pwd2 = $("#pwd2").val();
			 
			        if ( pwd1 != '' && pwd2 == '' ) {
			            null;
			        } else if (pwd1 != "" || pwd2 != "") {
			            if (pwd1 == pwd2) {
			                $("#alert-success").css('display', 'inline-block');
			                $("#alert-danger").css('display', 'none');
			                $("#pwd3").val('true');
			                $("#submit").attr("disabled", false);
			            } else {
			                $("#alert-success").css('display', 'none');
			                $("#alert-danger").css('display', 'inline-block');
			                $("#pwd3").val('false');
			                $("#submit").attr("disabled", true);
			            }
			        }
			    });
			</script>
	      </div>
	    </div>
	    <div class="form-group">        
	      <div class="col-sm-offset-2 col-sm-10">
	        <button type="submit" class="btn btn-primary" id="submit">가입</button>
	        <button type="reset" class="btn btn-danger">취소</button>
	      </div>
	    </div>
	  </form:form>
	</div>
</body>
</html>