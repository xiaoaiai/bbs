<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<Link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style/style.css" />
</head>
<body>

	<!--      用户信息、登录、注册        -->

	<DIV class="h">
		您尚未 <a href="login.jsp">登录</a> &nbsp;| &nbsp; <A href="reg.jsp">注册</A>
		|
	</DIV>

	<DIV class="h">
		您好： 张三 &nbsp;| &nbsp; <A href="manage/doLogout.jsp">登出</A> |
	</DIV>


	<BR />
	<!--      导航        -->
	<DIV>
		&gt;&gt;<B><a href="index.jsp">论坛首页</a></B>
	</DIV>
	<BR />
	<!--      错误信息        -->
	<DIV class="t" align="center">
		<BR /> <font color="red">错误信息:<%=request.getAttribute("errorInfo")%></font>
		<BR /> <BR /> <input type="button" value="返 回"
			onclick="window.history.back();" class="btn" /> <BR /> <BR />
	</DIV>
	<!--      声明        -->
	<BR />
	<CENTER class="gray">Information Technology Co.,Ltd 版权所有</CENTER>
</body>
</html>