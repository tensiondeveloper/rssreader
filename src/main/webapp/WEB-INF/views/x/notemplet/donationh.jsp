<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<style type="text/css">

.subject_txt{
	font-size: 24px;
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
    left: 50%;
    transform: translate(-50%, -50%);
}
.padding5{
	padding: 2%;
	padding-top: 25px;
}
.inside_abdiv > img{
	float: left;
	width: 256px;
}
.inside_abdiv > div{
	float: left;
	margin-left: 75px;
}

.inside_abdiv > div > p{
	
}


.content_txt{
 font-size: 31px;
 font-weight: bold;
 font-family: 'Nanum Myeongjo', serif;
 margin: 0px;
 margin-bottom: 10px;
 color: black;
}

.ect_txt{
    margin: 0px;
    position: absolute;
    font-size: 23px;
    top: 75%;
    left: 16%;
    transform: translateY(-50%);
    margin-top: 30px;
    color: white;

}
.ect_txtrt{
	color: black;
    cursor: pointer;
    margin: 0px;
    position: absolute;
    font-size: 23px;
    top: 75%;
    left: 76%;
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
	width: 222px;
}

.subject_txt{
    font-size: 20px;
    margin: 0px;
}

.content_txt{
	font-size: 22px;
    font-weight: bold;
    font-family: 'Nanum Myeongjo', serif;
    margin: 0px;
    margin-bottom: 6px;
}

.ect_txt{
left:15%;
	margin: 0px;
    margin-top: 18px;
    font-size: 20px;
}
.ect_txtrt{
	left:72%;
	margin: 0px;
    margin-top: 18px;
    font-size: 20px;
}

}

@media (max-width: 991px) {
	.inside_abdiv > div{
	    margin-left: 30px;
	
	}
	.donatxt{
	width: 100%;
	
	}
	.inside_abdiv > img{
	    width: 40%;
	}
	
	.subject_txt{
	    font-size: 17px;
	    margin: 0px;
	}
	
	.content_txt{
		font-size: 18px;
	    font-weight: bold;
	    font-family: 'Nanum Myeongjo', serif;
	    margin: 0px;
	    margin-bottom: 3px;
	}
	
	.ect_txt{
		margin: 0px;
	    font-size: 17px;
	    margin-top: 10px;
	    left: 18%;
	}
	.ect_txtrt{
		margin: 0px;
	    font-size: 17px;
	    margin-top: 10px;
	    left: 72%;
	}

}


@media (max-width: 600px) {
.inside_abdiv > div{
   margin-left: 15px;

}
/* .donatxt{
width: 65%;

} */
.inside_abdiv > img{
    width: 45%;
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


.donaintro div{
	margin:15px;
	border: 1px solid #05366e;
	text-align: center;
}
.donaintro div h3{
font-size: 18px;
	color: #05366e;
}
a:hover, a:focus{
	    text-decoration: none;
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
					<li><i class="fa fa-home pr-10"></i><a href="index.html">Home</a></li>
					<c:choose>

					<c:when test="${group eq 200}">
						<li class="active active ftbold">MBA총동창회 기여현황, 200만원 이상</li>
					 </c:when>
					
					<c:when test="${group eq 500}"> 
							 <li class="active active ftbold">MBA총동창회 기여현황, 500만원 이상</li>

					 </c:when>
					 
					<c:when test="${group eq 1000}"> 
							<li class="active active ftbold">MBA총동창회 기여현황, 1000만원 이상</li>
					 </c:when>
					
					<c:otherwise>  </c:otherwise>
					
				</c:choose>
					
				</ol>


				<c:choose>

					<c:when test="${group eq 200}">
					<h2 class="page-title">MBA총동창회 기여현황, 200만원 이상</h2>
					 </c:when>
					
					<c:when test="${group eq 500}"> 
							<h2 class="page-title">MBA총동창회 기여현황, 500만원 이상</h2>

					 </c:when>
					 
					<c:when test="${group eq 1000}"> 
							<h2 class="page-title">MBA총동창회 기여현황, 1000만원 이상</h2>
					 </c:when>
					
					<c:otherwise>  </c:otherwise>
					
				</c:choose>
				
				<div class="separator-2 clear"></div>
				
				
				<div class="col-md-12 donaintro" style="margin-bottom: 15px;">
					<div class="col-md-2 "><a href="/donation?group=2"><h3>동문회비안내</h3></a></div>
					
					<c:choose>

					<c:when test="${group eq 200}">
						<div class="col-md-2 "><a href="/donation?group=500"><h3>500만원 이상</h3></a></div>
						<div class="col-md-2 active"><a href="/donation?group=200"><h3>200만원 이상</h3></a></div>
					 </c:when>
					
					<c:when test="${group eq 500}"> 
							<div class="col-md-2 active"><a href="/donation?group=500"><h3>500만원 이상</h3></a></div>
							<div class="col-md-2 "><a href="/donation?group=200"><h3>200만원 이상</h3></a></div>

					 </c:when>
					 
					
					<c:otherwise>  </c:otherwise>
					
				</c:choose>
					
					
					
					<div class="col-md-2 "><a href="/donation?group=30"><h3>30만원 이상</h3></a></div>
					<div class="col-md-2 "><a href="/donation?group=1"><h3>평생회비 납부자</h3></a></div>
				
				</div>
				<div class="separator-2 clear"></div>
				<!-- page-title end -->
				
				<!-- <div class="row" style="background: url('/resources/img/dona_back.png')">
					<div class="col-md-6 insidediv" >
						<img src="/resources/img/inside_pic.png" class="inside_pic">
					
					</div>
					<div class="col-md-6 insidediv">
						<img src="/resources/img/inside_pic.png" class="inside_pic">
					</div>
				</div> background: url('/resources/img/donation/donation_back.png');-->
				 <div class="col-md-12" style="padding-bottom: 30px;
    background-repeat-y: repeat;
    background-size: contain;">
				
				 <c:choose>

					<c:when test="${group eq 200}">
						 <img src="/resources/img/donation/200_logo.png" class="donatxt">
					 </c:when>
					
					<c:when test="${group eq 500}"> 
							 <img src="/resources/img/donation/500_logo.png" class="donatxt">

					 </c:when>
					 
					<c:when test="${group eq 1000}"> 
							 <img src="/resources/img/donation/1000_logo.png" class="donatxt">				
					 </c:when>
					
					<c:otherwise>  </c:otherwise>
					
				</c:choose>

				<c:forEach var="dona" items="${dona_list}" varStatus="status">
					 
									<div class="col-md-12 padding5" >
										 <c:choose>
											<c:when test="${group eq 200}">
													<img src="/resources/img/donation/200.png" class="inside_pic">
											 </c:when>
											
											<c:when test="${group eq 500}"> 
													<img src="/resources/img/donation/500.png" class="inside_pic">
						
											 </c:when>
											 
											<c:when test="${group eq 1000}"> 
														<img src="/resources/img/donation/1000.png" class="inside_pic">	
											 </c:when>
											<c:otherwise>  </c:otherwise>
											
										</c:choose>
									
									
									
									
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
										<div><p class="ect_txtrt">상세보기 ></p></div>
										<div style="clear: both"></div>
									</div>
				</c:forEach>
								 
			
					
					
					
					
					
					
					
					
					
					
					
					
					
				</div> 

			</div>
			
































