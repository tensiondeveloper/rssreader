<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
	<script src="/resources/global_assets/js/plugins/forms/selects/select2.min.js"></script>
<style>
.nav-sidebar .nav-item:not(.nav-item-header):last-child {
     padding-bottom: 0rem !important;
}
.nav-sidebar .nav-item:not(.nav-item-header):first-child {
     padding-top: 0rem !important;
}
.nav-group-sub .nav-group-sub .nav-link{
padding-left: 20px !important;
}
.nav-group-sub .nav-link{
    padding: 0.625rem 1.25rem 0.625rem 2.5rem;
}
.feed_img{

    border-radius: 10px;
    margin-right: 1.25rem;
    width: 16px;
    margin-top: 0.1875rem;
    margin-bottom: 0.1875rem;
    font-size: 1rem;
    top: 0;
    font-family: icomoon!important;
    speak: none;
    font-style: normal;
    font-weight: 400;
    font-variant: normal;
    text-transform: none;
    line-height: 1;
    min-width: 1em;
    display: inline-block;
    text-align: center;
    font-size: 1rem;
    vertical-align: middle;
    position: relative;
    top: -1px;
    -webkit-font-smoothing: antialiased

}
.addbtn{

    left: 78%;
    margin-right: 10px;
width: calc(1.5rem + 0px);
    height: calc(1.5rem + 0px);
}

.rssnametxt2{

display: block;
    width: 165px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
}

</style>
	
	
<script type="text/javascript">





/* setInterval( loadTable() , 5000);
 */
$(document).ready(function(){
	/*  loadTable();  */
	$('#main_cate_side').select2();
	$('#sub_cate_side').select2();
	
	
	$("#main_cate_side").on('change',function(){
		var list = "<option>메인 카테고리를 선택해주세요</option>";
		   $.ajax({
		        url:"/sub_catecall",
		        type:'POST',
		        data : {
					"seq" : $("#main_cate_side option:selected").val()
				},
		        success:function(data){
		        	var list = "";
		        	$.each(data.list, function(key, value){
		        		list+= '<option value="'+value.cate2_seq+'">'+value.cate2_name+'</option>';
		        	})
		        	
		        	$("#sub_cate_side").empty();
		        	var mySelect = $("#sub_cate_side").append(list);
		        	mySelect.trigger("change");
		        	console.log(data.list)
		        }
	 	   }) 
		
	})
	
	
	
	
	
	
	
	
	
	$("#url-submit").click(function(){
		$.ajax({
			type : "POST",
			data:{
				"url"		:$("#urltxt").val(),
				"cate2_seq" :  $("#sub_cate_side option:selected").val()
			},
			url : "/urladd",
			success : function(data) {
				alert("url이 추가 되었습니다");
				$('#modal_keyboard').modal('hide');
				location.reload();
			}
		})  
		
	})
	
	
	
})


/* function loadTable() {
	$.ajax({
		type : "POST",
		url : "/side",
		success : function(data) {
			//loadTable();
			var list = '<li class="nav-item-header"><div class="text-uppercase font-size-xs line-height-xs">RSS<a href="#" class="btn btn-icon btn-light btn-sm rounded-pill addbtn" data-toggle="modal" data-target="#modal_keyboard2"><i class="icon-folder-plus3"></i></a><a href="#" class="btn btn-icon btn-light btn-sm rounded-pill addbtn" data-toggle="modal" data-target="#modal_keyboard"><i class="icon-plus22"></i></a></div> <i class="icon-menu" title="Main"></i></li>';
			list += '<li class="nav-item"><a href="/all" class="nav-link" id="dashboard"><i class="icon-home4"></i><span>전체</span></a></li>';
			$.each(data.sidelist, function(key, value){
				list+='<li class="nav-item">';
				list+='<a href="/rss/'+value.list_seq+'" class="nav-link">';
				list+='<img class="feed_img" src="https://www.inoreader.com/fetch_icon/search.naver.com?w=32&amp;cs=1296397256&amp;v=1">';
				list+='<span class="rssnametxt2">';
				list+=value.rss_name;
				list+='</span>';
				
				if(value.ncnt != 0){
					list+='<span class="badge badge-primary align-self-center ml-auto">'+value.ncnt+'</span>';
				}
				
				list+='</a>	</li>';
				
			});
			
			$("#rssdiv").empty();
			$("#rssdiv").append(list);
			console.log(data)
		}
	})  
	
	
	
} */

function loadTable() {
$.ajax({
	type : "POST",
	url : "/side",
	success : function(data) {
		//loadTable();
		var list = '<li class="nav-item-header"><div class="text-uppercase font-size-xs line-height-xs">RSS<a href="#" class="btn btn-icon btn-light btn-sm rounded-pill addbtn" data-toggle="modal" data-target="#modal_keyboard2"><i class="icon-folder-plus3"></i></a><a href="#" class="btn btn-icon btn-light btn-sm rounded-pill addbtn" data-toggle="modal" data-target="#modal_keyboard"><i class="icon-plus22"></i></a></div> <i class="icon-menu" title="Main"></i></li>';
		list += '<li class="nav-item"><a href="/all" class="nav-link" id="dashboard"><i class="icon-home4"></i><span>전체</span></a></li>';
		$.each(data.lista, function(key, value){
			list += '<li class="nav-item nav-item-submenu">';
			list += '<a href="#" class="nav-link"><i class="icon-tree5"></i> <span>'+value.cate1_name+'</span></a>';
			$.each(value.list, function(key, value2){
				console.log(value2)
				list += '<ul class="nav nav-group-sub" data-submenu-title="Menu levels">';
				list += '<li class="nav-item nav-item-submenu">';
				list += '<a href="#" class="nav-link"><i class="icon-firefox"></i>' +value2.cate2_name+'</a>';
				list += '<ul class="nav nav-group-sub">';
				
				$.each(value2.list, function(key, value3){
					list += '<li class="nav-item"><a href="#" class="nav-link"><i class="icon-android"></i>keyword</a></li>';
					
				})
				list += '</ul>';
				list += '</li></ul>';
				
					
					
			})
			
			list += '</li>';
			
		});
		
		
		
		
		$("#rssdiv").empty();
		$("#rssdiv").append(list);
	
	}
})  
}
/* <li class="nav-item nav-item-submenu">
<a href="#" class="nav-link"><i class="icon-tree5"></i> <span>cate1</span></a>
<ul class="nav nav-group-sub" data-submenu-title="Menu levels">
	<li class="nav-item nav-item-submenu">
		<a href="#" class="nav-link"><i class="icon-firefox"></i> cate2</a>
		<ul class="nav nav-group-sub">
			<li class="nav-item"><a href="#" class="nav-link"><i class="icon-android"></i>keyword</a></li>
		</ul>
	</li>
</ul>

</li> */
</script>
										
									

<!-- Main sidebar -->
		<div class="sidebar sidebar-dark sidebar-main sidebar-expand-lg">

			<!-- Sidebar content -->
			<div class="sidebar-content">

				<!-- User menu -->
				<div class="sidebar-section sidebar-user my-1">
					<div class="sidebar-section-body">
						<div class="media">
							<a href="#" class="mr-3">
								<img src="/resources/global_assets/images/placeholders/placeholder.jpg" class="rounded-circle" alt="">
							</a>

							<div class="media-body">
								<div class="font-weight-semibold">Account</div>
								<!-- <div class="font-size-sm line-height-sm opacity-50">
									<select>
										<option>https://WWW.TEST.COM</option>
									</select>
									
								</div> -->
							</div>

						
						</div>
					</div>
				</div>
				<!-- /user menu -->


				<!-- Main navigation -->
				<div class="sidebar-section">
					<ul class="nav nav-sidebar" data-nav-type="accordion">

						<!-- Main -->
						<li class="nav-item-header"><div class="text-uppercase font-size-xs line-height-xs">TOOL</div> <i class="icon-menu" title="Main"></i></li>
						<li class="nav-item">
							<a href="/" class="nav-link" id="dashboard">
								<i class="icon-home4"></i>
								<span>
									Dashboard
								</span>
							</a>
							<a href="/category" class="nav-link" id="category">
								<i class="icon-home4"></i>
								<span>
									Category
								</span>
							</a>
						</li>
						<!-- <li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link"><i class="icon-tree5"></i> <span>cate1</span></a>
							<ul class="nav nav-group-sub" data-submenu-title="Menu levels">
								
								<li class="nav-item nav-item-submenu">
									<a href="#" class="nav-link"><i class="icon-firefox"></i> cate2</a>
									<ul class="nav nav-group-sub">
										<li class="nav-item"><a href="#" class="nav-link"><i class="icon-android"></i>keyword</a></li>
									</ul>
								</li>
							</ul>
							
						</li> -->
					
					</ul>
					
					
					
					
					
					
					
					
					
					
					
					
					
					<ul class="nav nav-sidebar" id="rssdiv" data-nav-type="accordion">
					
					
					<li class="nav-item-header">
						<div class="text-uppercase font-size-xs line-height-xs">RSS 
						<a href="#" class="btn btn-icon btn-light btn-sm rounded-pill addbtn" data-toggle="modal" data-target="#modal_keyboard"><i class="icon-plus22"></i></a>
						</div>
						 <i class="icon-menu" title="Main"></i></li>
						<!--<li class="nav-item">
						<a href="/all" class="nav-link" id="dashboard">
						 <i class="icon-home4"></i><span>전체</span></a></li> -->
											
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
							<c:forEach var="c" items="${sider.lista}">
								<li class="nav-item nav-item-submenu">
								<a href="#" class="nav-link" id="${c.cate1_seq}cate1"><span>${c.cate1_name}</span></a>
								
								<c:forEach var="c2" items="${c.list}">
									<ul class="nav nav-group-sub" data-submenu-title="Menu levels">
									<li class="nav-item nav-item-submenu">
									<a href="#" class="nav-link" id="${c2.cate2_seq}cate2">${c2.cate2_name}</a>
									<ul class="nav nav-group-sub">
										<c:forEach var="c3" items="${c2.list}">
											<li class="nav-item"><a href="/rss/${c3.list_seq}" class="nav-link" id="${c3.list_seq}rss"><img class="feed_img" src="https://www.inoreader.com/fetch_icon/search.naver.com?w=32&amp;cs=1296397256&amp;v=1"><span class="rssnametxt2">${c3.rss_name}</span><span class="badge badge-primary align-self-center ml-auto">${c3.ncnt}</span></a></li>
										</c:forEach>
									</ul>	
									</li></ul>
								</c:forEach>
								</li>
								
						</c:forEach>
						
						
							<!-- <li class="nav-item">
								<a href="/" class="nav-link" id="dashboard">
									<i class="icon-home4"></i>
									<span>
										전체
									</span>
								</a>
								
							</li>
							<li class="nav-item">
								<a href="/" class="nav-link" id="dashboard">
									<img  class="feed_img" src="https://www.inoreader.com/fetch_icon/search.naver.com?w=32&amp;cs=1296397256&amp;v=1">
									<span>
										전체
									</span>
								</a>
								
							</li> -->
					</ul>
						
							<ul class="nav nav-sidebar" data-nav-type="accordion">
						<li class="nav-item-header"><div class="text-uppercase font-size-xs line-height-xs">Administrate</div> <i class="icon-menu" title="Main"></i></li>
						<li class="nav-item">
							<a href="/filter" class="nav-link" id="dashboard">
								<i class="icon-home4"></i>
								<span>
									제외어
								</span>
							</a>
						</li>
					<!-- 	<li class="nav-item">
							<a href="#" class="nav-link" id="dashboard">
								<i class="icon-home4"></i>
								<span>
									Media
								</span>
							</a>
						</li> -->
						
					

					</ul>
				</div>
				<!-- /main navigation -->

			</div>
			<!-- /sidebar content -->
			
		</div>
		<!-- /main sidebar -->
		
		<div id="modal_keyboard" class="modal fade" data-keyboard="false" data-backdrop="static" tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header bg-primary text-white">
							<h6 class="modal-title">URL 등록</h6>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<div class="modal-body">
							
							<form action="#" class="modal-body form-inline justify-content-center">
									
									<div class="row" style="width: 100%">
												<div class="col-lg-6">
													<div class="form-group">
													<select id="main_cate_side">
									<option>메인카테고리를 선택해주세요</option>
									<c:forEach var="c" items="${sider.cate1_list_side}">
										<option value="${c.cate1_seq}">${c.cate1_name}</option>
									
									</c:forEach>
														
							</select>
													</div>
												</div>

												<div class="col-lg-6">
													<div class="form-group">
														<select id="sub_cate_side">
															<option>------------------</option>
							</select>
													</div>
												</div>
											</div>
							
							
						
								
								<div class="row" style="width: 100%;margin-top: 20px;">
							
							<input type="text" id="urltxt" placeholder="URL" class="form-control mb-2 mr-sm-2 ml-sm-2 mb-sm-0" style="width: 100%;">
							</div>
						</form>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-link" data-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary" id="url-submit">등록하기</button>
						</div>
					</div>
				</div>
			</div>
			
			
			
			
			
			
			
			
			
			
			
	
		