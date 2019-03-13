<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>后台登录页面</title>
<link rel="icon" href="img/index.ico" />
<script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="css/backend/backend.css">
<script src="js/backend/backend.js"></script>

</head>
<body>
	<div class="top_div"></div>
	<div
		style="background: rgb(255, 255, 255); margin: -100px auto auto; border: 1px solid rgb(231, 231, 231); border-image: none; width: 400px; height: 200px; text-align: center;border-radius: 5px">
		<div style="width: 165px; height: 96px; position: absolute;">
			<div class="tou"></div>
			<div class="initial_left_hand" id="left_hand"></div>
			<div class="initial_right_hand" id="right_hand"></div>
		</div>
		<form action="admin.do?method=checklogin" method="post">
			<p style="padding: 30px 0px 10px; position: relative;">
				<span class="u_logo"></span> <input class="ipt" type="text"
					placeholder="用户名" value="" name="username" autofocus="autofocus">
			</p>
			<p style="position: relative;">
				<span class="p_logo"></span> <input class="ipt" id="password"
					type="password" placeholder="密码" value="" name="password">
			</p>
			<div
				style="height: 50px; line-height: 50px; margin-top: 30px; border-top-color: rgb(231, 231, 231); border-top-width: 1px; border-top-style: solid;">
				<p style="margin: 5px 35px 20px 45px;">
					<input type="submit" id="btn" value="登录" />
				</p>
			</div>
		</form>
	</div>
</body>
