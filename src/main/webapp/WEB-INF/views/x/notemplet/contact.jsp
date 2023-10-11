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


$(document).ready(function(){
	


var totalpage = '${totalpage}';
var nowpage = '${nowpage}';

var rowpage = 10;


var htmltemp = "";
var start;
var end;


if(totalpage>0)
{
	if(nowpage >= 1)
	{
		var page = nowpage - 1;
		
		htmltemp += "<li><a href=\"javascript:goList('"+page+"')\" aria-label='Previous'><i class='fa fa-caret-left' style='    line-height: 39px;'></i></a></li>";
	}
	// 페이지 바로가기 링크
	var buttons = 10;	//페이지 바로가기 링크의 수
	var half_buttons = Math.ceil(buttons / 2);
	var last_page = Math.ceil(totalpage / rowpage);
	console.log(last_page)
	if(last_page < buttons)
	{
		start = 0;
		end = last_page;
	}
	else
	{
		if(nowpage <= half_buttons)
		{
			start = 0;
			end = 10;
		}
		else if(nowpage > last_page - half_buttons)
		{
			start = last_page - buttons + 1;
		 	end = last_page;
		}
		else
		{
			start = nowpage - half_buttons;
			end = nowpage + half_buttons;
		}
	}
	var k;
	for(var i = start; i < end; i++)
	{
        k = i+1;
		if(i == nowpage)
		{
			if(i==1)
			{

				htmltemp += " <li class='active'><a>"+k+"</a></li>";
			}
			else
			{
				htmltemp += " <li class='active'><a>"+k+"</a></li>";
			}
		}
		else
		{
			if(i==1)
			{
				htmltemp +=  " <li><a href=\"javascript:goList('"+i+"')\">";
				htmltemp +=  k+"</a></li>";
			}
			else
			{
				htmltemp +=  " <li><a href=\"javascript:goList('"+i+"')\">";
				htmltemp +=   k+"</a></li>";
			}
		}
	}
    if (start >= 1 && end == 1) {
    	htmltemp += "<li class='active'><a>1</a></li>";
    }

    if (start == 0 && end == 0) {
    	htmltemp += "<li class='active'><a>1</a></li>";
    }

	//다음 페이지 버튼
    last_page = last_page - 1;
    if(nowpage < last_page)
	{
		page = nowpage + 1;
		/* htmltemp +=  " <a href=\"javascript:goList('"+page+"')\" class=\"direction next\"><span>&nbsp;</span></a>"; */
		htmltemp +=  " 	<li><a href=\"javascript:goList('"+page+"')\" aria-label='Next'><i class='fa fa-caret-right' style='    line-height: 39px;'></i></a></li>";
	}
    //echo " <a href=\"javascript:goList('{$last_page}')\" class=\"direction next\">NEXT<span></span><span></span></a> ";
}
else
{
 /*   
 	htmltemp +=  "<a href=\"javascript:goList('0')\" class=\"direction prev\"><span>&nbsp;</span></a>";
    htmltemp +=  "<li class='active'>1</li>";
    htmltemp +=  " <a href=\"javascript:goList('0')\" class=\"direction next\"><span>&nbsp;</span></a>"; 
    */
    htmltemp +=  "<li><a href=\"javascript:goList('0')\" aria-label='Previous'><i class='fa fa-caret-left' style='    line-height: 39px;'></i></a></li>";
    htmltemp +=  "<li class='active'><a>1</a></li>";
    htmltemp +=  "<li><a href=\"javascript:goList('0')\" aria-label='Next'><i class='fa fa-caret-right' style='    line-height: 39px;'></i></a></li>";
}

console.log("설정")
console.log(htmltemp)
$("#pagenavi").append(htmltemp);




})


function searchfn(){
	
	location.href = "notice?page=0&search="+$("#search").val()+"&keyword="+$("#keyword").val();
	
}



function goList(page)
{
	location.href = "notice?page="+page+"&search="+'${search}'+"&keyword="+'${keyword}';
}


</script>
<style type="text/css">


.pagination > li > a {
    border-top-left-radius: 0px !important;
    border-bottom-left-radius: 0px !important;
    border-top-right-radius: 0px !important;
    border-bottom-right-radius: 0px !important;
}
.table > thead > tr > th{
    border: 0px;
    border-top: 2px solid black !important;
    background-color: white;
    text-align: center;
    border-bottom: 1px solid black;

}
.table > tbody > tr > td{
	text-align: center;
	    border-bottom: 1px solid black;
	        font-weight: 100;

}
.table{

margin-bottom: 0px;
font-size: 12pt;
}
.thide{

	display: table-cell;
}
.tm{
	width: auto;
}
@media (max-width: 992px){
.thide{

	display: none;
}
.tm1{
	width: 70%;
}
.tm2{
	width: 30%;
}
}


.unit_div{

	padding : 5px;
	border: 1px solid #05366e;
	text-align: center;
	color: #05366e;
	margin-bottom: 15px;
	cursor: pointer;
}
.unit_div:hover{
	color: white;
	background-color: #05366e;

}
.unit_div.active{
color: white;
	background-color: #05366e;
}


.titletd{
	text-align: left !important;
}
.idtd{
text-align: left !important;
}
.datetd{

}


</style>


			<!-- main start -->
			<!-- ================ -->
			<div
				class="main col-md-12"
				style="position: relative;">

				<!-- page-title start -->
				<!-- ================ -->
				<ol class="breadcrumb">
					<li><i class="fa fa-home pr-10"></i><a href="index.html">Home</a></li>
					
					<li class="active active ftbold">문의·요청 하기</li>
				</ol>

				<h2 class="page-title">문의·요청 하기</h2>
				<div class="separator-2 clear"></div>
		
		
				
				
				
					<div class="unive-txt" style="margin-top: 10px;">
					<table class="table">
					<colgroup>
						<col width="8%" />
						<col width="47%" />
						<col width="15%" />
						<col width="15%" />
						<col width="15%" />
					</colgroup>
					<thead>
						<tr>
							<th class="thide">번호</th>
							<th class="tm tm1">제목</th>
							<th class="tm tm2">글쓴이</th>
							<th class="thide">날짜</th>
							<th class="thide">답변</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${list}" varStatus="status">				
							<tr>
														<td class="thide">${totalpage -(((nowpage+1)-1)*10+ status.index)}  </td>
								<sec:authentication property="name" var="secName"/>
									<c:choose>
										<c:when test="${secName eq list.id || secName eq 'admin'}">
										<c:choose>
												<c:when test="${list.cnt == null}">
													<td class="titletd"><a href="/contact_read?seq=${list.board_seq}">${list.board_title}</a></td>
												</c:when>
										
												<c:otherwise> 
													<td class="titletd"><a href="/contact_read?seq=${list.board_seq}">${list.board_title}</a>[${list.cnt}]</td>
												</c:otherwise>
											 </c:choose>
										</c:when>
										<c:otherwise>
											
											<td class="titletd">비밀글입니다 <i class="fas fa-lock"></i></td>
										</c:otherwise>
									</c:choose>

			
							
								
									<td class="idtd">${list.id}</td>
									<td class="thide datetd">${list.board_date}</td>
								<c:choose>

								<c:when test="${list.board_flag eq 0}">
									<td class="thide datetd">접수</td>
								</c:when>
								
								<c:when test="${list.board_flag eq 1}"> 
									<td class="thide datetd">답변등록</td>
								 </c:when>
								
								<c:otherwise> 
<td class="thide datetd"></td>
								</c:otherwise>

								</c:choose>

								
								
							</tr>
						</c:forEach>
					</tbody>	
					
					</table>
					<div style="text-align: right;">
						<a href="/contactwrite" class="btn btn-dark">작성</a>
						</div>
					<div style="text-align: center;">
					
					<ul class="pagination" id="pagenavi">
					</ul>
					
					</div>
					
				</div>
    
    		 
			
		
		
		
		
		
		
		
		
		
		
		
		

			</div>
			
































