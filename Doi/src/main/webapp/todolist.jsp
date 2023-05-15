<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="todolist.Todo" %>
<%@ page import="todolist.TodoDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="org.jsoup.select.Elements" %>

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
	<nav class="navbar navbar-default" style="padding-top: 0px;">
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
				<li class="active"><a href="todolist.jsp">일정</a></li>
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
	<%		
		int list_size = 1;
		TodoDAO todoDAO = new TodoDAO();
		Todo todo = new Todo();
		ArrayList<Todo> list = todoDAO.getList(userID);
		String now_temp = todo.Crawling(1);
		String now_stat = todo.Crawling(2);
		String now_etc = todo.Crawling(3);
		if (userID != null) {
			for(int i = 1; i < 11; i++) {
				if(list.get(0).getObject(i) == null || list.get(0).getObject(i).equals("")) {
					break;
				}
				list_size++;
			}
		}
	%>
	<div class="container" style="width:20%; float:right;">
		<br/>
		<table class = "table table" style = "width:40%; text-align: center; border: 3px solid #02aab0;">
			<thead>
			</thead>
			<tbody>
				<tr>
					<td><img src="image/weather/weather_<%=now_stat%>.png" style="width:270px; height:270px"><br/></td>
				</tr>
				<tr style="background: linear-gradient(135deg, #02aab0, #00cdac);">
					<td><h1 style="text-align:center; color:#ffffff; font-size: 50px;"> <%=now_temp%> </h1>
					<h4 style="color:#ffffff; text-align:center;"> <%=now_etc%> </h4></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class ="container" style="width:80%; height:100%">
		<br/><br/>
		<form method="post" action="todolist_add.jsp?object_number=<%=list_size%>">
			<br/><br/>
			<table class = "table table" style = "width:40%; text-align: center; border: 2px solid #0054ff">
				<thead>
					<tr>
						<th rowspan="2" colspan ="2" style = "background: linear-gradient(135deg, #00d8ff, #0054ff); color:#ffffff; text-align: center;">
						<%
							if (list_size < 11) {				
						%>
							<input type="text" class="form-control" placeholder="할 일을 추가해주세요." name="object_text" maxlength = "20" style="float:left; width:93%;">							
							<input type="submit" value ="+" style = "background-color: transparent; float:right; font-size: 25px; color: white; border: 0;">
						<%
							} else {
						%>
							<a style="text-align: center; width:100%; color:#ffffff;"> 더 이상 추가할 수 없습니다. </a>						
						<%
							}
						%>
						 </th>
					</tr>
				</thead>
				<tbody>
				<%
					if (userID != null) {
						for(int i = 1; i < 11; i++) {
							if(list.get(0).getObject(i) != null && !list.get(0).getObject(i).equals("")) {
				%>
					<tr>
						<td style="text-align: center;"><a> <%=list.get(0).getObject(i)%> </a>
						<a href="todolist_delete.jsp?select_index=<%=i%>" style="float:right;color:#FF0000;">✖️</a>
						</td>
					</tr>					
				<%
							}
						}
					}
				%>
				</tbody>
			</table>
		</form>	
	</div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"><</script>
	<script src="js/bootstrap.js"><</script>
</body>
</html>