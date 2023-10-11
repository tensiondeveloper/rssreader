<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    


<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/mba/group.css">



<script type="text/javascript">
$(function(){
$( '.nav-stacked > li:nth-child(4)' ).addClass("active")

	
	



})

$(document).ready( function () {
	/* $("#datatable").DataTable({
		
		 language: {
		        paginate: {
		            previous: '‹',
		            next:     '›'
		        },
		        aria: {
		            paginate: {
		                previous: '이전',
		                next:     '다음'
		            }
		        }
	    },
		// 표시 건수기능 숨기기
		lengthChange: false,
		// 검색 기능 숨기기
		searching: false,
		// 정렬 기능 숨기기
		ordering: false,
		// 정보 표시 숨기기
		info: false,
		// 페이징 기능 숨기기
		paging: true
	}); */
} );


function donation_add(){
	
/* 	$("#name").val();
	$("#company").val();
	$("#class").val();
	$("#pay").val();
	$("#donadate").val();
	$("#img").val(); */
	$("#writefrm").submit();
	
	
}
</script>
<style type="text/css">
.groupdiv{
	margin-right: -6px;
    margin-left: -6px;
    margin-bottom: 20px;

}
.groupdiv > div{
    padding-left: 5px;
    padding-right: 5px;
        margin-bottom: 10px;
width: 25%;
float: left;
}
.groupdiv > div > div{
  color :#05366e;
  text-align: center;
   /*  background-color: gray; */
   border:2px solid #05366e;
width: 100%;

}
.gtop input{
    width: 63%;
    margin: 0 auto;

}










</style>

			<div
				class="main col-md-9 col-mg-3 col-md-push-3"
				style="position: relative;">
				
			<div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">기부자 등록하기</h6>
                </div>
	                <div class="card-body">
	                	<form action="donation_add?${_csrf.parameterName}=${_csrf.token}"  enctype="multipart/form-data" method="post" id="writefrm"><br>
	                	<div>
			                <div>
			                  <label>성명</label>
			                  <input type="text" class="form-control" id="name"name="name"/>
			                </div>
			                <div>
			                  <label>소속</label>
			                  <input type="text" class="form-control" id="company"name="company"/>
			                </div>
			                <div>
			                  <label>직급</label>
			                  <input type="text" class="form-control" id="mclass" name="mclass"/>
		                    </div>
	                    </div>
		                    <div style="clear: both;"></div>
	                    <div>
		                    <div>
			                  <label>기부금 액수</label>
			                  <input type="text" class="form-control" id="pay"name="pay"/>
		                    </div>
		                    <div>
			                  <label>날짜</label>
			                  <input type="text" class="form-control" id="donadate"name="donadate"/>
		                    </div>
	                    </div>
		                     <div style="clear: both;"></div>
	                    <div>
		                    <div>
			                  <label>이미지</label>
			                  <input type="file" class="form-control" id="img"name="img"/>
		                    </div>
	                    </div>
		                     <div style="clear: both;"></div>
		             </form>        	
		                     <div style="text-align: center;margin-top: 20px;">
								<button onclick="donation_add();">등록</button>
							</div>
							
                </div>
             </div>
    	
		    	
    				
    				
    				
    				
    				
    				
    				
    				
				
			</div>
