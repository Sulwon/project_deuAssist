<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Iterator" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/default.css">
<title>Do I</title>
</head>
<body>
	<%
		String userID = null;	
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>				
			</button>
			<a class="navbar-brand" href="main.jsp"> &lt; 동의대 학업 도우미 &gt; </a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-mid">
				<li class="active"><a href="main.jsp">메인</a></li>
				<li><a href="todolist.jsp">일정</a></li>
				<li><a href="board.jsp">게시판</a></li>	
			</ul>
			<%
				if(userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">로그인<span class="caret"></span> </a>
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a></li>
						<li><a href="register.jsp">회원가입</a></li>					
					</ul>
				</li>				
			</ul>
			<%
				} else {
			%>			
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"><%=userID%> 님<span class="caret"></span> </a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>					
					</ul>
				</li>				
			</ul>			
			<%
				}
			%>
		</div>	
	</nav>
	<div class="container" style="width: 100%;">
		<div id="myCarousel" class="carousel slide" data-ride="carousel" style="float:left;">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1" ></li>
				<li data-target="#myCarousel" data-slide-to="2" ></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<a href="https://www.deu.ac.kr/www"><img src="image/1.png"></a>
				</div>
				<div class="item">
					<a href="https://www.deu.ac.kr/www"><img src="image/2.png"></a>
				</div>
				<div class="item">
					<a href="https://www.deu.ac.kr/www"><img src="image/3.png"></a>
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>	
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>	
		</div>
	</div>
	<hr>
	<div class="row">
		<div class="col-md-2">
			<img src="image/4.png"></img>
		</div>
		<br/>
		<div class="col-md-3">
			<table class = "table table-striped" style = "text-align: center; border: 1px solid #4374D9">
				<thead>
					<tr>
						<th colspan ="3" style = "background-color: #4374D9; color:#ffffff; text-align: center;">DAP 시스템</th>
					</tr>
				</thead>
				<tbody> 
					<tr>
						<td style = "text-align: left;"> 학생경력관리포탈시스템(DAP)은 PRIME사업에서 요구하는 전공 및 교양, 비교과과정 개편에 따른 역량중심 교육과정을 유연하게 반영 및 관리합니다.
						<p><a class="btn btn-default" style = "background-color: #D9E5FF; color:#003399; text-align: center; float:right;" href="https://dap.deu.ac.kr/"> 바로가기 </a></p></td>
					</tr>	
				</tbody>		
			</table>
		</div>	
		<div class="col-md-3">
			<table class = "table table-striped" style = "text-align: center; border: 1px solid #4374D9">
				<thead>
					<tr>
						<th colspan ="3" style = "background-color: #4374D9; color:#ffffff; text-align: center;">DOOR 시스템</th>
					</tr>
				</thead>
				<tbody> 
					<tr>
						<td style = "text-align: left;"> 동의대학교 내/외부의 콘텐츠의 배포 및 공유를 활성화하고, 플립러닝 현장에서 쉽게 활용하기 위한 교육 인프라를 제공하며, 어디서나 사전/사후학습이 가능한 환경을 제공하는 시스템입니다.
						<p><a class="btn btn-default" style = "background-color: #D9E5FF; color:#003399; text-align: center; float:right;" href="https://door.deu.ac.kr/"> 바로가기 </a></p></td>
					</tr>	
				</tbody>		
			</table>
		</div>	
		<div class="col-md-3">
			<table class = "table table-striped" style = "text-align: center; border: 1px solid #4374D9">
				<thead>
					<tr>
						<th colspan ="3" style = "background-color: #4374D9; color:#ffffff; text-align: center;">생활관</th>
					</tr>
				</thead>
				<tbody> 
					<tr>
						<td style = "text-align: left;"> 새로운 세대의 사고와 삶의 방식에 부합되는 기숙사 경영 및 운영을 통해 최적의 면학환경에서 편리하게 생활 할 수 있도록 최대의 편의를 제공하도록 노력하겠습니다.
						<p><a class="btn btn-default" style = "background-color: #D9E5FF; color:#003399; text-align: center; float:right;" href="https://dorm.deu.ac.kr/"> 바로가기 </a></p></td>
					</tr>	
				</tbody>		
			</table>
		</div>
		<div class="col-md-1"></div>
	</div>
	<footer style="background-color: #000000; color: #ffffff">
		<div class="container">
			<br/>
			<div class="row">
				<div class="col-sm-2" style="text-align: center;" ><h5>Copyright &copy; 2021</h5></div>
				<div class="col-sm-2" style="text-align: center;" ><h5>소프트웨어공학 B7조</h5></div>
				<div class="col-sm-3"></div>
				<div class="col-sm-2" style="text-align: right;"><h4>팀원 목록</h4></div>
				<div class="col-sm-3"><p>20173063 장태민　　　20173102 이성훈　　　20193045 이소정　　　20193049 김지영</p></div>
			</div>
		</div>
	 </footer>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"><</script>
	<script src="js/bootstrap.js"><</script>
</body>
</html>