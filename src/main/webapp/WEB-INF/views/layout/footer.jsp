<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" type="text/css" href="/resources/mba/footer.css">
<style type="text/css">
.footerbanner{
	background-color: white;
	height: 58px;

}
.footerbanner > div {

float: left;width: 50%;
}
.footerbanner > div>img {

display: inline;
padding: 5px;
}


</style>

<footer id="footer" class="clearfix ">
				<div class="footerbanner pchide" style="margin-top: 20px">
					<div > <a href="/donation?group=0"><img src="/resources/img/dona_widget_mobile.png" style="margin-left: 15px;"></a></div>
					<div style="    text-align: right;"><a href="/contactus" ><img src="/resources/img/inquiry_widget_mobile.png" style="    float: right;margin-right: 15px;"></a></div>
				</div>
				<!-- .subfooter start -->
				<!-- ================ -->
				<div class="subfooter" style="background-color: #434343">
					<div class="container">
						<div class="subfooter-inner">
							<div class="row">
								<div class="col-md-9 footer-one">
									<div class="square-top"></div>
									<p class="text-left" style="color: white;">03722 서울특별시 서대문구 연세로50 연세대학교 경영전문대학원</p>
									<p class="text-left" style="color: white;">개인정보처리방침</p>
									<p class="text-left" style="color: white;">Copyright  © 2016 Yonsei Graduate School of Business. All rights reserved </p>
								</div>
								<div class="col-md-3 footer-two">
									<select onchange="if(this.value!='') window.open(this.value);">
										<option value="">관련사이트</option>
										<option value="https://www.yonsei.ac.kr/sc/">연세대학교</option>
										<option value="https://amp.yonsei.ac.kr/">연세대학교 경영전문대학원</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- .subfooter end -->

</footer>