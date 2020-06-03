<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/TestWeb/css/bootstrap.css">
    <link rel="stylesheet" href="/TestWeb/css/custom.css">
    
</head>
<body>
    <%@include file ="../include/header.jsp" %>
    
<section>
        <div class="container">
            <div class="row join-wrap">
                <!--join-form을 적용한다 float해제 margin:0 auto-->
                <div class="col-xs-12 col-md-9 join-form">
                    
                    <div class="titlebox">
                        MEMBER INFO                    
                    </div>
                    <form action="updateForm.user" method="post" name="regForm">
                    <p>*표시는 필수 입력 표시입니다</p>
                    <table class="table">
                        <tbody class="m-control">
                            <tr>
                                <td class="m-title">*ID</td>
                                <td><input class="form-control input-sm" name="id" value="${uservo.id }" readonly="readonly"></td>
                            </tr>
                            <tr>
                                <td class="m-title">*이름</td>
                                <td><input class="form-control input-sm" name="name" value="${uservo.name }"></td>
                            </tr>
                            <tr>
                                <td class="m-title" name="pw" type="password">*비밀번호</td>
                                <td><input class="form-control input-sm" name="pw" ></td>
                            </tr>
                            <tr>
                                <td class="m-title">*비밀번호확인</td>
                                <td><input class="form-control input-sm" name="pw_check" type="password" ></td>
                            </tr>
                            <tr>
                                <td class="m-title">*E-mail</td>
                                <td>
                                    <input class="form-control input-sm" name="email" value="${uservo.email }">@
                                    <select class="form-control input-sm sel">
                                        <option>naver.com</option>
                                        <option>gmail.com</option>
                                        <option>daum.net</option>
                                    </select>
                                    <button class="btn btn-info">중복확인</button>
                                </td>
                            </tr>
                            <tr>
                                <td class="m-title">*휴대폰</td>
                                <td>
                                    <input class="form-control input-sm sel" name="phone1" value="${uservo.phone1 }"> -
                                    <input class="form-control input-sm sel" name="phone2" value="${uservo.phone2 }"> -
                                    <input class="form-control input-sm sel" name="phone3" value="${uservo.phone3 }">
                                </td>
                            </tr>
                            <tr>
                                <td class="m-title">*주소</td>
                                <td><input class="form-control input-sm add" name="address" value="${uservo.address }"></td>
                            </tr>
                            <tr>
                                <td class="m-title">*상세주소</td>
                                <td><input class="form-control input-sm add"></td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <div class="titlefoot">
                        <button class="btn" onclick="check()">수정</button>
                        <button class="btn" onclick="location.href='mypage.user'">목록</button>
                    </div>
                  </form>  
                </div>


            </div>

        </div>

    </section>
    
    
   <%@include file ="../include/footer.jsp" %>
   
   <script>
		function check(){
			if(document.regForm.pw.value.length<5){
				alert("비밀번호 5글자 이상입니다");
				return false;
			}else if(document.regForm.pw.value != document.regForm.pw_check.value){
				alert("비밀번호 확인란 확인하세요");
				document.regForm.pw_check.focus();
				return false;
			}else if(document.regForm.name.value ==''){
				alert("이름은 필수 사항 입니다");
				return false;
			}else{
				document.regForm.submit();
			}
		}
	</script>

    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>