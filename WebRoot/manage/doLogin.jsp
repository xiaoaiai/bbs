<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="com.oracle.bbs_tra.DAO.*" %>
<%@page import="com.oracle.bbs_tra.model.*" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dologin.jsp' starting page</title>
   

  </head>
  <%
   request.setCharacterEncoding("utf-8");
   String uName=request.getParameter("uName");
   String uPass=request.getParameter("uPass");
   UsersDAO usersDAO =new UsersDAO();
   Users users= usersDAO.findexitBy(uName,uPass);
   if(users ==null ){
   
    request.setAttribute("error","用户名或密码错误");
    request.getRequestDispatcher("error.jsp").forward(request,response);
   
   }else{
  	session.setAttribute("users",users);
  	  response.sendRedirect("../index.jsp"); 
   
   }
   
   
   
   
   
   
   %>
  
  <body>
    <br>
  </body>
</html>
