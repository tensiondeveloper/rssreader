<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" />
<style type="text/css">
@font-face {
	font-family: 'Geekble';
	src: url('/resources/GeekbleMalang2WOFF.woff') format('woff');
	font-weight: 100;
	font-display: swap;
}
body {
	font-family: 'Geekble';
}
input{
font-family: 'Pretendard';
}
 .login-page {
  width: 50%;
  margin: auto;
} 
@media ( max-width : 992px) {

 .login-page {
  width: 100%;
  margin: auto;
} 

}
.form {
  position: relative;
  z-index: 1;
  
  
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
 
}
.form input {
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 10px;
  box-sizing: border-box;
  font-size: 14px;
}
.form button {
  text-transform: uppercase;
  outline: 0;
  background: #05366e;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 20px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button:hover,.form button:active,.form button:focus {
  background: #05366e;
}
.form .message {
     margin: 10px 0 0;
    color: #b3b3b3;
    font-size: 12px;
    border-top: 1px solid #b3b3b3;
    padding-top: 10px;
}
.form .message a {
  text-decoration: none;
   color: #b3b3b3;
}
.form .register-form {
  display: none;
}



input[type=checkbox] {  
    display: none;  
}

input[type=checkbox] + label{
    display: inline-block;
    cursor: pointer;
    position: relative;
    padding-left: 24px;
    margin-right: 5px;
    font-size: 13px;
}

input[type=checkbox]+ label:before {     

    content: "";
    display: inline-block;
    width: 20px;
    height: 20px;
    margin-right: 10px;
    position: absolute;
    border: 2px solid #05366e;
    left: 0;
    bottom: -10px;
    background-color: white;
    border-radius: 20px;
    box-shadow: inset 0px 1px 1px 0px rgba(0, 0, 0, .3), 0px 1px 0px 0px rgba(255, 255, 255, .8);
}
input[type=checkbox]:checked + label:before { 

   content: "\2713";
	text-shadow: 1px 1px 1px rgba(0, 0, 0, .2);
    font-size: 15px;
    font-weight: 800;
    color: #05366e;
    background: white;
    text-align: center;
    line-height: 16px;
} 
.modal{
    top: 250px;
}

</style>
	
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>

$(document).ready(function(){
	var a =0;
	var a = '${error}';
	if(a == 1){
		alert("아이디나 비밀번호를 확인해주세요")
	}	

	$("#id-submit").on('click',function(){
			var id = $("#id").val();
			var name = $("#name").val();
			var pass1 = $("#pass1").val();
			var pass2 = $("#pass2").val();
			
			if (id == '') {
				alert("아이디를 입력해주세요")
				return;
			} 
			if (name == '') {
				alert("이름을 입력해주세요")
				return;
			} 
			if (pass1 == '') {
				alert("패스워드를 입력해주세요")
				return;
			} 
			if (pass1 != pass2) {
				alert("비밀번호가 서로 다릅니다")
				return;
			} 
			$.ajax({
				type : "POST",
				data: {
		              "id" : id,
		              "name" : name,
		              "pass1" : pass1
		       
		        },
				url : "/join",
				success : function(data) {
					if(data.code == 1){
						alert("이미 사용중인 아이디입니다")
					}else{
						alert("회원가입되었습니다 로그인해주세요.")
						location.reload();
					}
					
				}
			})
			
			
			
			
		})	

})




</script>




<div class="login-page">
  <div class="form">
    <!-- <form class="register-form">
      <input type="text" placeholder="name"/>
      <input type="password" placeholder="password"/>
      <input type="text" placeholder="email address"/>
      <button>create</button>
    </form> -->
    <div style="    margin-bottom: 15px;">
    <span style="font-size: 40px;">로그인</span>
    <div class="line3"></div>
    <span></span>
    
    </div>
    <form class="login-form" name="f" action="/j_spring_security_check" method="post" style="    margin: 0 auto;" >
    <input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>
      <input type="text" name="username" placeholder="username"/>
      <input type="password" name="password"placeholder="password" style="margin-bottom: 30px;"/>
      <button type="submit">LOGIN</button>
      <p class="message" style="    text-decoration: none;    color: #9b9797;    font-size: 17px;"><a href="#" data-toggle="modal" data-target="#modal_keyboard">회원가입</a></p>
    
    </form>
  </div>
</div>






	<div id="modal_keyboard" class="modal fade" data-keyboard="false" data-backdrop="static" tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header bg-primary text-white">
							<h3 class="modal-title" style="    margin: 0 auto;">회원가입</h3>
						</div>

						<div class="modal-body">
							
							<form action="#" class="modal-body form-inline justify-content-center">
							
							<div class="row" style="width: 100%;margin-top: 20px;">
							
								<input type="text" id="id" placeholder="ID"  autocomplete="off" class="form-control" style="width: 100%;margin-bottom: 20px">
								<input type="text" id="name" placeholder="NAME"   autocomplete="off" class="form-control" style="width: 100%;margin-bottom: 20px">
								<input type="password" id="pass1" placeholder="PASSWORD"   autocomplete="off" class="form-control" style="width: 100%;margin-bottom: 20px">
								<input type="password" id="pass2" placeholder="PASSWORD 확인" class="form-control"  autocomplete="off" style="width: 100%;margin-bottom: 20px">
							</div>
						</form>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-link" data-dismiss="modal" style="    font-size: 20px;color:black;
						
    font-weight: 100;">취소</button>
							<button type="button" class="btn btn-primary" id="id-submit" style="    font-size: 20px;
    font-weight: 100;">등록하기</button>
						</div>
					</div>
				</div>
			</div>
			
			
			
			
			
			
			
			
			
			
			
	
		










