
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML>
<%@ page language="java" import="java.util.*,com.oracle.bbs_tra.model.*" pageEncoding="utf-8"%>
<HEAD>
<TITLE>学员论坛--登录</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gbk">
<Link rel="stylesheet" type="text/css" href="../style/style.css"/>
</HEAD>

<BODY>
<DIV>
	&ldquo;<IMG src="image/logo.gif">
</DIV>

<!--      用户信息、登录、注册        -->

<%
   request.setCharacterEncoding("utf-8");





 %>
<DIV class="h">
	您尚未　<a href="login.jsp">登录</a>
	&nbsp;| &nbsp; <A href="reg.jsp">注册</A> |
</DIV>



<BR/>
<!--      导航        -->
<DIV>
	&gt;&gt;<B><a href="index.jsp">论坛首页</a></B>
</DIV><BR/>
<!--      错误信息        -->
<DIV class="t" align="center">
	<BR/>
	<font color="red"><%=request.getAttribute("error") %></font>
	<font color="red"><%//=%></font>
	<BR/><BR/>
	<input type="button" value="返 回" onclick="window.history.back();" class="btn"/>
	<BR/><BR/>
</DIV>
<!--      声明        -->
<BR/>
<CENTER class="gray">
Information Technology Co.,Ltd 版权所有</CENTER>
</BODY>
</HTML>
