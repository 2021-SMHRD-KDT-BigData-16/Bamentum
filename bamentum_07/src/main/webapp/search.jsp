<%@page import="com.tscm.model.BmtOnePostDTO"%>
<%@page import="com.tscm.model.BmtPostDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous">
	
</script>
<style>
@import url("./css/search.css");
</style>
</head>
<body>
	<!--헤더부분: 바멘텀 로고 등등-->
	<div class="page">
		<header>
			<img src="./img/로고_투명_흰색.png" class="Logo">
			<nav>
				<ul>
					<li><a href="01_post.jsp" class="menuLink"
						style="width: 50px; align: center;">바멘텀</a></li>
					<li><a href="MyProfile.do" class="menuLink"
						style="width: 70px; align: center;">내 프로필</a></li>
					<li><a href="Follow.do" class="menuLink" style="width: 80px;">팔로잉보기</a></li>
					<li><a href="04_bic_num.jsp" class="menuLink"
						style="width: 120px;">내 자전거 등록</a></li>

				</ul>

				<div class="search-box">
					<button type="button" id="search_btn" class="btn-search">
						<i class="fas fa-search"><img src="./img/search_white(2).png"
							class="search_icon" style="width: 40px; margin-top: 8px;"></i>
					</button>

					<input type="text" id="input_search" class="input-search" placeholder="검색어를 입력하세요!">
				</div>

				<img src="./img/profile_2.PNG" class="profile_circle">

			</nav>
		</header>
	</div>
	<section class="post">


		<div class="search_result">

			<%
			String input_search = (String) session.getAttribute("input_search");
			%>
			<span id="result"><%=input_search%></span>
			가 포함된 게시글 입니다

		</div>

		<div style="margin-left: 300px;">





			<%
			ArrayList<BmtOnePostDTO> listDto = (ArrayList) session.getAttribute("searchList");
			%>


			<%
			for (int i = 0; i < listDto.size(); i++) {
			%>

			<div class="postbox">


				<a class="postbox_head" href="#" style="text-decoration: none;">
					<img src="./img/person-circle.svg" class="profile"><span class="writer"> <%=listDto.get(i).getU_nick()%></span>
				</a>
				<span class="time">
					<%=listDto.get(i).getP_date()%>

				</span>
				<p class="postbox_neck"><%=listDto.get(i).getP_title()%></p>

				<hr>

				<a href="javascript:PostView('<%=listDto.get(i).getP_idx()%>')">

					<img alt="이미지가 없네요" height=100px
					src=<%=listDto.get(i).getP_file()%>>
				</a>

				<div class="div_postbox_body">
					<p class="postbox_body" style="line-height: 30px;"><%=listDto.get(i).getP_content()%></p>
				</div>

						<div class="ad" style="border: 1px solid #1bbc98;">
					<img src="./img/우측_배너1.jpg" style=" width: 298px; height: 398px;">
				</div>
				<div class="ad2" style="border: 1px solid #1bbc98;">
					<a href="https://alton1736.modoo.at/"><img
						src="./img/KakaoTalk_20230401_104927887.jpg" style=" width: 298px; height: 408px;"></a>
				</div>

				<hr style="border: 1 solid gray;">


				<button id="post_like">
					<a href="javascript:likePost('<%=listDto.get(i).getP_idx()%>')"
						class="Like">좋아요</a>
				</button>

				<button class="post_origin">
					<!-- postid 보내기작업(to selectpostone.java) -->
					<a href="javascript:onePost('<%=listDto.get(i).getP_idx()%>')"
						class="Origin">원문보기</a>
				</button>
				<!--공간나누는영역-->
			</div>
			<div class="space"></div>

			<%
			}
			%>
		
	</section>
	
	
	<script>
	// 검색기능 해보자
	let input_search;
	
	$('#search_btn').click(function(){
		console.log("서치클릭안되나확인");
		input_search = $('#input_search').val();
	
		go_search();
			
	});
	
	const go_search = function(){		
					
		$.ajax({
			type :"post",
			url : "Search.do",
			data:{
				"input_search" : input_search
			},
			success: function(){
				window.location.href = "search.jsp"
			},
			error : function(erreMsg) {
				console.log('error');
				console.log(erreMsg);
				alert("서버가 원활하지 않습니다..");
			}
		});
		
	}
	
	function onePost(postid){
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
	
	<!-- 포스트 좋아요 자바스크립트 -->
	function likePost(postid){
	
		$.ajax({
			type: "post",
			url: "LikeService.do",
			data :{
				"p_idx":postid
			},
			dataType : "json",
			success : function(receive_data){
				console.log(receive_data);
			if (receive_data.resCode === 1) {
				alert("좋아요💚");
				
			}else if(receive_data.resCode === 0){
				alert("이미 눌렀어요💚");					
				};				
				
			},
			error : function(erreMsg){
				console.log(erreMsg);
			}		
			
		});

	};
	
	
	
    
	
	
	</script>
	
	
	
	
	
	
	
</body>
</html>