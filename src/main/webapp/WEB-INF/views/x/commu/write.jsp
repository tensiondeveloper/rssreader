<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script type="text/javascript">
$(function() {
	
	
	var type = '${board}';
	if(type.indexOf('unit') >= 0){
		$("#unitactiveli").addClass("active");
	}else{
		$("#${board}li").addClass("active");
	}
})


</script>
<script type="text/javascript">


$(document).ready(function() {
	$("#submitbtn").on('click',function(){
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); 
		if(	$("input[name=title]").val() == ''){
			alert("제목을 입력하세요")
			return;
		}
		if($("#ir1").val() == '<p>&nbsp;</p>'){
			alert("내용을 입력하세요")
			return;
		
		}
		 $("#writefrm").submit(); 
		
		
	})
	
	/* 
	
	$('#summernote').summernote({
		  height: 300,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다'	
		  callbacks: {	//여기 부분이 이미지를 첨부하는 부분
				onImageUpload : function(files) {
					uploadSummernoteImageFile(files[0],this);
				}
			}
	});
	function uploadSummernoteImageFile(file, editor) {
		data = new FormData();
		data.append("file", file);

		$.ajax({
			data : data,
			type : "POST",
			url : "/file/imageup",
			contentType : false,
			processData : false,
			success : function(data) {

				$(editor).summernote('insertImage', data.url);
			}
		});
	} */
}); 
</script>







<style>




</style>






<div class="main col-md-9 col-mg-3 col-md-push-3"
	style="position: relative;">

	<!-- page-title start -->
	<!-- ================ -->
	<ol class="breadcrumb">
		<li><i class="fa fa-home pr-10"></i><a href="index.html">Home</a></li>

		<li class="active active ftbold">글쓰기</li>
	</ol>

	<h2 class="page-title">글쓰기</h2>
	<div class="separator-2 clear"></div>
	<form action="write_submit?${_csrf.parameterName}=${_csrf.token}"  enctype="multipart/form-data" method="post" id="writefrm">
		<input type="text" class="form-control" placeholder="제목" name="title" style="margin-bottom: 10px;">
		<input type="hidden" name="board" value="${board}">
	<textarea rows="" cols="" id="ir1" style="width: 100%;display: none;min-width:260px; " name="content"></textarea>
<!-- 	 <textarea id="summernote" name="content" style="display: none"></textarea>  -->











		<div>
			<input type="file"name ="file" style="margin-top: 10px;">
		</div>
		<a id="submitbtn" class="btn btn-dark" style="float: right">등록</a>
	</form>
</div>

<script type="text/javascript" src="/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "ir1", 
          sSkinURI: "/resources/editor/SmartEditor2Skin.html",  
         
          htParams : {
              bUseToolbar : true,             
              bUseVerticalResizer : true,     
              bUseModeChanger : true,         
              fOnBeforeUnload : function(){
                   
              }
          }, 
          fOnAppLoad : function(){
              oEditors.getById["ir1"].exec("PASTE_HTML", [""]);
          },
          fCreator: "createSEditor2"
      });

});
</script>

