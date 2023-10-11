<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %> 


<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/mba/header.css">
<script>
	$(document).ready(function() {
		$("#closebtn").click(function() {
			$("#headerpop").hide();
		});
		$(".close").click(function() {
			$("body").removeClass("open-body");
		});
		$(".btnside").click(function() {
			$("#menu,.page_cover,html").addClass("open");
			$("body").addClass("open-body");
			window.location.hash = "#open";
		});

		window.onhashchange = function() {
			if (location.hash != "#open") {
				$("#menu,.page_cover,html").removeClass("open");
				$("body").removeClass("open-body");
			}
		};

		$("#navbartop > .dropdown").hover(function() {
			$(this).children(".header_top").show();
			$(this).children(".header_bottom").show();
		}, function() {
			$(this).children(".header_top").hide();
			$(this).children(".header_bottom").hide();
		})

	    $(".topli").click(function(){
	    	 $(this).next("div").toggleClass("hide");

        });
		
		$("#line-wrapper").click(function() {
			$("#headerpop").show();
		});




	})
</script>

<style type="text/css">
#wrapper {
  width:150px;
  height:150px;
  background: green;
  box-shadow: 0 1px 15px rgba(0,0,0,.8);
  
  /* 추가된 부분 */
  position:absolute;
}
.open-body{
overflow:hidden;
position:fixed;


}
/* 추가된 부분 */
#line-wrapper {
	cursor: pointer;
    width: 35px;
    height: 35px;
    position: absolute;
    top: 14px;
    left: 1130px;
    float: right;
}

/* 추가된 부분 */
.line {
  	background: #05366e;
    margin-top: 6px;
    margin-bottom: 6px;
    width: 23px;
    height: 2px;
    border-radius: 2px;
    box-shadow: 0 1px 3px rgba(0,0,0,.5);
    position: relative;
}




#wrapper2 {
 	cursor: pointer;
    width: 15px;
    height: 15px;
    position: absolute;
    left: 15px;
}

/* 추가된 부분 */
#line-wrapper2 {
	cursor: pointer;
    width: 15px;
    height: 15px;
    position: absolute;
    left: 15px;
}

/* 추가된 부분 */
.line2 {
  	background: white;
    margin-top: 6px;
    margin-bottom: 6px;
    width: 23px;
    height: 2px;
    border-radius: 2px;
    box-shadow: 0 1px 3px rgba(0,0,0,.5);
    position: relative;
}

.logintxt1{

    position: absolute;
    margin-left: 307px;
    margin-top: 37px;
    font-size: 17px;
}
.logintxt2{
 position: absolute;
    margin-left: 276px;
    margin-top: 37px;
    font-size: 17px;

}
@media ( max-width : 1199px) {
#line-wrapper {
	left: 840px;
}
.logintxt1{

    position: absolute;
    margin-left: 115px;
    margin-top: 37px;
    font-size: 17px;
}
.logintxt2{

    position: absolute;
    margin-left: 87px;
    margin-top: 37px;
    font-size: 17px;
}
}

@media(max-width: 992px){

.logintxt1{

   display: none; 
}
.logintxt2{
   display: none; 

}
}


#sidebanner{
background-color: white;
position: fixed;
    top: 368px;
    left: 50%;
    margin-left: 570px;
    width: 100px;
    height: 200px;
    z-index: 200;
        border-radius: 15px 15px 15px 15px;
}
#sidebanner > div{

background: #d8d7d7; width: 77%;  margin: 0 auto;  height: 1px;}


#logoimg{
display: inline;      
margin-top: 13px;
	margin-left: 0px;
	width: 270px;
}

@media ( max-width : 768px) {

#logoimg{
	margin-left: -10px;
    margin-top: 17px;
}
}
</style>

<!-- <div id="sidebanner">
<img src="/resources/img/band_widget.png" style="    padding: 10px;">
<div></div>
<a href="/contactus"><img src="/resources/img/inquiry_widget2.png" style="    padding: 10px;"></a>
</div> -->

<div class="header-container">
	<div class="header-top dark " style="height: 86px;">
		<div class="container">
			<div class="row">
				<div class="" style="margin: 0 auto; text-align: center;">
					<a href="../../../"><img src="/resources/img/logo.png" id="logoimg"
						></a>
					

				<sec:authorize access="isAnonymous()">
						<span class="logintxt1"><a href="/login" style="color: white;">로그인</a> | <a  href="/joinus" style="color: white;">회원가입</a></span> 
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
					 <span class="logintxt2"><a style="color: white;" href="#" onclick="document.getElementById('logout').submit();">로그아웃</a> | <a style="color: white;" href="/mypage">마이페이지</a></span>
					
						<form id="logout" action="/logout" method="POST">
						   <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
						</form>
					</sec:authorize> 


					
					
					
					<div class="btnside hidep">
						 <div id="line-wrapper2">
						    <div class="line2"></div>
						    <div class="line2" style="width: 15px;"></div>
						    <div class="line2"></div>
						  </div>
					</div>
					<div onclick="history.back();" class="page_cover"></div>
					<div id="menu">

						<div style="background-color: #05366e; height: 55px;">
						
							<sec:authorize access="isAnonymous()">
								<div class="mlogintxt" ><a href="/login">로그인</a> | <a href="/joinus">회원가입</a></div>
							</sec:authorize>
							<sec:authorize access="isAuthenticated()">
								<div class="mlogintxt" ><a href="/logout">로그아웃</a> | <a href="/mypage">마이페이지</a></div>
							</sec:authorize> 
						</div>
						<div class="s_m_imart list_type1">
							<a class="title" href="../intro/greeting2"><span class="txt">MBA총동창회 소개</span><span
								class="icon_mt icon"></span></a>
							<div class="menuList n2">
								<ul>
									<li><a href="../intro/greeting2"><span>·총동창회 회장 인사말</span></a></li>
									<li><a href="../intro/greeting"><span>·총동창회 사무총장 인사말</span></a></li>
									<li><a href="../intro/visionmission"><span>·총동창회 미션/비전</span></a></li>
									<li><a href="../intro/group"><span>·총동창회 조직도</span></a></li>
									<li><a href="../intro/regulation"><span>·총동창회 회칙</span></a></li>
									<li><a href="../intro/map"><span>·총동창회 사무소 연락처/위치</span></a></li>
									<li><a href="../intro/greeting3"><span>·경영전문대학원 원장 인사말</span></a></li>
									<li><a href="../intro/introunive"><span>·경영전문대학원 소개</span></a></li>
									
									
									
								
								</ul>
							</div>
							<div style="clear: both;"></div>
						</div>
						<div class="s_m_imart list_type1">
							<a class="title" href="/commu/notice"><span class="txt">
									커뮤니티활동</span><span class="icon_mt icon"></span></a>
							<div class="menuList n2">
								<ul>
								<li><a href="/commu/notice"><span>·공지사항</span></a></li>
								<li><a href="/commu/active"><span>·총동창회 활동소식</span></a></li>
								<li><a href="/commu/forum"><span>·MBA포럼</span></a></li>
								<li><a href="/commu/trackinggolf"><span>·MBA 트레킹/골프</span></a></li>
								<li><a href="/commu/graduatenews"><span>·경영전문대학원,학부소식</span></a></li>
								
								<li><a href="/commu/familyevent"><span>·MBA동정/경.조사</span></a></li>
								<li><a href="/commu/companypr"><span>·동문 기업 PR</span></a></li>
								<li class="topli"><a href="/commu/unit01"><span>·기수별 활동</span></a></li>
								<!-- <div class="inlist hide">
									<li><a href="/commu/unit01"><span>96기</span></a></li>
									<li><a href="/commu/unit02"><span>95기</span></a></li>
									<li><a href="/commu/unit03"><span>94기</span></a></li>
								</div> -->
								<li class="topli"><a href="/commu/group01"><span>·그룹별 활동</span></a></li>
							<!-- 	
								
								<div class="inlist hide">  작동안됨.
									<li><a href="#"><span>EMPTY</span></a></li>
									<li><a href="#"><span>EMPTY</span></a></li>
									<li><a href="#"><span>EMPTY</span></a></li>
									<li><a href="#"><span>EMPTY</span></a></li>
									<li><a href="#"><span>EMPTY</span></a></li>
									<li><a href="#"><span>EMPTY</span></a></li>
								</div> -->
								<li class="topli"><a href="/commu/wonwoohoe"><span>·재학생 원우회</span></a></li>
							<!-- 		<li><a href="#"><span>·MBA총동창회 공지</span></a></li>
									<li><a href="#"><span>·MBA총동창회 활동/행사 계획표</span></a></li>
									<li><a href="#"><span>·MBA총동창회 원우 동정</span></a></li>
									<li><a href="#"><span>·MBA총동창회 회장 동정</span></a></li>
									<li><a href="#"><span>·연세대학교 소식</span></a></li>
									<li><a href="#"><span>·연세대 경영전문대학원 소식</span></a></li>
 -->								</ul>
							</div>
							<div style="clear: both;"></div>
						</div>
						<div class="s_m_imart list_type1">
							<a class="title" href="/read/column"><span class="txt">읽을거리</span><span
								class="icon_mt icon"></span></a>
							<div class="menuList n2">
								<ul>
									<!-- <li><a href="#"><span>·MBA총동창회 홍보(PR) 신문기사</span></a></li>
									<li><a href="#"><span>·MBA총동창회 홍보(PR) 송출기사</span></a></li>
									<li><a href="#"><span>·동문 전문 기고글</span></a></li>
									<li><a href="#"><span>·동문 논문</span></a></li>
									<li><a href="#"><span>·동문 시,수필</span></a></li>
									<li><a href="#"><span>·동문 개인 사진</span></a></li>
									<li><a href="#"><span>·자유게시판</span></a></li>
									<li><a href="#"><span>·MBA총동창회 활동 사진,동영상DB</span></a></li> -->
									<li><a href="/read/column"><span>·동문 컬럼/논문(Self)</span></a></li>
									<li><a href="/read/poem"><span>·동문 시/수필/사진(Self)</span></a></li>
									<li><a href="/read/recommendbook"><span>·동문 책소개</span></a></li>
									<li><a href="/read/journal"><span>·MBA 저널</span></a></li>
									<li><a href="/read/ceonight"><span>·MBA 경영인의밤</span></a></li>
									<li><a href="/read/yoyyear"><span>·MBA 송년회밤</span></a></li>
								</ul>
							</div>
							<div style="clear: both;"></div>
						</div>
						<div class="s_m_imart list_type1">
							<a class="title" href="/donation?group=2" ><span class="txt" style="margin:13px 0 13px 15px;">동문회비·기여현황</span><span
								class="icon_mt icon"></span></a>
							<div class="menuList n2">
								<ul>
									<li><a href="/donation?group=2"><span>·동문회비 안내</span></a></li>
									<li><a href="/donation?group=500"><span>·500만원 이상</span></a></li>
									<li><a href="/donation?group=200"><span>·200만원 이상</span></a></li>
									<li><a href="/donation?group=30"><span>·30만원 이상</span></a></li>
									<li><a href="/donation?group=1"><span>·평생회비 납부자</span></a></li>
								</ul>
							</div>
							<div style="clear: both;"></div>
						</div>
						<div class="s_m_imart list_type1">
							<a class="title" href="/contactus"><span class="txt"style="margin: 13px 0 13px 15px;">문의·요청하기</span><span
								class="icon_mt icon"></span></a>
						
							<div style="clear: both;"></div>
						</div>
						<!-- <div class="s_m_imart list_type1">
							<a class="title" href="#"><span class="txt">동창회 후원</span><span
								class="icon_mt icon"></span></a>
							<div class="menuList n2">
								<ul>
								
										<li><a href="/donation"><span>·후원자 리스트</span></a></li> 
								</ul>
							</div>
							
							<div style="clear: both;"></div>
						</div> -->



						<div onclick="history.back();" class="close"></div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- header-top end -->

	<!-- header start -->
	<!-- classes:  -->
	<!-- "fixed": enables fixed navigation mode (sticky menu) e.g. class="header fixed clearfix" -->
	<!-- "dark": dark version of header e.g. class="header dark clearfix" -->
	<!-- "full-width": mandatory class for the full-width menu layout -->
	<!-- "centered": mandatory class for the centered logo layout -->
	<!-- ================ -->
	<div style="width: 100% ; height: 800px;display: none;background-color: white;z-index:103;position: absolute;" id="headerpop">
  
		<div class="container headerhide" style="position: relative;">
				<img src="/resources/mba/close.png" style="  position: absolute;    right: 10px;    top: 5px;    width: 25px;cursor: pointer;" id="closebtn">
			<div class="row" style="margin-top: 35px;">
				<div class="col-md-3 col25">
					<div>
						<h5 class="titleheader">연세MBA총동창회 소개</h5>
						<div class="separator-2"></div>
						<ul class="list-icons">
							
							<li><a href="../intro/greeting2" class="header_tag">총동창회 회장 인사말</a></li>
							<li><a href="../intro/greeting" class="header_tag">총동창회 사무총장 인사말</a></li>
							<li><a href="../intro/visionmission" class="header_tag">MBA미션/비전</a></li>
							<li><a href="../intro/group" class="header_tag">MBA조직도</a></li>
							<li><a href="../intro/regulation" class="header_tag">총동창회 회칙</a></li>
							<li><a href="../intro/map" class="header_tag">총동창회 사무소 연락처/위치</a></li>
							<li><a href="../intro/greeting3" class="header_tag">경영전문대학원 원장 인사말</a></li>
							<li><a href="../intro/introunive" class="header_tag">경영전문대학원 소개</a></li>
									
						</ul>
					</div>
				</div>
				<div class="col-md-3 col25">
					<div>
						<h5 class="titleheader">커뮤니티활동</h5>
						<div class="separator-2"></div>
						<ul class="list-icons">
							<li><a href="/commu/notice" class="header_tag">공지사항</a></li>
							<li><a href="/commu/active" class="header_tag">총동창회 활동소식</a></li>
							<li><a href="/commu/forum" class="header_tag">MBA 포럼</a></li>
							<li><a href="/commu/trackinggolf" class="header_tag">MBA 트레킹/골프</a></li>
							<li><a href="/commu/graduatenews" class="header_tag">경영전문대학원,학부 소식</a></li>
							<li><a href="/commu/familyevent" class="header_tag">MBA동정/경.조사</a></li>
							<li><a href="/commu/companypr" class="header_tag">동문 기업 PR</a></li>
							<li><a href="/commu/unit01" class="header_tag">기수별 활동</a>
							<ul class="header-ul-inside">
								<li ><a href="/commu/unit01">- 94기</a></li>
								<li ><a href="/commu/unit02">- 96기</a></li>
								<li ><a href="/commu/unit03">- 97기</a></li>
								
							</ul>
							<div style="clear: both;"></div>
							</li>
							
							<li><a href="/commu/group01" class="header_tag">그룹별 활동</a>
							<ul class="header-ul-inside">
								<li ><a href="/commu/group01">- 이수회</a></li>
								<li ><a href="/commu/group02">- 그룹02</a></li>
								<li ><a href="/commu/group03">- 그룹03</a></li>
							
							</ul>
							<div style="clear: both;"></div>
							</li>
							<li><a href="/commu/wonwoohoe" class="header_tag">재학생원우회</a></li>
						</ul>
						
					</div>
				</div>
				<div class="col-md-3 col25">
					<div>
						<h5 class="titleheader">읽을거리</h5>
						<div class="separator-2"></div>
						<ul class="list-icons">
							<li><a href="/read/column" class="header_tag">동문 컬럼/논문(Self)</a></li>
							<li><a href="/read/poem" class="header_tag">동문 시/수필/사진(Self)</a></li>
							<li><a href="/read/recommendbook" class="header_tag">동문 책소개</a></li>
							<li><a href="/read/journal" class="header_tag">MBA 저널</a></li>
							<li><a href="/read/ceonight" class="header_tag">MBA 경영인의밤</a></li>
							<li><a href="/read/yoyyear" class="header_tag">MBA 송년회밤</a></li>
						</ul>
						
					</div>
				</div>
				
				
				<!-- <div class="col-md-3 col25">
					<div>
						<h5 class="titleheader">동창회 후원</h5>
						<div class="separator-2"></div>
						<ul class="list-icons">
							<li><a href="/donation" class="header_tag">후원자 리스트</a></li>
						</ul>
					</div>
				</div> -->
			</div>
			
			<div class="row" style="margin-top: 35px;">
				<div class="col-md-3 col25">
					<div>
						<h5 class="titleheader"><a href="/donation?group=2">동문회비·기여현황</a></h5>
						<div class="separator-2"></div>
					<ul class="list-icons">
							
							<li><a href="/donation?group=2" class="header_tag">동문회비 안내</a></li>
							<li><a href="/donation?group=500" class="header_tag">500만원 이상</a></li>
							<li><a href="/donation?group=200" class="header_tag">200만원 이상</a></li>
							<li><a href="/donation?group=30" class="header_tag">30만원 이상</a></li>
							<li><a href="/donation?group=1" class="header_tag">평생회비 납부자</a></li>
									
						</ul>
					</div>
				</div>
				<div class="col-md-3 col25">
					<div>
						<h5 class="titleheader"><a href="/contactus">문의·요청하기</a></h5>
						<div class="separator-2"></div>
					<!-- 	<ul class="list-icons">
							
							<li><a href="../intro/greeting2" class="header_tag">총동창회 회장 인사말</a></li>
							<li><a href="../intro/greeting" class="header_tag">총동창회 사무총장 인사말</a></li>
							<li><a href="../intro/visionmission" class="header_tag">MBA미션/비전</a></li>
							<li><a href="../intro/group" class="header_tag">MBA조직도</a></li>
							<li><a href="../intro/regulation" class="header_tag">총동창회 회칙</a></li>
							<li><a href="#" class="header_tag">총동창회 사무소 연락처/위치</a></li>
							<li><a href="../intro/greeting3" class="header_tag">경영전문대학원 원장 인사말</a></li>
							<li><a href="../intro/introunive" class="header_tag">경영전문대학원 소개</a></li>
									
						</ul> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="clear: both;"></div>
	<header class="header mhide" >

	<div class="container">
		<div class="row">

			<div class="">

				<!-- header-right start -->
				<!-- ================ -->
				<div class="header-right clearfix">

					<!-- main-navigation start -->
					<!-- classes: -->
					<!-- "onclick": Makes the dropdowns open on click, this the default bootstrap behavior e.g. class="main-navigation onclick" -->
					<!-- "animated": Enables animations on dropdowns opening e.g. class="main-navigation animated" -->
					<!-- "with-dropdown-buttons": Mandatory class that adds extra space, to the main navigation, for the search and cart dropdowns -->
					<!-- ================ -->
					<div class="main-navigation  animated with-dropdown-buttons">

						<!-- navbar start -->
						<!-- ================ -->
						<nav class="navbar navbar-default" role="navigation">
						<div class="container-fluid">

							<!-- Toggle get grouped for better mobile display -->


							<!-- Collect the nav links, forms, and other content for toggling -->
							<div class="collapse navbar-collapse" id="navbar-collapse-1"
								style=" padding: 0px;">
								<!-- main-menu -->
								<ul class="nav navbar-nav " id="navbartop"
									style="display: table; float: none; margin: auto; padding: 0;">

									<!-- mega-menu start -->

									<!-- mega-menu end -->
									<!-- mega-menu start -->

									<!-- mega-menu end -->
									<li class="dropdown">
										<div class="header_top"></div>
										<div class="header_bottom"></div> <a class="dropdown-toggle"
										data-toggle="dropdown" href="../intro/greeting2">연세MBA총동창회 소개</a>
										<ul class="dropdown-menu">
											<li><a href="../intro/greeting2">총동창회 회장 인사말</a></li>
											<li><a href="../intro/greeting">총동창회 사무총장 인사말</a></li>
											<li><a href="../intro/visionmission">총동창회 미션/비전</a></li>
											<li><a href="../intro/group">총동창회 조직도</a></li>
											<li><a href="../intro/regulation">총동창회 회칙</a></li>
											<li><a href="../intro/map">총동창회 사무실 위치/연락처</a></li>
											<li><a href="../intro/greeting3">경영전문대학원 원장 인사말</a></li>
											<li><a href="../intro/introunive">경영전문대학원 소개</a></li>
											<!-- <li><a href="#">MBA총동창회 활동</a></li>
											<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">기수별 활동</a>
												<ul class="dropdown-menu">
													<li><a href="#">98</a></li>
													<li><a href="#">97</a></li>
													<li><a href="#">96</a></li>
													<li><a href="#">95</a></li>
												</ul></li>
											<li><a href="#">그룹별 활동</a></li>
											<li><a href="#">재학생 원우회</a></li> -->

										</ul>
									</li>

									<li class="dropdown ">
										<div class="header_top"></div>
										<div class="header_bottom"></div> <a
										href="/commu/notice" class="dropdown-toggle"
										data-toggle="dropdown">커뮤니티활동</a>
										<ul class="dropdown-menu">
										
										
											<li><a href="/commu/notice">공지사항</a></li>
											<li><a href="/commu/active">총동창회 활동소식</a></li>
											<li><a href="/commu/forum">MBA 포럼</a></li>
											<li><a href="/commu/trackinggolf">MBA 트레킹/골프</a></li>
											<li><a href="/commu/graduatenews">경영전문대학원,학부 소식</a></li>
											<li><a href="/commu/familyevent">MBA동정/경.조사</a></li>
											<li><a href="/commu/companypr">동문 기업 PR</a></li>
											<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="/commu/unit01">기수별 활동</a>
											<ul class="dropdown-menu">
												<li><a href="/commu/unit01">94기</a></li>
												<li><a href="/commu/unit02">96기</a></li>
												<li><a href="/commu/unit03">97기</a></li>
											</ul></li>
											<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="/commu/group01">그룹별 활동</a>
											<ul class="dropdown-menu">
												<li><a href="/commu/group01">이수회</a></li>
												<li><a href="/commu/group02">그룹02</a></li>
												<li><a href="/commu/group03">그룹03</a></li>
											</ul></li>
											<li><a href="/commu/wonwoohoe">재학생원우회</a></li>
										<!-- 	<li><a href="#">MBA총동창회 공지</a></li>
											<li><a href="#">MBA총동창회 활동/행사 계획표</a></li>
											<li><a href="#">MBA총동창회 원우 동정</a></li>
											<li><a href="#">MBA총동창회 회장 동정</a></li>
											<li><a href="#">연세대학교 소식</a></li>
											<li><a href="#">연세대 경영전문대학원 소식</a></li> -->
										</ul>
									</li>
									<li class="dropdown ">
										<div class="header_top"></div>
										<div class="header_bottom"></div> <a href="/read/column"
										class="dropdown-toggle" data-toggle="dropdown">읽을거리</a>
										<ul class="dropdown-menu">
											<li><a href="/read/column">동문 컬럼/논문(Self)</a></li>
											<li><a href="/read/poem">동문 시/수필/사진(Self)</a></li>
											<li><a href="/read/recommendbook">동문 책소개</a></li>
											<li><a href="/read/journal">MBA 저널</a></li>
											<li><a href="/read/ceonight">MBA 경영인의밤</a></li>
											<li><a href="/read/yoyyear">MBA 송년회밤</a></li>
										
											<!-- <li><a href="#">MBA총동창회 홍보(PR) 신문기사</a></li>
											<li><a href="#">MBA총동창회 홍보(PR) 송출기사</a></li>
											<li><a href="#">동문 전문 기고글</a></li>
											<li><a href="#">동문 논문</a></li>
											<li><a href="#">동문 시,수필</a></li>
											<li><a href="#">동문 개인 사진</a></li>
											<li><a href="#">자유게시판</a></li>
											<li><a href="#">MBA총동창회 활동 사진,동영상DB</a></li> -->
										</ul>
									</li>
									<li class="dropdown ">
										<div class="header_top"></div>
										<div class="header_bottom"></div> <a href="/donation?group=2" 
										class="dropdown-toggle" data-toggle="dropdown">동문회비·기여현황</a>
										<ul class="dropdown-menu">
											<li><a href="/donation?group=2">동문회비 안내</a></li>
											<li><a href="/donation?group=500">500만원 이상</a></li>
											<li><a href="/donation?group=200">200만원 이상</a></li>
											<li><a href="/donation?group=30">30만원 이상</a></li>
											<li><a href="/donation?group=1">평생회비 납부자</a></li>
								
										
											
										</ul>
										
									</li>
									<li class="dropdown ">
										<div class="header_top"></div>
										<div class="header_bottom"></div> <a href="/contactus"
										class="dropdown-toggle" data-toggle="dropdown">문의·요청하기(Self)</a>
									</li>
									<!-- <li class="dropdown ">
										<div class="header_top"></div>
										<div class="header_bottom"></div> <a href="#"
										class="dropdown-toggle" data-toggle="dropdown">동창회 후원</a>
										<ul class="dropdown-menu">
											<li><a href="/donation">후원자리스트</a></li>
										</ul>
									</li> -->
								</ul>
								<!-- main-menu end -->

								<!-- header dropdown buttons -->

								<!-- header dropdown buttons end-->
								<!-- <div class="headerbtn"></div>
								 -->
								 <div id="line-wrapper">
								    <div class="line"></div>
								    <div class="line" style="width: 15px;"></div>
								    <div class="line"></div>
								  </div>
								
								
								
							</div>

						</div>
						</nav>
						<!-- navbar end -->

					</div>
					<!-- main-navigation end -->
				</div>
				<!-- header-right end -->

			</div>
		</div>
	</div>

	</header>
	<!-- header end -->
</div>


<!-- <li><a href="#">Blog Home <span class="badge">v1.1</span></a></li>
	<li class="dropdown "><a class="dropdown-toggle"
		data-toggle="dropdown" href="#">Large Image</a>
		<ul class="dropdown-menu to-left">
			<li><a href="#">Right Sidebar</a></li>
			<li><a href="#">Left Sidebar</a></li>
			<li><a href="#">Without Sidebar</a></li>
		</ul></li>
	<li class="dropdown "><a class="dropdown-toggle"
		data-toggle="dropdown" href="#">Medium Image</a>
		<ul class="dropdown-menu to-left">
			<li><a href="#">Right Sidebar</a></li>
			<li><a href="#">Left Sidebar</a></li>
			<li><a href="#">Without Sidebar</a></li>
		</ul></li>
	<li class="dropdown "><a class="dropdown-toggle"
		data-toggle="dropdown" href="#">Masonry</a>
		<ul class="dropdown-menu to-left">
			<li><a href="#">Right Sidebar</a></li>
			<li><a href="#">Left Sidebar</a></li>
			<li><a href="#">Without Sidebar</a></li>
		</ul></li>
	<li><a href="#">Timeline</a></li>
	<li><a href="#">Blog Post</a></li>
 -->