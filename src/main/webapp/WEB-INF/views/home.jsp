<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ include file="/WEB-INF/views/include/security.jsp"%> --%>

<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<h2><a href="board/boardList">boardList</a></h2>
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
