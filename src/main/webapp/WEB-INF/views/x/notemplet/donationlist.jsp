<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<style type="text/css">

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

	padding-top: 25px;
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
.subject_txt{
font-size: 15px;
margin: 0px;
}

.content_txt{
 font-size: 22px;
 font-weight: bold;
 font-family: 'Nanum Myeongjo', serif;
 margin: 0px;
 margin-bottom: 10px;
}

.ect_txt{
	margin:0px;
    margin-top: 30px;

}
.donatxt{
	margin:0 auto; margin-top: 50px;margin-bottom: 50px;width: auto;

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
	margin: 0px;
    margin-top: 18px;
    font-size: 14px;
}


}

@media (max-width: 600px) {
.donatxt{
width: 65%;

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


.mdisplay{
	display:  none;
}

.pcdisplay{
display:inline-table;

}
@media (max-width: 992px) {
.mdisplay{
	display: inline-table;
}

.pcdisplay{

display: none;
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
					<li><i class="fa fa-home pr-10"></i><a href="index.html">Home</a></li>
					
					<li class="active active ftbold">MBA총동창회 발전기금 기부자1</li>
				</ol>

				<h2 class="page-title">MBA총동창회 발전기금 기부자</h2>
				<div class="separator-2 clear"></div>
				<div class="col-md-12 donaintro" style="margin-bottom: 15px;">
					<div class="col-md-2 "><a href="/donation?group=2"><h3>동문회비안내</h3></a></div>
					<div class="col-md-2 "><a href="/donation?group=500"><h3>500만원 이상</h3></a></div>
					<div class="col-md-2 "><a href="/donation?group=200"><h3>200만원 이상</h3></a></div>
					<div class="col-md-2 "><a href="/donation?group=30"><h3>30만원 이상</h3></a></div>
					<div class="col-md-2 "><a href="/donation?group=1"><h3>평생회비 납부자</h3></a></div>
				
				</div>
				<div class="separator-2 clear"></div>
			<div style="clear: both;"></div>
		
			 <div class="col-md-12 pcdisplay" style="background: url('/resources/img/donation/donation_back_pc.png');padding-bottom: 30px;
				    background-repeat-y: repeat;
				    background-size: contain;height: 1069px;">
				    <img src="/resources/img/donation/donation_txt_pc.png" style="margin: 0 auto;    width: 40%;    margin-top: 50px;">
    			<div style="margin-top: 50px;">
   					 <div class="col-md-6 padding5" >
						<a href="/donation?group=500"><img src="/resources/img/donation/list_500.png" class="inside_pic"></a>
					</div>
   					 <div class="col-md-6 padding5" >
						<a href="/donation?group=200"><img src="/resources/img/donation/list_200.png" class="inside_pic"></a>
					</div>
   					 <div class="col-md-6 padding5" >
						<a href="/donation?group=30"><img src="/resources/img/donation/list_30.png" class="inside_pic"></a>
					</div>
   					 <div class="col-md-6 padding5" >
						<a href="/donation?group=1"><img src="/resources/img/donation/list_0.png" class="inside_pic"></a>
					</div>
   				 </div>
    
  			</div>
			<div style="clear: both;"></div>
			<div class="col-md-12 mdisplay" style="background: url('/resources/img/donation/donation_back_m.png');padding-bottom: 30px;width:100%;
				    background-repeat-y: repeat;
				    background-size: contain;height: 1069px;">
				    <img src="/resources/img/donation/donation_txt_m.png" style="width: 59%;margin: 0 auto;margin-top: 40px; margin-bottom: 20px;">
    			<div >
   					 <div class="col-md-6 padding5" >
						<a href="/donation?group=500"><img src="/resources/img/donation/list_500_m.png" class="inside_pic"></a>
					</div>
   					 <div class="col-md-6 padding5" >
						<a href="/donation?group=200"><img src="/resources/img/donation/list_200_m.png" class="inside_pic"></a>
					</div>
   					 <div class="col-md-6 padding5" >
						<a href="/donation?group=30"><img src="/resources/img/donation/list_30_m.png" class="inside_pic"></a>
					</div>
   					 <div class="col-md-6 padding5" >
						<a href="/donation?group=1"><img src="/resources/img/donation/list_0_m.png" class="inside_pic"></a>
					</div>
   				 </div>
   				 <div style="clear: both"></div>
    
  			</div> 
		
		
		
		
		
		
		
		
		

			</div>
			
































