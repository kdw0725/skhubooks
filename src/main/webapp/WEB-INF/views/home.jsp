<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ include file="/WEB-INF/views/include/bootstrap.jsp"%> --%>
<link rel="stylesheet" href="/webjars/bootstrap/3.3.4/dist/css/bootstrap.min.css">
<script src="/webjars/jquery/2.1.3/dist/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.4/dist/js/bootstrap.min.js"></script>
<%@ include file="/WEB-INF/views/include/headinclude.jsp"%>	

<html>
<head>
	<title>Home</title>
</head>
<body>
<h1 class="title"><b>Main</b></h1>
<%@ include file="/WEB-INF/views/include/headinclude2.jsp"%>
<sec:authorize access="isAnonymous()">
    <h5><a href='<c:url value="/member/logIn"/>'>LOGIN</a></h5>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
    <form action="/SKHUBooks/logout" method="POST">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <p><sec:authentication property="principal.username"/>님, 반갑습니다.</p>
        <button type="submit">LOGOUT</button>
    </form>
</sec:authorize>
</body>
</html>
