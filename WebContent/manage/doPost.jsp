<%@page import="java.sql.Timestamp"%>
<%@page import="com.oracle.bbs.model.*"%>
<%@page import="com.oracle.bbs.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>处理发帖</title>
</head>
<body>
	<%
		//判断是否登录
		if (session.getAttribute("users") == null) {
			out.write("<script type='text/javascript'>");
			out.write("alert('请先登录!');");
			out.write("location.href='../login.jsp'");
			out.write("</script>");
			//跳转到登录页面
			//response.sendRedirect("../login.jsp");
			return;
		}

		//设置编码格式
		request.setCharacterEncoding("UTF-8");

		//获取提交信息
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String sub_boardid = request.getParameter("sub_boardid");
		String topicid = request.getParameter("topicid");

		Users loginUsers = (Users) session.getAttribute("users");

		//获取帖子的类型
		String topicType = request.getParameter("topicType");
		//判断是回帖还是发帖
		if ("post".equals(topicType)) { //发帖
			//创建DAO
			TopicDAO topicDAO = new TopicDAO();

			//封装信息
			Topic topic = new Topic();
			topic.setTitle(title);
			topic.setContent(content);
			topic.setPublishtime(new Timestamp(System.currentTimeMillis()));
			topic.setModifytime(new Timestamp(System.currentTimeMillis()));
			topic.setSub_boardid(Integer.parseInt(sub_boardid));
			topic.setUid(loginUsers.getUid());

			//执行发帖方法
			int rowCount = topicDAO.doAdd(topic);

			//跳转到相应页面
			if (rowCount == 1) {
				//跳转到list.jsp
				response.sendRedirect("../list.jsp?sub_boardid=" + sub_boardid);
			} else {
				//
				request.setAttribute("errorInfo", "发帖错误");
				request.getRequestDispatcher("../error.jsp").forward(request, response);
			}
		}

		if ("reply".equals(topicType)) { //回帖

			ReplyDAO replyDAO = new ReplyDAO();

			//封装数据
			Reply reply = new Reply();
			reply.setTitle(title);
			reply.setContent(content);
			reply.setPublishtime(new Timestamp(System.currentTimeMillis()));
			reply.setModifytime(new Timestamp(System.currentTimeMillis()));
			reply.setTopicid(Integer.parseInt(topicid));
			reply.setUid(loginUsers.getUid());

			//执行回帖方法
			int rowCount = replyDAO.doAdd(reply);

			//跳转到相应页面
			if (rowCount == 1) {
				//跳转到detal.jsp
				response.sendRedirect("../detail.jsp?sub_boardid=" + sub_boardid + "&topicid=" + topicid);
			} else {
				//
				request.setAttribute("errorInfo", "回帖错误");
				request.getRequestDispatcher("../error.jsp").forward(request, response);
			}
		}
	%>
</body>
</html>