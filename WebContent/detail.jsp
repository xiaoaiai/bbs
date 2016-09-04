<%@page import="java.util.List"%>
<%@page import="com.oracle.bbs.model.*"%>
<%@page import="com.oracle.bbs.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<Link rel="stylesheet" type="text/css" href="style/style.css" />
</head>
<%
	TopicDAO topicDAO = new TopicDAO();
	UsersDAO usersDAO = new UsersDAO();
	ReplyDAO replyDAO = new ReplyDAO();

	//获取topicid
	String topicid = request.getParameter("topicid");
	//获取suboardid
	String sub_boardid = request.getParameter("sub_boardid");

	//分页
	int currentPage = 1;
	int pageNome = 3;

	//根据topicid获取回帖数
	int allRow = replyDAO.findCountByTopicId(topicid);

	//总页数 
	int allPage = allRow % pageNome == 0 ? allRow / pageNome : allRow / pageNome + 1;

	if (request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	//解决上一页问题
	if (currentPage <= 0) {
		currentPage = 1;
	}
	//解决下一页问题
	if (currentPage >= allPage && allPage != 0) {
		currentPage = allPage;
	}

	List<Reply> replyList = replyDAO.findAllByTopicId(currentPage, topicid);
%>
<body>
	<DIV>
		<IMG src="image/logo.jpg">
	</DIV>

	<!--      用户信息、登录、注册        -->

	<DIV class="h">
		您尚未 <a href="login.jsp">登录</a> &nbsp;| &nbsp; <A href="reg.jsp">注册</A>
		|
	</DIV>

	<!--      主体        -->
	<DIV>
		<br />
		<!--      导航        -->
		<DIV>
			&gt;&gt;<B><a href="index.jsp">论坛首页</a></B>&gt;&gt; <B><a
				href="list.jsp">灌水乐园</a></B>
		</DIV>
		<br />
		<!--      回复、新帖        -->
		<DIV>
			<A
				href="post.jsp?sub_boardid=<%=sub_boardid%>&topicid=<%=topicid%>&topicType=reply"><IMG
				src="image/reply.gif" border="0" id=td_post></A> <A
				href="post.jsp"><IMG src="image/post.gif" border="0" id=td_post></A>
		</DIV>
		<!--         翻 页         -->
		<DIV>
			<a
				href="detail.jsp?sub_boardid=<%=sub_boardid%>&topicid=<%=topicid%>&currentPage=<%=currentPage - 1%>">上一页</a>|
			<a
				href="detail.jsp?sub_boardid=<%=sub_boardid%>&topicid=<%=topicid%>&currentPage=<%=currentPage + 1%>">下一页</a>
		</DIV>
		<%
			Topic topic = topicDAO.findById(topicid);
			Users topicUsers = usersDAO.findByUid(topic.getUid());
		%>
		<!--      本页主题的标题        -->
		<DIV>
			<TABLE cellSpacing="0" cellPadding="0" width="100%">
				<TR>
					<TH class="h">本页主题: <%=topic.getTitle()%></TH>
				</TR>
				<TR class="tr2">
					<TD>&nbsp;</TD>
				</TR>
			</TABLE>
		</DIV>

		<!--      主题        -->
		<%
			if (currentPage == 1) {
		%>
		<DIV class="t">
			<TABLE style="BORDER-TOP-WIDTH: 0px; TABLE-LAYOUT: fixed"
				cellSpacing="0" cellPadding="0" width="100%">
				<TR class="tr1">
					<TH style="WIDTH: 20%"><B><%=topicUsers.getUname()%></B><BR />
						<img src="image/head/<%=topicUsers.getUhead()%>" /><BR /> 注册:<%=topicUsers.getRegtime()%><BR /></TH>
					<TH>
						<H4><%=topic.getTitle()%></H4>
						<DIV><%=topic.getContent()%></DIV>
						<DIV class="tipad gray">
							发表：[<%=topic.getPublishtime().toString().substring(0, 19)%>>]
							&nbsp; 最后修改:[<%=topic.getModifytime().toString().substring(0, 19)%>]
						</DIV>
					</TH>
				</TR>
			</TABLE>
		</DIV>
		<%
			}
		%>
		<!--      回复        -->

		<%
			for (int i = 0; i < replyList.size(); i++) {
				Reply reply = replyList.get(i);

				Users replyUsers = usersDAO.findByUid(reply.getUid());
		%>
		<DIV class="t">
			<TABLE style="BORDER-TOP-WIDTH: 0px; TABLE-LAYOUT: fixed"
				cellSpacing="0" cellPadding="0" width="100%">
				<TR class="tr1">
					<TH style="WIDTH: 20%"><B><%=replyUsers.getUname()%></B><BR />
						<BR /> <img src="image/head/<%=replyUsers.getUhead()%>" /><BR />
						注册:<%=replyUsers.getRegtime()%><BR /></TH>
					<TH>
						<H4><%=reply.getTitle()%></H4>
						<DIV><%=reply.getContent()%></DIV>
						<DIV class="tipad gray">
							发表：[<%=reply.getPublishtime().toString().substring(0, 19)%>]
							&nbsp; 最后修改:[<%=reply.getModifytime().toString().substring(0, 19)%>]
							<%
							//判断登录的用户是否为回帖的用户
								Users loginUsers = (Users) session.getAttribute("users");
								if (loginUsers != null && loginUsers.getUid() == reply.getUid()) {
						%>
							<A
								href="manage/doDeleteReply.jsp?replyid=<%=reply.getReplyid()%>&sub_boardid=<%=sub_boardid%>&topicid=<%=topicid%>">[删除]</A>
							<A
								href="update.jsp?replyid=<%=reply.getReplyid()%>&sub_boardid=<%=sub_boardid%>">[修改]</A>
							<%
								}
							%>
						</DIV>
					</TH>
				</TR>
			</TABLE>
		</DIV>
		<%
			}
		%>



		<!--      声明        -->
		<BR>
		<CENTER class="gray">Information Technology Co.,Ltd 版权所有</CENTER>
</body>
</html>