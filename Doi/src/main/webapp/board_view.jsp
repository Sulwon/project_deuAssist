<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
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
		int b_ID = 0;
		if (request.getParameter("b_ID") != null) {
			b_ID = Integer.parseInt(request.getParameter("b_ID")); 
		}
		if (b_ID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 글 입니다.')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(b_ID);
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
			<br/><br/>
			<table class = "table table-striped" style = "text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan ="3" style = "background-color: #4374D9; color:#ffffff; ; text-align: center;">게시글</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2"><%= bbs.getB_Title().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%= bbs.getUserID() %></td>
					</tr>	
					<tr>
						<td>작성일</td>
						<td colspan="2"><%= bbs.getB_Date().substring(0,11) + bbs.getB_Date().substring(11,13) + ":" + bbs.getB_Date().substring(14,16) %></td>
					</tr>	
					<tr>
						<td colspan="2" style="min-height: 200px; text-align:mid;"><%= bbs.getB_Content().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
					</tr>		
				</tbody>		
			</table>
			<a href="board.jsp" class="btn btn-primary">목록</a>
			<%
				if(userID != null && userID.equals(bbs.getUserID())) {
			%>
				<a href="board_fix.jsp?b_ID=<%=b_ID%>" class ="btn btn-primary">수정</a>
				<a onclick = "return confirm('정말로 삭제하시겠습니까?')" href="board_deleteAction.jsp?b_ID=<%=b_ID%>" class ="btn btn-primary">삭제</a>
			<%
				}
			%>
			<input type="submit" class ="btn btn-primary pull-right" value ="글쓰기">	
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"><</script>
	<script src="js/bootstrap.js"><</script>
</body>
</html>