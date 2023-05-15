<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
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
		if (!userID.equals(bbs.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글의 권한이 없습니다.')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");			
		} else {
			BbsDAO bbsDAO = new BbsDAO();
			int result = bbsDAO.delete(b_ID);
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alery('데이터베이스 오류가 발생하였습니다.')");
				script.println("history.back()");
				script.println("</script>");					
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'board.jsp'");
				script.println("</script>");					
			}
		}
	%>	
</body>
</html>