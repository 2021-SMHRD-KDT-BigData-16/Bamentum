<%@page
	import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@page import="com.tscm.model.BmtCmtDtDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tscm.model.BmtCmtDTO"%>
<%@page import="com.tscm.model.BmtPostDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.tscm.model.BmtOnePostDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="org.slf4j.Logger"%>
<%@ page import="org.slf4j.LoggerFactory"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<style>
@import url("./css/onepost.css");
</style>

</head>

<body>
	<%
	request.setCharacterEncoding("UTF-8");
	BmtOnePostDTO retDto = (BmtOnePostDTO) session.getAttribute("post");

	Long p_idx = (Long) session.getAttribute("p_idx");
	System.out.println("03_onePost.jsp - p_idx: " + p_idx);
	%>
	<%
	Logger LOG = LoggerFactory.getLogger(getClass());
	LOG.debug(" page Start : {} ", "01_post.jsp");

	ArrayList<BmtCmtDtDTO> clist = (ArrayList) session.getAttribute("cmtlist");
	int likeNum = (int) session.getAttribute("likeNum");

	if (clist != null) {
		LOG.debug("onePost.jsp - listDto size {} ", clist.size());
		for (int i = 0; i < clist.size(); i++) {
			LOG.debug("onePost.jsp - {} : {} ", i, clist.get(i).getC_content());
		}

	} else {
		LOG.debug("onePost.jsp - clDto null ");
	}
	%>


	<!--스크립트와 부트스트랩 src 불러오는 영역-->
	<script src="script.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

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
					<button type="button" class="btn-search" id="search_btn">
						<i class="fas fa-search"><img src="./img/search_white(2).png"
							class="search_icon" style="width: 40px; margin-top: 8px;"></i>
					</button>
					<input type="text" id="input_search" class="input-search"
						placeholder="검색어를 입력하세요!">


				</div>

				<img src="./img/person-circle.svg" class="profile_circle">

			</nav>
		</header>
	</div>


	<!--0331 영민 포스트 삭제하기-->

	
	<!--  <form action="postDelete.do">
			<input type="submit" value="삭제하기">		
		
		</form>-->
	<%

	%>
	<!--포스트들이 들어가있는 영역-->
	<section class="post">
		<div class="postbox">
			<a class="postbox_head" href="#" style="text-decoration: none;">💚</a><span
				class="writer"><%=retDto.getU_nick()%></span>
				<span class="time"><%=retDto.getP_date()%></span>
				
				<button id="post_delete" onclick="delPost('<%=p_idx%>')">글 삭제하기</button>
			<p class="postbox_neck"><%=retDto.getP_title()%></p>
			<hr>
			

			<p class="postbox_body">
			<%if(retDto.getP_file().contains("jpg")) {%>
			<div class="img_box">
				<img  class="img_show" alt="이미지" height=100px src=<%=retDto.getP_file()%>>
				</div><%} %>
				<div><%=retDto.getP_content()%></div></p>
			<br><br>
			
			
		<!--버튼영역-->
		</div>

		<!--공간나누는영역-->
		<div class="space"></div>



		<!--로그인 했을 때만댓글남기기-->
		<!-- <c:if test="${sessionScope.sessionID!=null}"></c:if> -->

		<div class="allaboutcomment">

			<div class="comment-count">
				총 댓글수 <span id="count"><%=clist.size()%></span>
			</div>
			<button id="post_like">
				<a href="javascript:likePost('<%=p_idx%>')" class="Like"><span id="heart">♥</span>좋아요</a>
			</button>
			<div class="comment-count">
				 <span id="likecount"><%=likeNum%></span>
			</div>
			<span class="submit_position">
			<button type="button" id="comment_submit">댓글등록🤍</button></span>
			
			
			
			
			<div id="comment">
				<label for="itemname"><span>❤ </span>댓글쓰기</label> <input type="text"
					id="comment_input" placeholder="어디입력해보시지">
					
			</div>
			<div class="space"></div>

			<!-- 댓글 나오는 목록 -->
			<div id="cmtbox">

				<%
				for (BmtCmtDtDTO s : clist) {
				%>

				<div>
					<span id="cmtNick"><%=s.getU_nick()%></span> <span id="cmtList"><%=s.getC_content()%></span>

					<button id="comment_delete" onclick="delCmt('<%=s.getC_idx()%>')">삭제</button>
					<br> <span id="cmtTime"><%=s.getC_date()%></span>

					<hr>
				</div>
				<%
				}
				%>


			</div>
	</section>

	<script src="https://code.jquery.com/jquery-3.6.4.min.js"
		integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
		crossorigin="anonymous">
		
	</script>



	<script type="text/javascript">
		//댓글 넣기!!!

		let post_comment;

		//댓글을 넣은 후 등록 버튼을 눌렀을 때 댓글정보를 가져와서 변수에 저장
		$('#comment_submit').click(function() {
			console.log("comment function")
			//input 가져오는 것을 위에 하면 아무것도 안가져오게 됨
			post_comment = $("#comment_input").val();
			cmt_create();
		});

		const cmt_create = function() {
			console.log("cmt_create function");
			console.log("입력한 댓글", post_comment);

			$.ajax({
				type : "post",
				url : "CmtInput.do",
				data : {
					"post_comment" : post_comment
				},
				dataType : "json",
				success : function(receive_data) {
					console.log(receive_data);
					//ajax_comment_suc(receive_data) 

					//댓글이 잘 저장되었을 때 페이지 reload
					if (receive_data.resCode === 1) {
						location.reload();
					}

				},
				error : function(erreMsg) {
					console.log('error');
					console.log(erreMsg);
					alert("서버가 원활하지 않습니다..");
				}
			});

		};

		const ajax_comment_suc = function(receive_data) {
			console.log('내가 쓴 글: ' + post_comment);
			console.log(receive_data);

			let json = receive_data;
			console.log(json);
		};

		// 댓글 삭제하기 !!!!!!!!!!!!!!!!!!!!!!!!!!!
		function delCmt(c_idx) {
			console.log(c_idx);
			$.ajax({
				type : "post",
				url : "CmtDelete.do",
				data : {
					"c_idx" : c_idx
				},
				success : function(data) {
					location.reload();
				}
			})
		}

		function delPost(p_idx) {
			$.ajax({
				type : "post",
				url : "PostDelete.do",
				data : {
					"p_idx" : p_idx
				},
				success : function(data) {
					location.replace("01_post.jsp");
				}
			})
		}

		//좋아요 ㅎㅎ
		function likePost(postid) {

			$.ajax({
				type : "post",
				url : "LikeService.do",
				data : {
					"p_idx" : postid
				},
				dataType : "text",
				success : function() {
					location.reload();					
					

				},
				error : function(erreMsg) {
					console.log(erreMsg);
				}

			});

		};
	</script>





	</section>
	<!--푸터영역-->
	<div id="foot" class="container">
		<footer
			class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
			<div class="col-md-4 d-flex align-items-center">
				<a href="/"
					class="mb-3 me-2 mb-md-0 text-muted text-decoration-none lh-1">
					<svg class="bi" width="30" height="24">
                    <use xlink:href="#bootstrap"></use>
                </svg>
				</a> <span class="mb-3 mb-md-0 text-muted">©2023 Bamentum, The
					sun covers the moon</span>
			</div>

			<ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
				<li class="ms-3"><a class="text-muted" href="#"><svg
							class="bi" width="24" height="24">
                        <use xlink:href="#twitter"></use>
                    </svg></a></li>
				<li class="ms-3"><a class="text-muted" href="#"><svg
							class="bi" width="24" height="24">
                        <use xlink:href="#instagram"></use>
                    </svg></a></li>
				<li class="ms-3"><a class="text-muted" href="#"><svg
							class="bi" width="24" height="24">
                        <use xlink:href="#facebook"></use>
                    </svg></a></li>
			</ul>
		</footer>
	</div>
	<!--푸터영역끝-->



	<!--섹션 끝-->

	<script>
		
	</script>


</body>
<!--바디끝-->








</html>