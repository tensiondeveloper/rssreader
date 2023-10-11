<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page import="org.springframework.security.core.Authentication"%>



<!-- main start -->

<div class="main col-md-12" style="position: relative;">

	<!-- page-title start -->
	<!-- ================ -->
	<div>
		<ol class="breadcrumb">
			<li><i class="fa fa-home pr-10"></i><a href="index.html">Home</a></li>
			<li class="active">문의·요청 내역</li>
			<li class="active active ftbold board_title">문의·요청 내역</li>
		</ol>

		<h2 class="page-title board_title">문의·요청 내역</h2>
	</div>
	<div class="separator-2 clear"></div>

	<!-- page-title end -->
	<h2>${contents.board_title}</h2>
	<div class="separator-3 clear"></div>
<%-- 	<c:if test="${not empty contents.board_filename}">
		<div style="text-align: right">
			<a href="boardfiledown?filename=${contents.board_filename}"
				target="_blank"><img src="/resources/img/disk.png"
				align="middle" style="width: 15px; display: inline;"><span>${contents.board_filename}</span></a>

		</div>
	</c:if> --%>
	<div>${contents.board_content}</div>
	<div style="text-align: right">
		<sec:authentication property="name" var="secName" />

		<sec:authorize access="${secName==contents.id}">
		
		</sec:authorize>





		<a href="/contactus" type="submit"
			class="btn btn-dark">목록</a>
	</div>



	<ul class="list-group" style="margin-top: 10px;">

		<li id="note-title" class="list-group-item note-title">
			<h3 class="panel-title">
				댓글 <span id="note-count">${fn:length(reply) }</span>
			</h3>
		</li>
		<c:forEach var="reply" items="${reply}" varStatus="status">
			<li class="list-group-item note-item clearfix" id="note-1968671">


				<div class="avatar avatar-medium clearfix ">
					<a class="nickname" href="/user/info/74476" title=""
						style="float: left">${reply.id}</a>
					<div class="date-created" style="float: right">
						<span class="timeago" title="${reply.reply_date}">${reply.reply_date}</span>
					</div>
				</div>
				<fieldset class="form">
					<article id="note-text-1968671"
						class="list-group-item-text note-text">
						${reply.reply_content}</article>
				</fieldset>

				<form action="/content/delete/1968671" method="post"
					id="note-delete-form-1968671">
					<input type="hidden" name="_method" value="DELETE" id="_method">
				</form>
			</li>
		</c:forEach>










		<li class="list-group-item note-form clearfix">
			<form action="/contact_replyadd?${_csrf.parameterName}=${_csrf.token}"
				method="post" class="note-create-form">
				<input type="hidden" name="board_seq" value="${contents.board_seq}">
				<div class="">
					<textarea class="form-control" style="width: 100%" name="content"></textarea>
				</div>
				<div style="text-align: right">
					<button type="submit" class="btn btn-dark"
						style="margin-right: 10px;">등록</button>
				</div>
			</form>
		</li>
	</ul>

</div>
<!-- main end -->
<!-- sidebar start -->
<!-- ================ -->
