<%@page import="com.oracle.bbs.dao.ReplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//获取传递的参数
		String replyid = request.getParameter("replyid");
		String sub_boardid = request.getParameter("sub_boardid");
		String topicid = request.getParameter("topicid");

		//创建DAO
		ReplyDAO replyDAO = new ReplyDAO();

		//执行删除方法
		int rowCount = replyDAO.doDelete(replyid);

		//跳转到相应页面
		if (rowCount == 1) {
			//跳转到list.jsp
			response.sendRedirect("../detail.jsp?sub_boardid="+sub_boardid+"&topicid=" + topicid);
		} else {
			//
			request.setAttribute("errorInfo", "删除失败");
			request.getRequestDispatcher("../error.jsp").forward(request, response);
		}
	%>
</body>
</html>