<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<title>MyTwitter 一一 聚焦当下。</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="img/index.ico" />
<script src="js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="css/system/twitter.css">
</head>
<body>
	<div id="loader">
		<div>
			<ul class="zhuye">
				<li><img src="img/index.ico"><a href="#">主页</a></li>

			</ul>
			<!-- <div>
				<input type="text" class="search" id="search"
					placeholder="搜索Twitter用户" /><img src="img/select.png" class="sea" />
			</div> -->
		</div>
	</div>
	<div id="body">
		<div id="welcome">
			<span><h1>欢迎使用 MyTwitter。</h1></span> <span class="link">联系你的好友和更多精彩。获取你感兴趣的实时更新。并通过每个视角观看事件实时呈现。</span>
		</div>

		<ul id="tu">
			<li class="show"><img src="img/US_CA_2.jpg" /></li>
			<li class="hidden"><img src="img/US_CA_3.jpg" /></li>
			<li class="hidden"><img src="img/US_CA_4.jpg" /></li>
			<li class="hidden"><img src="img/US_CA_5.jpg" /></li>
			<li class="hidden"><img src="img/US_CA_6.jpg" /></li>
			<li class="hidden"><img src="img/US_CA_7.jpg" /></li>
		</ul>

		<ul id="xiangqing">
			<li class="show">
				<p>National moment of silence happening now. #Ferguson</p>
				<p style="margin-bottom: 30px">#JusticeForMikeBrown</p>
				<p>由@Tursday拍摄及发布</p>
				<p>05:24 PM - 14 Aug 2018</p>
			</li>
			<li class="hidden">
				<p>
					Checking this off my bucket list. (photo by @ScottBorrero)<br>@exumguides
				</p>
				<p style="margin-bottom: 30px">#jacksonjourneys #jacksonhole</p>
				<p>由@RaviVora拍摄及发布</p>
				<p>06:53 PM - 26 Sep 2018</p>
			</li>
			<li class="hidden">
				<p>#2014 Flashback:Paying tribute to the late + great Lou Reed.</p>
				<p style="margin-bottom: 30px">@TheGRAMMYs #NFTO</p>
				<p>由@JaredLeto拍摄及发布</p>
				<p>12:40 AM - 30 Dec 2018</p>
			</li>
			<li class="hidden">
				<p>What a ride it has been. 166 days in #space, time for me</p>
				<p style="margin-bottom: 30px">@astro_alex @msuraev to head
					home.</p>
				<p>由@astro_reid拍摄及发布</p>
				<p>10:03 PM - 9 Nov 2018</p>
			</li>
			<li class="hidden">
				<p>Sums up this weekend.</p>
				<p style="margin-bottom: 30px"></p>
				<p>由@sanarao拍摄及发布</p>
				<p>07:05 PM - 8 Nov 2018</p>
			</li>
			<li class="hidden">
				<p>.@ChicagoBulls outlast @Warriors in a dramatic
					finish,113-111.</p>
				<p>D-Rose overcomes Tos, nails game-winning jumper.</p>
				<p>由@NBA拍摄及发布</p>
				<p>11:13 PM - 27 Jan 2018</p>
			</li>
		</ul>

		<div id="login">
			<form action="user.do?method=checklogin" method="post">
				<input class="txt" placeholder="邮件地址或用户名" type="text"
					name="username" autofocus id="username" value="" /><br>
				<input class="txt" placeholder="密码" type="password" name="password"
					style="width: 200px;margin-bottom: 0;" id="password"
					value="" />
				<button class="btn" id="signin"
					style="font-weight: bold;border-radius: 5px;background-color: white;
				border:1px solid  rgba(29, 161, 241, 1.00);color:rgba(29, 161, 241, 1.00);">登录</button>
				<input class="cb" type="checkbox" checked="checked" /> <span
					style="font-size: 12px;color: #666;">记住我·<a href="#"
					style="color: dodgerblue">忘记密码？</a></span>
			</form>
		</div>
		<div id="rigest">
			<div class="newcomer" style="font-weight: bold;color:black;">
				新来MyTwitter？<span style="color: #666;font-weight: bold">注册</span>
			</div>
			<form action="user.do?method=register&order=first" method="post">
				<input class="txt" type="text" placeholder="姓名"
					style="margin:5px 8px;" name="name" id="name" /><br> <input
					class="txt" type="text" placeholder="邮件地址" style="margin:5px 8px;"
					name="uname" id="uname" /><br> <input class="txt"
					type="password" placeholder="密码" style="margin:5px 8px;" name="pwd"
					id="pwd" />
				<button id="signup" class="btn"
					style="width: 100px;border-radius:5px;margin-left: 191px;  margin-top:5px;  background-color: rgba(29, 161, 241, 1.00);
				border-color: rgba(0,0,0,1.00);color: white ;font-weight: bold">
					注册MyTwitter</button>

			</form>
		</div>
		<ul id="lianjie">
			<li><a href="">关于</a></li>
			<li><a href="">帮助中心</a></li>
			<li><a href="https://www.cnblogs.com/yonyong">博客</a></li>
			<li><a href="">状态</a></li>
			<li><a href="">工作机会</a></li>
			<li><a href="">条款</a></li>
			<li><a href="">隐私政策</a></li>
			<li><a href="">Cookies</a></li>
			<li><a href="">广告信息</a></li>
			<li><a href="">商标</a></li>
			<li><a href="">广告</a></li>
			<li><a href="">企业</a></li>
			<li><a href="">开发者</a></li>
			<li><a href="">目录</a></li>
			<li><a href="">&copy;2019MyTwitter</a></li>
		</ul>
	</div>
	<script>
		$(".txt").val("");
		$(".txt").on({
			focus : function() {
				$(this).css("border", "1px solid rgba(29,141,242,1.00)");
			},
			blur : function() {
				$(this).css("border", "1px solid #ccc");
			}
		});
		if(${param.m == 1}){
			alert("您的账号在其他地方登陆，您以被迫下线！")
		}
	
		var num = 0;
		window.setInterval("change()", 10000);
	
		function change() {
			$("#tu li:eq(" + num + ")").fadeIn(500).siblings().fadeOut();
			$("#xiangqing li:eq(" + num + ")").css("display", "block").siblings().css("display", "none");
			num++;
			if (num > 5) {
				num = 0;
			}
		}
		window.onload = function() {
			change();
		}
	
		$(".zhuye li").on({
			mouseover : function() {
				$(this).css("borderBottom", "3px solid rgba(29,161,241,1.00)");
			},
			mouseout : function() {
				$(this).css("borderBottom", "");
			}
		});
		$("#signin").on({
			mouseover : function() {
				$(this).css("backgroundColor", "rgba(29,161,241,0.20)");
			},
			mouseout : function() {
				if ($(this).css("backgroundColor") == "rgba(29, 161, 241, 0.2)"){
					$(this).css("backgroundColor", "white");
				}
			},
			click : function() {
				$(this).css("backgroundColor", " rgba(29, 161, 241, 1.00)");
				$(this).css("color", "white");
			}
		});
		$("#signup").on({
			mouseover : function() {
				$(this).css("backgroundColor", "rgb(0, 109, 191 ,1.00)");
			},
			mouseout : function() {
				$(this).css("backgroundColor", " rgba(29, 161, 241, 1.00)");
			}
		});
	
		$(".search").on({
			focus : function() {
				$(".search").css("backgroundColor", "rgba(255,255,255,1.00)");
				$(".sear").css("backgroundColor", "rgba(255,255,255,1.00)");
				$(".search").css("color", "rgba(203,203,203,1.00)");
	
			},
			blur : function() {
				$(".search").css("backgroundColor", "rgba(245,248,250,1.00)");
				$(".sear").css("backgroundColor", "rgba(245,248,250,1.00)");
				$(".search").css("color", "rgba(44,47,47,1.00)");
			}
		});
	
	
		$("#username").bind('input propertychange ', function() {
			if ($(this).val().trim() != "") {
				$(this).css("color", "black");
			} else {
				$(this).css("color", "gray");
			}
		});
		$("#password").bind('input propertychange ', function() {
			if ($(this).val().trim() != "") {
				$(this).css("color", "black");
			} else {
				$(this).css("color", "gray");
			}
		});
	
		$("#uname").bind('input propertychange ', function() {
			if ($(this).val().trim() != "") {
				$(this).css("color", "black");
			} else {
				$(this).css("color", "gray");
			}
		});
	
		$("#name").bind('input propertychange ', function() {
			if ($(this).val().trim() != "") {
				$(this).css("color", "black");
			} else {
				$(this).css("color", "gray");
			}
		});
		$("#pwd").bind('input propertychange ', function() {
			if ($(this).val().trim() != "") {
				$(this).css("color", "black");
			} else {
				$(this).css("color", "gray");
			}
		});
		$("#search").bind('input propertychange ', function() {
			if ($(this).val().trim() != "") {
				$(this).css("color", "black");
			} else {
				$(this).css("color", "gray");
			}
		});
	</script>
</body>
</html>