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
        
        <!--게시판만 적용되는 css-->            
        <style>

            .table-striped > tbody > tr {
                background-color: rgba(255, 255, 255)
            }
            .row h2 {
                color: aliceblue;
                
            }
            .pagination-sm {
                margin: 0;
            }
            
        </style>
    </head>

    <body>
   <%@include file ="../include/header.jsp" %>
        
    <section>
        
        <div class="container">
            <div class="row">
                
                <h2>게시판 목록</h2>
                <table class="table table-striped" style="text-align: center; border: 2px solid #737373">
                    <thead>
                        <tr>
                            <th style="background-color: #9DCAFF; text-align: center;">번호</th>
                            <th style="background-color: #9DCAFF; text-align: center;">제목</th>
                            <th style="background-color: #9DCAFF; text-align: center;">작성자</th>
                            <th style="background-color: #9DCAFF; text-align: center;">작성일</th>
                        </tr>
                    </thead>
                    <c:forEach var="vo" items="${list }">
                    <tbody>
                        <tr>
                            <td>${vo.bno }</td>
                            <td><a href="content.board?bno=${vo.bno }">${vo.title }</a></td>
                            <td>${vo.writer }</td>
                            <td>${vo.regdate }</td>
                        </tr>
                       
                    </tbody>
                    </c:forEach>
                </table>

                <div class="text-center">
                    <ul class="pagination pagination-sm">
                        <li><a href="#">이전</a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">다음</a></li>
                    </ul>
                    <button class="btn btn-info pull-right" onclick="location.href='write.board'">글쓰기</button>
                </div>
                
            </div>
        </div>
    </section>
        
   <%@include file ="../include/footer.jsp" %>
        
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>

    </body>

</html>
