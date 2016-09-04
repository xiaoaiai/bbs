<%@page import="com.oracle.bbs.model.*"%>
<%@page import="java.util.List"%>
<%@page import="com.oracle.bbs.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<Link rel="stylesheet" type="text/css" href="style/style.css" />
<title>学员论坛--帖子列表</title>
</head>
<%
	//创建DAO
	TopicDAO topicDAO = new TopicDAO();
	ReplyDAO replyDAO = new ReplyDAO();
	UsersDAO usersDao = new UsersDAO();
	SubBoardDAO subBoardDAO = new SubBoardDAO();

	//获取傳遞子版块id
	String sub_boardid = request.getParameter("sub_boardid");

	SubBoard subBoard = subBoardDAO.findById(sub_boardid);

	//分页
	int currentPage = 1;
	int pageNome = 2;

	int allRow = topicDAO.findCountBysub_boardId(sub_boardid);

	int allPage = allRow % pageNome == 0 ? allRow / pageNome : allRow / pageNome + 1;

	if (request.getParameter("currentPage") != null) {
		String cp = request.getParameter("currentPage");
		currentPage = Integer.parseInt(cp);
	}
	if (currentPage <= 0) {
		currentPage = 1;
	}
	if (currentPage >= allPage && allPage != 0) {
		currentPage = allPage;
	}

	List<Topic> topicList = topicDAO.findAllBySubBoardId(sub_boardid, currentPage);
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
		<!--      导航        -->
		<br />
		<DIV>
			&gt;&gt;<B><a href="index.jsp">论坛首页</a></B>&gt;&gt; <B><a
				href="list.jsp?sub_boardid=<%=subBoard.getSub_boardid()%>"><%=subBoard.getSub_boardname()%>></a></B>
		</DIV>
		<br />
		<!--      新帖        -->
		<DIV>
			<A href="post.jsp?sub_boardid=<%=subBoard.getSub_boardid()%>&topicType=post"><IMG src="image/post.gif" name="td_post"
				border="0" id=td_post></A>
		</DIV>
		<!--         翻 页         -->
		<DIV>
			<a
				href="list.jsp?currentPage=<%=currentPage - 1%>&sub_boardid=<%=sub_boardid%>">上一页</a>|
			<a
				href="list.jsp?currentPage=<%=currentPage + 1%>&sub_boardid=<%=sub_boardid%>">下一页</a>
		</DIV>

		<DIV class="t">
			<TABLE cellSpacing="0" cellPadding="0" width="100%">
				<TR>
					<TH class="h" style="WIDTH: 100%" colSpan="4"><SPAN>&nbsp;</SPAN></TH>
				</TR>
				<!--       表 头           -->
				<TR class="tr2">
					<TD>&nbsp;</TD>
					<TD style="WIDTH: 80%" align="center">文章</TD>
					<TD style="WIDTH: 10%" align="center">作者</TD>
					<TD style="WIDTH: 10%" align="center">回复</TD>
				</TR>
				<!--         主 题 列 表        -->
				<%
					for (int i = 0; i < topicList.size(); i++) {
						Topic topic = topicList.get(i);

						String count = replyDAO.findCountByTopicId(topic.getTopicid());
						Users users = usersDao.findByUid(topic.getUid());
				%>
				<TR class="tr3">
					<TD><IMG src="image/topic.gif" border=0></TD>
					<TD style="FONT-SIZE: 15px"><A href="detail.jsp?sub_boardid=<%=subBoard.getSub_boardid() %>&topicid=<%=topic.getTopicid() %>"><%=topic.getTitle()%></A></TD>
					<TD align="center"><%=users.getUname()%></TD>
					<TD align="center"><%=count%></TD>
				</TR>
				<%
					}
				%>
			</TABLE>
		</DIV>
		<!--            翻 页          -->
		<DIV>
			<a
				href="list.jsp?currentPage=<%=currentPage - 1%>&sub_boardid=<%=sub_boardid%>">上一页</a>|
			<a
				href="list.jsp?currentPage=<%=currentPage + 1%>&sub_boardid=<%=sub_boardid%>">下一页</a>
		</DIV>
	</DIV>
	<!--             声 明          -->
	<BR />
	<CENTER class="gray">Information Technology Co.,Ltd 版权所有</CENTER>
</body>
</html>