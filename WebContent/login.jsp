<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<Link rel="stylesheet" type="text/css" href="style/style.css" />
<script language="javascript">
	function check() {
		//alert(document.loginForm.uName);
		if (document.loginForm.uName.value == "") {
			alert("用户名不能为空");
			return false;
		}
		if (document.loginForm.uPass.value == "") {
			alert("密码不能为空");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<DIV>
		<IMG src="image/logo.jpg">
	</DIV>
	<!--      用户信息、登录、注册        -->

	<DIV class="h">
		您尚未 <a href="login.jsp">登录</a> &nbsp;| &nbsp; <A href="reg.jsp">注册</A>
		|
	</DIV>


	<BR />
	<!--      导航        -->
	<DIV>
		&gt;&gt;<B><a href="index.jsp">论坛首页</a></B>
	</DIV>
	<!--      用户登录表单        -->
	<DIV class="t" style="MARGIN-TOP: 15px" align="center">
		<FORM name="loginForm" onsubmit="return check();" action="manage/doLogin.jsp" method="post">
			<br />用户名 &nbsp;<INPUT class="input" tabIndex="1" type="text"
				maxLength="20" size="35" name="uName"> <br />密 码 &nbsp;<INPUT
				class="input" tabIndex="2" type="password" maxLength="20" size="40"
				name="uPass"> <br /> <INPUT class="btn" tabIndex="6"
				type="submit" value="登 录">
		</FORM>
	</DIV>
	<!--      声明        -->
	<BR />
	<CENTER class="gray">Information Technology Co.,Ltd 版权所有</CENTER>
</body>
</html>