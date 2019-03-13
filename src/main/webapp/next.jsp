<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>请选择一个用户名</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="img/index.ico" />
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/jquery.slideunlock.js"></script>
<link href="css/slide-unlock.css" rel="stylesheet">
<link href="css/reveal-it.css" rel="stylesheet">
<script src="js/jquery.animate-colors-min.js"></script>
<script src="js/reveal-it.js"></script>
<link rel="stylesheet" href="css/system/next.css">
</head>

<body>
	<div id="header">
		<img src="img/index.ico" />
	</div>

	<div id="body">
		<div class="xuan">选择一个用户名</div>
		<div class="yuan">
			<img
				src="${pageContext.request.contextPath}/img/spinner-rosetta-blue-26x26.gif" />
		</div>
		<div class="yonghu">
			<div class="fangxin">请放心，用户名稍后可以更改</div>
			<div id="xiaoshiba">
				<input id="txt" type="text" placeholder="用户名" name="aite" autofocus />
				<span class="check"></span> <br>

				<div id="slider">
					<div id="slider_bg"></div>
					<span id="label">&gt;&gt;</span> <span id="labelTip">拖动滑块完成注册</span>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$("#txt").val("");
	$("#txt").focus();
	$("#txt").on({
		focus : function() {
			$(this).css("border", "1px solid rgba(29,141,242,1.00)");
		},
		blur : function() {
			$(this).css("border", "1px solid  #ccc");
		}
	});

	$("#header img").on({
		mouseover : function() {
			$(this).css("borderBottom", "5px solid rgba(29,141,242,1.00)");

		},
		mouseout : function() {
			$(this).css("borderBottom", "");
		},
		click : function() {
			location = "index.jsp";
		}
	});

	$("#txt").bind('input propertychange change', function() {
		var txt = $("#txt").val();
		var xmlHttp = new XMLHttpRequest();

		if ($(this).val() == "") {
			$(this).css("color", "gray");
		} else {
			$(this).css("color", "black");
		}
		xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState == 4) { //如果等于4，说明服务器响应成功了
				//这里的代码在服务器响应成功时执行！
				if (xmlHttp.status == 200) { //如果服务器响应码是200时
					var regex = new RegExp("^[A-Za-z0-9]+$", "g");
					var data = xmlHttp.responseText;

					if (data == "yes" && txt != "" && txt != null && regex.test(txt)) {
						$(".check").html("<img src='img/icon_tick_blue.png'/>");
					} else if (data == "no" && txt != "" && txt != null && regex.test(txt)) {
						$(".check").html("<img src='img/error.png'/><span style='color:tomato;font-size:14px'>该用户名已被占用。</span>");
					} else {
						$(".check").html("<img src='img/error.png'/><span style='color:tomato;font-size:14px'>只支持英文字母和数字。</span>");
					}
				}
			}
		}
		xmlHttp.open("GET", "/mytwitter/user.do?method=checkaite&aite=" + txt, false);
		xmlHttp.send(null);
	});

	$(function() {
		var slider = new SliderUnlock("#slider", {
			successLabelTip : "完成"
		}, function() {
			if ($("#txt").val() == "" || $(".check:eq(0)").html().indexOf("img/icon_tick_blue.png") < 0) {
				location.reload();
				return;
			}
			$(".yonghu").hide();
			$(".yuan").show();
			window.setInterval(function() {
				window.location.href = "user.do?method=signup&aite=" + $("#txt").val();
			}, 3000);
		});
		slider.init();
	});

	function bling() {
		$("#labelTip").stop().animate({
			'color' : "black"
		}, 5000, function() {
			$("#labelTip").css("color", "gray");
		})
	}
	;

	window.onload = function() {
		bling();
	}
	window.setInterval('bling()', 7000);
</script>
</html>
