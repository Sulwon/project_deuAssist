<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="todolist.Todo" %>
<%@ page import="todolist.TodoDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%
request.setCharacterEncoding("UTF-8");
%>

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
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요한 기능입니다.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");			
		}	
		if (request.getParameter("object_text") == null || request.getParameter("object_text").equals("")) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alery('할 일을 적어주세요.')");
				script.println("history.back()");
				script.println("</script>");
		} else {
			TodoDAO todoDAO = new TodoDAO();
			int result = todoDAO.fix_todo(userID, request.getParameter("object_number"), request.getParameter("object_text"));
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alery('데이터베이스 오류가 발생하였습니다.')");
				script.println("history.back()");
				script.println("</script>");					
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'todolist.jsp'");
				script.println("</script>");					
			}
		}
	%>	
</body>
</html>