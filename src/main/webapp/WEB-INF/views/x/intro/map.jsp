<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script type="text/javascript">
$(function(){
$( '.nav-stacked > li:nth-child(6)' ).addClass("active")
})
</script>
<style type="text/css">

.unive-txt{
word-break: keep-all;

}
.univetxt-sub{
	font-size: 16px;
    font-weight: 600;
    margin-top: 30px;
    margin-bottom: 5px;
}
.mapdiv{

margin-top: 10px;
}
.mapdiv p{
	margin-bottom: 5px;
}
.mapdiv p span{
	font-weight: bold;
}
</style>


			<!-- main start -->
			<!-- ================ -->
			<div
				class="main col-md-9 col-mg-3 col-md-push-3"
				style="position: relative;">

				<!-- page-title start -->
				<!-- ================ -->
				<div>
					<ol class="breadcrumb">
						<li><i class="fa fa-home pr-10"></i><a href="index.html">Home</a></li>
						<li class="active">MBA총동창회 소개</li>
						<li class="active active ftbold">총동창회 사무실 연락처/위치</li>
					</ol>

					<h2 class="page-title">총동창회 사무실 연락처/위치</h2>
				</div>
				<div class="separator-2 clear"></div>
				<!-- page-title end -->
				<div class="unive-txt">
					
 <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ikv6ab553m"></script>

				<div id="map" style="width:100%;height:400px;margin-top: 5px; border: 4px solid #05366e"></div>
				<div class="mapdiv">
				
				<p><span>주소 |</span> 03722 서울특별시 서대문구 연세로 50 연세동문회관 2층 <span>사무실 전화번호 |</span> 02-717-9324~5</p>
				<p><span>사이트관리자 엄은향 과장 |</span> 010-9115-1294 / ysumbaalumni@gmail.com</p>
				<p><span>사이트관리자 이근설 사무총장 |</span> 000-0000-0000 / test@test.net</p>
				
				</div>
	
				<script>
				
				
				var map = new naver.maps.Map('map', {
				    center: new naver.maps.LatLng(37.563189, 126.941886),
				    zoom: 15
				});

				var marker = new naver.maps.Marker({
				    position: new naver.maps.LatLng(37.563189, 126.941886),
				    map: map
				});
				</script>
					
					
					
					
					
				</div>


			


			</div>
			<!-- main end -->
			<!-- sidebar start -->
			<!-- ================ -->
		





























