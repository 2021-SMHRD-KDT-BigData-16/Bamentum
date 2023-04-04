<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link
        href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="./css/Login.css">

    <title>바멘텀 | 로그인</title>

<meta charset="UTF-8">

</head>
<body>
	
  <div class="introducing">
        <span>당신</span><span style="color : #ffffff">과</span> <span>자전거,</span>
        <br><span style="color : #ffffff">그렇게</span> <span>바멘텀.</span>
        <img src="./img/bicycle.svg" class="login_bic">
        <hr class="title-line" style="border : 1px solid #ffffff; width : 1100px;">
    </div>

    <!-- 메인 소개문구 우측 부가설명 문구 -->
    <div class="introducing_2">
        <span>오직 당신과 자전거만을 위한 특별한 공간.</span>
        <br>
        <span>다양한 자전거 소식을 만나보세요.</span>
        <br>
        <span>바로 여기,</span> <span class="intro_bam">바멘텀</span><span>에서.</span>
    </div>

    <!-- 로그인 양식 -->
    <div class="login-form">
        <form action="LogIn.do" method="post">
            <h3 class="login_title">로그인</h3>
            <input type="text" name="email" class="login_text-field" placeholder="아이디">
            <input type="password" name="pw" class="login_text-field" placeholder="비밀번호">
            <input type="submit" value="로그인" class="submit_btn">
            <button type="button" onclick="javascript:popOpen();" class="join_btn">회원가입</button>
        </form>

        <div class="links">
            <a href="#">아이디 / 비밀번호 찾기</a>
        </div>
    </div>

    <div class="modal-bg" onClick="javascript:popClose();"></div>
    
<!--  문경수 : 2023.03.30 Login 기능 시작 -->    
    
    <form class="join-form" action="Join.do" method="post" >
        <a href="00_login.jsp"><img class="join_back"
                src="/Bamen_Sub/bamentum_UI02/src/main/webapp/img/bg-img/x-lg.svg"></a>
        <h2 class="join_H">회원가입</h2>
        <h3 class="join_intro">"당신의 자전거와 함께하는 모든 순간을 즐겨보세요!"</h3>
        <h6 style="font-size : 20px; margin-bottom : 5px; margin-left : 10px;">이름</h6>
        <input type="text" class="text-field" name = "u_nick" placeholder="  이름 입력">
        <h6 class="join_elements" style="font-size : 20px; margin-top : 20px; margin-bottom : 5px; margin-left : 10px;">
            이메일</h6>
        <input type="text" class="text-field" name = "u_email" placeholder="  example@smhrd.co.kr">
        <h6 style="font-size : 20px; margin-top : 20px; margin-bottom : 5px; margin-left : 10px;">비밀번호</h6>
        <input type="password" class="text-field" name = "u_pw" placeholder="  비밀번호 입력">

        <!-- 개인정보 처리방침 / 서비스 이용약관 동의 -->
        <div class="checkbox_group" style="margin-left: 10px; margin-top: 50px;">

            <input type="checkbox" class="check_1"
                style="margin-bottom : 20px; width : 20px; height : 20px; vertical-align: -4px;">
            <label for="check_1"><a href="#">개인정보 처리방침 동의 <span
                        style="color : rgb(255, 112, 112)">(필수)</span></a></label>
            <br>
            <input type="checkbox" class="check_2" style="width : 20px; height : 20px; vertical-align: -4px;">
            <label for="check_2"><a href="#">서비스 이용약관 동의 <span
                        style="color : rgb(255, 112, 112)">(필수)</span></a></label>
            <!-- 개인정보 처리방침 / 서비스 이용약관 링크 -> 링크 누르면 자세한 약관으로 이동 -->

        </div>

        <input type="submit" class="join_submit" value="회원가입">
        <p style="margin : 90px; margin-top : 30px;">이미 회원이신가요? <a
                href="00_login.jsp" style="font-weight: 600;">로그인하기</a></p>
   
    <!-- !!!!!!!!!!!!!!!!테스트용 접속 기능 -->
        <a href="00_login.jsp" class="admin" style="font-weight: 600; margin-left : 220px;">관리자 접속</a>
    </form>
    
<!--  문경수 : 2023.03.30 Login 기능 시작 -->    

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"
        integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"> </script>
           
    <script>
        function popOpen() {

            var modalPop = $('.join-form');
            var modalBg = $('.modal-bg');

            modalBg.fadeIn();

            $(modalPop).show();
            $(modalBg).show();

        }

        function popClose() {
            var modalPop = $('.join-form');
            var modalBg = $('.modal-bg');

            $(modalPop).hide();
            $(modalBg).hide();

        }

    </script>
	
</body>
</html>