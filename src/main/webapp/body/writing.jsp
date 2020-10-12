<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script src="/resources/js/summernote-ko-KR.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#summernote').summernote({
			height: 300,
			minHeight: null,
			maxHeight: null,
			lang: "ko-KR",
			placeholder: '최대 2000자까지 쓸 수 있습니다',
			toolbar: [
		    	['fontname', ['fontname']],
		    	['fontsize', ['fontsize']],
		    	['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    	['color', ['forecolor','color']],
		    	['table', ['table']],
		    	['para', ['ul', 'ol', 'paragraph']],
		    	['height', ['height']],
		    	['insert',['link','video']],
		    	['view', ['codeview', 'help']]
		    ],
		    fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
		});
		
		$('#price1').bind('keyup', function(e){
			var rgx1 = /\D/g;
			var rgx2 = /(\d+)(\d{3})/;
			var num = this.value.replace(rgx1,"");
			
			while (rgx2.test(num)) num = num.replace(rgx2, '$1' + ',' + '$2');
			this.value = num;
			
			if(num != ""){
				num = num.replace(/,/g, "");
			}
			$('#price2').val(num);
		});
	});
	
	function doIt(){
		var file=document.getElementById("file").files;
		var reader = new FileReader();
		reader.onload = function(){
			document.getElementById("img").src = reader.result;
		};
		reader.readAsDataURL(file[0]);
	}
</script>
</head>
<body>
	<div class="container">
	  <h2>글 등록</h2>
	  <form:form modelAttribute="product" class="form-horizontal" action="../product/writing.html" method="post" enctype="multipart/form-data">
	  	<div class="form-group">
	      <label class="control-label col-sm-2" for="title">제목:</label>
	      <div class="col-sm-10">
	        <form:input type="text" path="product_title" class="form-control" id="title" placeholder="Title" name="title"/>
	      	<font color="red"><form:errors path="product_title"/></font><br/>
	      </div>
	    </div>
	    <div class="form-group">
	    	<label class="control-label col-sm-2" for="file">썸네일:</label>
	    	<div class="col-sm-10">
	    		<img alt="" src="http://placehold.it/100x100" id="img" width="100" height="100">
				<form:input path="imagename" type="file" id="file" name="file" onChange="doIt()"/>
			</div>
		</div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="price">가격:</label>
	      <div class="col-sm-10">
	        <input type="text" class="form-control" id="price1" placeholder="Price" name="price1"/>
	        <form:input type="hidden" path="product_price" class="form-control" id="price2" name="price2"/>
	      	<font color="red"><form:errors path="product_price"/></font><br/>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="content">내용:</label>
	      <div class="col-sm-10">          
	        <form:textarea path="product_content" id="summernote" name="editordata"/>
	      	<font color="red"><form:errors path="product_content"/></font><br/>
	      </div>
	    </div>
	    <div class="form-group">        
	      <div class="col-sm-offset-2 col-sm-10">
	        <button type="submit" class="btn btn-primary" id="submit">등록</button>
	        <button type="reset" class="btn btn-danger">취소</button>
	      </div>
	    </div>
	  </form:form>
	</div>
</body>
</html>