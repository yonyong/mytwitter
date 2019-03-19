<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${admin == null }">
	<jsp:forward page="backend.jsp"></jsp:forward>
</c:if>
<html>
<head>
<meta charset="utf-8">
<title>后台主界面</title>
<link rel="icon" href="img/index.ico" />
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.animate-colors-min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script src="js/jquery.waypoints.min.js"></script>
<script src="js/jquery.countup.min.js"></script>
<script src="js/highcharts.js"></script>
<link rel="stylesheet" href="css/backend/page.css">

</head>

<body>
	<div id="loader">
		<div id="logo">
			<img src="img/index.ico" style="width: 24px;height: 24px;margin: 5px" />
		</div>
		<div id="loadetial">
			<ul>
				<li>${admin.aname }<span
						class="glyphicon glyphicon-chevron-down down"></span></li>
				<li>换肤<span class="glyphicon glyphicon-chevron-down down"></span></li>
			</ul>
			<div id="exit">退出</div>
			<div id="color">
				<div class="colornext" style="background-color: orange;">橙色</div>
				<div class="colornext" style="background-color:royalblue">蓝色</div>
				<div class="colornext" style="background-color: green">绿色</div>
				<div class="colornext" style="background-color:pink">粉色</div>

			</div>
		</div>
	</div>
	<div id="cebian">
		<div class="daohangdai" id="big">
			<span class="glyphicon glyphicon-menu-hamburger"
				style="margin-top: 8px"></span>
		</div>
		<div id='list'>
			<ul>
				<li><span class="glyphicon glyphicon-home tubiao"></span><span
					class="zi">主页</span></li>
				<li><span class="glyphicon glyphicon-user tubiao"></span><span
					class="zi">用户中心</span></li>
				<li><span class="glyphicon glyphicon-list-alt tubiao"></span><span
					class="zi">推文中心</span></li>
				<li><span class="glyphicon glyphicon-heart tubiao"></span><span
					class="zi">关于</span></li>
			</ul>
		</div>
	</div>
	<div id="body">
		<div id="welcome">
			<div id="username">您好，</div>
			<div id="huanying">欢迎登录MyTwitter后台 !</div>
		</div>

		<div id="time">
			<div id="date">
				<div id="xingqi"></div>
				<div id="riqi">
					<span id="year" style="font-size: 23px;"></span><span id="month"></span>
				</div>
			</div>
			<div id="hour">
				<div id="hourtime">
					<span id="hours"></span>:<span id="min"></span>
				</div>
			</div>
		</div>

		<div id="detail">
			<div class="kapian" style="background: dodgerblue">
				<div
					style="width: 100%;height: 40px;background-color: white;margin-top: -10px;line-height: 40px">
					<div
						style="font-size: 20px;color: black;margin: 10px 0 20px 10px;width: 100%;height: 30px;font-weight: bold">在线人数：</div>
				</div>
				<span class="glyphicon glyphicon-eye-open"
					  style="font-size: 30px; color: white;margin-left: 30px;margin-top: 20px"></span>
				<span class="counter" style="font-size: 35px;">0</span>
			</div>
			<div class="kapian" style="background: #ea6f5a">
				<div
					style="width: 100%;height: 40px;background-color: white;margin-top: -10px;line-height: 40px">
					<div
						style="font-size: 20px;color: black;margin: 10px 0 20px 10px;font-weight: bold ">今日访问量：</div>
				</div>
				<span class="glyphicon glyphicon-plus"
					  style="font-size: 30px; color: white;margin-left: 30px;margin-top: 20px"></span>
				<span class="counter" style="font-size: 35px;"><fmt:formatNumber
						value="0" pattern="###,###" /></span>
			</div>
			<div class="kapian" style="background: mediumpurple ">
				<div
					style="width: 100%;height: 40px;background-color: white;margin-top: -10px;line-height: 40px">
					<div
						style="font-size: 20px;color: black;margin: 10px 0 20px 10px;font-weight: bold">推文数：</div>
				</div>
				<span class="glyphicon glyphicon-refresh "
					  style="font-size: 30px; color: white;margin-left: 30px;margin-top: 20px"></span>
				<span class="counter" style="font-size: 35px;"><fmt:formatNumber
						value="0" pattern="###,###" /></span>
			</div>
			<div class="kapian" style="background: coral">
				<div
					style="width: 100%;height: 40px;background-color: white;margin-top: -10px;line-height: 40px">
					<div
						style="font-size: 20px;color: black;margin: 10px 0 20px 10px;font-weight: bold">总人数：</div>
				</div>
				<span class="glyphicon glyphicon-user"
					  style="font-size: 30px; color: white;margin-left: 30px;margin-top: 20px"></span>
				<span class="counter" style="font-size: 35px;"><fmt:formatNumber
						value="0" pattern="###,###" /></span>
			</div>
		</div>
		<%--jquery自带原生highcharts--%>
		<div id="message"></div>
	</div>
</body>
<script src="js/backend/page.js"></script>

</html>

