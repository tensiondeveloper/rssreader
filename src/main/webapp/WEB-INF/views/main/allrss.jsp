<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
.lang{

	background-color: gray;
}
.coll-icon{
margin-top: 10px;
    font-size: 1rem;
}
.rssnametxt{

	    color: blue;
    font-size: 17px;
    font-style: oblique;
}
</style>
<script>
$("#dashboard").addClass("active")

function delurl(seq,e){
	if (confirm("선택 URL을 삭제하시겠습니까?") == true) {
			$(e).closest("tr").remove();

	 	   $.ajax({
	        url:"/urldelete",
	        type:'POST',
	        data : {
				"seq" : seq,
			},
	        success:function(data){
	        	alert("삭제 되었습니다.")
	        	
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
					
							<h4><i class="icon-search4 mr-2"></i> <span class="font-weight-semibold">전체보기</span> </h4>
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
								

								

								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th style="width: 50px">분류</th>
												<th style="width: 130px">날짜</th>
												<th style="width: 220px;;">미디어</th>
												<th style="width: 100px;"></th>
												<th>뉴스</th>
												<th class="text-center" style="width: 20px;">
													<div class="list-icons">
														<div class="dropdown position-static">
															<a href="#" class="list-icons-item" data-toggle="dropdown" aria-expanded="false"><i class="icon-arrow-down12"></i></a>
															<div class="dropdown-menu dropdown-menu-right" style="">
																
																<a href="#" class="dropdown-item"  class="btn btn-light" data-toggle="modal" data-target="#modal_scrollable"><i class="icon-checkmark3 text-success"></i>체크항목 내보내기</a>
															
															</div>
														</div>
													</div>
												
												
												
											</tr>
										</thead>
										<tbody>
											
											<c:set var="size" value="${fn:length(list)}" />
											<tr class="table-active table-border-double">
												<td colspan="5">새로운 뉴스</td>
												<td class="text-right">
													<span class="badge badge-success badge-pill">${size}</span>
												</td>
											</tr>
											<c:forEach var="c" items="${list}">
												
											<c:choose>
												<c:when test="${c.lang == '0'}"> 
													<tr>
												</c:when>
												
												<c:otherwise>
													<tr class="lang">
												</c:otherwise>
											</c:choose>
											
											
										
												<td class="text-center">
													<label class="custom-control custom-checkbox">
														<input type="checkbox" class="custom-control-input" id="chk" value="${c.url_seq}">
														<span class="custom-control-label d-flex"></span>
													</label>
												</td>
												<td class="text-left">
												<h6 class="mb-0">${c.dateday}</h6>
													<div class="font-size-sm text-muted line-height-1">${c.time}</div>
												</td>
												<td>
													<div class="d-flex align-items-center">
														
														<div>
															<span class="badge badge-mark border-primary mr-1"></span><a href="${c.media_url}" class="text-body font-weight-semibold">${c.media}</a>
														</div>
													</div>
												</td>
												<td>
													
												</td>
												<td>
													<a href="${c.url} " class="text-body" target="_black">
														<div class="font-weight-semibold">${c.title} <span class="rssnametxt">(${c.rss_name})</span></div>
													
													</a>
														
														
														
														
												</td>
												<td class="text-center">
													<div class="list-icons">
														<div class="dropdown">
															<a href="#" class="list-icons-item" data-toggle="dropdown"><i class="icon-menu7"></i></a>
															<div class="dropdown-menu dropdown-menu-right">
																<a href="#" class="dropdown-item" onclick="delurl('${c.url_seq}',this)"><i class="icon-cross2 text-danger"></i>삭제</a>
															</div>
														</div>
													</div>
												</td>
											</tr>
												
												
												
												
											</c:forEach>
											

											

											<c:set var="size2" value="${fn:length(list_old)}" />
											<tr class="table-active table-border-double">
												<td colspan="5">이전 뉴스</td>
												<td class="text-right">
													<span class="badge badge-danger badge-pill">${size2}</span>
												</td>
											</tr>
											<c:forEach var="c" items="${list_old}">
												
											<c:choose>
												<c:when test="${c.lang == '1'}"> 
													<tr class="lang">
												</c:when>
												
												<c:otherwise>
													<tr >
												</c:otherwise>
											</c:choose>
												<td class="text-center">
													<label class="custom-control custom-checkbox">
														<input type="checkbox" class="custom-control-input" id="chk" value="${c.url_seq}">
														<span class="custom-control-label d-flex"></span>
													</label>
												</td>
												<td class="text-left">
													<h6 class="mb-0">${c.dateday}</h6>
													<div class="font-size-sm text-muted line-height-1">${c.DATETIME}</div>
												</td>
												<td>
													<div class="d-flex align-items-center">
														<div>
															<span class="badge badge-mark border-primary mr-1"></span><a href="${c.media_url}" class="text-body font-weight-semibold">${c.media}</a>
														</div>
													</div>
												</td>
												<td>
													

														
																									
												</td>
												<td>
													<a href="${c.url} " class="text-body" target="_black">
														<div class="font-weight-semibold">${c.title} <span class="rssnametxt">(${c.rss_name})</span></div>
													</a>
														
														
														
														
												</td>
												<td class="text-center">
													<div class="list-icons">
														<div class="dropdown">
															<a href="#" class="list-icons-item" data-toggle="dropdown"><i class="icon-menu7"></i></a>
															<div class="dropdown-menu dropdown-menu-right">
																<a href="#" class="dropdown-item" onclick="delurl('${c.url_seq}',this)"><i class="icon-cross2 text-danger"></i>삭제</a>
															</div>
														</div>
													</div>
												</td>
											</tr>
												
												
												
												
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>

				</div>
			</div>
		
		</div>
		
		
		
		
		
		
			<div id="modal_scrollable" class="modal fade" tabindex="-1">
						<div class="modal-dialog modal-dialog-scrollable">
							<div class="modal-content">
								<div class="modal-header pb-3">
									<h5 class="modal-title">Scrollable modal</h5>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>

								<div class="modal-body py-0">
									<p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>
									<p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
									<p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus auctor fringilla.</p>
									<p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>
									<p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
									<p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus auctor fringilla.</p>
									<p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>
									<p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
									<p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus auctor fringilla.</p>
									<p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>
									<p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
									<p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus auctor fringilla.</p>
									<p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>
									<p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
									<p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus auctor fringilla.</p>
									<p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>
									<p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
									<p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus auctor fringilla.</p>
								</div>

								<div class="modal-footer pt-3">
									<button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary">Save changes</button>
								</div>
							</div>
						</div>
					</div>