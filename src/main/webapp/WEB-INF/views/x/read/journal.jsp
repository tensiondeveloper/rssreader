<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %> 
<script type="text/javascript">
function deljournal(seq){
	
	if (confirm("정말 삭제하시겠습니까??") == true){    //확인
		$.ajax({
			url: '/read/journal_delete',
			type:'POST',
			dataType: 'json',
			data:{
				 "seq" : seq
			},
			success:function(data){
				alert("삭제되었습니다")
			}
		})
		
	   

	}else{   //취소

	    return;

	}
	
	
	
}
$(function(){
$( '.nav-stacked > li:nth-child(4)' ).addClass("active")
})
</script>
<style type="text/css">

.unive-txt{
word-break: keep-all;

}
.univetxt-sub{
	font-size: 16px;
    font-weight: 600;
    margin-top: 30px;
    margin-bottom: 5px;
}
.journal{
	padding-right: 10px;
	padding-left:10px;
	cursor: pointer;
}
</style>


			<!-- main start -->
			<!-- ================ -->
			<div
				class="main col-md-8 col-lg-offset-1 col-md-push-4 col-lg-push-2"
				style="position: relative;">

				<!-- page-title start -->
				<!-- ================ -->
				<div>
					<ol class="breadcrumb">
						<li><i class="fa fa-home pr-10"></i><a href="index.html">Home</a></li>
						<li class="active">읽을 거리</li>
						<li class="active active ftbold">MBA 저널</li>
					</ol>

					<h2 class="page-title">MBA 저널</h2>
				</div>
				<div class="separator-2 clear"></div>
				<!-- page-title end -->
				<div class="unive-txt">
					<div style="width: 100%">
					<!-- <iframe src="/readjournal?no=7a72c17c-dfdf-409c-bf6c-0fa2b6960e53.pdf" style="width: 100%"></iframe> -->
									
					
						<c:forEach var="a" items="${journal_list}" varStatus="status">	
						<div class="col-sm-6 col-md-3 journal" style="position: relative;">
					
							
							<sec:authentication property="name" var="secName"/>
 
							<sec:authorize access="${secName==a.id}">
								<span style="    position: absolute;    top: 7px;    right: 20px;" title="삭제하기" onclick="deljournal('${a.journal_seq}');"><i class="far fa-trash-alt"></i></span>
								<span style="    position: absolute;    top: 7px;    right: 37px;" title="수정하기"><a href="/read/journal_modify?seq=${a.journal_seq }"><i class="fas fa-pencil-alt"></i></a></span>
							</sec:authorize>
							
							<a href="/readjournal?no=${a.journal_file}" target="_black"><img src="/journalresources/${a.journal_subimg}"></a>
							<div class="body mb-20 mt-10">
							<span style="font-size: 17px;font-weight: bold;">${a.journal_title}</span>
							</div>
							</div>
							
							
						</c:forEach>
						<!-- <div class="col-sm-6 col-md-3 journal" ><img src="/resources/file/po.png"></div>
						<div class="col-sm-6 col-md-3 journal"><img src="/resources/file/po.png"></div>
						<div class="col-sm-6 col-md-3 journal"><img src="/resources/file/po.png"></div> -->
					</div>
					
					
					
					
					
					
					<div style="clear: both;"></div>
					<div style="text-align: right;">
					<a href="journal_add" type="submit"
				class="btn btn-dark" style="margin-right: 10px;">등록</a> 
					</div>
					
				</div>


			


			</div>
			<!-- main end -->
			<!-- sidebar start -->
			<!-- ================ -->
		





























