<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script type="text/javascript">
	
</script>

<script type="text/javascript">
	/* ?${_csrf.parameterName}=${_csrf.token} 나중에 붙여볼것*/
	/* $(function(){
	 CKEDITOR.replace( 'p_content', {//해당 이름으로 된 textarea에 에디터를 적용
	 width:'100%',
	 height:'400px',
	 filebrowserUploadUrl      : '/upld/uploadFile?type=Files',
	 filebrowserImageUploadUrl : '/upld/uploadFile?type=Images',
	 });
	
	
	 CKEDITOR.on('dialogDefinition', function( ev ){
	 var dialogName = ev.data.name;
	 var dialogDefinition = ev.data.definition;
	
	 switch (dialogName) {
	 case 'image': //Image Properties dialog
	 console.log("1")
	 //dialogDefinition.removeContents('info');
	 dialogDefinition.removeContents('Link');
	 dialogDefinition.removeContents('advanced');
	 break;
	 }
	 });  
	
	 }); */

	$(document).ready(function() {
		/* $("#submitbtn").on('click', function() {
			if ($("input[name=title]").val() == '') {
				alert("제목을 입력하세요")
				return;
			}
			if ($("input[name=content]").val() == '') {
				alert("제목을 입력하세요")
				return;
			}

			$("#writefrm").submit();

		})
 */
		
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
		//여기 아래 부분
		
		
	});
</script>













<!-- main start -->
<!-- ================ -->
<div class="main col-md-12" style="position: relative;">

	<!-- page-title start -->
	<!-- page-title start -->
	<!-- ================ -->
	<ol class="breadcrumb">
		<li><i class="fa fa-home pr-10"></i><a href="index.html">Home</a></li>

		<li class="active active ftbold">문의·요청하기</li>
	</ol>

	<h2 class="page-title">문의·요청하기</h2>
	<div class="separator-2 clear"></div>
	<form action="contactwrite_submit?${_csrf.parameterName}=${_csrf.token}"
		enctype="multipart/form-data" method="post" id="writefrm">
		<input type="text" class="form-control" placeholder="제목" name="title"
			style="margin-bottom: 10px;"> <input type="hidden"
			name="board" value="${board}">
					<textarea rows="" cols="" id="ir1" style="width: 100%;display: none;min-width:260px; " name="content"></textarea>
<!-- 		<textarea id="summernote" name="content" style="display: none"></textarea> -->
		<!-- <div>
			<input type="file" name="file" style="margin-top: 10px;">
		</div> -->
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




