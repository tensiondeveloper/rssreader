<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<!-- /core JS files -->
<script src="/resources/global_assets/js/plugins/pickers/pickadate/picker.js"></script>
	<script src="/resources/global_assets/js/plugins/pickers/pickadate/picker.date.js"></script>
	<script src="/resources/global_assets/js/plugins/pickers/pickadate/picker.time.js"></script>
		<script src="/resources//global_assets/js/demo_pages/picker_date.js"></script>
	<!-- Theme JS files -->
	 <script src="/resources/global_assets/js/plugins/visualization/d3/d3v5.min.js"></script> 
	<script src="/resources/global_assets/js/plugins/visualization/c3/c3.min.js"></script>

	<script src="/resources/assets/js/app.js"></script>
	
<style>
.urltxt2{
  display: block;
  width: 350px;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}


</style>
<script>
$("#dashboard").addClass("active")
function del(seq){
	if (confirm("선택 URL을 삭제하시겠습니까?") == true) {
		

 	   $.ajax({
        url:"/urllistdelete",
        type:'POST',
        data : {
			"seq" : seq,
		},
        success:function(data){
        	alert("삭제 되었습니다.")
        	location.reload();
        }
 	   })
	
	
}else{
	
	return;
	
}
	
	
	
}

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
							<h4><i class="icon-arrow-left52 mr-2"></i> <span class="font-weight-semibold">Dashboard</span></h4>
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

				<div class="card">
						<div class="card-header">
							<h5 class="card-title">주소 현황</h5>
						</div>

						<div class="card-body">
						</div>

						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>#</th>
										<th >URL</th>
										<th >타이틀</th>
										<th width="130px">새로운뉴스</th>
										<th width="100px">이전뉴스</th>
										<th width="230px">등록날짜</th>
										<th width="70px">삭제</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="c" items="${rsslist}" varStatus="status">
										<tr>
											<td>${status.count}</td>
											<td><span class="urltxt2"><a href="${c.rssurl}" target="_black">${c.rssurl}</a></span></td>
											<td><img class="feed_img" src="${c.iconimg}">${c.rss_name}</td>
											<td><a href="/rss/${c.list_seq}"><span class="badge badge-primary badge-pill">${c.ncnt}</span></a></td>
											<td><a href="/rss/${c.list_seq}"><span class="badge badge-primary badge-pill">${c.acnt}</span></a></td>
											<td>${c.add_date}</td>
											<td><a href="#" class="list-icons-item text-danger" onclick="del('${c.list_seq}')"><i class="icon-trash"></i></a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				
			







				</div>

			</div>
			<!-- /inner content -->

		
		</div>
		