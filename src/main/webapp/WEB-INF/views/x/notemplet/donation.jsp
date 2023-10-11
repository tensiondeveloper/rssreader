<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<style type="text/css">

.subject_txt{
	font-size: 14px;
	margin: 0px;
	color: #818181;
}
.pading0{
	padding:0px;
}
.insidediv{
	background: url('/resources/img/dona_inside.png');background-repeat: no-repeat;
    background-size: auto;
}
.inside_pic{
	width:100%
}
.inside_abdiv{
    position: absolute;
    top: 50%;
    left: 19%;
    transform: translateY(-50%);
}
.padding5{
	padding-top: 15px;
}
.inside_abdiv > img{
	float: left;
}
.inside_abdiv > div{
	float: left;
	margin-left: 15px;
}

.inside_abdiv > div > p{
	
}


.content_txt{
 font-size: 19px;
 font-weight: bold;
 font-family: 'Nanum Myeongjo', serif;
 margin: 0px;
 margin-bottom: 10px;
 color: black;
}

.ect_txt{
	margin: 0px;
    position: absolute;
    top: 77%;
    left: 12%;
    transform: translateY(-50%);
    margin-top: 30px;

}
.ect_txtrt{
	margin: 0px;
    position: absolute;
    top: 77%;
    left: 75%;
    transform: translateY(-50%);
    margin-top: 30px;
}
.donatxt{
	margin:0 auto; margin-top: 50px;width: auto;width: 97%;

}
.ect_txt > span{
float: right;
}
@media (min-width: 991px) and (max-width: 1199px) {
.inside_abdiv > img{
width: 41%;
}

.subject_txt{
    font-size: 11px;
    margin: 0px;
}

.content_txt{
	font-size: 16px;
    font-weight: bold;
    font-family: 'Nanum Myeongjo', serif;
    margin: 0px;
    margin-bottom: 6px;
}

.ect_txt{
left:15%;
	margin: 0px;
    margin-top: 18px;
    font-size: 14px;
}
.ect_txtrt{
left:72%;
	margin: 0px;
    margin-top: 18px;
    font-size: 14px;
}

}

@media (max-width: 600px) {
.donatxt{
width: 100%;

}
.inside_abdiv > img{
    width: 34%;
}

.subject_txt{
       font-size: 10px;
    margin: 0px;
}

.content_txt{
	font-size: 12px;
    font-weight: bold;
    font-family: 'Nanum Myeongjo', serif;
    margin: 0px;
    margin-bottom: 3px;
}

.ect_txt{
	margin: 0px;
    font-size: 12px;
    margin-top: 10px;
}
.ect_txtrt{
	margin: 0px;
    font-size: 12px;
    margin-top: 10px;
}

}




</style>


			<!-- main start -->
			<!-- ================ -->
			<div
				class="main col-md-12"
				style="position: relative;">

				<!-- page-title start -->
				<!-- ================ -->
				<ol class="breadcrumb">
					<li><i class="fa fa-home pr-10"></i><a href="#">Home</a></li>
					
					<li class="active active ftbold">MBA총동창회 기여현황, 30만원 이상</li>
				</ol>

				<h2 class="page-title">MBA총동창회 기여현황, 30만원 이상</h2>
				<div class="separator-2 clear"></div>
				<!-- page-title end -->
				
				<!-- <div class="row" style="background: url('/resources/img/dona_back.png')">
					<div class="col-md-6 insidediv" >
						<img src="/resources/img/inside_pic.png" class="inside_pic">
					
					</div>
					<div class="col-md-6 insidediv">
						<img src="/resources/img/inside_pic.png" class="inside_pic">
					</div>
				</div> -->
				
				<div class="col-md-12 donaintro" style="margin-bottom: 15px;">
					<div class="col-md-2 "><a href="/donation?group=2"><h3>동문회비안내</h3></a></div>
					<div class="col-md-2 "><a href="/donation?group=500"><h3>500만원 이상</h3></a></div>
					<div class="col-md-2 "><a href="/donation?group=200"><h3>200만원 이상</h3></a></div>
					<div class="col-md-2 active"><a href="/donation?group=30"><h3>30만원 이상</h3></a></div>
					<div class="col-md-2 "><a href="/donation?group=1"><h3>평생회비 납부자</h3></a></div>
				
				</div>
				<div class="separator-2 clear"></div>
				 <div class="col-md-12" style="padding-bottom: 30px;
    background-repeat-y: repeat;
    background-size: contain;">
				 
				 
					
					
			 <img src="/resources/img/donation/30_logo.png" class="donatxt">
				<c:forEach var="dona" items="${dona_list}" varStatus="status">
				 
					<div class="col-md-6 padding5" >
						<img src="/resources/img/donation/30.png" class="inside_pic">
						<div class="inside_abdiv">
							<img src="/resources/img/inside_pic.png">
							<div>
								<p class="subject_txt">이름(기수)</p>
								<p class="content_txt">${dona.donation_name}</p>
								<p class="subject_txt">회사명</p>
								<p class="content_txt">${dona.donation_company}</p>
								<p class="subject_txt">직함</p>
								<p class="content_txt">${dona.donation_class}</p>
								<p class="subject_txt">발전기금 기부액수</p>
								<p class="content_txt">${dona.donation_pay}</p>
							</div>
						</div>
						<div><p class="ect_txt" style="color: #818181;">${dona.donation_date}</p></div>
						<div><p class="ect_txtrt" style="color: black;cursor: pointer;">상세보기 ></p></div>
						<div style="clear: both"></div>
					</div>
								
				</c:forEach>
								 
			
					
					
					
					
					
					
					
					
					
					
					
					
					
				</div> 

			</div>
			
































