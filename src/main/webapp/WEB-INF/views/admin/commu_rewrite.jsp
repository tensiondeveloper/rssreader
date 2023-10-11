<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">


</script>
<div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">글 수정</h6>
            </div>
            <div class="card-body">
            
				<form action="commu_rewrite_submit?${_csrf.parameterName}=${_csrf.token}"  enctype="multipart/form-data" method="post" id="writefrm">
					<input type="text" class="form-control" placeholder="제목" name="title" style="margin-bottom: 10px;" value="${reboard.board_title}">
					<input type="hidden" name="board" value="${reboard.board_type}">
					<input type="hidden" name="seq" value="${reboard.board_seq}">
					<input type="hidden" name="filename" id="filenameori"value="${reboard.board_filename}">
				<!--  <textarea id="summernote" name="content" style="display: none;"></textarea>  -->
					<textarea rows="" cols="" id="ir1" style="width: 100%;display: none" name="content">${reboard.board_content}</textarea>
				
					<div>
						<span>${reboard.board_filename}</span>
						<input type="file" id="board_file" name ="file" style="margin-top: 10px;">
					</div>
					<button id="submitbtn" class="btn btn-dark" style="float: right">등록</button>
				</form>
		</div>
		</div>


<script type="text/javascript" src="/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "ir1", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "/resources/editor/SmartEditor2Skin.html",  
          htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,             
              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : true,     
              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : true,         
              fOnBeforeUnload : function(){
                   
              }
          }, 
          fOnAppLoad : function(){
              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
           
             
             /*  oEditors.getById["ir1"].exec("PASTE_HTML", []); */
          },
          fCreator: "createSEditor2"
      });
});
 
 

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
	//여기 아래 부분
	$("#board_file").on('change',function(){
		var fileValue = $("#board_file").val().split("\\");
		var fileName = fileValue[fileValue.length-1];

		$("#filenameori").val(fileName);
	})	
	
}); 
</script>














