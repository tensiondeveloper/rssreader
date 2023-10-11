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
	$("#datatable").DataTable({
		
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
	});
	
	$("#submitbtn").on('click',function(){
		$("#writefrm").submit();
	})
	
	
	
	
	
	
	
	
	
	
	
	
	
	
} );


function update_donack(seq,a){
	
	
	var formData = new FormData();
	formData.append("seq",seq)
	formData.append("name",$(a).parents("td").parents("tr").children("td").eq(0).children("input").val())
	formData.append("company",$(a).parents("td").parents("tr").children("td").eq(1).children("input").val())
	formData.append("class",$(a).parents("td").parents("tr").children("td").eq(2).children("input").val())
	formData.append("pay",$(a).parents("td").parents("tr").children("td").eq(3).children("input").val())
	formData.append("date",$(a).parents("td").parents("tr").children("td").eq(4).children("input").val())
	formData.append("img",$(a).parents("td").parents("tr").children("td").eq(5).children("input")[0].files[0])
	
	 $.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: "update_dona",
	        data:formData,
	        processData: false,
	        contentType: false,
	        cache: false,
	        timeout: 600000,
	        success: function (data) {
	            alert("수정되었습니다")
	            location.reload();
	        },
	        error: function (e) {
	            console.log("ERROR : ", e);
	        }
});
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
    				
    				<table id="datatable" >
    <thead>
        <tr>
            <th>이름</th>
            <th>소속</th>
            <th>계급</th>
            <th>금액</th>
            <th>날짜</th>
            <th>이미지</th>
            <th>수정</th>
            <th>삭제</th>
        </tr>
    </thead>
    <tbody>
       	  <c:forEach items="${list}" var="list"> 
		    	<tr>
		    		  	<td><input type="text" value="${list.donation_name}"></td>
		    		  	<td><input type="text" value="${list.donation_company}"></td>
		    		  	<td><input type="text" value="${list.donation_class}"></td>
		    		  	<td><input type="text" value="${list.donation_pay}"></td>
		    		  	<td><input type="text" value="${list.donation_date}"></td>
		    		  	<td><img src="/groupimg/${list.donation_img} " style="width: 200px;"><input type="file" value="${list.donation_img}"></td>
		    		  	<td><button class="btn btn-facebook btn-block" onclick="update_donack('${list.donation_seq}',this)" type="button">수정</button></td>
		    		  	<td><button onclick="delete_dona('${list.donation_seq}')">삭제</button></td>
		    	</tr>
   		  </c:forEach>
   		  
   		  
   		  <%-- <c:forEach items="${group2 }" var="list"> 
		    	<tr>
		    		  	<td><input type="text" value="${list.headname}"></td>
		    		  	<td><input type="text" value="${list.name}"></td>
		    		  	<td><img src="/groupimg/${list.imgsrc} " style="width: 200px;"><input type="file"></td>
		    		  	<td><button class="testbtn" onclick="update_group2('${list.seq}',this)" >수정</button></td>
		    		  	<td><button onclick="delete_group2('${list.seq}')">삭제</button></td>
		    	</tr>
   		  </c:forEach> --%>
   		  
   		  
   		  
   		  
    </tbody>
</table>
    				
    				
    				
    				
		    	
    				
    				
    				
    				
    				</div>
    				
    		</div>		
    				
				
			</div>

			
			
						
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">기부자 수정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="donation_update?${_csrf.parameterName}=${_csrf.token}"  enctype="multipart/form-data" method="post" id="writefrm"><br>
        <input type="hidden" class="form-control" name="seq" id="seq">
    	<div>
	        <label>이름</label>
	        <input type="text" class="form-control" name="name" id="name">
        </div>
        <div>
	        <label>소속</label>
	        <input type="text" class="form-control" name="company" id="company">
        </div>
        <div>
	        <label>계급</label>
	        <input type="text" class="form-control" name="mclass" id="mclass">
        </div>
        <div>
	        <label>금액</label>
	        <input type="text" class="form-control" name="pay" id="pay">
        </div>
        <div>
	        <label>날짜</label>
	        <input type="text" class="form-control" name="date" id="date">
        </div>
        <div>
	        <label>이미지</label>
	        <input type="file" class="form-control" name="img" id="img">
        </div>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <a id="submitbtn" class="btn btn-primary" style="float: right">등록</a>
      </div>
    </div>
  </div>
</div>