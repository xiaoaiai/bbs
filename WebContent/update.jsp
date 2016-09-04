<%@page import="com.oracle.bbs.model.Reply"%>
<%@page import="com.oracle.bbs.dao.ReplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<Link rel="stylesheet" type="text/css" href="style/style.css" />
<script type="text/javascript">
	function check() {
		if (document.updateForm.title.value == "") {
			alert("标题不能为空");
			return false;
		}
		if (document.updateForm.content.value == "") {
			alert("内容不能为空");
			return false;
		}
		if (document.updateForm.content.value.length > 1000) {
			alert("长度不能大于1000");
			return false;
		}
	}
</script>
</head>
<%
	//
	ReplyDAO replyDAO = new ReplyDAO();

	//获取replyid
	String replyid = request.getParameter("replyid");
	String sub_boardid = request.getParameter("sub_boardid");

	//
	Reply reply = replyDAO.findById(replyid);
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
				href="list.jsp">Java基础</a></B>
		</DIV>
		<BR />
		<DIV>
			<FORM name="updateForm" onSubmit="return check();"
				action="manage/doUpdateReply.jsp" method="post">
				<INPUT type="hidden" name="sub_boardid" value="<%=sub_boardid%>" />
				<input type="hidden" name="topicid" value="<%=reply.getTopicid()%>">
				<INPUT type="hidden" name="replyid" value="<%=replyid%>" />
				<DIV class="t">
					<TABLE cellSpacing="0" cellPadding="0" align="center">

						<TR>
							<TD class="h" colSpan="3"><B>&#20462;&#25913;&#24086;&#23376;</B></TD>
						</TR>

						<TR class="tr3">
							<TH width="20%"><B>标题</B></TH>
							<TH><INPUT name="title" value="<%=reply.getTitle()%>"
								class="input" style="PADDING-LEFT: 2px; FONT: 14px Tahoma"
								tabIndex="1" size="60"></TH>
						</TR>

						<TR class="tr3">
							<TH vAlign="top">
								<DIV>
									<B>内容</B>
								</DIV>
							</TH>
							<TH colSpan="2">
								<DIV>
									<span><textarea name="content" style="WIDTH: 500px;"
											rows="20" cols="90" tabIndex="2"><%=reply.getContent()%></textarea></span>
								</DIV> (不能大于:<FONT color="blue">1000</FONT>字)
							</TH>
						</TR>
					</TABLE>
				</DIV>

				<DIV style="MARGIN: 15px 0px; TEXT-ALIGN: center">
					<INPUT class="btn" tabIndex="3" type="submit" value="修 改">
				</DIV>
			</FORM>

		</DIV>
		<!--      声明        -->
		<BR />
	</DIV>
	<CENTER class="gray">Information Technology Co.,Ltd 版权所有</CENTER>

</body>
</html>