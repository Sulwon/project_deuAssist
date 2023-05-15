<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
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
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="todolist.jsp">일정</a></li>
				<li class="active"><a href="board.jsp">게시판</a></li>	
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
	
	<div class ="container">
		<div class ="row">
			<form method="post" action="board_writeAction.jsp">
				<br/><br/>
				<table class = "table table-striped" style = "text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan ="2" style = "background-color: #4374D9; color:#ffffff; ; text-align: center;">게시판 작성</th>
						</tr>
					</thead>
					<tbody>
						<tr>						
							<td><input type="text" class="form-control" placeholder="글 제목" name="b_Title" maxlength = "50"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="b_Content" maxlength = "2048" style="height: 350px;"></textarea></td>
						</tr>					
					</tbody>		
				</table>
				<input type="submit" class ="btn btn-primary pull-right" value ="글쓰기">
			</form>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"><</script>
	<script src="js/bootstrap.js"><</script>
</body>
</html>