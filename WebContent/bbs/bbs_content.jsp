<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

 
<!DOCTYPE html>
<html lang="en">
<head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="/TestWeb/css/bootstrap.css">
        <link rel="stylesheet" href="/TestWeb/css/custom.css">

        <title>BBS Test</title>

</head>
<body>
 	
 	<%@include file ="../include/header.jsp" %>
 	
     <section>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-10 col-sm-12 join-form">
                    <h2>게시판 상세보기<small>(디자인이궁금하세요?)</small></h2>

                    <form action="modify.board" method="post">
                        <div class="form-group">
                            <label>등록일</label>
                            <input type="text" class="form-control" name="regdate" value="<fmt:formatDate value="${VO.regdate }" pattern="yyyy-MM-dd"/>">
                        </div>
                        <div class="form-group">
                            <label>글번호</label>
                            <input type="text" class="form-control" name="bno" value="${VO.bno }">
                        </div>
                        <div class="form-group">
                            <label>글쓴이</label>
                            <input type="text" class="form-control"  name="writer" value="${VO.writer }">
                        </div>
                        <div class="form-group">
                            <label>제목</label>
                            <input type="text" class="form-control"  name="title" value="${VO.title }">
                        </div>
                        <div class="form-group">
                            <label>내용</label>
                            <input type="text" class="form-control"  name="content" value="${VO.content }">
                        </div>
                        
                        <!--구현로직: 버튼은 온클릭을 사용하던 자바스크립트를 이용해야 합니다-->
                        <div class="form-group">
                            <button type="button" class="btn btn-success" onclick="location.href='list.board'">목록</button>
                            <button type="button" class="btn btn-info" onclick="location.href='modify.board?bno=${VO.bno}'">수정</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>


        </section>
    
 	<%@include file ="../include/footer.jsp" %>
    
</body>
</html>