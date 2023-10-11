<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<style type="text/css">
.card-body div div{

	float: left;
	margin-right :20px;
}
.card-body div{
margin-bottom: 10px;
}
.form-control{

width: 450px;
}
</style>   
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script>
$(document).ready(function() {
 
 	$("#updatesiteinfo").on('click',function(){
	
 		$.ajax({
			type : "POST",
			data : {
				"addr"		:  $("#addr").val(),
				"latitude"		: 	 $("#latitude").val()	,
				"longitude"		: 	 $("#longitude").val()	,
				"email"		: 	 $("#email").val()	,
				"number"		: 	 $("#number").val()	,
				"admin1_name"		: 	 $("#admin1_name").val()	,
				"admin1_phone"		: 	 $("#admin1_phone").val(),	
				"admin1_email"		: 	 $("#admin1_email").val()	,
				"admin2_name"		: 	 $("#admin2_name").val()	,
				"admin2_phone"		: 	 $("#admin2_phone").val()	,
				"admin2_email"		: 	 $("#admin2_email").val()	
			},
			url : "/admint/updateinfo",
			success : function(data) {
				alert("수정되었습니다")
			}
 		})
 		
 		
 		
	 
	})
 
 
 
})
 
 </script>  
   
        <div class="container-fluid">

          <!-- <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">기본정보</h1>
   
          </div> -->
<!--  기본정보에 들어가야할 정보
주소 
사무실
 전화번호 
 -->
        
          <div class="row">

          <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">기본정보</h6>
                  <div class="dropdown no-arrow">
                 
                    <div class="dropdown-menu-right" >
                   		<button class="btn" id="updatesiteinfo">수정</button>
                    </div>
                  </div>
                </div>
	                <div class="card-body">
	                	<div>
			                <div>
			                  <label>주소</label>
			                  <input type="text" class="form-control" id="addr" value="${info.addr}"/>
			                </div>
			                <div>
			                  <label>위도</label>
			                  <input type="text" class="form-control" id="latitude" value="${info.map_latitude}"/>
			                </div>
			                <div>
			                  <label>경도</label>
			                  <input type="text" class="form-control" id="longitude" value="${info.map_longitude}"/>
		                    </div>
	                    </div>
		                    <div style="clear: both;"></div>
	                    <div>
		                    <div>
			                  <label>이메일</label>
			                  <input type="text" class="form-control" id="email" value="${info.email}" />
		                    </div>
		                    <div>
			                  <label>사무실 전화번호</label>
			                  <input type="text" class="form-control" id="number" value="${info.office_number}"/>
		                    </div>
	                    </div>
		                     <div style="clear: both;"></div>
	                    <div>
		                    <div>
			                  <label>관리자1 정보</label>
			                  <input type="text" class="form-control" id="admin1_name" value="${info.admin1_name}"/>
		                    </div>
		                    <div>
			                  <label>관리자1 전화번호</label>
			                  <input type="text" class="form-control" id="admin1_phone" value="${info.admin1_phone}"/>
		                    </div>
		                    <div>
			                  <label>관리자1 이메일</label>
			                  <input type="text" class="form-control" id="admin1_email" value="${info.admin1_email}"/>
		                    </div>
	                    </div>
		                     <div style="clear: both;"></div>
	                    <div>
		                    <div>
			                  <label>관리자2 정보</label>
			                  <input type="text" class="form-control" id="admin2_name" value="${info.admin2_name}"/>
		                    </div>
		                    <div>
			                  <label>관리자2 전화번호</label>
			                  <input type="text" class="form-control" id="admin2_phone" value="${info.admin2_phone}"/>
		                    </div>
		                    <div>
			                  <label>관리자2 이메일</label>
			                  <input type="text" class="form-control" id="admin2_email" value="${info.admin2_email}"/>
		                    </div>
	                    </div>
		                     <div style="clear: both;"></div>
                </div>
             </div>
          </div>

        </div>
