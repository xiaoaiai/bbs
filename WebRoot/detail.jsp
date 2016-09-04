<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.oracle.bbs_tra.DAO.*" %>
<%@page import="com.oracle.bbs_tra.model.*" %>

<%@page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'detail.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<Link rel="stylesheet" type="text/css" href="style/style.css" />

  </head>
  <%
     String topicid=request.getParameter("topicid");
    String sub_boardid=request.getParameter("sub_boardid");
     TopicDAO topicDAO =new TopicDAO();
     SubBoardDAO subDAO = new SubBoardDAO();
     UsersDAO usersDAO = new UsersDAO(); 
     ReplyDAO replyDAO = new ReplyDAO();
    
     
     
  
  
   %>
  
<DIV>
	<IMG src="image/logo.jpg">
</DIV>
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
<!--      主体        -->
<DIV><br/>
	<!--      导航        -->
	<%
  SubBoard subboard= subDAO.findnameByid(sub_boardid);
	
	 %>
<DIV>
	&gt;&gt;<B><a href="index.jsp">返回首页</a></B>&gt;&gt;
	<B><a href="list.jsp"><%= subboard.getSub_boardname()%></a></B>
</DIV>
	<br/>
	<!--      回复、新帖        -->
	<DIV>
		<A href="post.jsp"><IMG src="image/reply.gif"  border="0" id=td_post></A> 
		<A href="post.jsp"><IMG src="image/post.gif"   border="0" id=td_post></A>
	</DIV>
	<!--         翻 页         -->
	<DIV>
		<a href="detail.jsp">上一页</a>|
		<a href="detail.jsp">下一页</a>
	</DIV>
	<!--      本页主题的标题        -->
	<%
	Topic topic=topicDAO.findnameByid(topicid);
	
	 %>
	
	<DIV>
		<TABLE cellSpacing="0" cellPadding="0" width="100%">
			<TR>
				<TH class="h">本页主题:<%=topic.getTitle() %></TH>
			</TR>
			<TR class="tr2">
				<TD>&nbsp;</TD>
			</TR>
		</TABLE>
	</DIV>
	
	<!--      主题        -->
	<%
	Users users =usersDAO.findByUid(topic.getUid());
	
	
	 %>
	
	<DIV class="t">
		<TABLE style="BORDER-TOP-WIDTH: 0px; TABLE-LAYOUT: fixed" cellSpacing="0" cellPadding="0" width="100%">
			<TR class="tr1">
				<TH style="WIDTH: 20%">
					<B><%=users.getUname() %></B><BR/>
					<img src="image/head/2.gif"/><BR/>
					<%=users.getRegtime() %><BR/>
				</TH>
				<%
				
				
				 %>
				<TH>
					<H4><%=topic.getTitle() %></H4>
					<DIV><%=topic.getContent() %></DIV>
					<DIV class="tipad gray">
						发表：[<%=topic.getPublishTime() %>] &nbsp;
						最后修改:[<%=topic.getModifyTime() %>]
					</DIV>
				</TH>
				<%
				
				
				 %>
			</TR>
		</TABLE>
	</DIV>
	
	<!--      回复        -->
	<%
	List<Reply> replylist =replyDAO.findByid(topic.getTopicid());
	for(int i=0;i<replylist.size();i++){
	   Reply reply =replylist.get(i);
	   
	
	 %>
	<DIV class="t">
		<TABLE style="BORDER-TOP-WIDTH: 0px; TABLE-LAYOUT: fixed" cellSpacing="0" cellPadding="0" width="100%">
			<TR class="tr1">
			<%
			users = usersDAO.findByUid(reply.getUid());
			 %>
				<TH style="WIDTH: 20%">
					<B><%=users.getUname()%></B><BR/><BR/>
					<img src="image/head/2.gif"/><BR/>
					注册:<%=users.getRegtime() %><BR/>
				</TH>
				<TH>
					<H4><%=reply.getTitle() %></H4>
					<DIV><%=reply.getContent() %></DIV>
					<DIV class="tipad gray">
						发表：[<%=reply.getPublishtime() %>] &nbsp;
						最后修改:[<%=reply.getModifytime() %>]
						<A href="manage/doDeleteReply.jsp">[删除]</A>
						<A href="update.jsp">[修改]</A>
					</DIV>
				</TH>
			</TR>
		</TABLE>
	</DIV>
	<%
}	
	
	}
	 %>
</DIV>
 
<!--      声明        -->
<BR>
<CENTER class="gray">
Information Technology Co.,Ltd 版权所有</CENTER>
</BODY>

</html>
