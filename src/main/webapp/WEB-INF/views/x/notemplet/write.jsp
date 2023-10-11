<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

   <script src="/resources/ckeditor/ckeditor.js"></script>
			<!-- main start -->
			<!-- ================ -->
			<div
				class="main col-md-12"
				style="position: relative;">

				<!-- page-title start -->
				<!-- ================ -->
				<ol class="breadcrumb">
					<li><i class="fa fa-home pr-10"></i><a href="index.html">Home</a></li>
					
					<li class="active active ftbold">글쓰기</li>
				</ol>

				<h2 class="page-title">글쓰기</h2>
				<div class="separator-2 clear"></div>
		
			<input type="text" class="form-control">
		 	 <textarea class="form-control" id="p_content"></textarea>

				
			</div>
			




    <script type="text/javascript">
    CKEDITOR.replace('p_content'
            , {height: 500                                                  
             });


    </script>
















