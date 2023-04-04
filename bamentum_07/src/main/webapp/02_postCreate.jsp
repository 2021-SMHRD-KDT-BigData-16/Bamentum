<%@page import="com.tscm.model.BmtPostDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>바멘텀 | 글 작성"</title>


<link rel="stylesheet" href="./css/postCreate.css">


</head>

<body>
	<!-- Header -->
	<div>

		<body>
			<div class="page">
				<header>
					<img src="./img/로고_투명_흰색.png" class="Logo">
					<nav>
						<ul>
						<li><a href="01_post.jsp" class="menuLink" style="width : 50px; align : center;">바멘텀</a></li>
                    <li><a href="05_myprofile.jsp" class="menuLink" style="width : 70px; align : center;">내 프로필</a></li>
                    <li><a href="#" class="menuLink" style="width : 80px;">팔로잉보기</a></li>
                    <li><a href="04_bic_num.jsp" class="menuLink" style="width : 120px;">내 자전거 등록</a></li>

						</ul>

						<div class="search-box">
				<button type="button" class="btn-search" id="search_btn">
						<i class="fas fa-search"><img src="./img/search_white(2).png"
							class="search_icon" style="width: 40px; margin-top: 8px;"></i>
					</button>
					<input type="text" id="input_search" class="input-search" placeholder="검색어를 입력하세요!">


				</div>

						<img src="./img/profile_2.PNG" class="profile_circle">

					</nav>
				</header>
			</div>
		</body>
	</div>
	<%

	%>

	
			
		<form action="PostCreate.do" method="post">
		
        <div class = "postCreate_intro">
            <img src="./img/pencil-square.svg" style = "width : 50px; height : 50px; margin-left : 220px; margin-bottom : -30px;">
            <p class = "intro" style = "font-size : 30px; font-weight : 700">게시물 작성</p>
            <p class = "sub_intro_1">당신의 일상, 생각, 자전거와 관련된 모든 것들을</p>
            <p class = "sub_intro_2">바멘텀에서 공유해보세요!</p>
        </div>

        <section class="post_section">

            <div class="writing_div">
                <p><textarea class="title_input" name = "p_title" placeholder="제목을 입력하세요!😊"></textarea></p>
                <p><textarea class="content_input" name = "p_content" placeholder="내용을 입력하세요!😉"></textarea></p>
                <button class="post_submit" onclick="alert('피드를 등록하시겠습니까?')">등록</button>
                <button class="cancel_submit" onclick="alert('피드 작성을 취소하시겠습니까?')">취소</button>
            </div>
        </section>
		</form>
			





</body>

<!-- 페이지 이동 자바스크립트 -->
<script type="text/javascript">
	function PostCreate(postid) {
		console.log(postid);
		let f = document.createElement('form');

		let obj;
		obj = document.createElement('input');
		obj.setAttribute('type', 'hidden');
		obj.setAttribute('name', 'postid');
		obj.setAttribute('value', postid);

		f.appendChild(obj);
		f.setAttribute('method', 'post');
		f.setAttribute('action', 'onePost.do');
		document.body.appendChild(f);
		f.submit();
	}
</script>





</html>