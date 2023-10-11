<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<link href="/resources/mba/board.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
$(function(){
$( '.nav-stacked > li:nth-child(5)' ).addClass("active")
})










$(document).ready(function(){
	


var totalpage = '${totalpage}';
var nowpage = '${nowpage}';

var rowpage = 20;


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
	
	location.href = "companypr?page=0&search="+$("#search").val()+"&keyword="+$("#keyword").val();
	
}



function goList(page)
{
	location.href = "companypr?page="+page+"&search="+'${search}'+"&keyword="+'${keyword}';
}


</script>


			<!-- main start -->
			<!-- ================ -->
			<div
				class="main col-md-9 col-mg-3 col-md-push-3"
				style="position: relative;">

				<!-- page-title start -->
				<!-- ================ -->
				<div>
					<ol class="breadcrumb">
						<li><i class="fa fa-home pr-10"></i><a href="index.html">Home</a></li>
						<li class="active">읽을거리</li>
						<li class="active active ftbold">MBA 경영인의 밤</li>
					</ol>

					<h2 class="page-title">MBA 경영인의 밤</h2>
				</div>
				<div class="separator-2 clear"></div>
				<!-- page-title end -->
				
				<div style="text-align: center">
				
				
					<select class="form-control" style="width: auto;    display: inline;" name="search" id="search">
						<option value="">--검색--</option>
						<option value="title_content">제목 / 내용</option>
						<option value="id">글쓴이</option>
					</select>
				
					<input type="text" class="form-control" id="keyword" name="keyword" style="width: auto;    display: inline;">
					<button type="button" onclick ="searchfn();"class="btn btn-dark">검색</button>
				</div>
				
				
				<div class="unive-txt" style="margin-top: 10px;">
					<table class="table">
					<colgroup>
						<col width="8%" />
						<col width="54%" />
						<col width="15%" />
						<col width="15%" />
						<col width="8%" />
					</colgroup>
					<thead>
						<tr>
							<th class="thide">번호</th>
							<th class="tm tm1">제목</th>
							<th class="tm tm2">글쓴이</th>
							<th class="thide">날짜</th>
							<th class="thide">조회</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${list}" varStatus="status">				
							<tr>
								<td class="thide">${totalpage -(((nowpage+1)-1)*10+ status.index)}  </td>
								<td><a href="/read/board?seq=${list.board_seq}">${list.board_title}</a></td>
								<td >${list.id}</td>
								<td class="thide">${list.board_date}</td>
								<td class="thide">${list.board_count}</td>
							</tr>
						</c:forEach>
					</tbody>	
					
					
					
					</table>
					<div style="text-align: right;">
						<a href="/read/write?board=${board}" class="btn btn-dark">작성</a>
						</div>
					<div style="text-align: center;">
					
					<ul class="pagination" id="pagenavi">
								<!-- 	<li><a href="#" aria-label="Previous"><i class="fa fa-caret-left" style="    line-height: 39px;"></i></a></li>
									<li class="active"><a href="#">1</a></li>
									 <li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#" aria-label="Next"><i class="fa fa-caret-right" style="    line-height: 39px;"></i></a></li> -->
					</ul>
					
					</div>
					
				</div>


			


			</div>
			<!-- main end -->
			<!-- sidebar start -->
			<!-- ================ -->
	