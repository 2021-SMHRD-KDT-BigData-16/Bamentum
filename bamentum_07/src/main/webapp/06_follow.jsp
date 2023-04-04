<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.tscm.model.BmtFwDetailDTO"%>
<%@page import="com.tscm.model.BmtUserDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="org.slf4j.Logger"%>
<%@ page import="org.slf4j.LoggerFactory"%>

<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- google icon -->
<!--
    <link
        href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
        rel="stylesheet">
-->    
        <link
        href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
        rel="stylesheet">


    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>

        <link rel="stylesheet" href="./css/follow.css">

        <style>
            @import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Noto+Serif+KR&display=swap');
        </style>
    </head>
</head>

<body>


    <!--스크립트와 부트스트랩 src 불러오는 영역-->
    <script src="script.js"></script>

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
                    <button class="btn-search"><i class="fas fa-search"><img
                                src="./img/search_white(2).png" class="search_icon"
                                style="width : 40px; margin-top : 8px;"></i></button>

                    <input type="text" class="input-search" placeholder="검색어를 입력하세요!">
                </div>

                <img src="./img/profile_2.PNG" class="profile_circle">

            </nav>
        </header>
    </div>
    
	<%
		Logger LOG = LoggerFactory.getLogger(getClass());
		LOG.debug(" page Start : {} ", "followPage.jsp");
		
		Date nowDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss"); 
		String strNowDate = sdf.format(nowDate);
		LOG.debug(" 날짜포맷 지정후 now {}, strNow {} ", nowDate, strNowDate);
		
		
		ArrayList<BmtFwDetailDTO> listDto = (ArrayList)session.getAttribute("fw_detail_list");
      
		if (listDto != null) {
			for(int i=0; i< listDto.size(); i++)
			{
				LOG.debug("06_follow.jsp - {} : {} - {} , {} , {}", 
						listDto.get(i).getFollower(), listDto.get(i).getFollowing(), 
						listDto.get(i).getF_date(), listDto.get(i).getU_nick(), 
						listDto.get(i).getU_profile() );
			}
		} else {
			LOG.debug("{} Fail ", "06_follow.jsp" );
		}
   %>

    <section>
        <div class="main_feed">
            <div class="left_feed">
                <div class="feed_box">
                    <img src="./img/bicycle.svg" class="bicycle_icon">
                    <p class="intro">팔로우 목록</p>
                    <p class="sub_intro">지금 바로 친구를 팔로우하고<br>더 활기찬 바멘텀을 즐겨보세요!</p>
                </div>
                <!-- 팔로워 검색 기능 -->
                <form action=" " method="post" class="followinsert_form" role="search"
                    stye="border : 1px solid black;">

                    <input type="search" name="following" value="" class="followinsert_input" type="submit"
                        class="button fit" placeholder="팔로우 할 사용자를 입력하세요!" aria-label="Search"
                        onfocus="this.placeholder=''" onblur="this.placeholder='팔로우 할 사용자를 검색하세요!'">
                    <img src="./img/search.svg" class="follow_search">

                </form>

                <div class="space"></div>

                <!-- 친구값 1 -->
	<%
		if (listDto != null) {
			for(int i=0; i< listDto.size(); i++) {
	
	%>                

                <div class="feed_name" style="justify-content: center;">
                    <div class="profile_box">
                        <img class="profile_img" src=<%=listDto.get(i).getU_profile()%>>
                    </div>
                    <form action="UnFollow.do" method="post">

                        <strong style="font-weight: bolder;">
                            <p class="follower_name"> <%= listDto.get(i).getU_nick() %> </p>
                        </strong>
                        <p class="follower_intro"> <%= sdf.format(listDto.get(i).getF_date()) %> </p><br>
                        <p class="follower_intro" style="color:black; font-size:14px;"> <%= listDto.get(i).getU_info() %> </p>
                        
						<input type = "text" style = "display:none" name = "following" value = "<%=listDto.get(i).getFollowing()%>">                        
						<input type = "text" style = "display:none" name = "follower" value = "<%=listDto.get(i).getFollower()%>">                        
                        
                        <button class = "cancel_follow">
                       		<a onclick = "alert('팔로우를 취소하시겠습니까?')" style = "font-size : 14px;">팔로우 취소</a>
                        </button>
                    </form>
                </div>

                <div class="space"></div>

   	<%
			}
		}
	
	%>                
                
            </div>
        </div>
        </div>
        </div>
    </section>

</body>

</html>