<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${user == null }">
	<jsp:forward page="index.jsp"></jsp:forward>
</c:if>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- Bootstrap 3.3.7 -->
<title>用户查询&nbsp;/&nbsp;Twitter</title>
<link rel="icon" href="img/index.ico" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.animate-colors-min.js"></script>
<script src="js/popup.js"></script>
<script src="js/autosize.min.js"></script>
<link rel="stylesheet" href="css/system/search.css">
<style>
	.touxiang {
		width: 32px;
		height: 32px;
		border: 1px solid white;
		background-size: 31px 31px;
		cursor: pointer;
		background:
				url(${pageContext.request.contextPath}/img/${user.uname }/${info.ulogo});
	}

</style>
</head>

<body>
	<div id="loader">
		<div>
			<ul id="daohang">
				<li><span class="glyphicon glyphicon-home"></span><span
					class="bian">主页</span></li>
				<li><span class="glyphicon glyphicon-bell"></span><span
					class="bian">通知</span></li>
				<li><span class="glyphicon glyphicon-comment"></span><span
					class="bian">私信</span></li>
			</ul>
		</div>
		<div>
			<img id="logo" src="img/index.ico" />
			<div id="search">
				<input type="text" class="search" placeholder="搜索MyTwitter用户"
					id="search_two" /><span class="glyphicon glyphicon-search sea"
					id="chaxun" style="color:gray;font-size: 15px;margin-top:1px"></span>
			</div>
			<div class="touxiang" id="touxiang"
				style="background-size:31px 31px;background:url(${pageContext.request.contextPath}/img/${user.uname }/${info.ulogo})"></div>
			<div id="list">
				<div class="triangle shang ss"></div>
				<div id="listlist">
					<div style="cursor: pointer;" id="self">
						<div id="uname"
							style="font-weight: bold; color:black;margin-top:5px;margin-left:18px;font-size:20px">${user.urealname }</div>
						<div id="aitevalue"
							style="color:gray;margin-left:20px;font-size:15px">@${user.uaite }</div>
					</div>
					<hr>
					<div class="listd" style="margin-top: 10px">
						<div>
							<span class=" glyphicon glyphicon-user"
								style="margin-right: 10px"></span>个人资料
						</div>
					</div>

					<div class="listd">
						<span class="glyphicon glyphicon-list-alt"
							style="margin-right: 10px"></span>列表
					</div>
					<hr>
					<div class="listd">
						<span class="glyphicon glyphicon-share" style="margin-right: 10px"></span>Twitter广告
					</div>
					<div class="listd">
						<span class=" glyphicon glyphicon-stats"
							style="margin-right: 10px"></span>分析
					</div>
					<hr>
					<div class="listd">设置与隐私</div>
					<div class="listd">帮助中心</div>
					<div class="listd">键盘快捷键</div>
					<div class="listd">登出</div>
				</div>
			</div>
			<button id="fatui" class="button btn btn-info">
				<span class="glyphicon glyphicon-send edit"></span><span
					class="bian fa">发推</span>
			</button>
		</div>
		<div id="popup">
			<div class="title">
				<p data-title="撰写新推文"></p>
				<span>&times</span>
			</div>
			<form action="" method="post" id="mytweettwo"
				enctype="multipart/form-data">
				<div class="cont">
					<div class="tweet ttt" id="tuiwen2">
						<textarea id="tweet2" class="wen xinxian" name="tuiwen"
							placeholder="有什么新鲜事？" style="max-height:300px;width:540px"></textarea>
						<div class="bq bq2"></div>
					</div>

					<div class="thing add">
						<span class="glyphicon glyphicon-camera addThing addx"></span> <span
							class="glyphicon glyphicon-picture addThing addx"></span> <span
							class="glyphicon glyphicon-stats addThing addx"></span> <span
							class="glyphicon glyphicon-map-marker addThing addx"></span>
						<button class="button but but_lu  btn btn-info" id="submittwo"
							type="button">
							<span class="glyphicon glyphicon-send edit_lu"></span> <span
								class="bian fa_lu">发推</span>
						</button>
					</div>
					<div class="zishu zishu_lu">140</div>

				</div>
			</form>
		</div>
		<div id="mask_shadow"></div>
	</div>
	<div id="body">
		<div id="littleloader">
			<div id="searchname"
				style="width: auto;line-height: 65px;margin-left: 95px;font-size: 25px;font-weight: bold;color: white;">${param.word}</div>
		</div>
		<div id="twoloader">
			<ul>
				<li id="users"
					style="text-align: center;width:60px;height: 50px;line-height: 50px;margin-left: 90px;color: #657786;font-size: 15px;font-weight: bold;cursor: pointer;">用户</li>
			</ul>
		</div>
		<div id="first">
			<div id="sousuo">
				<input type="text" placeholder="搜索用户" />
				<button id="dianjisousuo">搜索</button>
			</div>
			<div id="xuanze" style="height: 160px">
				<div class="guanzhu" style="color:black">
					搜索筛选<span id="xianshi"
						style="font-size: 12px;font-weight: normal;cursor: pointer;">
						· <a>隐藏</a>
					</span>
				</div>

				<div>
					<select id="fanwei" style="display: block;">
						<c:if test="${param.fw == 0 || empty param.fw }">
							<option value="all" selected="selected">来自任何人</option>
							<option value="follow">你关注的人</option>
							<option value="fans">关注你的人</option>
						</c:if>
						<c:if test="${param.fw == 1}">
							<option value="all">来自任何人</option>
							<option value="follow" selected="selected">你关注的人</option>
							<option value="fans">关注你的人</option>
						</c:if>
						<c:if test="${param.fw == 2}">
							<option value="all">来自任何人</option>
							<option value="follow">你关注的人</option>
							<option value="fans" selected="selected">关注你的人</option>
						</c:if>
						<c:if test="${param.fw == 3}">
							<option value="all">来自任何人</option>
							<option value="followtwo" selected="selected">${who.urealname} 关注的人</option>
							<option value="fanstwo">关注 ${who.urealname} 的人</option>
						</c:if>
						<c:if test="${param.fw == 5}">
							<option value="all">来自任何人</option>
							<option value="followtwo">${who.urealname} 关注的人</option>
							<option value="fanstwo" selected="selected">关注 ${who.urealname} 的人</option>
						</c:if>
					</select>
				</div>
				<div>
					<select id="weizhi" style="display: block;">
						<option value="man">全部位置</option>
						<option value="woman">附近位置</option>
					</select>
				</div>
			</div>
		</div>
		<div id="second">
			<div id="content"></div>
			<div id="elliot">
				<button id="jiazaianniu" class="btn	btn-default"
					style="width: 500px;height:40px; margin:20px;margin-left: 230px;display: none">点击加载更多</button>
			</div>
		</div>

	</div>
</body>
<script>
	function catsession() {
		$.ajax({
			url : '/mytwitter/user.do?method=catsession',
			type : 'POST',
			success : function(response, status) {
				if (response == "exit") {
					location = "twitter.jsp";
				}
			}
		});
	}
	$(function() {
		catsession();
	})
	window.setInterval(function() {
		catsession();
	}, 1000);
</script>
<script>
$(function() {
		$("#touxiang").popover({
			content : "修改个人信息和登出",
			placement : 'bottom',
			trigger : 'hover '
		});
		$("#logo").popover({
			content : "点击置顶",
			placement : 'bottom',
			trigger : 'hover '
		});
		$(".addThing").popover({
			content : "暂时没用",
			placement : 'bottom',
			trigger : 'hover '
		});
	
	})
$("#fanwei").bind("change", function() {
		/* $("#second").html("");
		if ($("#fanwei").val() == "follow") {
			search('/mytwitter/user.do?method=search&word=' + $("#searchname").html().trim() + '&pagenum=0&fanwei=follow');
		} else if ($("#fanwei").val() == "fans") {
			search('/mytwitter/user.do?method=search&word=' + $("#searchname").html().trim() + '&pagenum=0&fanwei=fans');
		} else if ($("#fanwei").val() == "followtwo") {
			search('/mytwitter/user.do?method=search&word=' + $("#searchname").html().trim() + '&pagenum=0&fanwei=followtwo');
		} else if ($("#fanwei").val() == "fanstwo") {
			search('/mytwitter/user.do?method=search&word=' + $("#searchname").html().trim() + '&pagenum=0&fanwei=fanstwo');
		} else if ($("#fanwei").val() == "all") {
			search('/mytwitter/user.do?method=search&word=' + $("#searchname").html().trim() + '&pagenum=0');
		} */
		location.reload();
	})
	$("#jiazaianniu").on({
		click : function() {
			if ($(this).html().trim() == "点击加载更多") {
				if ($("#fanwei").val() == "follow") {
					search('/mytwitter/user.do?method=search&word=' + $("#searchname").html().trim() + '&pagenum=' + $(".usersinfo").length + '&fanwei=follow');
				} else if ($("#fanwei").val() == "fans") {
					search('/mytwitter/user.do?method=search&word=' + $("#searchname").html().trim() + '&pagenum=' + $(".usersinfo").length + '&fanwei=fans');
				} else if ($("#fanwei").val() == "followtwo") {
					search('/mytwitter/user.do?method=search&word=' + $("#searchname").html().trim() + '&pagenum=' + $(".usersinfo").length + '&fanwei=followtwo');
				} else if ($("#fanwei").val() == "fanstwo") {
					search('/mytwitter/user.do?method=search&word=' + $("#searchname").html().trim() + '&pagenum=' + $(".usersinfo").length + '&fanwei=fanstwo');
				} else {
					search('/mytwitter/user.do?method=search&word=' + $("#searchname").html().trim() + '&pagenum=' + $(".usersinfo").length);
				}
			}
		}
	});
	window.onload=function(){
		if ($("#fanwei").val() == "follow") {
			search('/mytwitter/user.do?method=search&word=' + $("#searchname").html().trim() + '&pagenum=0&fanwei=follow');
		}else if ($("#fanwei").val() == "fans") {
			search('/mytwitter/user.do?method=search&word=' + $("#searchname").html().trim() + '&pagenum=0&fanwei=fans');
		} else if ($("#fanwei").val() == "followtwo") {
			search('/mytwitter/user.do?method=search&word=' + $("#searchname").html().trim() + '&pagenum=0&fanwei=followtwo');
		}else if ($("#fanwei").val() == "fanstwo") {
			search('/mytwitter/user.do?method=search&word=' + $("#searchname").html().trim() + '&pagenum=0&fanwei=fanstwo');
		} else {
			search('/mytwitter/user.do?method=search&word=' + $("#searchname").html().trim() + '&pagenum=0');
		}
	}
	
	var mytwitter = ' ${pageContext.request.contextPath}';
	function addSearch(result) {
		var html = "";
		for (var i = 0; i < result.length; i++) {

			html += '<div class="usersinfo"><div class="bg" ';
			if (result[i].ubg == null) {
				html += 'style="background: ' + result[i].ucolor + ';'
			} else {
				html += 'style="background-color: ' + result[i].ucolor + ';background: url(' + mytwitter + '/img/' + result[i].uname + "/" + result[i].ubg + ');';
			}
			html += 'background-size: 300px 100px;"></div><div class="waiyuan">' +
				'<div class="yuantouxiang" style="background: url(' + mytwitter + '/img/' + result[i].uname + "/" + result[i].ulogo + ');background-size: 70px 70px;"></div></div>'
			html += '<div class="waiguanzhu">';
			if ("@" + result[i].uaite != $("#aitevalue").html()) {
				if(result[i].guanzhu == 1)
					html += '<button class="guanzhuta" onclick="guanzhuta(this)" style="color:white;background-color:'+color+';border:0px solid red">正在关注</button>';
				if(result[i].guanzhu == 0)
					html += '<button class="guanzhuta" onclick="guanzhuta(this)" style="color:'+color+';">关注</button>';
			}

			html += '</div><div class="realname">' + result[i].urealname + '</div><div class="uaite">@' +
				result[i].uaite + '</div><div class="jianjie">' + result[i].uabout 
				+ '</div><input class="uid" type="hidden" value="'+result[i].uid+'"/></div>';
		}
		return html;
	}
	function search(url) {
		$.ajax({
			url :url,
			type : 'POST',
			success : function(response, status) {
				var length = response.length;
				if (response == "没有" && $(".usersinfo").length == 0) {
					var html = '<div id="bucunzai"><div id="meiyou">没有关于 ' + $("#searchname").html() + ' 的结果 </div><div id="cuowu">你输入的词语查不到任何结果。你可能打错了。</div></div>';
					$("#content").append(html);
					searchJs();
					return;
				} else if (response == "没有") {
						$("#jiazaianniu").html("没有更多了！");
						return;
				} else if (response == "no") {
					var html =  '<div id="bucunzai"><div id="meiyou">没有你关注 OR 关注你的人。 </div></div>';
					$("#content").append(html);
					searchJs();
					return;
				} else if (response == "nono") {
					var html =  '<div id="bucunzai"><div id="meiyou">没有 ${who.urealname} 关注 OR 关注 ${who.urealname} 的人。 </div></div>';
					$("#content").append(html);
					searchJs();
					return;
				} else {
					var result = $.parseJSON(response);
					var html = addSearch(result);
					$("#content").append(html);
					$('window').scrollTop($('#elliot')[0].scrollHeight);
					$("#jiazaianniu").show();
				}
				searchJs();
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(errorThrown);
			}
		});
	};
function guanzhuta(button){
		var uid = $(button).parent().next().next().next().next().val();
		if ( $(button).html() == '关注') {
			 updateFollow(uid,"add");
			 $(button).css("backgroundColor", color);
			 $(button).html("正在关注");
			 $(button).css("color", "white");
			 $(button).css("border", "0px solid red");	
		}
		if ( $(button).html() == '取消关注') {
			 updateFollow(uid,"del");
			 $(button).css("backgroundColor","white");
			 $(button).html("关注");
			 $(button).css("color", color);
			 $(button).css("border", "1px solid " + color);		
		}
}
	function searchJs() {
		$(".realname").on({
			mouseover : function() {
				$(this).css("color", color);
			},
			mouseout : function() {
				$(this).css("color", "black");
			},
			click : function() {
				var uid = $(this).next().next().next().val();
				if(uid == ${user.uid}){
						window.open("selfdetail.jsp");
						return;
				}
	            window.open("user.do?method=iswho&who="+$(this).html().trim()+"&id="+uid);
			}
		});
		
		$(".guanzhuta").css("border", "1px solid " + color);
		$(".guanzhuta").on({
			mouseover : function() {
				if ($(this).html() == '关注') {
					var yanse = color.substring(0, color.indexOf("1.00"));
					$(this).css("backgroundColor", yanse + "0.1)");
				}
				if ($(this).html() == '正在关注') {
					$(this).html("取消关注");
					$(this).css("backgroundColor", "rgba(172,0,43,1.00)");
				}
			},
			mouseout : function() {
				if ($(this).html() == '关注')
					$(this).css("backgroundColor", "white");
				if ($(this).html() == '取消关注') {
					$(this).css("backgroundColor", color);
					$(this).html("正在关注");
					$(this).css("color", "white");
					$(this).css("border", "0px solid red");
				}

			}
		});
		$("#dianjisousuo").css("color", color);
		$("#dianjisousuo").css("border", "1px solid " + color);
		$("#dianjisousuo").on({
			mouseover : function() {
				var yanse = color.substring(0, color.indexOf("1.00"));
				$(this).css("backgroundColor", yanse + "0.1)");
			},
			mouseout : function() {
				$(this).css("backgroundColor", "white");
			},
			click : function() {
				$("#logo").attr("src", "img/spinner-rosetta-blue-26x26.gif");
				var reg = new RegExp("^[\u4e00-\u9fa5_a-zA-Z0-9]+$","gi");
				var word = $("#sousuo input").val();
				if(reg.test(word)  || word=="" ){
					location = "search.jsp?word=" + word;
				}else{
					youwu();
				}

			}
		});
		function youwu(){
			var html = '<div id="bucunzai"><div id="meiyou">你的输入内容有误，请重新输入！</div></div>';
			$("#second").html(html);
			searchJs();
			$("#logo").attr("src", "img/index.ico");
		}
		$("#sousuo input").on({
			focus : function() {
				$(this).css("border", "1px solid " + color);
			},
			blur : function() {
				$(this).css("border", "1px solid #657786");
			},
		});
		$('#sousuo input').bind('keypress', function(event) {
			if (event.keyCode == 13) {
				$("#logo").attr("src", "img/spinner-rosetta-blue-26x26.gif");
				var reg = new RegExp("^[\u4e00-\u9fa5_a-zA-Z0-9]+$","gi");
				var word = $("#sousuo input").val();
				if(reg.test(word)  || word==""){
					location = "search.jsp?word=" + word;
				}else{
					youwu();
				}
			}

		});

		$("#sousuo input").bind('input propertychange ', function() {
			if ($(this).val().trim() != "") {
				$(this).css("color", "black");
			} else {
				$(this).css("color", "#657786");
			}
		});
		$("#sousuo input").val("");
		$("#sousuo input").focus();
	/* 	if(${param.word==""}){
				if(${param.fw==1}){
					window.document.title = "你关注的人 / Twitter";
				}else if(${param.fw==2}){
					window.document.title = "关注你的人 / Twitter";
				}else if(${param.fw==3}){
					window.document.title = "${who.urealname} 关注的人 / Twitter";
				}else if(${param.fw==5}){
					window.document.title = "关注 ${who.urealname} 的人 / Twitter";
				}else{
					window.document.title = "所有用户 / Twitter";
				}
		} */
	}
	
	function updateFollow(uid,method){
		$.ajax({
              type: "POST",
              url:"concern.do?method="+method+"&suid="+uid,
   	          async: false,  
              success: function(data) {
					//Ok
                }
            });
	}
</script>
<script>
	var color = "${info.ucolor}";
	var yanse = color.substring(0, color.indexOf("1.00")) + "0.4)";

	$("#users").css("color", color);
	$("#users").css("borderBottom", "3px solid " + color);
	$(".button").css("backgroundColor", color);
	$("#touxiang").css("backgroundColor", color);
	$("#littleloader").css("backgroundColor", color);
	$(".dt").css("color", color);
	$("#touxiang").css("backgroundSize", "31px 31px");
	$(".search").on({
		focus : function() {
			$(".search").css("backgroundColor", "rgba(255,255,255,1.00)");
			$(".sear").css("backgroundColor", "rgba(255,255,255,1.00)");
		//$(".search").css("color", "rgba(203,203,203,1.00)");
		},
		blur : function() {
			$(".search").css("backgroundColor", "rgba(245,248,250,1.00)");
			$(".sear").css("backgroundColor", "rgba(245,248,250,1.00)");
		//$(".search").css("color", "rgba(44,47,47,1.00)");
		}
	});

	$("#logo").click(function(e) {
		e.preventDefault();
		$(document.documentElement).animate({
			scrollTop : 0
		}, 500);
		//支持chrome
		$(document.body).animate({
			scrollTop : 0
		}, 500);
	});

	$("#daohang li").on({
		mouseover : function() {
			$(this).css("borderBottom", "5px solid " + color);
			$(this).css("color", color);
		},
		mouseout : function() {
			$(this).css("borderBottom", "");
			$(this).css("color", "rgba(102,107,117,1.00)");
		}
	});
	$("#daohang li:eq(0)").on({
		click : function() {
			location = "main.jsp";
		}
	});
	$("#daohang li:eq(1)").click(function() {
		location = "notify.jsp";
	});
	$("#daohang li:eq(2)").click(function() {
		window.open("message.jsp");
	});
	$(".button").on({
		mouseover : function() {
			$(this).css("backgroundColor", "rgb(0, 109, 191 ,1.00)");
		},
		mouseout : function() {
			$(this).css("backgroundColor", " rgba(29, 161, 241, 1.00)");
		}
	});

	$("#touxiang").click(function() {
		$("#list").fadeToggle(10);
	});

	$(document).click(function(e) {
		e = window.event || e; // 兼容IE7
		obj = $(e.srcElement || e.target);
		if ($(obj).is("#touxiang") || ((e.pageX >= 1035 && e.pageX <= 1165) && (e.pageY >= 50 && e.pageY <= 311))) {

		} else {
			$("#list").fadeOut(10);
		}
	});

	$(function() {
		$('#popup').popup({
			ifDrag : true,
			dragLimit : true
		});
	});

	$(".listd").on({
		mouseover : function() {
			$(this).css("backgroundColor", color);
			$(this).css("color", "white");
		},
		mouseout : function() {
			$(this).css("backgroundColor", "white");
			$(this).css("color", "black");
		}
	});

	$(".listd:first").click(function() {
		location = "selfdetail.jsp";
	});
	$("#self").click(function() {
		location = "selfdetail.jsp";
	});

	$(".listd:last").click(function() {
		location = "user.do?method=exit";
	});

	$(".wen").css("border", "0px solid lightsalmon");
	$(".wen").css("color", color);
	$(".tweet").css("border", "2px solid " + color);
	$(".addThing").css("color", color);
	$(".xinxian").focus();
	$(".wen").on({
		focus : function() {
			if ($(this).trim().val() == "" || $(this).val() == null) {
				$(".wen").css("color", "black");
				$(".but").attr("disabled", "true");
			} else {
				$(".but").removeAttr("disabled");
			}
			$(".tweet").css("border", "2px solid " + color);
		},
		blur : function() {
			if ($(this).val() == "" || $(this).val() == null) {
				$(".wen").css("color", color);
				$(".but").attr("disabled", "true");
			} else {
				$(".but").removeAttr("disabled");
			}
			$(".tweet").css("border", "2px solid " + color);
		//rgb(164, 217, 249)
		}
	});

	$(".addThing").on({
		mouseover : function() {
			$(this).css("color", "#657786");
		},
		mouseout : function() {
			$(this).css("color", color);

		}
	});

	autosize(document.querySelectorAll('textarea'));

	if ($(".wen").val() == "") {
		$(".but").attr("disabled", "true");
	}

	$("#tuiwen2").bind('input oninput', function() {
		$(".cont").css("height", $(this).height() + 100 + "px");
	});
	$(".cont").css("height", "200px");
	$(".wen").bind('input oninput', function() {
		var zishu = 140 - $(this).val().length;
		$(".zishu").html(zishu);

		if (zishu < 0) {
			$(".zishu").css("color", "lightcoral");
			$(".zishu").css("fontWeight", "bold");
			$(".wen").css("color", "lightcoral");
			$(".but").attr("disabled", "true");
		} else {
			$(".zishu").css("color", "#657786");
			$(".zishu").css("fontWeight", "");
			$(".wen").css("color", "black");
			$(".but").removeAttr("disabled");
			if ($(this).val() == "") {
				$(".but").attr("disabled", "true");
			} else {
				$(".but").removeAttr("disabled");
			}
		}
	});
</script>
<script>
	$("#xianshi").css("color", color);
	$("#xianshi").on({
		click : function() {
			if ($(this).html().trim() == "· <a>显示</a>") {
				$(this).html(" · <a>隐藏</a>");
				$("#xuanze").animate({
					height : "160px"
				}, 300);
				$("select").fadeIn();
				return;
			}
			if ($(this).html().trim() == "· <a>隐藏</a>") {
				$(this).html(" · <a>显示</a>");
				$("#xuanze").animate({
					height : ""
				}, 500);
				$("select").fadeOut(500);
				return;
			}
		}
	});

	$("#chaxun").on({
		click : function() {
			$("#logo").attr("src", "img/spinner-rosetta-blue-26x26.gif");
			var word = $(".search").val();
			var reg = new RegExp("^[\u4e00-\u9fa5_a-zA-Z0-9]+$", "gi");
			if (reg.test(word) || word == "") {
				location = "search.jsp?word=" + word;
			} else {
				youwu();
			}

		}
	});
	$("#search_two").val();

	$('#search_two').bind('keypress', function(event) {
		if (event.keyCode == 13) {
			$("#logo").attr("src", "img/spinner-rosetta-blue-26x26.gif");
			var word = $(".search").val();
			var reg = new RegExp("^[\u4e00-\u9fa5_a-zA-Z0-9]+$", "gi");
			if (reg.test(word) || word == "") {
				location = "search.jsp?word=" + word;
			} else {
				youwu();
			}
		}
	});

	$("#search_two").bind('input propertychange ', function() {
		if ($(this).val().trim() != "") {
			$(this).css("color", "black");
		} else {
			$(this).css("color", "#657786");
		}
	});
</script>
</html>
