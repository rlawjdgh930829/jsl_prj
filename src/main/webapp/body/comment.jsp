<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container-fluid">
		<div class="col-sm-12">
			<hr>
			<h4>Comment:</h4>
			<form role="form" id="commentForm" name="commentForm" method="post">
        		<div class="form-group">
					<textarea class="form-control" rows="3" required id="reply_content" name="reply_content"></textarea>
					 <input type="hidden" id="product_no" name="product_no" value="${ DETAIL.product_no }" />
				</div>
			<button type="button" class="btn btn-success" onClick="fn_comment('${ DETAIL.product_no }')">Submit</button>
			</form><br/>
			<p><span class="badge" id="cCnt"></span> Comments:</p>
			<hr>
		</div>
	</div>
	<div class="container">
	    <form id="commentListForm" name="commentListForm" method="post">
	        <div id="commentList">
	        </div>
	    </form>
	</div>
	<hr>
	
	<script>
		function fn_comment(code){ 
		    $.ajax({
		        type:'POST',
		        url : "<c:url value='../reply/addComment.html'/>",
		        data:$("#commentForm").serialize(),
		        success : function(data){
		            if(data=="success") {
		                getCommentList();
		                $("#reply_content").val("");
		            }
		        },
		        error:function(request,status,error){}   
		    });
		}
		
		function delete_comment(no){ 
		    $.ajax({
		    	type:'POST',
		        url : "<c:url value='../reply/deleteComment.html'/>",
		        data: {"no" : no},
		        success : function(data){
		            if(data=="success") {
		                getCommentList();
		            }
		        },
		        error:function(request,status,error){}   
		    });
		}
	
		$(function(){
		    getCommentList();
		});
		
		function getCommentList(){
		    $.ajax({
		        type:'GET',
		        url : "<c:url value='../reply/commentList.html'/>",
		        dataType : "json",
		        data:$("#commentForm").serialize(),
		        success : function(data){
		            
		            var html = "";
		            var cCnt = data.length;
		            
		            if(data.length > 0){
		                for(i=0; i<data.length; i++){
		                    html += "<div class='col-sm-12' style='margin-left:" + 20*data[i].reply_depth + "px;''>";
		                    html += "<h4>"+data[i].person_name+"</h4>";
		                    html += "<p>" + data[i].reply_content + "</p><br/>";
		                    if(data[i].USER_NO != null) {
		                    html += "<div align='right'><button type='button' class='btn btn-primary' id='btn"+i+"' name='btn"+i+"' onClick='comment("+data[i].reply_no+","+i+","+data[i].product_no+")'>답변</button>";
		                    }
		                    if(data[i].USER_NO == data[i].person_no) {
							html += "/<button type='button' class='btn btn-danger' onClick='delete_comment("+data[i].reply_no+")'>삭제</button>";
		                    }
		                    html += "</div><div id='comment"+i+"'/></div><hr>";
		                    html += "</div>";
		                } 
		            } else {
		                html += "<div>";
		                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
		                html += "</table></div>";
		                html += "</div>";
		            }
		            $("#cCnt").html(cCnt);
		            $("#commentList").html(html);
		        },
		        error:function(request,status,error){}
		    });
		}

		function comment(reply_no, i, product_no) {
			$("#comment"+i).append('<div class="col-sm-12">' +
					'<form id="subCommentForm'+i+'" name="subCommentForm'+i+'" method="post">' +
					'<br><label for="exp">답글:</label>' +
                    '<input type="input" style="width: 60%;" class="form-control" id="reply_content" name="reply_content" placeholder="Content">' +
                    '<input type="hidden" value="'+reply_no+'" id="reply_no" name="reply_no">' +
                    '<input type="hidden" value="'+product_no+'" id="product_no" name="product_no">' +
                    '<button type="button" class="btn btn-success" onClick="subComment('+i+')">등록</button>' +
                    '</form>' +
                    '</div>'
                   	);
			$("#btn"+i).attr("disabled", true);
		}
		
		function subComment(i){
		    $.ajax({
		        type:'POST',
		        url : "<c:url value='../reply/subComment.html'/>",
		        data:$("#subCommentForm" +i).serialize(),
		        success : function(data){
		            if(data=="success") {
		            	getCommentList();
		            }
		        },
		        error:function(request,status,error){}   
		    });
		}
		 
	</script>
</body>
</html>