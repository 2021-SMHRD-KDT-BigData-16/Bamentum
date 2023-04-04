<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link
        href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
        rel="stylesheet">

    <!-- css 경로 -->
    <link rel="stylesheet" href="css/bic_num.css">
    
    <title>바멘텀 | 내 자전거 등록</title>
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
                    <button class="btn-search"><i class="fas fa-search"><img
                                src="./img/search_white(2).png" class="search_icon"
                                style="width : 40px; margin-top : 8px;"></i></button>

                    <input type="text" class="input-search" placeholder="검색어를 입력하세요!">
                </div>

                <img src="./img/profile_2.PNG" class="profile_circle">

            </nav>
        </header>
    </div>



    <div class="intro">
        <img src="./img/bicycle.svg" style="width : 100px; margin-bottom : -50px;">
        <h5 style="font-size: 40px;">바멘텀에 내 자전거를 등록해 보세요!</h5>
        <h6 style="font-size: 20px; font-weight : 300; margin-top : -50px;">자전거를 인증 등록해 보세요. <br> 사람들에게 나의 자전거를 소개할
            수
            있으며 <br> 분실 및 도난 사고에 대비할 수 있습니다.</h6>
    </div>

    <div class="bic_num_sector" style = "margin-top : -30px;">


	<form action="BicNumIns.do" method="post" >

        <h4 style="width : 300px; font-size : 22px; margin-left : 20px; margin-top:10px;">브랜드를 선택해 주세요.</h4>
        <div class="selectBox_1" style="margin-left: 20px; margin-top : -20px;">

            <select class="select" name="b_brand" >
                <option disabled selected>브랜드 선택</option>
                <option>ALTON</option>
                <option>APPALANCHIA</option>
                <option>ARGON18</option>
                <option>ASTER</option>
                <option>BANSHEE</option>
                <option>BASSO</option>
                <option>BAUM</option>
                <option>BERGAMONT</option>
                <option>BESV</option>
                <option>BH</option>
                <option>BIANCHI</option>
                <option>BIRDY</option>
                <option>BMC</option>
                <option>BOARDMAN</option>
                <option>BROMPTON</option>
                <option>BRUNO</option>
                <option>CANNONDALE</option>
                <option>CANYON</option>
                <option>CARRERA</option>
                <option>CARRYME</option>
                <option>CEEPO</option>
                <option>CELLO</option>
                <option>CERVELO</option>
                <option>CHUMBA</option>
                <option>CINELLI</option>
                <option>CIPOLLINI</option>
                <option>COLNAGO</option>
                <option>COLUMBUS</option>
                <option>COMMENCAL</option>
                <option>CONSTANTINE</option>
                <option>CUBE</option>
                <option>CYFAC</option>
                <option>DAHON</option>
                <option>DEROSA</option>
                <option>DEVINCI</option>
                <option>EDDY MERCKS</option>
                <option>ELFAMA</option>
                <option>ENGINE11</option>
                <option>EVIL BIKES</option>
                <option>FACTOR</option>
                <option>FELT</option>
                <option>FOCUS</option>
                <option>FUJI</option>
                <option>GARY FISHER</option>
                <option>GHOST</option>
                <option>GIANT</option>
                <option>GIOS</option>
                <option>GT</option>
                <option>HAIBIKE</option>
                <option>IBIS</option>
                <option>INTENS</option>
                <option>ISSAC</option>
                <option>JAEGER</option>
                <option>JAMIS</option>
                <option>KESTREL</option>
                <option>KHS</option>
                <option>KLEIN</option>
                <option>KNOLLY</option>
                <option>KOGA</option>
                <option>KONA</option>
                <option>KUOTA</option>
                <option>LAPIERRE</option>
                <option>LINUS</option>
                <option>LITESPEED</option>
                <option>LOOK</option>
                <option>LOUIS GARNEAU</option>
                <option>LYNSKEY</option>
                <option>MACKINLEY</option>
                <option>MARIN</option>
                <option>MASI</option>
                <option>MERIDA</option>
                <option>MERLIN</option>
                <option>MEZZO</option>
                <option>MONDRAKER</option>
                <option>MONGOOSE</option>
                <option>MOOTS</option>
                <option>MOULTON</option>
                <option>NICOLAI</option>
                <option>NORCO</option>
                <option>OPUS</option>
                <option>ORANGE</option>
                <option>ORBEA</option>
                <option>PARLEE</option>
                <option>PASSONI</option>
                <option>PHANTOM</option>
                <option>PINARELLO</option>
                <option>PIVOT</option>
                <option>POLYGON</option>
                <option>QUALISPORTS</option>
                <option>RALEIGH</option>
                <option>REFINED</option>
                <option>RIDLEY</option>
                <option>ROCKY MOUNTAIN</option>
                <option>SANTACRUZ</option>
                <option>SCHWINN</option>
                <option>SCOTT</option>
                <option>SEVEN</option>
                <option>SPECIALIZED</option>
                <option>STACATO</option>
                <option>STROCK</option>
                <option>STRIDA</option>
                <option>SURLY</option>
                <option>SWIFT</option>
                <option>TERN</option>
                <option>TIME</option>
                <option>TITICACA</option>
                <option>TOMMASINI</option>
                <option>TRANSITION</option>
                <option>TREK</option>
                <option>TRIGON</option>
                <option>TWITTER</option>
                <option>WHEELER</option>
                <option>WHYTE</option>
                <option>WIAWIS</option>
                <option>WILLIER</option>
                <option>YETI</option>
                <option>기타</option>

            </select>

        </div>

        <h4 style="width : 300px; font-size : 22px; margin-left : 20px;">모델명을 입력해 주세요.</h4>
        <div class="selectBox_2" style="margin-left: 20px; margin-top : -20px;">

            <input class="input_model" name="b_model">

        </div>

        <h4 style="width : 250px; font-size : 22px; margin-left : 20px; margin-bottom : 0px;">
            차대번호를 입력해 주세요.</h4>

        <!-- 차대번호 입력 input -->
        <br>

            <input class="input_model"  name="b_num" style="margin-left: 20px; margin-top : -400px;">

        <!-- 차대번호 위치 표시 문구(클릭 시 모달창 표시) -->

        <!-- 모달 창(차대번호 위치 이미지)-->
        <div class="modal-bg" onClick="javascript:popClose();"></div>
        <div class="num_info"
            style="background-color: #ffffff; width : 760px;  height : 500px; border : 1px solid gray; margin-left : -10px; margin-top : 100px;">
            <img src="./img/num_location.PNG"
                style="width : 700px; margin-left : 30px; margin-top : 30px; border : 2px solid #1bbc98;">
                
        </div>


        <h4 style="width : 500px; font-size : 22px; margin-left : 20px;">차대번호가 포함된 사진을 등록해 주세요.</h4>


        <div class="container" style = "margin-left : 20px; margin-top : -500px;">
            <div class="image-upload" id="image-upload" style = "margin-top : 450px;">
                <form method="post" enctype="multipart/form-data" style = "box-shadow: 2px 2px 2px gray; border : 1px solid gray; border-radius : 5px; 
                background-color : #1bbc98; color : #ffffff; width : 300px; height : 25px; margin-left : 0px; margin-top : 0px;">
                    
                    <input type="file" id="chooseFile" name="b_img" accept="image/*" onchange="loadFile(this)">
                </form>

                <div class="fileContainer" style = "margin-left : -90px; margin-top : 30px; margin-bottom:50px;">
                    <div class="fileInput">
                        <p>파일명 :  </p>
                        <p id="fileName"></p>
                    </div>
                    
                    <div class="button_here" style = "margin-left : -50px; margin-bottom : -190px;">
                        <label for="chooseFile">
                            이곳을 클릭해 파일을 선택하세요.
                        </label>
                    </div>
                    <div class="buttonContainer">
                        <div class="submitButton" id="submitButton" style = "font-size : 14px;">등록</div>
                    </div>
                </div>
            </div>
            
            <div class="image-show" id="image-show" style = "border : 1px solid black; width : 655px; height : 300px; margin-top : 570px; color : rgb(161, 161, 161);">사진</div>
            <input type="submit" value="내 자전거 등록하기"
            style="margin-top : 350px; margin-left : 500px; width : 150px; height : 40px; font-size : 16px;
            font-weight : 700; background-color : #1bbc98; border-radius: 5px; color : #ffffff; border : none; cursor: pointer;">
        </div>
    

    </div>
    
    </form>
    
    
        <div style="height : 100px; margin-left : 500px; margin-top : -817px;">
            <img src="./img/question.svg"
                style="width : 17px; height : 17px; margin-top : 39px; margin-left : 450px; margin-right : -20px;">
                   <button  onclick="javascript:popOpen();"
                style="cursor : pointer; margin-left : 20px; margin-top : -1549px; margin-bottom : 0px; background-color: transparent; font-size : 15px; border : none;">
                차대번호는 어디있나요?</button>
                        
                 

        </div>    
    
    
    </div>
</body>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"
    integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"> </script>

    <script src="index.js"></script>

<script>

    // 차대번호 설명 이미지 모달창 js
    function popOpen() {

        var modalPop = $('.num_info');
        var modalBg = $('.modal-bg');

        modalBg.fadeIn();

        $(modalPop).show();
        $(modalBg).show();

    }

    function popClose() {

        var modalPop = $('.num_info');
        var modalBg = $('.modal-bg');

        modalBg.fadeOut();

        $(modalPop).hide();
        $(modalBg).hide();

    }



    // 이미지 업로드 js
    var submit = document.getElementById('submitButton');
    submit.onclick = showImage;     //Submit 버튼 클릭시 이미지 보여주기

    function showImage() {
        var newImage = document.getElementById('image-show').lastElementChild;
        newImage.style.visibility = "visible";

        document.getElementById('image-upload').style.visibility = 'hidden';

        document.getElementById('fileName').textContent = null;     //기존 파일 이름 지우기
    }


    function loadFile(input) {
        var file = input.files[0];

        var name = document.getElementById('fileName');
        name.textContent = file.name;

        var newImage = document.createElement("img");
        newImage.setAttribute("class", 'img');

        newImage.src = URL.createObjectURL(file);

        newImage.style.width = "100%";
        newImage.style.height = "100%";
        newImage.style.visibility = "hidden";   //버튼을 누르기 전까지는 이미지 숨기기
        newImage.style.objectFit = "contain";

        var container = document.getElementById('image-show');
        container.appendChild(newImage);
    };
</script>

</html>