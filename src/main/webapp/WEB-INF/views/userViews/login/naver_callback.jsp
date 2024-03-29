<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/js/naver_login/naver_collback.js" var="navercollbackJS" />
<c:url value="/resources/js/naver_login/config/naver_login_config.js" var="naverJS" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>naver login callback</title>
		<script
			type="text/javascript"
			src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
			charset="utf-8"
		></script>
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	</head>
	<body>
		<form id="profile_form" action="<%=request.getContextPath()%>/user/login/naver" method="post">
			<input type="hidden" value="" name="social_id" id="profile_social_id" />
			<input type="hidden" value="" name="user_name" id="profile_user_name" />
			<input type="hidden" value="" name="user_email" id="profile_user_email" />
			<input type="hidden" value="" name="social_type" id="profile_social_type" />
		</form>

		<script src="${naverJS}"></script>
		<script src="${navercollbackJS}"></script>
	</body>
</html>
