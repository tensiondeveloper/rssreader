<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

Optional theme
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

Latest compiled and minified JavaScript
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
 
</script>


<!-- id
password
name
graduation_major
class_num
graduation_y
major
birth_y
birth_m
birth_d
phone
email
home_phone
addr1
addr2
addr3
company_addr1
company_addr2
company_addr3
residential
memo
company
company_rank
company_phone
job_field
l_company -->














<script type="text/javascript">
function numkeyCheck(e) { var keyValue = event.keyCode; if( ((keyValue >= 48) && (keyValue <= 57)) ) return true; else return false; }
	$(document).ready(function() {
		$("#search-btn").click(function() {
			
			var birth = $("#birth_y").val() +"-"+$("#birth_m").val()+"-"+$("#birth_d").val()
			var name = $("#name").val()
			console.log(birth)
			 $.ajax({
					type : "POST",
					data : {
						"name":  name
						,"birth": birth
						
					},
					url : "/searchuser",
					success : function(data) {
						if(data.otheruser == null){
							$("#searchdiv").empty()
							var attr = "해당 정보의 데이터가 없습니다.";
							$("#searchdiv").append(attr)
						}else{
							$("#searchdiv").empty()
							var attr = "<input type='radio'><span>"+data.otheruser.name;
							attr += " | "+data.otheruser.birth
							attr += " | "+data.otheruser.graduation_major
							attr += " | "+data.otheruser.class_num
							attr += " | "+data.otheruser.graduation_y
							attr += " | "+data.otheruser.major +"</span><a href='/otherjoin2?name="+data.otheruser.name+"&birth="+data.otheruser.birth+"'>선택</a>"
							$("#searchdiv").append(attr)
						}
							
					}
				});
				
			
			
		})
		$("#btn-confirm").click(function() {
			
			var id =	$("#id").val();
			var password =	$("#pwd").val();
			var password2 =	$("#pwd2").val();
			var name =	$("#name").val();
			var graduation_major =$("#graduation_major").val();
			var class_num =	$("#class_num").val();
			var graduation_y = $("#graduation_y").val();
			var major = $("#major").val();
			var birth_y =$("#birth_y").val();
			var birth_m =$("#birth_m").val();
			var birth_d =$("#birth_d").val();
			var phone = $("#phone").val();
			var email = $("#email").val();
			var home_phone = $("#home_phone").val();
			var hobby =	$("#hobby").val();
			
			var addr1 = $("#sample6_postcode").val();
			var addr2 = $("#sample6_address").val();
			var addr3 = $("#sample6_detailAddress").val();
			var company_addr1 = $("#sample6_postcode2").val();
			var company_addr2 = $("#sample6_address2").val();
			var company_addr3 = $("#sample6_detailAddress2").val();
			var residential = $("#residential").val();
			var memo =	$("#memo").val();
			var company =	$("#company").val();
			var company_rank =	$("#company_rank").val();
			var company_phone =	$("#company_phone").val();
			var job_field =	$("#job_field").val();
			var l_company =	$("#l_company").val();
			if (id == "") {
				alert("아이디를 입력하세요");
				return;
			}
			
			
			
			 $.ajax({
					type : "POST",
					data : {
						"id":  id
					},
					url : "idcheck",
					success : function(data) {
							if(data.check == 1){
								alert("이미 사용중인 아이디입니다")
								return;
							}
					}
					
			});  
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			if (password == "" || password2 == "" ||password2 !=password) {
				alert("비밀번호를 확인해주세요");
				return;
			}
			if (name == "") {
				alert("이름을 입력하세요");
				return;
			}
			
			if (phone == "") {
				alert("전화번호를 입력하세요");
				return;
			}
				
			 $.ajax({
				type : "POST",
				data : {
					"id":  id
					,"password":  password
					,"name":  name
					,"graduation_major":  graduation_major
					,"class_num":  class_num
					,"graduation_y":  graduation_y
					,"major":  major
					,"birth_y":  birth_y
					,"birth_m":  birth_m
					,"birth_d":  birth_d
					,"phone":  phone
					,"hobby":  hobby
					,"email":  email
					,"home_phone":  home_phone
					,"addr1":  addr1
					,"addr2":  addr2
					,"addr3":  addr3
					,"company_addr1":  company_addr1
					,"company_addr2":  company_addr2
					,"company_addr3":  company_addr3
					,"residential":  residential
					,"memo":  memo
					,"company":  company
					,"company_rank":  company_rank
					,"company_phone":  company_phone
					,"job_field":  job_field
					,"l_company":  l_company
					
				},
				url : "joinadd",
				success : function(data) {
						location.href="../";
				}
			});  
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
		/* 	
			if (id.length == 0) {
				alert("아이디를 입력하세요");
				return;
			}
 */
		
		});
	})
</script>



</head>


<style type="text/css">
.birthtab{
    float: left;
    width: 30%;
    box-sizing: border-box;
    margin-right: 5px;
}
.form-row{

width: 200px;
float: left;
margin-right: 50px;
}
.group_div{
	margin-bottom: 15px;
}
.form-row4{

width: 150px;
float: left;
margin-right: 50px;
}
/* h1{
margin: 0px;
    text-align: center;
    line-height: 2.5;
}
.container{
margin-top: 40px;
    background-color: white;
    box-shadow: 1px 1px 1px 1px #a89db3;
    padding: 60px;


}
.inline{

width:150px;
display: inline-block;

} */

.formauto{
	width: 60%;
	margin: 0 auto;
}

@media (max-width: 992px){
.formauto{
	width: 100%;
	margin: 0 auto;
}
.form-row{
 width: 100% !important;
 margin-bottom: 10px;
}
}
</style>

<div class="main col-md-12" style="min-height: 500px;">
		<div id="input-group" >
			<div class="form-group formauto">
				<div class="col-md-6">
					<label class="input-label">이름 <span style="color: red">*</span></label> <input id="name" name="name" value=""class="form-control">
				</div>
				<div class="col-md-6">
					<label class="input-label">생년월일</label> 
					<div>
					<div class="form-group birthtab">
						<select id="birth_y" name="birth_y" class="form-control">
							<option value="">- 년 -</option> 
							<c:forEach var="i" begin="1930" end="2050">
								<option value="<c:out value="${i}" />">${i}년</option> 
							</c:forEach>
						</select>
					</div>
					<div class="form-group birthtab">
						<select id="birth_m" name="birth_m" class="form-control" >
							<option value="">- 월 -</option> 
							<c:forEach var="i" begin="1" end="12">
								<option value="<c:out value="${i}" />">${i}월</option> 
							</c:forEach>
						</select>
					</div>
					<div class="form-group birthtab">
						<select id="birth_d" name="birth_d" class="form-control" >
							<option value="">- 일 -</option> 
							<c:forEach var="i" begin="1" end="31">
								<option value="<c:out value="${i}" />">${i}일</option> 
							</c:forEach>
						</select>
					</div>
					</div>
				</div>
	
				<div style="clear: both"></div>
			</div>
			
			


		</div>
		<div style="    text-align: center;">
				<a id="search-btn" class="btn btn-primary">검색</a>
		</div>
		
		
		<div id="searchdiv" style="text-align: center;margin-top: 5px;">
		
			
		
		</div>
</div>

