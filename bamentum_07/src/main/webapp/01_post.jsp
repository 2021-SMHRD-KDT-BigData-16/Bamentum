<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.lang.Integer"%>

<%@ page import="com.tscm.model.BmtOnePostDTO"%>
<%@ page import="org.slf4j.LoggerFactory"%>
<%@ page import="org.slf4j.Logger"%>
<%@ page import="com.tscm.model.BmtPostDTO"%>
<%@ page import="com.tscm.model.BmtOnePostDTO"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>바멘텀 자유게시판</title>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous"> </script>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/post.css">

</head>


<body>

	<%
	Logger LOG = LoggerFactory.getLogger(getClass());
	LOG.debug(" page Start : {} ", "01_post.jsp");

	ArrayList<BmtOnePostDTO> listDto = (ArrayList) session.getAttribute("postlist");

	if (listDto != null) {
		LOG.debug("post.jsp - listDto size {} ", listDto.size());
		for (int i = 0; i < listDto.size(); i++) {
			LOG.debug("post.jsp - {} : {} ", i, listDto.get(i).getP_content());
		}

	} else {
		LOG.debug("post.jsp - listDto null ");
	}
	%>

	<!-- 0330영민 헤더수정 -->

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

					<input type="text" id="input_search" class="input-search"
						placeholder="검색어를 입력하세요!">
				</div>

				<img src="./img/profile_2.PNG" class="profile_circle">

			</nav>
		</header>
	</div>

	<div class="banner"
		style="display: flex; margin-top: 15px; margin-left: 400px; margin-bottom: -20px; height: 100px;">
		<img src="./img/배너4.jpg"
			style="border: 1px solid rgb(228, 107, 173); width: 700px;">
	</div>

	<div style="margin-left: 300px;">

		<!--글쓰는 회색박스 영역-->
		<div class="writing_Sector" style="cursor: pointer;"
			onclick="location.href='02_postCreate.jsp'">
			<div onclick="location.href='목적지 링크주소(URL)';"></div>

			<img src="./img/pencil-square.svg"
				style="width: 30px; margin-top: 23px; margin-left: 20px;">
			<!-- 글쓰기 영역 접속 경로 -->
			<div class="writing_container">

				<p style="margin-left: 15px; margin-top: 13px;">당신의 생각은 어떠신가요?</p>
			</div>
		</div>

		<!--포스트들이 들어가있는 영역-->
		<section class="post">
		
		<div class="ad" style="border: 1px solid #1bbc98;">
					<img src="./img/우측_배너1.jpg" style="width: 298px; height: 398px;">
				</div>
				<div class="ad2" style="border: 1px solid #1bbc98;">
					<a href="https://alton1736.modoo.at/"><img
						src="./img/KakaoTalk_20230401_104927887.jpg"
						style="width: 298px; height: 408px;"></a>
				</div>
			<div id="post_more">
		
		</div>
			
			
		</section>

		<button id="btn_post_more">페이지 더보기</button>


		<!-- 무한 스크롤 자바스크립트 -->
		<script type="text/javascript">
	
		
		
		window.onscroll = function() {scrollInfinite()};
		function scrollInfinite()
			{
			    if ((window.innerHeight + window.scrollY) >= (document.body.offsetHeight*0.8)) {
		            console.log(`scrollInfinite : ` + page_cnt);
			    	
			    	if(!loading) {
			    		loading = true;
			            console.log(`scrollInfinite loading : ` + loading);
			            
				        setTimeout( function() { next_load() }, 100);
		    		}
			    }			
			} 
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
		
		
		
		//무한스크롤 및 무한더보기
		
		let loading = false;
		let page_cnt = 1;
		let post_send = { "page_cnt" : page_cnt };
	
		$('#btn_post_more').click(function(){
			console.log("btnPost function");
			next_load();
			
		});
		
	    $(document).ready(function(){
            console.log(`ready : ` + page_cnt);
            page_cnt = 0;
            post_send = { "page_cnt" : page_cnt };            
            
			next_load();
	    });

		
		
	    const next_load = function(){
			console.log("next_load function");
			
			$.ajax({
				type : "post",
				url : "more_page.do",
				data : post_send,
				async : false,
				dataType:"json",
				
				success : function(receive_data) {
					ajax_more_page_suc(receive_data)	},
				error : function(errorMsg) {
					console.log('error');
					console.log(errorMsg);
					
				}
			});
	    };
	    
	    
	    
	    const ajax_more_page_suc = function(receive_data){
            console.log(`ajax_more_page_suc page_cnt : ` + page_cnt);
			console.log(receive_data);
			loading = true;
			
			let json = receive_data;
			console.log(json);
			
			let resultHTML = '';
			
	        for(let i = 0; i < json.length; i++){
	        	
	        	console.log(json[i].p_file);
	        	
	        	console.log(`include jpg ` + json[i].p_file);
	        	
				resultHTML += `
				
			        <div class = "postbox">
		            
					<a class="postbox_head" href="#" style = "text-decoration : none;"> <span class="writer"><img src="./img/person-circle.svg"> ` + json[i].u_nick  + ` </span></a>
		            <button class="Follow"><a href="javascript:PostFollowing('`+ json[i].p_idx+`')" class="follow">팔로우하기</a></button>
		            
		            <p class="time">   ` + json[i].p_date  + ` : ` +json[i].rn + ` </p>
		            <p class="postbox_neck">   ` + json[i].p_title + ` </p>
		           
					<a href = "javascript:PostView(' ` + json[i].p_idx  + ` ')">
		           
					
				    <p><img alt="이미지" onerror="this.style.display='none'" height = 100px src= ` + json[i].p_file + ` ></p>		            
					</a>
		            
					<p class="postbox_body">  ` + json[i].p_content + ` </p>
					<hr>
		            <button class="Like"><a href="javascript:likePost('`+ json[i].p_idx+`')" class="Like">좋아요</a></button>
		            <button class="post_origin">
		            
		            <a href="javascript:onePost('`+ json[i].p_idx+`')" class="Origin">원문보기</a></button>
		        </div>
		    	<div class="space"></div>
				`;
				
	        };
	        
	        
//	        $('body').append(resultHTML);
	        $('section').append(resultHTML);
			
			page_cnt = page_cnt + 1;
            console.log(`page_cnt : ` + page_cnt);
            post_send = { "page_cnt" : page_cnt };            
			
			loading = false;
		};
	    
	</script>


		<!-- 스크립트 시간입니다 -->
		<script src="script.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js">
	</script>


		<!-- 포스트 이동 자바스크립트 -->
		<script type="text/javascript">
		
    	function PostFollowing(postid){
    		console.log(postid);		
    	    let f = document.createElement('form');
    	    
    	    let obj;
    	    obj = document.createElement('input');
    	    obj.setAttribute('type', 'hidden');
    	    obj.setAttribute('name', 'postid');
    	    obj.setAttribute('value', postid);
    	    
    	    f.appendChild(obj);
    	    f.setAttribute('method', 'post');
    	    f.setAttribute('action', 'PostFollowing.do');
    	    document.body.appendChild(f);
    	    f.submit();
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