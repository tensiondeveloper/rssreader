<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
	<link href="/resources/global_assets/css/icons/icomoon/styles.min.css" rel="stylesheet" type="text/css">
	<link href="/resources/assets/css/all.min.css" rel="stylesheet" type="text/css">
	<!-- /global stylesheets -->

	<!-- Core JS files -->
	<script src="/resources/global_assets/js/main/jquery.min.js"></script>
	<script src="/resources/global_assets/js/main/bootstrap.bundle.min.js"></script>
	<!-- /core JS files -->

	<!-- Theme JS files -->
 	<script src="/resources/global_assets/js/plugins/visualization/d3/d3.min.js"></script>
 	<script src="/resources/global_assets/js/plugins/visualization/d3/d3_tooltip.js"></script>
	<script src="/resources/global_assets/js/plugins/ui/moment/moment.min.js"></script>
	<script src="/resources/global_assets/js/plugins/pickers/daterangepicker.js"></script>

	<script src="/resources/assets/js/app.js"></script>
	<script src="/resources/global_assets/js/demo_pages/dashboard.js"></script>
	<script src="/resources/global_assets/js/demo_charts/pages/dashboard/light/streamgraph.js"></script>
	<script src="/resources/global_assets/js/demo_charts/pages/dashboard/light/sparklines.js"></script>
	<script src="/resources/global_assets/js/demo_charts/pages/dashboard/light/lines.js"></script>	
	<script src="/resources/global_assets/js/demo_charts/pages/dashboard/light/areas.js"></script>
	<script src="/resources/global_assets/js/demo_charts/pages/dashboard/light/donuts.js"></script>
	<script src="/resources/global_assets/js/demo_charts/pages/dashboard/light/bars.js"></script>
	
	<script src="/resources/global_assets/js/demo_charts/pages/dashboard/light/heatmaps.js"></script>
	<script src="/resources/global_assets/js/demo_charts/pages/dashboard/light/pies.js"></script>
	<script src="/resources/global_assets/js/demo_charts/pages/dashboard/light/bullets.js"></script>
	<script type="text/javascript">


$(document).ready(function() {
	$("#submitbtn").on('click',function(){
	
		 $("#writefrm").submit(); 
		
		
	})
	
})
	</script>
	<div class="content">
					<div class="row">
<form action="/file"  enctype="multipart/form-data" method="post" id="writefrm">
		<input type="text"name ="dong" style="margin-top: 10px;"placeholder="동">
			<input type="text"name ="ho" style="margin-top: 10px;"placeholder="호">
			<input type="file"name ="file" style="margin-top: 10px;" >
			
			<a id="submitbtn" class="btn btn-dark" style="float: right">등록</a>
	</form>
	</div></div>