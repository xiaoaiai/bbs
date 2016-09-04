<%@page import="com.oracle.bbs.dao.ReplyDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.oracle.bbs.model.Reply"%>
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
		//0.设置编码格式
		request.setCharacterEncoding("UTF-8");

		//1.获取提交的信息
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String replyid = request.getParameter("replyid");

		String topicid = request.getParameter("topicid");
		String sub_boardid = request.getParameter("sub_boardid");

		//2.封装数据
		Reply reply = new Reply();
		reply.setReplyid(Integer.parseInt(replyid));
		reply.setTitle(title);
		reply.setContent(content);
		reply.setModifytime(new Timestamp(System.currentTimeMillis()));

		//3.创建DAO
		ReplyDAO replyDAO = new ReplyDAO();

		//4.调用修改方法
		int rowCount = replyDAO.doUpdate(reply);

		//5.判断执行结果
		if (rowCount == 1) {
			//跳转到detail.jsp?sub_boardid=11&topicid=1
			response.sendRedirect("../detail.jsp?sub_boardid=" + sub_boardid + "&topicid=" + topicid);
		} else {
			//6.跳转到相应页面
			request.setAttribute("errorInfo", "修改错误");
			request.getRequestDispatcher("../error.jsp").forward(request, response);
		}
	%>
</body>
</html>