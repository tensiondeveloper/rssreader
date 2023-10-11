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
	$(".groupinput").keypress(function (e) {
        if (e.which == 13){
                console.log($(this).attr('data-type'))
                var num = $(this).attr('data-type').split('.')[0]
                var type = $(this).attr('data-type').split('.')[1]
                var txt = $(this).val();
                console.log(num)
                console.log(type)
                console.log(txt)
                 $.ajax({
                    type: "POST",
                    data: {
                          "num" : num,
                          "type":type,
                          "txt":txt
                    },
                    url: "update_group",
                    success: function (data) {
                       alert("수정되었습니다.")
                    }
                }); 
        }
        
	})

	$("#groupaddbtn").on('click',function(){
		
			
		
		  $.ajax({
              type: "POST",
              data: {
                    "headname" : $("#addheadname").val(),
                    "name":$("#addname").val(),
                    "imgsrc":$("#addimgsrc").val()
              },
              url: "add_group",
              success: function (data) {
            	  
              }
          }); 
	})
	
	
	$("#submitbtn").on('click',function(){
		$("#writefrm").submit();
	})
	
	$("#testbtn2").on('click',function(){
		$("#frmheadname").val("");
		$("#frmname").val("");
		$("#frmimgsrc").val("");
	})
	
	

})
function update_group2(seq,a){
	
		$(a).parents("td").parents("tr").children("td").eq(0).children("input").val()
		$(a).parents("td").parents("tr").children("td").eq(1).children("input").val()
		$(a).parents("td").parents("tr").children("td").eq(2).children("input").val()
		
		var formData = new FormData();
		formData.append("seq",seq)
		formData.append("headname",$(a).parents("td").parents("tr").children("td").eq(0).children("input").val())
		formData.append("name",$(a).parents("td").parents("tr").children("td").eq(1).children("input").val())
		formData.append("imgsrc",$(a).parents("td").parents("tr").children("td").eq(2).children("input")[0].files[0])
		console.log($(a).parents("td").parents("tr").children("td").eq(2).children("input")[0].files[0])
		console.log(formData)
		
		 $.ajax({
		        type: "POST",
		        enctype: 'multipart/form-data',
		        url: "update_group2",
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
function delete_group2(seq){
	 $.ajax({
         type: "POST",
         data: {
               "seq" : seq
        
         },
         url: "delete_group2",
         success: function (data) {
       	  alert("삭제되었습니다")
       	  
       	location.reload();
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

<div style="    width: 1200px;">
<div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">조직도 (수정후 엔터)</h6>
            </div>
            <div class="card-body">
				<div class="gtop">
    				<div class="groupthird">
	    				<div class="d1"><input type="text" class="form-control groupinput" data-type="1.1" value="${group[0].headname}"></div>
						<div class="d2" style="color:#05366e"><input type="text" class="form-control groupinput" data-type="1.2" value="${group[0].name}"></div>
					</div>
					
					
					<div style="display: table;    width: 100%;    margin: 40px auto 0;    table-layout: fixed;">
					
						<div class="tbcell" style="top: -25px;">
								<div style="margin: 0 auto">
									<div class="d1 reversegray" style="margin-bottom: 10px;">고문</div>
				    				<div class="d1 reversegray" style="width: 50%;float:left;padding:2px"><input type="text" data- class="form-control groupinput" data-type="2.1" value="${group[1].headname}"></div>
				    				<div class="d2" style="width: 50%;float:left;border: 2px solid #333333; "><input type="text" class="form-control groupinput" data-type="2.2" value="${group[1].name}"></div>
									<div class="d2" style="border: 2px solid #333333;">자문위원단</div >
								</div>
						</div>
						<div class="tbcell">
								<div style="margin: 0 auto">
				    				<div class="d1"><input type="text" class="form-control groupinput" data-type="3.1" value="${group[2].headname}"></div>
									<div class="d2" style="color:#05366e"><input type="text" class="form-control groupinput" data-type="3.2" value="${group[2].name}"></div >
								</div>
						</div>
						<div class="tbcell">
								<div style="margin: 0 auto">
				    				<div class="d1 reversegray"><input type="text" class="form-control groupinput" data-type="4.1" value="${group[3].headname}"></div>
									<div class="d2" style="border: 2px solid #333333;"><input type="text" class="form-control groupinput" data-type="4.2" value="${group[3].name}"></div >
								</div>
						</div>
					</div>
 				
	 				<div class="groupthird" style="25px;">
		    				<div class="d1"><input type="text" class="form-control groupinput" data-type="5.1" value="${group[4].headname}"></div>
							<div class="d2" style="color:#05366e"><textarea  class="form-control groupinput" data-type="5.2" >${group[4].name}</textarea></div >
					</div>
 				
 					<div class="groupthird" style="clear: both;float: right;    margin-right: 14px;margin-bottom: 65px;">
		    				<div class="d1 harfd reversegray"><input type="text" class="form-control groupinput" data-type="6.1" value="${group[5].headname}"></div>
		    				<div class="d2 harfd" style=" border: 2px solid #333333;margin-bottom: 1px;"><input type="text" class="form-control groupinput" data-type="6.2" value="${group[5].name}"></div>
							<div class="d1 harfd reversegray"><input type="text" class="form-control groupinput" data-type="7.1" value="${group[6].headname}"></div>
		    				<div class="d2 harfd" style=" border: 2px solid #333333;"><input type="text" class="form-control groupinput" data-type="7.2" value="${group[6].name}"></div>
							<div style="clear: both;"></div>
					</div>
 					<div style="display: table;    width: 100%;    margin: 40px auto 0;    table-layout: fixed;">
						<div class="tbcell">
							<div class="lastgroup">
								<div><input type="text" class="form-control groupinput" data-type="8.1" value="${group[7].headname}"></div>
			    				<div><input type="text" class="form-control groupinput" data-type="8.2" value="${group[7].name}"></div>
								<div><input type="text" class="form-control groupinput" data-type="9.1" value="${group[8].headname}"></div>
			    				<div><input type="text" class="form-control groupinput" data-type="9.2" value="${group[8].name}"></div>
								<div style="clear: both;"></div>
							</div>
							<div class="lastgroup">
								<div><input type="text" class="form-control groupinput" data-type="10.1" value="${group[9].headname}"></div>
			    				<div><input type="text" class="form-control groupinput" data-type="10.2" value="${group[9].name}"></div>
								<div><input type="text" class="form-control groupinput" data-type="11.1" value="${group[10].headname}"></div>
			    				<div><input type="text" class="form-control groupinput" data-type="11.2" value="${group[10].name}"></div>
								<div style="clear: both;"></div>
							</div>
							<div class="lastgroup">
								<div><input type="text" class="form-control groupinput" data-type="12.1" value="${group[11].headname}"></div>
			    				<div><input type="text" class="form-control groupinput" data-type="12.2" value="${group[11].name}"></div>
								<div><input type="text" class="form-control groupinput" data-type="13.1" value="${group[12].headname}"></div>
			    				<div><input type="text" class="form-control groupinput" data-type="13.2" value="${group[12].name}"></div>
								<div style="clear: both;"></div>
							</div>
							<div class="lastgroup">
								<div><input type="text" class="form-control groupinput" data-type="14.1" value="${group[13].headname}"></div>
			    				<div><input type="text" class="form-control groupinput" data-type="14.2" value="${group[13].name}"></div>
								<div><input type="text" class="form-control groupinput" data-type="15.1" value="${group[14].headname}"></div>
			    				<div><input type="text" class="form-control groupinput" data-type="15.2" value="${group[14].name}"></div>
								<div style="clear: both;"></div>
							</div>
							<div class="lastgroup">
								<div><input type="text" class="form-control groupinput" data-type="16.1" value="${group[15].headname}"></div>
			    				<div><input type="text" class="form-control groupinput" data-type="16.2" value="${group[15].name}"></div>
								<div><input type="text" class="form-control groupinput" data-type="17.1" value="${group[16].headname}"></div>
			    				<div><input type="text" class="form-control groupinput" data-type="17.2" value="${group[16].name}"></div>
								<div style="clear: both;"></div>
							</div>
							<div class="lastgroup">
								<div><input type="text" class="form-control groupinput" data-type="18.1" value="${group[17].headname}"></div>
			    				<div><input type="text" class="form-control groupinput" data-type="18.2" value="${group[17].name}"></div>
								<div><input type="text" class="form-control groupinput" data-type="19.1" value="${group[18].headname}"></div>
			    				<div><input type="text" class="form-control groupinput" data-type="19.2" value="${group[18].name}"></div>
								<div style="clear: both;"></div>
							</div>
						</div>
						<div class="tbcell">
							<div class="lastgroup">
								<div><input type="text" class="form-control groupinput" data-type="20.1" value="${group[19].headname}"></div>
			    				<div><input type="text" class="form-control groupinput" data-type="20.2" value="${group[19].name}"></div>
								<div><input type="text" class="form-control groupinput" data-type="21.1" value="${group[20].headname}"></div>
			    				<div><input type="text" class="form-control groupinput" data-type="21.2" value="${group[20].name}"></div>
								<div style="clear: both;"></div>
							</div>
							<div class="lastgroup">
								<div><input type="text" class="form-control groupinput" data-type="22.1" value="${group[21].headname}"></div>
			    				<div><input type="text" class="form-control groupinput" data-type="22.2" value="${group[21].name}"></div>
								<div><input type="text" class="form-control groupinput" data-type="23.1" value="${group[22].headname}"></div>
			    				<div><input type="text" class="form-control groupinput" data-type="23.2" value="${group[22].name}"></div>
								<div style="clear: both;"></div>
							</div>
							<div class="lastgroup">
								<div><input type="text" class="form-control groupinput" data-type="24.1" value="${group[23].headname}"></div>
			    				<div><input type="text" class="form-control groupinput" data-type="24.2" value="${group[23].name}"></div>
								<div><input type="text" class="form-control groupinput" data-type="25.1" value="${group[24].headname}"></div>
			    				<div><input type="text" class="form-control groupinput" data-type="25.2" value="${group[24].name}"></div>
								<div style="clear: both;"></div>
							</div>
							<div class="lastgroup">
								<div><input type="text" class="form-control groupinput" data-type="26.1" value="${group[25].headname}"></div>
			    				<div><input type="text" class="form-control groupinput" data-type="26.2" value="${group[25].name}"></div>
								<div><input type="text" class="form-control groupinput" data-type="27.1" value="${group[26].headname}"></div>
			    				<div><input type="text" class="form-control groupinput" data-type="27.2" value="${group[26].name}"></div>
								<div style="clear: both;"></div>
							</div>
							<div class="lastgroup">
								<div><input type="text" class="form-control groupinput" data-type="28.1" value="${group[27].headname}"></div>
			    				<div><input type="text" class="form-control groupinput" data-type="28.2" value="${group[27].name}"></div>
								<div><input type="text" class="form-control groupinput" data-type="29.1" value="${group[28].headname}"></div>
			    				<div><input type="text" class="form-control groupinput" data-type="29.2" value="${group[28].name}"></div>
								<div style="clear: both;"></div>
							</div>
							<div class="lastgroup">
								<div><input type="text" class="form-control groupinput" data-type="30.1" value="${group[29].headname}"></div>
			    				<div><input type="text" class="form-control groupinput" data-type="30.2" value="${group[29].name}"></div>
								<div><input type="text" class="form-control groupinput" data-type="31.1" value="${group[30].headname}"></div>
			    				<div><input type="text" class="form-control groupinput" data-type="31.2" value="${group[30].name}"></div>
								<div style="clear: both;"></div>
							</div>
						</div>
						<div class="tbcell" style="vertical-align: top;">
							<div class="lastgroup">
								<div><input type="text" class="form-control groupinput" data-type="32.1" value="${group[31].headname}"></div>
			    				<div><input type="text" class="form-control groupinput" data-type="32.2" value="${group[31].name}"></div>
								<div><input type="text" class="form-control groupinput" data-type="33.1" value="${group[32].headname}"></div>
			    				<div><input type="text" class="form-control groupinput" data-type="33.2" value="${group[32].name}"></div>
								<div style="clear: both;"></div>
							</div>
							<div class="lastgroup">
								<div><input type="text" class="form-control groupinput" data-type="34.1" value="${group[33].headname}"></div>
			    				<div><input type="text" class="form-control groupinput" data-type="34.2" value="${group[33].name}"></div>
								<div><input type="text" class="form-control groupinput" data-type="35.1" value="${group[34].headname}"></div>
			    				<div><input type="text" class="form-control groupinput" data-type="35.2" value="${group[34].name}"></div>
								<div style="clear: both;"></div>
							</div>
							<div class="lastgroup">
								<div><input type="text" class="form-control groupinput" data-type="36.1" value="${group[35].headname}"></div>
			    				<div><input type="text" class="form-control groupinput" data-type="36.2" value="${group[35].name}"></div>
								<div><input type="text" class="form-control groupinput" data-type="37.1" value="${group[36].headname}"></div>
			    				<div><input type="text" class="form-control groupinput" data-type="37.2" value="${group[36].name}"></div>
								<div style="clear: both;"></div>
							</div>
							<div class="lastgroup">
								<div><input type="text" class="form-control groupinput" data-type="38.1" value="${group[37].headname}"></div>
			    				<div><input type="text" class="form-control groupinput" data-type="38.2" value="${group[37].name}"></div>
								<div><input type="text" class="form-control groupinput" data-type="39.1" value="${group[38].headname}"></div>
			    				<div><input type="text" class="form-control groupinput" data-type="39.2" value="${group[38].name}"></div>
								<div style="clear: both;"></div>
							</div>
							<div class="lastgroup">
								<div><input type="text" class="form-control groupinput" data-type="40.1" value="${group[39].headname}"></div>
			    				<div><input type="text" class="form-control groupinput" data-type="40.2" value="${group[39].name}"></div>
								<div><input type="text" class="form-control groupinput" data-type="41.1" value="${group[40].headname}"></div>
			    				<div><input type="text" class="form-control groupinput" data-type="41.2" value="${group[40].name}"></div>
								<div style="clear: both;"></div>
							</div>
						
						</div>
					</div>
 				</div>
              
            </div>
</div>

</div>


			<div
				class="main col-md-9 col-mg-3 col-md-push-3"
				style="position: relative;">
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
		<div style="margin-bottom: 40px;    margin-top: 70px;">		
		
	<%-- 	<c:set var="i" value="0" /> 
		<c:set var="j" value="3" />
		  <c:forEach items="${group2 }" var="list"> 
		  <c:if test="${i%j == 0 }"> 
		 	<div class="groupdiv">
		  </c:if> 
		 	<div>
				<div>
					<img src="/resources/img/${list.imgsrc}" style="padding: 15px;    width: 100%;">
					<h4>${list.headname}</h4>
					<h5>${list.name}</h5>
				
				</div>
			</div>
		  <c:if test="${i%j == j-1 }"> 
		</div>
		  </c:if>
		   <c:set var="i" value="${i+1 }" />
		    </c:forEach>  --%>
		    <button class="btn btn-facebook btn-block" id="testbtn2" type="button"data-toggle="modal" data-target="#exampleModal">추가하기</button>
		    <table class="table">
		    	<tr>
		    		<th>직책</th>
		    		<th>이름</th>
		    		<th>이미지</th>
		    		<th>수정</th>
		    		<th>삭제</th>
				</tr>
		    
		    		  <c:forEach items="${group2 }" var="list"> 
		    	<tr>
		    		  	<td><input type="text" value="${list.headname}"></td>
		    		  	<td><input type="text" value="${list.name}"></td>
		    		  	<td><img src="/groupimg/${list.imgsrc} " style="width: 200px;"><input type="file"></td>
		    		  	<td><button class="testbtn" onclick="update_group2('${list.seq}',this)" >수정</button></td>
		    		  	<td><button onclick="delete_group2('${list.seq}')">삭제</button></td>
		    	</tr>
		    		  </c:forEach>
		    
		    
		    
		    </table>
		    


				
				<div style="clear: both;"></div> 
			</div>
				
				<div class="separator-2"
					style="margin-top: 0px; color: #05366e; margin-bottom: 0px;"></div>


			</div>
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">조직 추가</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="add_group?${_csrf.parameterName}=${_csrf.token}"  enctype="multipart/form-data" method="post" id="writefrm"><br>
			  <div>
	        <label>직책</label>
	        <input type="text" class="form-control" name="headname" id="frmheadname">
        </div>
        <div>
	        <label>이름</label>
	        <input type="text" class="form-control" name="name" id="frmname">
        </div>
        <div>
	        <label>이미지</label>
	        <input type="file" class="form-control" name="imgsrc" id="frmimgsrc">
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
