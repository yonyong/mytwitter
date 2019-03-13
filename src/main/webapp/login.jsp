<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8">
<title>登录</title>
<link rel="icon" href="img/index.ico" />
<script src="js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="css/system/login.css">
</head>
<body>
	<div id="loader">
		<div>
			<ul class="zhuye">
				<li><img src="img/index.ico"><a href="index.jsp"><b>主页</b></a></li>
			</ul>
		</div>
	</div>

	<c:if test="${display == 'show' }">
		<div id="tixing">
			<span class="tishiyu">您的用户名和密码与我们的记录不匹配，请重新检查后重试。</span><span
				class="cha">&times;</span>
		</div>
	</c:if>
	<c:if test="${display == 'stop' }">
		<div id="tixing">
			<span class="tishiyu">该用户已冻结！如需继续使用服务，请前往xxxx.mytwitter.com申请解封。</span><span
				class="cha">&times;</span>
		</div>
	</c:if>

	<div id="body">
		<div id="shang">
			<div id="biao">
				<div class="deng">登录 MyTwitter</div>
				<form action="user.do?method=checklogin" method="post">
					<input class="txt" type="text" placeholder="邮件地址或用户名"
						style="margin-top: 20px" autofocus name="username" /><br> <input
						class="txt" type="password" placeholder="密码"
						style="margin-bottom: 20px" name="password" /><br> <input
						id="btn" type="submit" value="登录" /><br>
				</form>
			</div>
		</div>
		<div id="xia">

			<div>
				首次使用 MyTwitter?<span id="zhuce"> 现在注册 »</span>
			</div>
		</div>
	</div>
</body>
<script src="js/system/login.js"/>
</html>
