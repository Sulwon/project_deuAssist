<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="todolist.Todo" %>
<%@ page import="todolist.TodoDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />
<jsp:setProperty name="user" property="userName" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Do I</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		if (user.getUserName() == null || user.getUserID() == null || user.getUserPassword() == null 
				|| user.getUserGender() == null || user.getUserEmail() == null ) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원 정보에 공백이 존재합니다.')");
			script.println("history.back()"); //이전 페이지 콜			
			script.println("</script>");
		} else {
			UserDAO userDAO = new UserDAO();
			int result = userDAO.register(user);
			if (result == -1) { //에러의 경우는 기본키 중복
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.')");
				script.println("history.back()"); //이전 페이지 콜			
				script.println("</script>");
			}
			else {
				session.setAttribute("userID", user.getUserID());
				TodoDAO todoDAO = new TodoDAO();
				int dummy = todoDAO.create_todo(user.getUserID());	
				PrintWriter script = response.getWriter(); 
				script.println("<script>");
				script.println("location.href = 'main.jsp'"); //성공			
				script.println("</script>");
			}
		}
	%>	
</body>
</html>