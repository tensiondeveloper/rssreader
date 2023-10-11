<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<style type="text/css">

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
  font-size: 16px;
  font-weight: bold;
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


</style>
	
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>





<div class="login-page">
  <div class="form">
    <!-- <form class="register-form">
      <input type="text" placeholder="name"/>
      <input type="password" placeholder="password"/>
      <input type="text" placeholder="email address"/>
      <button>create</button>
    </form> -->
    <div>
    <span style="font-size: 27px;font-weight: bolder;">로그인</span>
    <div class="line3"></div>
    <span>연세대학교 MBA 총동창회 홈페이지에 오신 것을 환영합니다.</span>
    
    </div>
    <form class="login-form" name="f" action="/j_spring_security_check" method="post" >
    <input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>
      <input type="text" name="username" placeholder="username"/>
      <input type="password" name="password"placeholder="password"/>
      <button type="submit">로그인</button>
      <div style="    text-align: left;    margin-top: 5px;">
      <input type="checkbox" id="cb1">
      <label for="cb1"></label><span>로그인상태유지</span>
      
      </div>
      <p class="message" style="    border-top: 0px;"><a href="#">아이디 찾기</a>  | <a href="#">비밀번호 찾기</a></p>
    </form>
  </div>
</div>

















