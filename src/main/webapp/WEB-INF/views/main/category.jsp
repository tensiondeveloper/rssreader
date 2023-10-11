<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<!-- /global stylesheets -->
<script src="/resources/global_assets/js/plugins/pickers/pickadate/picker.js"></script>
<script src="/resources/global_assets/js/plugins/pickers/pickadate/picker.date.js"></script>
<script src="/resources/global_assets/js/plugins/pickers/pickadate/picker.time.js"></script>
<script src="/resources//global_assets/js/demo_pages/picker_date.js"></script>
<script src="/resources/global_assets/js/plugins/visualization/d3/d3v5.min.js"></script> 
<script src="/resources/global_assets/js/plugins/visualization/c3/c3.min.js"></script>

	<!-- Core JS files -->
	<script src="/resources/global_assets/js/main/jquery.min.js"></script>
	<script src="/resources/global_assets/js/main/bootstrap.bundle.min.js"></script>
	<script src="/resources/global_assets/js/plugins/forms/selects/select2.min.js"></script>

	<script src="/resources/assets/js/app.js"></script>
	<script src="/resources/global_assets/js/demo_pages/alpaca_advanced.js"></script>
	
	
	
	


<style>
.lang{
	background-color: gray;
}
.coll-icon{
margin-top: 10px;
    font-size: 1rem;
}

</style>
<script>

$("#category").addClass("active")
$(document).ready(function(){
	$('#cate1_seq').select2();
	$('#main_cate').select2();
	$('#sub_cate').select2();
	$('#cate1_seq_u').select2();
	$('#cate2_a').select2();
	$('#cate1_a_d').select2();
	$('#cate1_a').select2();
	$('#cate1_seq_d').select2();
	$('#cate2_a_d').select2();
	
	
	$('#s_rsslist').select2();
	
	$("#cate1_add").on('click',function(){
		  $.ajax({
		        url:"/cate1_add",
		        type:'POST',
		        data : {
					"cate1" : $("#cate1").val(),
				},
		        success:function(data){
		        	alert("등록 되었습니다.")
		        	location.reload();
		        }
		 	   })
		
	})
	$("#rss_cate_add").on('click',function(){
		
		console.log( $("#sub_cate option:selected").val())
		console.log($("#s_rsslist option:selected").val())
		
		
			$.ajax({
		        url:"/rss_cate_add",
		        type:'POST',
		        data : {
					"cate2_seq" : $("#sub_cate option:selected").val(),
					"list_seq" : $("#s_rsslist option:selected").val(),
					
					
					
				},
		        success:function(data){
		        	alert("등록 되었습니다.")
		        	location.reload();
		        }
		 	   })
		
	})
	
	$("#cate2_add").on('click',function(){
		  $.ajax({
		        url:"/cate2_add",
		        type:'POST',
		        data : {
					"cate1_seq" : $("#cate1_seq").val(),
					"cate2_name" : $("#cate2").val(),
				},
		        success:function(data){
		        	alert("등록 되었습니다.")
		        	location.reload();
		        }
		 	   })
		
	})
	$("#main_cate").on('change',function(){
		console.log("123")
		console.log($("#main_cate option:selected").val())
		var list = "<option>메인 카테고리를 선택해주세요</option>";
		   $.ajax({
		        url:"/sub_catecall",
		        type:'POST',
		        data : {
					"seq" : $("#main_cate option:selected").val()
				},
		        success:function(data){
		        	var list = "";
		        	$.each(data.list, function(key, value){
		        		list+= '<option value="'+value.cate2_seq+'">'+value.cate2_name+'</option>';
		        	})
		        	
		        	$("#sub_cate").empty();
		        	var mySelect = $("#sub_cate").append(list);
		        	mySelect.trigger("change");
		        	console.log(data.list)
		        }
	 	   }) 
		
	})
	$("#cate1_seq_u").on('change',function(){
		console.log("123")
		console.log($("#cate1_seq_u option:selected").val())
		var list = "<option>메인 카테고리를 선택해주세요</option>";
		   $.ajax({
		        url:"/sub_catecall",
		        type:'POST',
		        data : {
					"seq" : $("#cate1_seq_u option:selected").val()
				},
		        success:function(data){
		        	var list = "";
		        	$.each(data.list, function(key, value){
		        		list+= '<option value="'+value.cate2_seq+'">'+value.cate2_name+'</option>';
		        	})
		        	
		        	$("#cate2_a").empty();
		        	var mySelect = $("#cate2_a").append(list);
		        	mySelect.trigger("change");
		        	console.log(data.list)
		        }
	 	   }) 
		
	})
	$("#cate1_seq_d").on('change',function(){
		console.log("123")
		console.log($("#cate1_seq_d option:selected").val())
		var list = "<option>메인 카테고리를 선택해주세요</option>";
		   $.ajax({
		        url:"/sub_catecall",
		        type:'POST',
		        data : {
					"seq" : $("#cate1_seq_d option:selected").val()
				},
		        success:function(data){
		        	var list = "";
		        	$.each(data.list, function(key, value){
		        		list+= '<option value="'+value.cate2_seq+'">'+value.cate2_name+'</option>';
		        	})
		        	
		        	$("#cate2_a").empty();
		        	var mySelect = $("#cate2_a_d").append(list);
		        	mySelect.trigger("change");
		        	console.log(data.list)
		        }
	 	   }) 
		
	})
	
	
	
	
	
	
	
	
	
	
	
	$("#cate1_u").on('click',function(){
		  $.ajax({
		        url:"/cate1_update",
		        type:'POST',
		        data : {
					"seq" : $("#cate1_a option:selected").val(),
					"name" : $("#cate1_u_n").val(),
				},
		        success:function(data){
		        	alert("수정 되었습니다.")
		        	location.reload();
		        }
		 	   })
		
	})
		$("#cate1_d").on('click',function(){
		  $.ajax({
		        url:"/cate1_delete",
		        type:'POST',
		        data : {
					"seq" : $("#cate1_a_d option:selected").val(),
				},
		        success:function(data){
		        	alert("삭제 되었습니다.")
		        	location.reload();
		        }
		 	   })
		
	})
		$("#cate2_u").on('click',function(){
		  $.ajax({
		        url:"/cate2_update",
		        type:'POST',
		        data : {
					"seq" :  $("#cate2_a option:selected").val(),
					"name" : $("#cate2_u_n").val(),
				},
		        success:function(data){
		        	alert("수정 되었습니다.")
		        	location.reload();
		        }
		 	   })
		
	})
		$("#cate2_d").on('click',function(){
		  $.ajax({
		        url:"/cate2_delete",
		        type:'POST',
		        data : {
					"seq" : $("#cate2_a_d option:selected").val()
				},
		        success:function(data){
		        	alert("삭제 되었습니다.")
		        	location.reload();
		        }
		 	   })
		
	})
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
})



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
					
							<h4>Category </h4>
							<a href="#" class="header-elements-toggle text-body d-lg-none"><i class="icon-more"></i></a>
						</div>

						
					</div>

					<div class="breadcrumb-line breadcrumb-line-light header-elements-lg-inline">
					
						<div class="header-elements d-none">
							<div class="breadcrumb justify-content-center">
						
							</div>
						</div>
					</div>
				</div>
				<!-- /page header -->


				<!-- Content area -->
				<div class="content">
					<div class="row">
					
						<div class="col-lg-6">
			                
		                	<div class="card">
								<div class="card-header">
					                <h6 class="card-title">메인 카테고리 등록</h6>
								</div>

				                <div class="card-body">
				                	<form action="#">
										<div class="form-group row">
											<label class="col-form-label col-lg-4">카데고리 명 :</label>
											<div class="col-lg-8">
												<input type="text" id="cate1" class="form-control" placeholder="카테고리 명">
											</div>
										</div>

										
										<div class="form-group row mb-0" style="margin-top: 79px;">
											<div class="col-lg-8 ml-lg-auto">
												<div class="text-right">
													<button type="button" class="btn btn-primary" id="cate1_add">등록 <i class="icon-paperplane ml-2"></i></button>
												</div>
											</div>
										</div>
									</form>
								</div>
								<div class="card-header" style="border-top: 2px solid #dfdfdf;">
					                <h6 class="card-title">메인 카테고리 수정</h6>
								</div>
								<div class="card-body">
				                	<form action="#">
										<div class="form-group row">
											<label class="col-form-label col-lg-4">카데고리 명 :</label>
											<div class="col-lg-8">
											
													<select id="cate1_a">
														
															<c:forEach var="c" items="${cate1_list}">
															
																<option value="${c.cate1_seq}">${c.cate1_name}</option>
															
															</c:forEach>
														
														</select>
											</div>
											</div>
											
											<div class="form-group row">
											<label class="col-form-label col-lg-4">수정될 카데고리 명 :</label>
											<div class="col-lg-8">
												<input type="text" id="cate1_u_n" class="form-control" placeholder="수정될 카테고리 명">
											</div>
										</div>

										
										<div class="form-group row mb-0" style="margin-top: 78px;">
											<div class="col-lg-8 ml-lg-auto">
												<div class="text-right">
													<button type="button" class="btn btn-teal" id="cate1_u">수정 <i class="icon-paperplane ml-2"></i></button>
												</div>
											</div>
										</div>
									</form>
								</div>
								<div class="card-header" style="border-top: 2px solid #dfdfdf;">
					                <h6 class="card-title">메인 카테고리 삭제</h6>
								</div>
								<div class="card-body">
				                	<form action="#">
										<div class="form-group row">
											<label class="col-form-label col-lg-4">카데고리 명 :</label>
											<div class="col-lg-8">
											
													<select id="cate1_a_d">
														
															<c:forEach var="c" items="${cate1_list}">
															
																<option value="${c.cate1_seq}">${c.cate1_name}</option>
															
															</c:forEach>
														
														</select>
											</div>
											</div>
											
										

										
										<div class="form-group row mb-0" style="margin-top: 78px;">
											<div class="col-lg-8 ml-lg-auto">
												<div class="text-right">
													<button type="button" class="btn btn-danger" id="cate1_d">삭제 <i class="icon-paperplane ml-2"></i></button>
												</div>
											</div>
										</div>
									</form>
								</div>
			                </div>
			                <!-- /left and right buttons -->

						</div>
					
						<div class="col-lg-6">
			                
		                	<div class="card">
								<div class="card-header">
					                <h6 class="card-title">서브 카테고리 등록</h6>
								</div>

				                <div class="card-body">
				                	<form action="#">
										<div class="form-group row">
											<label class="col-form-label col-lg-4">상위 카테고리 : </label>
											<div class="col-lg-8">
														<select id="cate1_seq">
														
															<c:forEach var="c" items="${cate1_list}">
															
																<option value="${c.cate1_seq}">${c.cate1_name}</option>
															
															</c:forEach>
														
														</select>
											</div>
										</div>

										<div class="form-group row">
											<label class="col-form-label col-lg-4">서브 카테고리 명:</label>
											<div class="col-lg-8">
												<input type="text" id="cate2" class="form-control" placeholder="서브카테고리 명">
											</div>
										</div>

									

										<div class="form-group row mb-0">
											<div class="col-lg-8 ml-lg-auto">
												<div class="text-right">
													<button type="submit" class="btn btn-primary" id="cate2_add">등록 <i class="icon-paperplane ml-2"></i></button>
												</div>
											</div>
										</div>
									</form>
								</div>
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								<div class="card-header" style="border-top: 2px solid #dfdfdf;">
					                <h6 class="card-title">서브 카테고리 수정</h6>
								</div>

				                <div class="card-body">
				                	<form action="#">
										<div class="form-group row">
											<label class="col-form-label col-lg-4">상위 카테고리 : </label>
											<div class="col-lg-8">
														<select id="cate1_seq_u">
															<option>메인카테고리를 선택해주세요</option>
															<c:forEach var="c" items="${cate1_list}">
															
																<option value="${c.cate1_seq}">${c.cate1_name}</option>
															
															</c:forEach>
														
														</select>
											</div>
										</div>

										<div class="form-group row">
											<label class="col-form-label col-lg-4">서브 카테고리 명:</label>
											<div class="col-lg-8">
													<select id="cate2_a">
														
															
														
													</select>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-form-label col-lg-4">수정될 서브 카테고리 명:</label>
											<div class="col-lg-8">
												<input type="text" id="cate2_u_n" class="form-control" placeholder="수정될 서브 카테고리 명">
											</div>
										</div>

									

										<div class="form-group row mb-0">
											<div class="col-lg-8 ml-lg-auto">
												<div class="text-right">
													<button type="submit" class="btn btn-teal" id="cate2_u">수정 <i class="icon-paperplane ml-2"></i></button>
												</div>
											</div>
										</div>
									</form>
								</div>
								
								
								
								
								
								
								
								
								
								
								<div class="card-header" style="border-top: 2px solid #dfdfdf;">
					                <h6 class="card-title">서브 카테고리 삭제</h6>
								</div>

				                <div class="card-body">
				                	<form action="#">
										<div class="form-group row">
											<label class="col-form-label col-lg-4">상위 카테고리 : </label>
											<div class="col-lg-8">
														<select id="cate1_seq_d">
															<option>메인카테고리를 선택해주세요</option>
															<c:forEach var="c" items="${cate1_list}">
															
																<option value="${c.cate1_seq}">${c.cate1_name}</option>
															
															</c:forEach>
														
														</select>
											</div>
										</div>

										<div class="form-group row">
											<label class="col-form-label col-lg-4">삭제할 서브 카테고리 명:</label>
											<div class="col-lg-8">
													<select id="cate2_a_d">
														
														
													</select>
											</div>
										</div>
										
									

										<div class="form-group row mb-0">
											<div class="col-lg-8 ml-lg-auto">
												<div class="text-right">
													<button type="submit" class="btn btn-danger" id="cate2_d">삭제 <i class="icon-paperplane ml-2"></i></button>
												</div>
											</div>
										</div>
									</form>
								</div>
			                </div>
			                <!-- /left and right buttons -->

						</div>
					
					
					</div>
					
					
					<div class="row">
					
						<div class="col-lg-12">
			                
		                	<div class="card">
								<div class="card-header">
					                <h6 class="card-title"></h6>
								</div>

				                <div class="card-body">
				                	<form action="#">
										<div class="form-group row">
											<label class="col-form-label col-lg-4">메인카테고리</label>
											<div class="col-lg-8">
														<select id="main_cate">
															<option>메인카테고리를 선택해주세요</option>
															<c:forEach var="c" items="${cate1_list}">
																<option value="${c.cate1_seq}">${c.cate1_name}</option>
															
															</c:forEach>
														
														</select>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-form-label col-lg-4">서브카테고리</label>
											<div class="col-lg-8">
														<select id="sub_cate">
														
														</select>
											</div>
										</div>
										
										
										<div class="form-group row">
											<label class="col-form-label col-lg-4">RSS</label>
											<div class="col-lg-8">
														<select id="s_rsslist">
															<c:forEach var="c2" items="${rsslist}">
																<option value="${c2.list_seq}">${c2.rss_name}</option>
															
															</c:forEach>
														</select>
											</div>
										</div>

										
										<div class="form-group row mb-0">
											<div class="col-lg-8 ml-lg-auto">
												<div class="text-right">
													<button type="button" class="btn btn-primary" id="rss_cate_add">등록 <i class="icon-paperplane ml-2"></i></button>
												</div>
											</div>
										</div>
									</form>
								</div>
			                </div>
			                <!-- /left and right buttons -->

						</div>
					</div>
				</div>
			</div>
		
		</div>
		
		
		
		
		