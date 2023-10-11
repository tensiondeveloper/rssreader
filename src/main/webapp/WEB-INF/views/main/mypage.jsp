<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script src="/resources/global_assets/js/plugins/pickers/pickadate/picker.js"></script>
<script src="/resources/global_assets/js/plugins/pickers/pickadate/picker.date.js"></script>
<script src="/resources/global_assets/js/plugins/pickers/pickadate/picker.time.js"></script>
<script src="/resources//global_assets/js/demo_pages/picker_date.js"></script>
<script src="/resources/global_assets/js/plugins/visualization/d3/d3v5.min.js"></script> 
<script src="/resources/global_assets/js/plugins/visualization/c3/c3.min.js"></script>

<script src="/resources/assets/js/app.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#cate1_add').on('click', function() {
		var name = $("#name").val();
		var old_pwd = $("#old_pwd").val();
		var new_pwd = $("#new_pwd").val();
		var new_pwd2 = $("#new_pwd2").val();
		if(name == ''){
			alert("이름을 입력해주세요")
		}
		if(new_pwd != new_pwd2){
			alert("바꾸시려는 비밀번호를 확인해주세요")
		}
		$.ajax({
	        url:"/mypage",
	        type:'POST',
	        data : {
	        	"name" : $("#name").val(),
				"old_pwd":old_pwd,
				"new_pwd":new_pwd
			},
	        success:function(data){
	        	if(data.error != 0){
	        		alert("이전비밀번호를 확인해주세요")
	        	}else if(data.error == 0){
	        		alert("변경되었습니다.")
	        		location.reload();
	        	}
	        }
 	   })
		
		
		
	});
	
})
</script>
	
	
	
	
<style>

.coll-icon{
margin-top: 10px;
    font-size: 1rem;
}
#mypageform input{
margin-bottom: 10px;
}
</style>
<script>

</script>	
	<!-- /theme JS files -->

	<!-- Main navbar -->
	<div class="content-wrapper">

			<!-- Inner content -->
			<div class="content-inner">

				<!-- Page header -->
				<div class="page-header page-header-light">
					<div class="page-header-content header-elements-lg-inline">
						<div class="page-title d-flex">
					
							<h4><i class="icon-user-plus mr-2"></i> <span class="font-weight-semibold">MYPAGE</span> </h4>
							<a href="#" class="header-elements-toggle text-body d-lg-none"><i class="icon-more"></i></a>
						</div>

						<!-- <div class="header-elements d-none">
							<div class="d-flex justify-content-center">
								<a href="#" class="btn btn-link btn-float text-body"><i class="icon-bars-alt text-primary"></i><span>Statistics</span></a>
								<a href="#" class="btn btn-link btn-float text-body"><i class="icon-calculator text-primary"></i> <span>Invoices</span></a>
								<a href="#" class="btn btn-link btn-float text-body"><i class="icon-calendar5 text-primary"></i> <span>Schedule</span></a>
							</div>
						</div> -->
					</div>

					<div class="breadcrumb-line breadcrumb-line-light header-elements-lg-inline">
					
						<div class="header-elements d-none">
							<div class="breadcrumb justify-content-center">
								
								<!-- <a href="#" class="breadcrumb-elements-item">
									<i class="icon-comment-discussion mr-2"></i>
									Support
								</a> -->

								<!-- <div class="breadcrumb-elements-item dropdown p-0">
									<a href="#" class="breadcrumb-elements-item dropdown-toggle" data-toggle="dropdown">
										<i class="icon-gear mr-2"></i>
										Settings
									</a>

									<div class="dropdown-menu dropdown-menu-right">
										<a href="#" class="dropdown-item"><i class="icon-user-lock"></i> Account security</a>
										<a href="#" class="dropdown-item"><i class="icon-statistics"></i> Analytics</a>
										<a href="#" class="dropdown-item"><i class="icon-accessibility"></i> Accessibility</a>
										<div class="dropdown-divider"></div>
										<a href="#" class="dropdown-item"><i class="icon-gear"></i> All settings</a>
									</div>
								</div> --> 
							</div>
						</div>
					</div>
				</div>
				<!-- /page header -->


				<!-- Content area -->
				<div class="content">
					<div class="card" style="width: 50%">
						<div class="card-header">
		                <h6 class="card-title">비밀번호 변경</h6>
					</div>

	                <div class="card-body">
	                	<form action="#" id="mypageform">
									<input type="text" class="form-control" placeholder="${sider.user.id}" disabled>
									<input type="text" id="name" class="form-control" placeholder="이름" value="${sider.user.name}">
									<input type="password" id="old_pwd" class="form-control" placeholder="이전 비밀번호">
									<input type="password" id="new_pwd" class="form-control" placeholder="새로운비밀번호">
									<input type="password" id="new_pwd2" class="form-control" placeholder="새로운비밀번호 확인">
							<div class="form-group row mb-0" style="margin-top: 79px;">
								<div class="col-lg-8 ml-lg-auto">
									<div class="text-right">
										<button type="button" class="btn btn-primary" id="cate1_add">정보변경 <i class="icon-paperplane ml-2"></i></button>
									</div>
								</div>
							</div>
						</form>
					</div>
					
					
					</div>

				</div>
			</div>
		
		</div>
		
		
		
		
		