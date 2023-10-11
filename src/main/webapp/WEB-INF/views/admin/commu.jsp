<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!-- 
<link href="/resources/mba/board.css" rel="stylesheet" type="text/css">  
 -->

<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<style>

ul.pagination li > a:hover,
ul.pagination li > a:focus {
  background-color: transparent;
  color: black;
  background-color: white;
  border-color: black;
  border: 1px;
  border: 1px solid black !important;
}
ul.pagination li.active a,
.pagination > .active > a:hover,
.pagination > .active > a:focus {
    color: black;
    background-color: white;
    border-color: black;
    border: 1px solid black !important;
}
ul.pagination,
ul.pager {
  margin: 0px 0 40px;
  text-align: left;
}
ul.pagination li {
  padding: 0;
  margin: 0 5px 0 0;
  border-bottom: none;
  display: inline-block;
  -webkit-border-radius: 0px;
  -moz-border-radius: 0px;
  border-radius: 0px;
}
ul.pagination li > a,
.pagination > li:first-child > a,
.pagination > li:last-child > a,
ul.pager li > a {
  /* 
  text-align: center;
  padding: 0;
  height: 40px;
  width: 40px;
  border: 1px solid #777777;
  line-height: 39px;
  background-color: #777777;
  color: #ffffff;
  display: inline-block;
  -webkit-border-radius: 100%;
  -moz-border-radius: 100%;
  border-radius: 100%; 
  */
    text-align: center;
    padding: 0;
    height: 40px;
    width: 40px;
    line-height: 39px;
    color: black;
    display: inline-block;
    -moz-border-radius: 100%;
    border: 1px;
}
ul.pagination li > a:hover,
ul.pagination li > a:focus {
  /*
   background-color: transparent;
  color: #ffffff;
  background-color: #0c9ec7;
  */
  border-color: black; 
}
ul.pagination li.active a,
.pagination > .active > a:hover,
.pagination > .active > a:focus {
  /* 
  color: #ffffff;
  background-color: #09afdf;
  */
  border-color: black; 
}
/* Breadcrumb
---------------------------------- */
.breadcrumb-container {
  background-color: #f8f8f8;
  border-bottom: 1px solid #f4f4f4;
}
.dark.breadcrumb-container {
  background-color: #777777;
  border-color: #333333;
  color: #ffffff;
}
.breadcrumb {
  background-color: transparent;
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  border-radius: 0;
  margin-bottom: 0;
  font-size: 12px;
  padding-left: 0;
}
.breadcrumb > li + li:before {
  font-family:'NanumBarunGothic', "FontAwesome";
  content: "\f101";
  font-size: 11px;
  padding-left: 3px;
}
.banner .breadcrumb-container {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  background-color: rgba(255, 255, 255, 0.85);
  border-bottom-color: rgba(255, 255, 255, 0.1);
}
.banner .dark.breadcrumb-container {
  background-color: rgba(57, 66, 69, 0.6);
  border-bottom-color: rgba(119, 119, 119, 0.1);
}
.banner .breadcrumb > li a,
.banner .breadcrumb > li i {
  color: #000000;
}
.banner .breadcrumb > .active,
.banner .breadcrumb > li + li:before {
  color: #777777;
}
.dark .breadcrumb > li a,
.dark .breadcrumb > li i,
.dark .breadcrumb > .active,
.dark .breadcrumb > li + li:before {
  color: #ffffff;
}
.banner .breadcrumb > li a:hover {
  color: #0c9ec7;
}

</style>


<script type="text/javascript">
$(function(){
$( '.nav-stacked > li:nth-child(5)' ).addClass("active")
})

$(document).ready(function(){

var totalpage = '${totalpage}';
var nowpage = '${nowpage}';
var pagename = '${pagename}';

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
	
	location.href = "commu?page=0&search="+$("#search").val()+"&keyword="+$("#keyword").val()+"&pangename="+pagename;
	
}



function goList(page)
{
	location.href = "commu?page="+page+"&search="+'${search}'+"&keyword="+'${keyword}'+"&pangename="+pagename;
}

function delete_board(seq){
	
	
	$.ajax({
        type: "POST",
        data: {
              "seq" : seq
       
        },
        url: "delete_commu",
        success: function (data) {
      	  alert("삭제되었습니다")
      	  
      	location.reload();
        }
    }); 
	
	
}



</script>


				<!-- page-title start -->
				<!-- ================ -->
				<!-- page-title end -->
<div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">커뮤니티</h6>
            </div>
            <div class="card-body">
            
            
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
						<col width="46%" />
						<col width="15%" />
						<col width="15%" />
						<col width="8%" />
						<col width="8%" />
					</colgroup>
					<thead>
						<tr>
							<th class="thide">번호</th>
							<th class="tm tm1">제목</th>
							<th class="tm tm2">글쓴이</th>
							<th class="thide">날짜</th>
							<th class="thide">조회</th>
							<th class="thide">삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${list}" varStatus="status">				
							<tr>
								<td class="thide">${totalpage -(((nowpage+1)-1)*10+ status.index)}  </td>
								<td><a href="commu_rewrite?seq=${list.board_seq}">${list.board_title}</a></td>
								<td >${list.id}</td>
								<td class="thide">${list.board_date}</td>
								<td class="thide">${list.board_count}</td>
								<td class="thide"><button onclick="delete_board('${list.board_seq}')">삭제</button></td>
							</tr>
						</c:forEach>
					</tbody>	
					
					
					
					</table>
					<%-- <div style="text-align: right;">
						<a href="/commu/write?board=${board}" class="btn btn-dark">작성</a>
						</div> --%>
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
            
</div>
            				
		