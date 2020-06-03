<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/TestWeb/css/bootstrap.css">
    <link rel="stylesheet" href="/TestWeb/css/custom.css">
    <title>BBS Test</title>
    
       
    <!--글쓰기만 적용되는 css-->   
    <style>
        .table-striped {
            text-align: center; 
            border: 2px solid #737373; 
        }

        .table-striped>tbody>tr {
            background-color: #f9f9f9
        }
    </style>
</head>

<body>
    <%@include file ="../include/header.jsp" %>

    <section>
        <div class="container" style="margin-top: 5%;">
            <div class="row">
                <form action="regist.board" method="post" name="regForm">
                    <table class="table table-striped" >
                        <thead>
                            <tr>
                                <th colspan="2" style="background-color: #9DCAFF; text-align: center;">게시판 글쓰기</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input type="text" class="form-control" placeholder="작성자" name="writer" maxlength="50"></td>
                            </tr>
                            <tr>
                                <td><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="50"></td>
                            </tr>
                            <tr>
                                <td><textarea rows="15" class="form-control" placeholder="1000 글자 이하" name="content" maxlength="1000" ></textarea></td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <input type="button" class="btn btn-primary pull-left" value="목록" onclick="location.href='list.board'">
                    <input type="submit" class="btn btn-primary pull-right" value="글쓰기" onclick="check()">
                </form>
            </div>
        </div>
    </section>
    
   <%@include file ="../include/footer.jsp" %>
   
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    
    <script>
		function check(){
			
			if(document.regForm.writer.value==''){
				alert("작성자는 필수 입니다");
				return false;
			}else if (document.reForm.title.value==''){
				alert("제목은 필수 입니다");
				return false;
			}else {
				document.regForm.submit();
			}
		}
	</script>

</body>

</html>