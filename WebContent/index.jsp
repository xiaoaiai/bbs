<%@page import="com.oracle.bbs.model.*"%>
<%@page import="java.util.List"%>
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
	//1.创建dao
	BoardDAO boardDAO = new BoardDAO();
	SubBoardDAO subBoardDAO = new SubBoardDAO();
	TopicDAO topicDAO = new TopicDAO();
	UsersDAO usersDAO = new UsersDAO();

	//2.调用查询主办块方法
	List<Board> boardList = boardDAO.findAll();
%>
<body>

	<DIV>
		<IMG src="image/logo.jpg">
	</DIV>
	<!--      用户信息、登录、注册        -->
	<%
		if (session.getAttribute("users") == null) {
	%>
	<DIV class="h">
		您尚未 <a href="login.jsp">登录</a> &nbsp;| &nbsp; <A href="reg.jsp">注册</A>
		|
	</DIV>
	<%
		} else {
	%>
	<DIV class="h">
		欢迎你：<%=((Users) session.getAttribute("users")).getUname()%>
		&nbsp;| &nbsp; <A href="manage/doLogout.jsp">注销</A> |
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
			<!--       主版块       -->
			<%
				//遍历主办块信息
				for (int i = 0; i < boardList.size(); i++) {
					Board board = boardList.get(i);

					//查询子版块信息
					List<SubBoard> subBoardList = subBoardDAO.findByBoardId(board.getBoardid());
			%>
			<TR class="tr3">
				<TD colspan="4"><%=board.getBoardname()%></TD>
			</TR>
			<!--       子版块       -->
			<%
				//遍历子版块信息
					for (int j = 0; j < subBoardList.size(); j++) {
						SubBoard subBoard = subBoardList.get(j);

						//根据子版块id获取帖子数
						String topicCount = topicDAO.findCountBySubBoardId(subBoard.getSub_boardid());

						//根据子版块id获取最后一个帖子信息
						Topic lastTopic = topicDAO.findLastBySubBoardId(subBoard.getSub_boardid());

						//根据ui获取用户信息
						Users lastUsers = usersDAO.findByUid(lastTopic.getUid());
			%>
			<TR class="tr3">
				<TD width="5%">&nbsp;</TD>
				<TH align="left"><IMG src="image/board.gif"> <A
					href="list.jsp?sub_boardid=<%=subBoard.getSub_boardid()%>"><%=subBoard.getSub_boardname()%></A></TH>
				<TD align="center"><%=topicCount%></TD>
				<TH><SPAN> <A href="detail.jsp"><%=lastTopic.getTitle()%>
					</A>
				</SPAN> <BR /> <SPAN><%=lastUsers.getUname()%></SPAN> <SPAN class="gray">[
						<%=lastTopic.getPublishtimeToString()%> ]
				</SPAN></TH>
			</TR>

			<%
				}
				}
			%>

		</TABLE>
	</DIV>

	<BR />
	<CENTER class="gray">Information Technology Co.,Ltd 版权所有</CENTER>
</body>
</html>