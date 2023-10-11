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


    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                  //  document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                   // document.getElementById("sample6_extraAddress").value = '';
                   
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    function sample6_execDaumPostcode2() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                  //  document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                   // document.getElementById("sample6_extraAddress").value = '';
                   
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode2').value = data.zonecode;
                document.getElementById("sample6_address2").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress2").focus();
            }
        }).open();
    }
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
			
			
			if (password == "" || password2 == "" ||password2 !=password) {
				alert("비밀번호를 확인해주세요");
				return;
			}
			if (name == "") {
				alert("이름을 입력하세요");
				return;
			}
			
			if (birth_y == "" ||birth_m == "" ||birth_d == "") {
				alert("생일을 확인해주세요");
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
					if(data.check == 1){
						alert("이미 사용중인 아이디입니다.")
						return;
					}else{
						location.href="../";
					}
					
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
    box-sizing: border-box;
    margin-right: 5px;
}
.form-row{

    margin-right: 10px;
float: left;
}
#input-group2 form-row{
	float: none;
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


@media (max-width: 992px){
.form-row{
 width: 100% !important;
 margin-bottom: 10px;
}
}

.inputfix{
    -moz-border-radius: 5px;
    background: #ffffff;
    height: 30px;
    color: #777777;
    position: relative;
    border: 1px solid #ccc;
}
.inputfix2{
    -moz-border-radius: 5px;
    background: #ffffff;
    height: 40px;
   width:100%;
    color: #777777;
    position: relative;
    border: 1px solid #ccc;
}
.tablefix{
	border-top: 2px solid black;

}

.tablefix th{

    vertical-align: middle !important;
    text-align: center;
    background-color: #e3e3e3;
}
.tablefixm th{

    text-align: left;
}
.mtable th{
	text-align: 

}
.table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td{
    padding: 14px 15px;
   /*  border-top: 1px solid #f3f3f3; */
       border-bottom: 1px solid #bdbdbd;
           font-weight: 400;

}

select[class="inputfix"]{
    width: 170px;
}
</style>

<div class="main col-md-12">


 	<div style="    text-align: center; margin-bottom: 50px;">
 	    <span style="font-size: 27px;font-weight: bolder;">MBA 총동창회 회원가입</span>
    <div class="line3"></div>
    
    </div>

	<form action="" class="mhide">
		<table class="table tablefix">
			<tr>
				<th>
				아이디/비밀번호
				</th>
				<td>
					<div class="form-row">
						<input id="id" name="id" class="inputfix" placeholder="아이디">
					</div>
					<div class="form-row">
						 <input id="pwd" name="pwd" type="password"  class="inputfix" placeholder="비밀번호">
					</div>
					<div class="form-row">
					<input id="pwd2" name="pwd2" type="password" class="inputfix" placeholder="비밀번호 확인">
					</div>
				</td>
			</tr>
			<tr>
				<th>
					이름/생년월일
				</th>
				<td>
					<div class="form-row">
					 <input id="name" name="name" value=""class="inputfix" placeholder="이름">
					</div>
					<div class="form-row" >
					<!-- <label class="input-label">생년월일 <span style="color: red">*</span></label>  -->
					생년월일
						<select id="birth_y" name="birth_y" class="inputfix" style="    width: 110px;">
							<option value="">- 년 -</option> 
							<c:forEach var="i" begin="1930" end="2050">
								<option value="<c:out value="${i}" />">${i}년</option> 
							</c:forEach>
						</select>
						<select id="birth_m" name="birth_m" class="inputfix" style="    width: 110px;">
							<option value="">- 월 -</option> 
							<c:forEach var="i" begin="1" end="12">
								<option value="<c:out value="${i}" />">${i}월</option> 
							</c:forEach>
						</select>
						<select id="birth_d" name="birth_d" class="inputfix" style="    width: 110px;">
							<option value="">- 일 -</option> 
							<c:forEach var="i" begin="1" end="31">
								<option value="<c:out value="${i}" />">${i}일</option> 
							</c:forEach>
						</select>
				
				</div>
				</td>
			</tr>
			<tr>
				<th>
					졸업 및 기수정보
				</th>
				<td>
					
				<div class="form-row">
					<select id="graduation_major" name="graduation_major" class="inputfix">
						<option value="">- 졸업과정 -</option> 
						<option value="경영">경영</option> 
						<option value="경제">경제</option>
						<option value="CMBA">CMBA</option>
						<option value="EMBA">EMBA</option>
						<option value="FMBA">FMBA</option>
						<option value="GMBA">GMBA</option>
					</select>
				</div>
				<div class="form-row">
					<input id="class_num" type="text" name="class_num" placeholder="기수" class="inputfix" >
				</div>
				<div class="form-row">
					
					<select id="graduation_y" name="graduation_y" class="inputfix" >
						<option value="">- 졸업년도 -</option> 
						<c:forEach var="i" begin="1957" end="2056" step="1" >
							<option value="${i}">${i}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-row">
					<select id="major" name="major" class="inputfix">
						<option value="">- 전공 -</option> 
						<option value="인사조직">인사조직</option> 
						<option value="회계">회계</option>
						<option value="마케팅">마케팅</option>
						<option value="경영정보">경영정보</option>
					</select>
	
				</div>
				</td>
			</tr>
			<tr>
				<th>
					연락처/취미
				</th>
				<td>
					<div class="form-row">
						 <input id="phone" name="phone" class="inputfix" onKeyPress="return numkeyCheck(event)" placeholder="휴대 전화번호">
					</div>
					<div class="form-row">
						 <input id="email" name="email"  class="inputfix" placeholder="이메일 주소">
					</div>
					<div class="form-row">
						<input id="hobby" name="hobby" class="inputfix"  placeholder="취미 / 특기">
					</div>
				</td>
			</tr>
			<tr>
				<th>
					자택주소 및 지역
				</th>
				<td>
					<div class="form-row" style="float: none;">
						<input type="text" id="sample6_postcode" name="addr1" class="inputfix inline" placeholder="우편번호" disabled="disabled">
						<input type="button" onclick="sample6_execDaumPostcode()" class="btn" value="우편번호 찾기" style="padding: 4px 20px; margin: 0px;background-color: #919191;color: white;">
						<input type="text" id="sample6_address" placeholder="주소" name="addr2" class="inputfix inline" style=" margin-left:5px;   width: 398px;margin-top: 5px;" disabled="disabled"><br>
						<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="addr3" class="inputfix inline" style="width: 700px;margin-top: 5px;">
					</div>
					<div class="form-row" style="margin-top: 5px">
						<select id="residential" name="residential"  class="inputfix">
							<option value="">- 거주지역 -</option> 
							<option value="domestic">국내</option> 
							<option value="foreign">해외</option> 
							<option value="death">사망</option> 
						</select>
					</div>
					<div class="form-row" style="margin-top: 5px">
					 <input id="home_phone" name="home_phone"  class="inputfix" onKeyPress="return numkeyCheck(event)" placeholder="자택 전화번호">
					</div>
					<div style="clear: both;"></div>
	
				</td>
			</tr>
			<tr>
				<th>
					근무처 주소
				</th>
				<td>
				<div class="form-row">
					 <input id="company" name="company" class="inputfix" placeholder="근무지 명">
				</div>
	
				<div class="form-row">
					 <input id="company_rank" name="company_rank" class="inputfix"  placeholder="근무처 직위/직책">
				</div>
	
				<div class="form-row">
					 <input id="company_phone" name="company_phone" class="inputfix" onKeyPress="return numkeyCheck(event)"  placeholder="근무처 전화번호">
				</div>
				<div class="form-row">
				 <input id="job_field" name="job_field" class="inputfix"  placeholder="업무분야">
				
				<div style="clear: both"></div>
				</div>
			
				<div class="group_div" style="    margin-bottom: 5px;">
				<div class="form-row" style="width: 100%;">
						<input type="text" id="sample6_postcode2" class="inputfix inline" name="company_addr1" disabled="disabled" placeholder="우편번호">
						<input type="button" onclick="sample6_execDaumPostcode2()" class="btn" value="우편번호 찾기" style="padding: 4px 20px; margin: 0px;background-color: #919191;color: white;">
						<input type="text" id="sample6_address2" placeholder="주소" disabled="disabled" name="company_addr2"  class="inputfix inline" style=" margin-left:5px;   width: 398px;margin-top: 5px;" disabled="disabled"><br>
						<input type="text" id="sample6_detailAddress2" placeholder="상세주소" name="company_addr3" class="inputfix inline" style="width: 700px;margin-top: 5px;">
				</div>
				<div style="clear: both"></div>
				</div>
				<div class="form-row">
					<input id="l_company" name="l_company" class="inputfix" placeholder="이전 근무처">
				</div>
			</td>
			</tr>
		</table>
	
	
			<div class="button-group"
				style="text-align: center; margin-top: 50px;">




				<a id="btn-confirm" class="btn btn-primary">가입</a>
				<a class="btn btn-gray-transparent" href="javascript:window.history.back();">취소</a>
			</div>
	</form>

















<!-- --------------- -->

<form class="hidep">
	<table class="table tablefix tablefixm">
	
		<tr><th>* 아이디/비밀번호</th></tr>
		<tr><td>
			<div class="form-row">
					<input id="id" name="id" class="inputfix2" placeholder="아이디">
				</div>
				<div class="form-row">
					 <input id="pwd" name="pwd" type="password"  class="inputfix2" placeholder="비밀번호">
				</div>
				<div class="form-row">
				<input id="pwd2" name="pwd2" type="password" class="inputfix2" placeholder="비밀번호 확인">
			</div>
	
		</td></tr>
		<tr><th>* 이름/생년월일</th></tr>
		<tr><td>
			<div class="form-row">
					 <input id="name" name="name" value=""class="inputfix2" placeholder="이름">
					</div>
					 <label class="input-label">생년월일 <span style="color: red">*</span></label> 
					<div class="form-row" >
						<select id="birth_y" name="birth_y" class="inputfix2" style="    width: 110px;">
							<option value="">- 년 -</option> 
							<c:forEach var="i" begin="1930" end="2050">
								<option value="<c:out value="${i}" />">${i}년</option> 
							</c:forEach>
						</select>
						<select id="birth_m" name="birth_m" class="inputfix2" style="    width: 110px;">
							<option value="">- 월 -</option> 
							<c:forEach var="i" begin="1" end="12">
								<option value="<c:out value="${i}" />">${i}월</option> 
							</c:forEach>
						</select>
						<select id="birth_d" name="birth_d" class="inputfix2" style="    width: 110px;">
							<option value="">- 일 -</option> 
							<c:forEach var="i" begin="1" end="31">
								<option value="<c:out value="${i}" />">${i}일</option> 
							</c:forEach>
						</select>
				
				</div>
		</td></tr>
		<tr><th>* 졸업 및 기수정보</th></tr>
		<tr><td>
			<div class="form-row">
					<select id="graduation_major" name="graduation_major" class="inputfix2">
						<option value="">- 졸업과정 -</option> 
						<option value="경영">경영</option> 
						<option value="경제">경제</option>
						<option value="CMBA">CMBA</option>
						<option value="EMBA">EMBA</option>
						<option value="FMBA">FMBA</option>
						<option value="GMBA">GMBA</option>
					</select>
				</div>
				<div class="form-row">
					<input id="class_num" type="text" name="class_num" placeholder="기수" class="inputfix2" >
				</div>
				<div class="form-row">
					
					<select id="graduation_y" name="graduation_y" class="inputfix2" >
						<option value="">- 졸업년도 -</option> 
						<c:forEach var="i" begin="1957" end="2056" step="1" >
							<option value="${i}">${i}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-row">
					<select id="major" name="major" class="inputfix2">
						<option value="">- 전공 -</option> 
						<option value="인사조직">인사조직</option> 
						<option value="회계">회계</option>
						<option value="마케팅">마케팅</option>
						<option value="경영정보">경영정보</option>
					</select>
	
				</div>
		
		</td></tr>
		<tr><th>* 연락처/취미</th></tr>
		<tr><td>
			<div class="form-row">
				 <input id="phone" name="phone" class="inputfix2" onKeyPress="return numkeyCheck(event)" placeholder="휴대 전화번호">
			</div>
			<div class="form-row">
				 <input id="email" name="email"  class="inputfix2" placeholder="이메일 주소">
			</div>
			<div class="form-row">
				<input id="hobby" name="hobby" class="inputfix2"  placeholder="취미 / 특기">
			</div>
		
		
		</td></tr>
		
		<tr><th>자택주소 및 지역</th></tr>
		<tr><td>
			<div class="form-row" style="float: none;">
						<input type="text" id="sample6_postcode" name="addr1" class="inputfix2 inline" placeholder="우편번호" disabled="disabled" style="float: left;width: 45%;margin-right: 10px;">
						<input type="button" onclick="sample6_execDaumPostcode()" class="btn" value="우편번호 찾기" style="    padding: 9px 19px;margin-left: 10px;width: 45%;margin: 0px;background-color: #919191;color: white;">
						<input type="text" id="sample6_address" placeholder="주소" name="addr2" class="inputfix2 inline" style=" margin-top: 5px;" disabled="disabled"><br>
						<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="addr3" class="inputfix2 inline" style=";margin-top: 5px;">
					</div>
					<div class="form-row" style="margin-top: 5px">
						<select id="residential" name="residential"  class="inputfix2">
							<option value="">- 거주지역 -</option> 
							<option value="domestic">국내</option> 
							<option value="foreign">해외</option> 
							<option value="death">사망</option> 
						</select>
					</div>
					<div class="form-row" style="margin-top: 5px">
					 <input id="home_phone" name="home_phone"  class="inputfix2" onKeyPress="return numkeyCheck(event)" placeholder="자택 전화번호">
					</div>
				<div style="clear: both;"></div>
		
		
		</td></tr>
		
		<tr><th>* 근무처 주소</th></tr>
		<tr><td>
			<div class="form-row">
					 <input id="company" name="company" class="inputfix2" placeholder="근무지 명">
				</div>
	
				<div class="form-row">
					 <input id="company_rank" name="company_rank" class="inputfix2"  placeholder="근무처 직위/직책">
				</div>
	
				<div class="form-row">
					 <input id="company_phone" name="company_phone" class="inputfix2" onKeyPress="return numkeyCheck(event)"  placeholder="근무처 전화번호">
				</div>
				<div class="form-row">
				 <input id="job_field" name="job_field" class="inputfix2"  placeholder="업무분야">
				
				<div style="clear: both"></div>
				</div>
			
				<div class="group_div" style="    margin-bottom: 5px;">
				<div class="form-row" style="width: 100%;">
						<input type="text" id="sample6_postcode2" class="inputfix2 inline" name="company_addr1" disabled="disabled" placeholder="우편번호" style="float: left;width: 45%;margin-right: 10px;">
						<input type="button" onclick="sample6_execDaumPostcode2()" class="btn" value="우편번호 찾기" style="    padding: 9px 19px;margin-left: 10px;width: 45%;margin: 0px;background-color: #919191;color: white;">
						<input type="text" id="sample6_address2" placeholder="주소" disabled="disabled" name="company_addr2"  class="inputfix2 inline" style=" margin-top: 5px;" disabled="disabled"><br>
						<input type="text" id="sample6_detailAddress2" placeholder="상세주소" name="company_addr3" class="inputfix2 inline" style="margin-top: 5px;">
				</div>
				<div style="clear: both"></div>
				</div>
				<div class="form-row">
					<input id="l_company" name="l_company" class="inputfix2" placeholder="이전 근무처">
				</div>
		
		
		
		</td></tr>
		
	
	</table>
	<div class="button-group"
				style="text-align: center; margin-top: 20px;">




				<a id="btn-confirm" class="btn btn-primary" style="width: 48%;padding: 15px 20px;">가입</a>
				<a class="btn btn-gray-transparent" href="javascript:window.history.back();" style="width: 48%;padding: 15px 20px;">취소</a>
			</div>
</form>





<%-- 
	<form id="user_form">
		<div id="input-group2" >
			<div class="group_div">
				<div class="form-row">
					<label class="input-label">아이디 <span style="color: red">*</span></label> <input id="id" name="id" class="inputfix2">
				</div>
				<div class="form-row">
					<label class="input-label">비밀번호 <span style="color: red">*</span></label> <input id="pwd" name="pwd" type="password"  class="inputfix2">
				</div>
				<div class="form-row">
					<label class="input-label">비밀번호 확인 <span style="color: red">*</span></label> <input id="pwd2" name="pwd2" type="password" class="inputfix2">
				</div>
				<div style="clear: both"></div>
			</div>
			
			
			<div class="form-group">
				<div class="form-row">
					<label class="input-label">이름 <span style="color: red">*</span></label> <input id="name" name="name" value=""class="inputfix2">
				</div>
				<div class="form-row" style="width: 35%;">
					<label class="input-label">생년월일 <span style="color: red">*</span></label> 
					<div>
					<div class="form-group birthtab">
						<select id="birth_y" name="birth_y" class="inputfix2">
							<option value="">- 년 -</option> 
							<c:forEach var="i" begin="1930" end="2050">
								<option value="<c:out value="${i}" />">${i}년</option> 
							</c:forEach>
						</select>
					</div>
					<div class="form-group birthtab">
						<select id="birth_m" name="birth_m" class="inputfix2" >
							<option value="">- 월 -</option> 
							<c:forEach var="i" begin="1" end="12">
								<option value="<c:out value="${i}" />">${i}월</option> 
							</c:forEach>
						</select>
					</div>
					<div class="form-group birthtab">
						<select id="birth_d" name="birth_d" class="inputfix2" >
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
			<div class="group_div">
				
				<div class="form-row">
					<label class="input-label">졸업과정</label> <select id="graduation_major" name="graduation_major" class="inputfix2">
						<option value="">- 선택 -</option> 
						<option value="경영">경영</option> 
						<option value="경제">경제</option>
						<option value="CMBA">CMBA</option>
						<option value="EMBA">EMBA</option>
						<option value="FMBA">FMBA</option>
						<option value="GMBA">GMBA</option>
					</select>
				</div>
				<div class="form-row">
					<label class="input-label">기수 <span style="color: red">*</span></label> <input id="class_num" type="text" name="class_num" placeholder="" class="inputfix2">
				</div>
				<div class="form-row">
					<label class="input-label">졸업년도</label> 
					<select id="graduation_y" name="graduation_y" class="inputfix2">
						<option value="">- 선택 -</option> 
						<c:forEach var="i" begin="1957" end="2056" step="1" >
							<option value="${i}">${i}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-row">
					<label class="input-label">전공</label> <select id="major" name="major" class="inputfix2">
						<option value="">- 선택 -</option> 
						<option value="인사조직">인사조직</option> 
						<option value="회계">회계</option>
						<option value="마케팅">마케팅</option>
						<option value="경영정보">경영정보</option>
					</select>
	
				</div>
				<div style="clear: both"></div>
			</div>
			
			
			
			<div class="group_div" style="margin-bottom: 35px;">
			
				<div class="form-row">
					<label class="input-label">휴대 전화번호 <span style="color: red">*</span></label> <input id="phone" name="phone" class="inputfix2" onKeyPress="return numkeyCheck(event)">
				</div>
				<div class="form-row">
					<label class="input-label">이메일 주소</label> <input id="email" name="email"  class="inputfix2">
				</div>
				<div class="form-row">
					<label class="input-label">취미 / 특기</label> <input id="hobby" name="hobby" class="inputfix2" >
				</div>
				<div style="clear: both"></div>
			</div>
			
			<div class="group_div" style="margin-bottom: 35px;">
				<div class="form-row" style="float: none;">
					<label class="input-label">자택 주소</label> <br>
					
						<input type="text" id="sample6_postcode" name="addr1" class="inputfix2 inline" placeholder="우편번호" disabled="disabled">
						<input type="button" onclick="sample6_execDaumPostcode()" class="btn" value="우편번호 찾기"><br>
						<input type="text" id="sample6_address" placeholder="주소" name="addr2" class="inputfix2 inline" style="width: 700px;margin-top: 5px;" disabled="disabled"><br>
						<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="addr3" class="inputfix2 inline" style="width: 700px;margin-top: 5px;">
					
				</div>
				<div style="clear: both"></div>
			</div>




			<div class="group_div">
				<div class="form-row">
					<label class="input-label">거주지역</label> 
					<select id="residential" name="residential"  class="inputfix2">
						<option value="">- 선택 -</option> 
						<option value="domestic">국내</option> 
						<option value="foreign">해외</option> 
						<option value="death">사망</option> 
					</select>
					
				</div>
	
				<div class="form-row">
					<label class="input-label">자택 전화번호</label> <input id="home_phone" name="home_phone"  class="inputfix2" onKeyPress="return numkeyCheck(event)">
				</div>
	
			
		
				<div style="clear: both"></div>
			</div>
			<div class="group_div">
				<div class="form-row">
					<label class="input-label">메모</label> <input id="memo" name="memo" class="inputfix2">
				</div>
				<div style="clear: both"></div>
			</div>
			
			
			
			<div class="group_div">
				<div class="form-row">
					<label class="input-label">근무처명</label> <input id="company" name="company" class="inputfix2" >
				</div>
	
				<div class="form-row">
					<label class="input-label">근무처 직위/직책</label> <input id="company_rank" name="company_rank" class="inputfix2">
				</div>
	
				<div class="form-row">
					<label class="input-label">근무처 전화번호</label> <input id="company_phone" name="company_phone" class="inputfix2" onKeyPress="return numkeyCheck(event)">
				</div>
				<div class="form-row">
					<label class="input-label">업무분야</label> <input id="job_field" name="job_field" class="inputfix2">
				</div>
				
				<div style="clear: both"></div>
			</div>
			
			<div class="group_div" style="    margin-bottom: 35px;">
				<div class="form-row" style="width: 100%;">
					<label class="input-label">근무처 주소</label> <br>
					
						<input type="text" id="sample6_postcode2" class="inputfix2 inline" name="company_addr1" disabled="disabled" placeholder="우편번호">
						<input type="button" onclick="sample6_execDaumPostcode2()" class="btn btn-info" value="우편번호 찾기" ><br>
						<input type="text" id="sample6_address2" placeholder="주소" disabled="disabled" name="company_addr2" class="inputfix2 inline" style=";margin-top: 5px;"><br>
						<input type="text" id="sample6_detailAddress2" placeholder="상세주소" name="company_addr3" class="inputfix2 inline" style="margin-top: 5px;">
	
					
					
				</div>
				<div style="clear: both"></div>
			</div>
			<div class="group_div" style="    margin-bottom: 35px;">
				<div class="form-row">
					<label class="input-label">이전 근무처</label> <input id="l_company" name="l_company" class="inputfix2">
				</div>
				<div style="clear: both"></div>
			</div>
	


















			<div class="button-group"
				style="text-align: center; margin-top: 50px;">
				<a id="btn-confirm" class="btn btn-primary btn-block">가입</a>
			</div>
		</div>




</form>
 --%>
</div>

