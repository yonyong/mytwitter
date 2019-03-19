<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- Bootstrap 3.3.7 -->
<title>MyTwitter / 开始</title>
<link rel="icon" href="img/index.ico" />
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/jquery.animate-colors-min.js"></script>
<link rel="stylesheet" href="css/system/start.css">
</head>

<body>
	<div id="header">
		<img src="img/index.ico" />
	</div>
	<div id="body">
		<div id="bodytwo">
			<div class="yuan">
				<img src="${pageContext.request.contextPath}/img/5-121204193Q8.gif" />
				<div style="margin-left: 10px;color:#333">正在为您配置账号，请稍等片刻。</div>
			</div>
			<div id="first">
				<div
					style="width: 400px;font-size: 28px;margin-top: 80px;font-weight: bold;color: black;">很高兴你来到这里，${user.urealname }。</div>
				<div
					style="width: 400px;font-size: 21px;margin-top: 30px;font-weight: bold;color: dimgray;">MyTwitter将持续更新最潮、最重大的新闻、媒体、体育、电视、对话消息等等——全为你量身定制！</div>
				<div
					style="width: 400px;font-size: 21px;margin-top: 20px;font-weight: bold;color: dimgray;">告诉我们你喜欢的东西，我们会帮你打点一切。</div>
				<button id="btn"
					style="border: none; margin-top: 20px;padding: 15px 30px;text-align: center;border-radius: 50px;color: white;font-size: 20px; font-weight: bold;background-color: rgb(19, 163, 243);cursor: pointer;">
					<p style="margin-left:5px">我们开始吧！</p>
				</button>
			</div>
			<div id="second">
				<ul>
					<li style="margin-left: 100px;padding-top:20px"><img
						src="img/na_1.jpg" /></li>
					<li style="position: relative;left: -70px;"><img
						src="img/na_2.jpg" /></li>
					<li style="margin-left: 100px;"><img src="img/na_3.jpg" /></li>
					<li style="margin-bottom: 50px;"><img src="img/na_4.jpg" /></li>
				</ul>
			</div>
		</div>
	</div>
</body>
<script>
	$("#btn").on({
		mouseover : function() {
			$(this).css("backgroundColor", "rgb(0, 109, 191)");
		},
		mouseout : function() {
			$(this).css("backgroundColor", "rgb(29, 161, 243)");
		},
		click : function() {
			$("#first").hide();
			$("#second").hide();
			$(".yuan").show();
			window.setInterval(function() {
				window.location.href = "signin.do?method=online";
			}, 3000)
		}
	});
	$("#second ul li:eq(0)").fadeIn(500, function() {
		$("#second ul li:eq(1)").fadeIn(500, function() {
			$("#second ul li:eq(2)").fadeIn(500, function() {
				$("#second ul li:eq(3)").fadeIn();
			});
		});
	});
</script>
< /html>