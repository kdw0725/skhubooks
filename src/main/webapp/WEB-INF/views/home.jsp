 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<html>
<head>
	<link rel="stylesheet" href="/SKHUBooks/resources/bootstrap/css/animate.min.css">
	<link rel="stylesheet" href="/SKHUBooks/resources/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/SKHUBooks/resources/bootstrap/css/font-awesome.min.css">
	<link rel="stylesheet" href="/SKHUBooks/resources/bootstrap/css/lightbox.css">
	<link rel="stylesheet" href="/SKHUBooks/resources/bootstrap/css/main.css">
	<link rel="stylesheet" href="/SKHUBooks/resources/bootstrap/css/prettyPhoto.css">
	<link rel="stylesheet" href="/SKHUBooks/resources/bootstrap/css/responsive.css">
	<style type="text/css">
		p{color: gray;}
		g{color: green;}
		x{color: #a1d19b;}
		black{color: black;}
		blue{color : blue;}
		red{color : red;}
		white{color : white;}
	</style>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <title>SKHUBooks</title>
    
    
</head>

<body>
<header id="header">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 overflow">
                   <div class="social-icons pull-right">
                        <ul class="nav nav-pills">
							<sec:authorize access="isAnonymous()">
								<li><a href="/SKHUBooks/member/logIn"><h5><b><x>LOGIN　</x></b></h5></a></li>
	                            <li><a href="/SKHUBooks/member/signIn"><h5><b><x>JOIN　</x></b></h5></a></li>
							</sec:authorize>
							<sec:authorize access="isAuthenticated()">
								<li>
									 <form action="/SKHUBooks/logout" method="POST">
								        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								        	<b><sec:authentication property="principal.username"/></b>님, 반갑습니다. &nbsp;&nbsp;
								        <button type="submit" class="btn btn-sm btn-default">LOGOUT</button>
								    </form>
								</li>
							</sec:authorize>
                        </ul>
                    </div>
                </div>
             </div>
        </div>
        <div class="navbar navbar-inverse" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <a class="navbar-brand" href="/SKHUBooks/">
                        <h1><img src="/SKHUBooks/resources/bootstrap/images/logo.PNG" alt="logo"></h1>
                    </a>

                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="active"><a href="/SKHUBooks/"><h3><b><x>Home</x></b></h3></a></li>
						<li><a href="/SKHUBooks/board/boardList"><h3><b><p>공지사항</p></b></h3></a></li>
                        <li><a href="/SKHUBooks/book/bookSearch"><h3><p><b>자료 검색</b></p></h3></a></li>
                        

                        <sec:authorize access="hasRole('ROLE_ADMIN')">
	                        <li class="dropdown"><a><h3><b><p>도서 관리<i class="fa fa-angle-down "></i></p></b></h3></a>
	                          <ul role="menu" class="sub-menu">
	                              <li><a href="/SKHUBooks/loan/memberCheck">대출</a></li>
	                              <li><a href="/SKHUBooks/loan/returnpage">반납</a></li>
	                          </ul>
	                        </li>
                        </sec:authorize>
						<sec:authorize access="hasRole('ROLE_USER')">
							<sec:authentication property='principal.username' var="logInID"/>
							<li><a href="/SKHUBooks/member/myInfo?member_id=${logInID }"><h3><b><p>내 정보 확인</p></b></h3></a></li>
						</sec:authorize>
						
						<sec:authorize access="isAnonymous()">
							<li><a href="/SKHUBooks/member/myInfo"><h3><b><p>내 정보 확인</p></b></h3></a></li>
						 </sec:authorize>
						
                        <li class="dropdown"><a><h3><b><p>게시판<i class="fa fa-angle-down "></i></p></b></h3></a>
                          <ul role="menu" class="sub-menu">
                              <li><a href="/SKHUBooks/qna/qnaList">Q & A</a></li>
                              <li><a href="/SKHUBooks/qna/fna">자주 하는 질문</a></li>
                          </ul></li>

                    </ul>
                </div>
                    </form>
                </div>
            </div>
        </div>
    </header>
    
    
<section id="home-slider">
	<img alt="" src="/SKHUBooks/resources/bootstrap/images/home/slider-bg.png" style="max-width: 100%;">
</section>

<section id="services" > <!-- style="background: #f5f0c5;" -->
        <div class="container">
            <div class="row">
              <br/><br/>
                  <h2><strong><qq>신착도서</qq></strong></h2>
                <c:forEach var="newBook" varStatus="i" items="${newBook }">
                  <div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="600ms" onclick="bookDetail(${newBook.BOOK_NO})">
	                  <img src="/SKHUBooks/resources/bootstrap/images/upload/${newBook.FILE_NAME }" alt="등록된 이미지가 없습니다." class="newBook">
	                  <p><h4><p>${newBook.BOOK_NAME }</p></h4></p>
                  </div>
                  
                  </c:forEach>
            </div>
        </div>
    </section>
	<section id="action" class="responsive">
        <div class="vertical-center">
             <div class="container">
                <div class="row">
                    <div class="action take-tour">
                        <div class="col-sm-7 wow fadeInLeft" data-wow-duration="500ms" data-wow-delay="300ms">
                        </div>

                        <div class="col-sm-5 text-center wow fadeInRight" data-wow-duration="500ms" data-wow-delay="300ms">
                        </div>
                    </div>
                </div>
            </div>
        </div>
   </section>
	<section id="blog" class="padding-top">
	        <div class="container">
	            <div class="row">
	                <div class="col-md-9 col-sm-7">
	                    <div class="row">
		
	                    </div>
		
	
                <div class="col-md-3 col-sm-5">
                    <div class="sidebar blog-sidebar">
	
                        <div class="sidebar-item categories">
                            <h2><strong>공지사항</strong></h2>
                            <ul class="nav navbar-stacked">
                            	<c:forEach var="list" varStatus="i" items="${list }">
                            		<li><a href="/SKHUBooks/board/boardDetail?board_no=${list.board_no }">${list.board_title }</a></li>
                            	</c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>	

</body>
<script>
function bookDetail(book_no){
	location.href="/SKHUBooks/book/bookDetail?book_no="+book_no;
}
</script>
</html>
