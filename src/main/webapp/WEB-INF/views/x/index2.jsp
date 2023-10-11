<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css" href="/resources/mba/slick/slick.css">
<link rel="stylesheet" type="text/css" href="/resources/mba/slick/slick-theme.css">


  <style type="text/css">
    html, body {
      margin: 0;
      padding: 0;
    }

    * {
      box-sizing: border-box;
    }

    .slider {
  /*       width: 50%; */
        margin: 0px auto;
    }

    .slick-slide {
      margin: 0px 10px;
    }

    .slick-slide img {
      width: 100%;
    }

    .slick-prev:before,
    .slick-next:before {
      color: black;
    }


    .slick-slide {
      transition: all ease-in-out .3s;
     /*  opacity: .2; */
    }
/*     
    .slick-active {
      opacity: .5;
    } */

    .slick-current {
      opacity: 1;
    }
     .content {
    margin: auto;
    padding: 20px 20px;
    width: auto;
  }

.slideshow {
	position: relative;
	width: 100%;
	/* height: 100%; */
	height: 1016px;
}
/* .slideshow img
{
    position: absolute;
    width: 100%;
    height: 100%;
    z-index:-1;
} */
.container-tem {
/* 	background: url('/resources/img/back_pc1.png'); */
	margin-right: auto;
	margin-left: auto;
	padding-left: 15px;
	padding-right: 15px;
	z-index: 300; 
	
	width: 1150px;
}

@media ( max-width : 768px) {
	.container-tem {
		width: 100%;
	}
}

@media ( max-width : 992px) {

	.container-tem {
		width: 100%;
	}
}

@media ( max-width : 1200px) {
	.container-tem {
		width: 100%;
	}
}


.slider-banner-fullwidth{

	height: 100% !important;
}



.loginbtn {
	background-color: #05366e;
    border-radius: 8px;
    cursor: pointer;
    color: white;
    font-size: 17px;
    padding: 18px 18px;
    text-decoration: none;
    float: right;
}

.loginbtn:active {
	position:relative;
	top:1px;
}

.separat{
	background: black;
    width: 96%;
    margin: 0 auto;
    top: 1px;
    height: 1px;
    float: left;
}
.separatorwhite{
background: white;
}

</style>

<img class="mhide" src="/resources/sample/maintest1.png">
<img class="pchide" src="/resources/sample/maintest2.png">
<!-- </div>  -->
 