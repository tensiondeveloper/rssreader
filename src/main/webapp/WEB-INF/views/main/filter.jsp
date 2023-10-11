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
	
	
	<script src="/resources/global_assets/js/main/jquery.min.js"></script>
	<script src="/resources/global_assets/js/main/bootstrap.bundle.min.js"></script>
	<!-- /core JS files -->

	<!-- Theme JS files -->
	<script src="/resources/global_assets/js/plugins/forms/inputs/inputmask.js"></script>
	<script src="/resources/global_assets/js/plugins/forms/selects/select2.min.js"></script>
	<script src="/resources/global_assets/js/plugins/forms/selects/bootstrap_multiselect.js"></script>
	<script src="/resources/global_assets/js/plugins/uploaders/bs_custom_file_input.min.js"></script>
	<script src="/resources/global_assets/js/plugins/extensions/jquery_ui/core.min.js"></script>
	<script src="/resources/global_assets/js/plugins/forms/inputs/typeahead/typeahead.bundle.min.js"></script>
	<script src="/resources/global_assets/js/plugins/forms/tags/tagsinput.min.js"></script>
	<script src="/resources/global_assets/js/plugins/forms/tags/tokenfield.min.js"></script>
	<script src="/resources/global_assets/js/plugins/forms/inputs/touchspin.min.js"></script>
	<script src="/resources/global_assets/js/plugins/forms/inputs/maxlength.min.js"></script>
	<script src="/resources/global_assets/js/plugins/forms/inputs/formatter.min.js"></script>
	
	
	 <script src="/resources/global_assets/js/plugins/visualization/d3/d3v5.min.js"></script> 
	<script src="/resources/global_assets/js/plugins/visualization/c3/c3.min.js"></script>
	<script src="/resources/assets/js/app.js"></script>
		<script src="/resources/global_assets/js/demo_pages/form_floating_labels.js"></script>
	
	<script src="/resources/global_assets/js/demo_charts/c3/c3_lines_areas.js"></script>
	<script src="/resources/global_assets/js/demo_charts/c3/c3_bars_pies.js"></script>
	
<script type="text/javascript">
$(document).ready(function(){
	$('input').on('beforeItemRemove', function(event) {
		  var tag = event.item;
		  console.log("삭제-"+tag)
		  console.log( $(this).attr("data-value"))
			$.ajax({
	        url:"/filter_delete",
	        type:'POST',
	        data : {
	        	"seq" : $(this).attr("data-value"),
				"lang":tag
			},
	        success:function(data){
	        	
	        }
	 	   })
		});
	$('input').on('beforeItemAdd', function(event) {
		 var tag = event.item;
		  console.log("입력-"+tag)
			  console.log( )
			$.ajax({
	        url:"/filter_add",
	        type:'POST',
	        data : {
				"seq" : $(this).attr("data-value"),
				"lang":tag
			},
	        success:function(data){
	        	
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


function importbtn(){
	
	var checkboxValues = [];
	  $(".check_seq:checked").each(function() { 
	        checkboxValues.push($(this).val());
	  });
	 var txt = '';
	  console.log(checkboxValues)
	  
	   $.ajax({
	      url:'/importchk',
	      type:'POST',
	      data : {
				"checkboxValues" : checkboxValues,
			},
	      success:function(data){
	      	$("#importtxt").val(data.import);
     	 }
  });  
	
	
}

function updaterss(seq){
	
	 $.ajax({
	      url:'/updaterss',
	      type:'POST',
	      data : {
				"seq" : seq,
			},
	      success:function(data){
	    	  location.reload();
    	 }
	 })
	
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
					
							<h4><i class="icon-search4 mr-2"></i> <span class="font-weight-semibold">제외어</span> </h4>
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
												<th style="width: 300px;">RSS</th>
												<th>제외어</th>
												
											</tr>
										</thead>
										<tbody>
											 	<c:forEach var="a" items="${list}">
											<tr>
												<th><a href="${a.rssurl}">${a.rss_name}</a></th>
												<th>
															<input type="text" class="form-control tags-input" value="${a.lang}" data-value="${a.list_seq}" placeholder="- 제외어 입력후 엔터" >
												</th>
												
											</tr>
											</c:forEach>
										
										</tbody>
									</table>
								</div>
							</div>

				</div>
			</div>
		
		</div>
		
		
		
		
		
		
			<div id="modal_scrollable" class="modal fade" data-keyboard="false" data-backdrop="static" tabindex="-1">
						<div class="modal-dialog modal-dialog-scrollable">
							<div class="modal-content">
								<div class="modal-header pb-3">
									<h5 class="modal-title">MAIL IMPORT</h5>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>

								<div class="modal-body py-0">
									<textarea style="width: 100%" id="importtxt">
									
									
									</textarea>
								</div>

								<div class="modal-footer pt-3">
									<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>