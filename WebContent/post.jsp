<%@page import="com.oracle.bbs.model.SubBoard"%>
<%@page import="com.oracle.bbs.dao.SubBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发表话题</title>
<Link rel="stylesheet" type="text/css" href="style/style.css" />
<script type="text/javascript">
	function check() {
		if (document.postForm.title.value == "") {
			alert("标题不能为空");
			return false;
		}
		if (document.postForm.content.value == "") {
			alert("内容不能为空");
			return false;
		}
		if (document.postForm.content.value.length > 1000) {
			alert("长度不能大于1000");
			return false;
		}

	}
</script>
</head>
<%
	//创建DAO
	SubBoardDAO subBoardDAO = new SubBoardDAO();

	//获取传递的subboardid
	String sub_boardid = request.getParameter("sub_boardid");

	//获取topicid
	String topicid = request.getParameter("topicid");

	//获取帖子的类型
	String topicType = request.getParameter("topicType");

	//根据subboardid获取subboard对象
	SubBoard subBoard = subBoardDAO.findById(sub_boardid);
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
		<BR />
		<!--      导航        -->
		<DIV>
			&gt;&gt;<B><a href="index.jsp">论坛首页</a></B>&gt;&gt; <B><a
				href="list.jsp?sub_boardid=<%=subBoard.getSub_boardid()%>"><%=subBoard.getSub_boardname()%></a></B>
		</DIV>
		<BR />
		<DIV>
			<FORM name="postForm" onsubmit="return check()"
				action="manage/doPost.jsp" method="POST">
				<INPUT type="hidden" name="topicid" value="<%=topicid%>" /> <INPUT
					type="hidden" name="sub_boardid" value="<%=sub_boardid%>" /> <INPUT
					type="hidden" name="topicType" value="<%=topicType%>" />
				<DIV class="t">
					<TABLE cellSpacing="0" cellPadding="0" align="center">
						<TR>
							<TD class="h" colSpan="3"><B>发表帖子</B></TD>
						</TR>

						<TR class="tr3">
							<TH width="20%"><B>标题</B></TH>
							<TH><INPUT class="input"
								style="PADDING-LEFT: 2px; FONT: 14px Tahoma" tabIndex="1"
								size="60" name="title"></TH>
						</TR>

						<TR class="tr3">
							<TH vAlign=top>
								<DIV>
									<B>内容</B>
								</DIV>
							</TH>
							<TH colSpan=2>
								<DIV>
									<span><textarea style="WIDTH: 500px;" name="content"
											rows="20" cols="90" tabIndex="2"></textarea></span>
								</DIV> (不能大于:<FONT color="blue">1000</FONT>字)
							</TH>
						</TR>
					</TABLE>
				</DIV>

				<DIV style="MARGIN: 15px 0px; TEXT-ALIGN: center">
					<INPUT class="btn" tabIndex="3" type="submit" value="提 交">
					<INPUT class="btn" tabIndex="4" type="reset" value="重 置">
				</DIV>
			</FORM>
		</DIV>
	</DIV>
	<!--      声明        -->
	<BR />
	<CENTER class="gray">Information Technology Co.,Ltd 版权所有</CENTER>

</body>
</html>