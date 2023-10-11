<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
       <!--  <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div> -->
        <div class="sidebar-brand-text mx-3">연세 MBA ADMIN</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Nav Item - Dashboard -->
     

      <!-- Divider -->
    

      <!-- Heading -->
      <div class="sidebar-heading">
        관리
      </div>
       <li class="nav-item active">
        <a class="nav-link" href="/admint">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>기본정보</span></a>
      </li>
	  <li class="nav-item">
        <a class="nav-link" href="/admint/group">
          <i class="fas fa-fw fa-table"></i>
          <span>조직도</span></a>
      </li>
      
       <hr class="sidebar-divider">
      <div class="sidebar-heading">
        게시판
      </div>
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseboard" aria-expanded="true" aria-controls="collapseboard">
          <i class="fas fa-fw fa-cog"></i>
          <span>커뮤니티</span>
        </a>
        <div id="collapseboard" class="collapse" aria-labelledby="collapseboard" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
<!--             <h6 class="collapse-header">제시판 분류</h6> -->
            <a class="collapse-item" href="commu?pagename=notice">공지사항</a>
            <a class="collapse-item" href="commu?pagename=active">총동창회 활동소식</a>
            <a class="collapse-item" href="commu?pagename=forum">MBA포럼</a>
            <a class="collapse-item" href="commu?pagename=trackinggolf">MBA 트래킹/골프</a>
            <a class="collapse-item" href="commu?pagename=graduatenews">경영전문대학원,학부 소식</a>
            <a class="collapse-item" href="commu?pagename=familyevent">MBA동정/경.조사</a>
            <a class="collapse-item" href="commu?pagename=companypr">동문 기업 PR</a>
            <a class="collapse-item" href="">기수별 활동</a>
            <a class="collapse-item" href="">그룹별 활동</a>
            <a class="collapse-item" href="commu?pagename=wonwoohoe">재학생원우회</a>
          </div>
        </div>
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-cog"></i>
          <span>읽을거리</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
<!--             <h6 class="collapse-header">제시판 분류</h6> -->
            <a class="collapse-item" href="read?pagename=column">동문 컬럼/논문</a>
            <a class="collapse-item" href="read?pagename=poem">동문 시/수필/사진</a>
            <a class="collapse-item" href="read?pagename=recommendbook">동문 책소개</a>
            <a class="collapse-item" href="read?pagename=wonwoohoe">MBA 저널</a>
            <a class="collapse-item" href="read?pagename=ceonight">MBA 경영인의밤</a>
            <a class="collapse-item" href="read?pagename=yoyyear">MBA 송년회밤</a>
          </div>
        </div>
      </li>

      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-wrench"></i>
          <span>동문회비</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">기부자액수</h6>
            <a class="collapse-item" href="/admint/donaadd">기부자등록</a>
            <a class="collapse-item" href="/admint/dona?type=500">500만원</a>
            <a class="collapse-item" href="/admint/dona?type=200">200만원</a>
            <a class="collapse-item" href="/admint/dona?type=30">30만원</a>
            <a class="collapse-item" href="/admint/dona?type=1">평생회비 납부자</a>
          </div>
        </div>
      </li>
  	
      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        UI
      </div>
     <!--  <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-folder"></i>
          <span>메인</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Login Screens:</h6>
            <a class="collapse-item" href="login.html">Login</a>
            <a class="collapse-item" href="register.html">Register</a>
            <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
            <div class="collapse-divider"></div>
            <h6 class="collapse-header">Other Pages:</h6>
            <a class="collapse-item" href="404.html">404 Page</a>
            <a class="collapse-item" href="blank.html">Blank Page</a>
          </div>
        </div>
      </li> -->
      <li class="nav-item">
        <a class="nav-link" href="charts.html">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>베너</span></a>
      </li>
    

   <!--    <hr class="sidebar-divider d-none d-md-block">

      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div> -->

    </ul>
    <!-- End of Sidebar -->