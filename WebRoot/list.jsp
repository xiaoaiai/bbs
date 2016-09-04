<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.oracle.bbs_tra.DAO.*"%>
<%@page import="com.oracle.bbs_tra.model.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'list.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<Link rel="stylesheet" type="text/css" href="style/style.css" />

	</head>
	<% 
  String sub_boardid=request.getParameter("sub_boardid");
  SubBoardDAO subDAO = new SubBoardDAO();
  TopicDAO topicDAO = new TopicDAO();
  UsersDAO usersDAO =new UsersDAO();
  ReplyDAO replyDAO = new ReplyDAO();
  
 

  
  
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
			您尚未
			<a href="login.jsp">登录</a> &nbsp; &nbsp;
			<A href="reg.jsp">注册</A>
		</DIV>
		<%
}
else{


}
 %>

		<!--      主体        -->
		<DIV>
			<!--      导航        -->
			<br />
			<%
SubBoard subboard=subDAO.findnameByid(sub_boardid);

 %>
			<DIV>
				&gt;&gt;
				<B><a href="index.jsp">论坛首页</a>
				</B>&gt;&gt;
				<B><a href="list.jsp?sub_boardid=<%=subboard.getSub_boardid()%>"><%=subboard.getSub_boardname() %></a>
				</B>
			</DIV>
			<br />
			<!--      新帖        -->
			<DIV>
				<A href="post.jsp"><IMG src="image/post.gif" name="td_post"
						border="0" id=td_post>
				</A>
			</DIV>
			<!--         翻 页         -->
			<DIV>
				<a href="list.jsp">上一页</a>|
				<a href="list.jsp">下一页</a>
			</DIV>

			<DIV class="t">
				<TABLE cellSpacing="0" cellPadding="0" width="100%">
					<TR>
						<TH class="h" style="WIDTH: 100%" colSpan="4">
							<SPAN>&nbsp;</SPAN>
						</TH>
					</TR>
					<!--       表 头           -->
					<TR class="tr2">
						<TD>
							&nbsp;
						</TD>
						<TD style="WIDTH: 80%" align="center">
							文章
						</TD>
						<TD style="WIDTH: 10%" align="center">
							作者
						</TD>
						<TD style="WIDTH: 10%" align="center">
							回复
						</TD>
					</TR>
					<!--         主 题 列 表        -->
					<%
          
        List<Topic> topiclist = topicDAO.findtopicBysubid(sub_boardid);
        for(int i=0;i<topiclist.size();i++){
              Topic topic =topiclist.get(i);
              Users users =usersDAO.findByUid(topic.getUid());
              String count =replyDAO.findBytopicid(topic.getTopicid());
       
      
       %>

					<TR class="tr3">
						<TD>
							<IMG src="image/topic.gif" border=0>
						</TD>
						<TD style="FONT-SIZE: 15px">
							<A
								href="detail.jsp?topicid=<%=topic.getTopicid() %>&sub_boardid=<%=topic.getSubboardid() %>"><%=topic.getTitle() %></A>
						</TD>
						<TD align="center"><%=users.getUname() %></TD>
						<TD align="center"><%=count %></TD>
					</TR>
					<%
	}
	
	
	 %>
				</TABLE>
			</DIV>

			<!--            翻 页          -->
			<DIV>
				<a href="list.jsp">上一页</a>|
				<a href="list.jsp">下一页</a>
			</DIV>
		</DIV>
		<!--             声 明          -->
		<BR />
		<CENTER class="gray">
			Information Technology Co.,Ltd 版权所有
		</CENTER>

	</BODY>
</html>
