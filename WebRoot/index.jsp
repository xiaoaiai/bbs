<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML>
<HEAD>
<%@page import="com.oracle.bbs_tra.model.*"%>
<%@page import="java.util.*"%>
<%@page import="com.oracle.bbs_tra.DAO.*"%>
<%@page import="java.sql.ResultSet;"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<TITLE>欢迎访问学员论坛</TITLE>
<Link rel="stylesheet" type="text/css" href="style/style.css" />
</HEAD>
<%
  BoardDAO boardDAO=new BoardDAO();
  SubBoardDAO subDAO=new SubBoardDAO();
  TopicDAO topDAO=new TopicDAO();
  UsersDAO usersDAO=new UsersDAO();
 
  List<Board> list = boardDAO.findAll();
  
 %>

<BODY>

<DIV>
	<IMG src="image/logo.jpg">
</DIV>
<!--      用户信息、登录、注册        -->
<%
Users loginusers =(Users) session.getAttribute("users");
if(loginusers==null ){
 %>
<DIV class="h">
	您尚未　<a href="login.jsp">登录</a>
	&nbsp; &nbsp; <A href="reg.jsp">注册</A> 
</DIV>
<%
}else{

 %>

<DIV class="h">
	    <%=loginusers.getUname() %></>您好!
	&nbsp;&nbsp; <A href="manage/doLogout.jsp">注销</A> 
</DIV>
<%
}
 %>

<!--      主体        -->
<DIV class="t">
	<TABLE cellSpacing="0" cellPadding="0" width="100%">
		<TR class="tr2" align="center">
			<TD colSpan="2">论坛</TD>
			<TD style="WIDTH: 10%;">主题</TD>
			<TD style="WIDTH: 30%">最后发表</TD>
		</TR>
		<% for(int i=0;i<list.size();i++){
		
		   Board board=list.get(i);
		   List<SubBoard> sublist = subDAO.findAll(board.getBoardid());
		
		%>
	<!--       主版块       -->
		
		<TR class="tr3">
			<TD colspan="4"><%=board.getBoardname() %></TD>
		</TR>
		
		<%
		
		 for(Iterator<SubBoard> iter = sublist.iterator(); iter.hasNext();) {
		   SubBoard subboard =iter.next();
		   String count = topDAO.findByid(subboard.getSub_boardid());
		   Topic title = topDAO.findLastBysub_boardid(subboard.getSub_boardid());
		   Users users=usersDAO.findByUid(title.getUid());
		   
		 
		 %>
	<!--       子版块       -->
		
		<TR class="tr3">
			<TD width="5%">&nbsp;</TD>
			<TH align="left">
				<IMG src="image/board.gif">
				<A href="list.jsp?loginusers=<%=loginusers%>&sub_boardid=<%=subboard.getSub_boardid()%>"><%=subboard.getSub_boardname() %></A>
			</TH>
			<TD align="center"><%=count %></TD>
			<TH>
				<SPAN>
					<A href="detail.jsp?"><%=title.getTitle() %></A>
				</SPAN>
				<BR/>
				<SPAN><%=users.getUname()%></SPAN>
				<SPAN class="gray"><%=title.getLastPublishTime() %></SPAN>
			</TH>
		</TR>
		<%
		}
		}
		
		 %>
		
		
		
	</TABLE>
</DIV>

<BR/>
<CENTER class="gray">
Information Technology Co.,Ltd 版权所有</CENTER>
</BODY>
</HTML>