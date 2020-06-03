<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/TestWeb/css/bootstrap.css">
    <link rel="stylesheet" href="/TestWeb/css/custom.css">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <title>BBS Test</title>
    
    
    <!--회원가입 폼만 적용되는 css-->
    <style type="text/css">
        .table-striped>tbody>tr {
            background-color: #f9f9f9
        }

        .join-form {
            margin: 0 auto;
            padding: 20px;
            width: 50%;
            float: none;
            background-color: white;
        }
        
        
        .form-group > .sel {
            width: 120px;
            display: inline-block;
            
        }
    </style>
    
    
</head>

<body>
   <%@include file ="../include/header.jsp" %>

    <section>
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-9 col-sm-12 join-form">
                    <h2>회원가입<small>(가운데정렬)</small></h2>

                    <form action="joinForm.user" method="post" name="reg_form">
                        <div class="form-group">
                            <label for="id">아이디</label>
                            <input type="text" class="form-control" id="id" placeholder="아이디를 (영문포함 4~12자 이상)" name="id">
                        </div>
                        <div class="form-group">
                            <label for="password">비밀번호</label>
                            <input type="password" class="form-control" id="password" placeholder="비밀번호 (영 대/소문자, 숫자, 특수문자 3종류 이상 조합 8자 이상)" name="pw">
                        </div>
                        <div class="form-group">
                            <label for="password-confrim">비밀번호 확인</label>
                            <input type="password" class="form-control" id="password-confrim" placeholder="비밀번호를 확인해주세요." name="pw_check">
                        </div>
                        <div class="form-group">
                            <label for="name">이름</label>
                            <input type="text" class="form-control" id="name" placeholder="이름을 입력하세요." name="name">
                        </div>
                        <!--input2탭의 input-addon을 가져온다 -->
                        <div class="form-group">
                            <label for="hp">휴대폰번호</label><br>
                            
                            <input class="form-control sel" placeholder="010" name="phone1"> -
                            <input class="form-control sel" placeholder="xxxx" name="phone2"> -
                            <input class="form-control sel" placeholder="xxxx" name="phone3">
                        
                        </div>
                        <div class="form-group">
                             <label for="hp">이메일</label><br>
                            <input class="form-control sel" name="email">@
                            <select class="form-control sel">
                                <option>naver.com</option>
                                <option>gmail.com</option>
                                <option>daum.net</option>
                            </select>
                        </div>
                        
                        <div class="form-group">
                            <label for="addr-num">주소</label>
                            <input type="text" class="form-control" id="addr-basic" placeholder="기본주소" name="address">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" id="addr-detail" placeholder="상세주소">
                        </div>
                        <div class="form-group">
                            <button type="button"  class="btn btn-lg btn-success btn-block" onclick="joinConfirm()">회원가입</button>
                        </div>
                        <div class="form-group">
                            <button type="button" class="btn btn-lg btn-info btn-block" onclick="location.href='login.user'">로그인</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>


    </section>

	<%@include file ="../include/footer.jsp" %>
	
	<script>
	function joinConfirm() {

		if(document.reg_form.id.value == 0) {
			alert('아이디를 입력하세요');
			reg_form.id.focus(); 
			return false; 
		} else if(document.reg_form.pw.value == 0) {
			alert('비밀번호를 입력하세요');
			reg_form.pw.focus();
			return false;
		} else if(document.reg_form.name.value == 0) {
			alert('이름을 입력하세요');
			reg_form.name.focus();
			return false;
		} else if(document.reg_form.id.value.length < 4 ) {
			alert('아이디는 4~12자 이어야 합니다');
			reg_form.id.focus();
			return false;
		} else if(document.reg_form.pw.value != document.reg_form.pw_check.value) {
			alert('비밀번호 확인란을 확인하세요');
			reg_form.pw_check.focus();
			return false;
		} else if( confirm('회원가입을 하시겠습니까?') ) {
			
			reg_form.submit(); 
		}
	}
	</script>

</body>

</html>