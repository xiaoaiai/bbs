<%@page import="com.oracle.bbs.model.Users"%>
<%@page import="com.oracle.bbs.dao.UsersDAO"%>
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

		//1.获取登录信息
		String uName = request.getParameter("uName");
		String uPass = request.getParameter("uPass");

		//2.创建dAO
		UsersDAO usersDAO = new UsersDAO();

		//3.调用登录验证方法
		Users users = usersDAO.checkLogin(uName, uPass);

		//4.判断执行结果
		if (users != null) { //登录成功
			//5.跳转到相应页面
			//保存登录信息
			session.setAttribute("users", users);
			response.sendRedirect("../index.jsp");

		} else { //登录不成功
			//5.跳转到相应页面
			//保存错误信息
			request.setAttribute("errorInfo", "用户名密码错误");
			request.getRequestDispatcher("../error.jsp").forward(request, response);
		}
	%>
</body>
</html>