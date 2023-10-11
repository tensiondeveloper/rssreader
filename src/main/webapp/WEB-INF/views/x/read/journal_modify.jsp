<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script type="text/javascript">
$(function(){
$( '.nav-stacked > li:nth-child(4)' ).addClass("active")
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
.journal{
	padding-right: 10px;
	padding-left:10px;
	cursor: pointer;
}
</style>


			<!-- main start -->
			<!-- ================ -->
			<div
				class="main col-md-8 col-lg-offset-1 col-md-push-4 col-lg-push-2"
				style="position: relative;">

				<!-- page-title start -->
				<!-- ================ -->
				<div>
					<ol class="breadcrumb">
						<li><i class="fa fa-home pr-10"></i><a href="index.html">Home</a></li>
						<li class="active">읽을 거리</li>
						<li class="active active ftbold">MBA 저널수정</li>
					</ol>

					<h2 class="page-title">MBA 저널수정</h2>
				</div>
				<div class="separator-2 clear"></div>
				<!-- page-title end -->
				<div class="unive-txt">
					<form action="journal_modify_submit?${_csrf.parameterName}=${_csrf.token}"  enctype="multipart/form-data" method="post" id="writefrm"><br>
						<input type="hidden" name="seq" value="${list.journal_seq}">
						<input type="text" class="form-control" placeholder="제목" name="title" style="margin-bottom: 10px;" value="${list.journal_title}">
						표지 : <input type="file"name ="subimg" style="margin-top: 10px;margin-left:10px; margin-bottom: 5px;   display: inline;"><br>
						<span style="color: gray;margin-left: 5px;">이전파일 : ${list.journal_subimg} </span><br><br>
						저널 파일 : <input type="file" name ="file" style="margin-top: 10px;margin-left:10px; margin-bottom: 5px;   display: inline;"><br>
						<span style="color: gray;margin-left: 5px;">이전파일 : ${list.journal_file}<br></span>
						<a id="submitbtn" class="btn btn-dark" style="float: right">수정</a>
					</form>
					
					
					
					
					
					
					
					
				</div>


			


			</div>
			<!-- main end -->
			<!-- sidebar start -->
			<!-- ================ -->
		

<script type="text/javascript">
$(document).ready(function() {

	$("#submitbtn").on('click',function(){
		
		$("#writefrm").submit();
		
		
	})

})
</script>






















