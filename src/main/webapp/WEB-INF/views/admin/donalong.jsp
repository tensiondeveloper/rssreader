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
				
				
				<div class="gtop">
    				
 				</div>
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
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
		    
		    <table class="table">
		    	<tr>
		    		<th>직책1</th>
		    		<th>이름</th>
		    		<th>이미지</th>
		    		<th>수정</th>
		    		<th>삭제</th>
				</tr>
		    
		    		  <c:forEach items="${group2 }" var="list"> 
		    	<tr>
		    		  	<td>${list.headname}</td>
		    		  	<td>${list.name}</td>
		    		  	<td>${list.imgsrc}</td>
		    		  	<td><button>수정</button></td>
		    		  	<td><button>삭제</button></td>
		    	
		    		  
		    		  
		    		  
		    	
		    	
		    	</tr>
		    		  </c:forEach>
		    
		    
		    
		    </table>
		    


				
				<div style="clear: both;"></div> 
			</div>
				
				<div class="separator-2"
					style="margin-top: 0px; color: #05366e; margin-bottom: 0px;"></div>


			</div>
