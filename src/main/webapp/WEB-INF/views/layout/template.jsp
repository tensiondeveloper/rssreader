<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>LOGIN</title>

	<!-- Global stylesheets -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
	<link href="/resources/global_assets/css/icons/icomoon/styles.min.css" rel="stylesheet" type="text/css">
	<link href="/resources/assets/css/all.min.css" rel="stylesheet" type="text/css">
	<!-- /global stylesheets -->

	<!-- Core JS files -->
	<script src="/resources/global_assets/js/main/jquery.min.js"></script>
	<script src="/resources/global_assets/js/main/bootstrap.bundle.min.js"></script>
	<!-- /core JS files -->

	<!-- Theme JS files -->

	<!-- /theme JS files -->

</head>

<body>

	<!-- Main navbar -->


	<!-- Page content -->
	<div class="page-content">
		<tiles:insertAttribute name="side" />
		


		<!-- Main content -->
		
		<tiles:insertAttribute name="contents" />
	</div>
	<!-- /page content -->

</body>
</html>
