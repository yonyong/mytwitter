<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>MyTwitter聊天网页版</title>
<link rel="icon" href="img/index.ico" />
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css" />
<script src="js/jquery.mCustomScrollbar.min.js"></script>
<link rel="stylesheet" href="css/system/message.css">
</head>

<body style="height: 100%;">
	<div id="message">
		<div id="liebiao">
			<div id="info">
				<div id="touxiang">
					<img
						src="${pageContext.request.contextPath}/img/${user.uname }/${info.ulogo} " />
				</div>
				<div id="uname">${user.urealname }</div>
				<span class="glyphicon glyphicon-comment" id="addfriend"
					data-toggle="modal" data-target="#myModal"></span>
			</div>
			<div id="search">
				<span class="glyphicon glyphicon-search"
					style="padding-top:12px;z-index: 9;float:left;color:#657786;font-size: 16px;width: 40px;height: 40px;position: relative;"></span>
				<input type="text" placeholder="查找联系人">
			</div>
			<div id="friend"></div>
		</div>
		<div id="xiaoxi">
			<div id="xiaoxione" style="display: none;">
				<div id="xiaoxitop"></div>
				<input class="uid" type="hidden">
				<div id="xiaoxinall"></div>
				<div id="addpic"></div>
				<textarea id="xiaoxikuang"></textarea>
				<div id="tip">按下Enter发送消息/Ctrl+Enter换行</div>
			</div>
			<div id="xiaoxitwo">您还未选中或发起聊天，快去跟好友聊一聊吧</div>
		</div>
	</div>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width:400px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">选择好友</h4>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						id="guanbi">关闭</button>
					<button type="button" class="btn btn-primary" id="xuanze">确定</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
</body>
<script>
	$("#xuanze").on({
		click:function(){
			xqnum = 0;
			$("input[name='haoyou']").each(function(){
				   if($(this).get(0).checked){
				   		var haoyou = $(this).get(0);
				   		$(".xiangqing").each(function(){
					   		if($(this).find(".uuid").val() == $(haoyou).parent().find(".uid").val()){
					   			if($("#xiaoxione").css("display") == "block"){
					   				if($("#xiaoxione").find(".uid").val() == $(this).find(".uuid").val()){
					   					
					   				}else{
					   					$(this).click();
					   				}
					   			}else{
					   				$(this).click();
					   			}
					   			$("#guanbi").click();
					   			return;
					   		}else{
					   			xqnum++;
					   		}
					 	});
					 	if(xqnum == $(".xiangqing").length){
					 		var html = '<div class="xiangqing" onclick="getMessage(this)"><div class="touxiang"><img src="'
								+$(haoyou).parent().find(".pengyoutouxiang img").attr("src")+ '" /></div><div class="liaotianxinxi">'
								+ '<input type="hidden" class="uuid" value="' + $(haoyou).parent().find(".uid").val()+ '"><div class="liaotianname">' + $(haoyou).parent().find(".pengyouname").html().trim() + '</div><div class="liaotiantime"></div>'
								+ '<div class="liaotianneirong"></div></div></div></div>';
							$("#friend").prepend(html);
							$(".xiangqing:eq(0)").click();
							$("#guanbi").click();
					   		return;
					 	}
				    }
			   });
			   $("#guanbi").click();
		}
	})
	$("#addfriend").on({
		mouseover : function() {
			$(this).css("color", "white");
		},
		mouseout : function() {
			$(this).css("color", "grey");
		},
		click:function(){
			addFriends();
		}
	});
	function getMessage(user) {
		if ($(user).css("backgroundColor") == "rgb(41, 43, 46)") {
			$(user).css("backgroundColor", "rgba(51, 53, 58, 1.00)");
			$(user).css("borderLeft", "");
			$("#xiaoxitwo").show();
			$("#xiaoxione").hide();
			$(this).find(".newmsg").hide();
			clearInterval(time);
			return;
		}
		$("#xiaoxitwo").hide();
		$("#xiaoxione").show();
		$(user).css("backgroundColor", "rgba(41, 43, 46, 1.00)");
		$(user).css("borderLeft", "3px solid orangered");
		$(user).siblings().css("backgroundColor", "rgba(51, 53, 58, 1.00)");
		$(user).siblings().css("borderLeft", "");
		$(this).find(".newmsg").hide();
		$("#xiaoxitop").html($(user).find(".liaotianname").html().trim());
		var uid = $(user).find(".uuid").val();
		$("#xiaoxione").find(".uid").val(uid);
		getMsg(uid);
		time = window.setInterval(function() {
			shuaxin()
		}, 1000);
	}
	function addFriends(){
		$.ajax({
			url : "/mytwitter/message.do?method=addfriend",
			type : "POST",
			asyn : true,
			success : function(response) {
				if(response =="[]"){
					$(".modal-body").html("无可聊天好友！");
					return;
				}
				var pengyou = $.parseJSON(response);
				var html = addPengyou(pengyou);
				$(".modal-body").html(html);
			}
		})
	}
	function addPengyou(pengyou){
		var html = '';
		for(var i = 0; i < pengyou.length; i++){
			html+='<div class="pengyou"><input type="hidden" class="uid" value="'
			+pengyou[i].uid+'"><input type="radio" name="haoyou" class="pengyoudanxuan" style="margin-top: 13px;margin-left: 30px;" /><div class="pengyoutouxiang"	><img src="'
			+'${pageContext.request.contextPath}/img/'+pengyou[i].uname+'/'+pengyou[i].ulogo+'" /></div><div class="pengyouname">'
			+pengyou[i].urealname+'</div><div class="pengyouaite">@'+pengyou[i].uaite+'</div>';
			
			html+='</div>';
		}
		return html;
	}
	function getMsg(uid) {
		$.ajax({
			url : "/mytwitter/message.do?method=msg&uid=" + uid,
			type : "POST",
			asyn : true,
			success : function(response) {
				var msg = $.parseJSON(response);
				var html = addMessage(msg);
				$("#xiaoxinall").html(html);	
				$('#xiaoxinall').scrollTop($('#xiaoxinall')[0].scrollHeight);
			}
		})
	}
	
	function shuaxin(){
		var url =  "/mytwitter/message.do?method=shuaxin&uid=" +$("#xiaoxione").find(".uid").val() +"&mid=" +$(".xiaoxixiaoxi:last").find(".mid").val();
		$.ajax({
			url : url ,
			type : "POST",
			success : function(response) {
				if(response!="[]"){
					var msg = $.parseJSON(response);
					var html = addMessage(msg);
					$("#xiaoxinall").append(html);	
					$('#xiaoxinall').scrollTop($('#xiaoxinall')[0].scrollHeight);
				}
			}
		})
	}
	function delliaotian(uid){
		var url =  "/mytwitter/message.do?method=del&uid="+ uid ;
		$.ajax({
			url : url ,
			type : "POST",
			success : function(response) {
			}
		})
	}
	function friendJs() {
	var kyoPopupMenu={};  
    kyoPopupMenu = (function(){  
    return {  
        sys: function (obj) {  
            $('.popup_menu').remove();  
            popupMenuApp = $('<div class="popup_menu app-menu"><ul><li><a menu="menu1">删除聊天</a></li></ul></div>')  
            .find('a').attr('href','javascript:;')  
            .end().appendTo('body');  
            //绑定事件  
            $('.app-menu a[menu="menu1"]').on('click', function (){  
            	var suid = $(obj).find(".uuid").val();
            	//delliaotian(suid)
            });  
            return popupMenuApp;  
        }  
    }})();  
    //取消右键  
    $('html').on('contextmenu', function (){return false;}).click(function(){  
        $('.popup_menu').hide();  
    });  
    //桌面点击右击  
	    $('.xiangqing').on('contextmenu',function (e){  
	        var popupmenu = kyoPopupMenu.sys(this);  
	        l = ($(document).width() - e.clientX) < popupmenu.width() ? (e.clientX - popupmenu.width()) : e.clientX;  
	        t = ($(document).height() - e.clientY) < popupmenu.height() ? (e.clientY - popupmenu.height()) : e.clientY;  
			popupmenu.css({left: l,top: t}).show();  
	        return false;  
	    }); 
		$(".xiangqing").on({
			mouseover : function() {
				if ($(this).css("backgroundColor") == "rgb(51, 53, 58)")
					$(this).css("backgroundColor", "rgba(41, 43, 45, 1.00)");
			},
			mouseout : function() {
				if ($(this).css("backgroundColor") == "rgb(41, 43, 45)")
					$(this).css("backgroundColor", "rgba(51, 53, 58, 1.00)");
			}
		});
	}
	
	$("#xiaoxikuang").keyup(function(e) {
		if (e.keyCode == 13 && e.ctrlKey) {
			$(this).val($(this).val() + "\n");
		} else if (e.keyCode == 13) {
			e.preventDefault();
			if ($(this).val().trim() != "") {
				addMessageAll();
			}
			
		}
	});
	$(function() {
		$("#friend").mCustomScrollbar({
			setTop : "0"
		});
		getFriend();
		window.setInterval(function() {
			getFriend()
		}, 1000);
	})
	function addMessageAll(){
		var url =  "/mytwitter/message.do?method=addmsg&uid=" +$("#xiaoxione").find(".uid").val() + "&mcontent=" +$("#xiaoxikuang").val() ;
		$.ajax({
			url : url,
			type : "POST",
			asyn:false,
			success : function(response) {
				if(response == "ok"){
					$('#xiaoxinall').scrollTop($('#xiaoxinall')[0].scrollHeight);
					$("#xiaoxikuang").val("");
				}
			}
		})
	
	}
	var message;
	function getFriend() {
		$.ajax({
			url : "/mytwitter/message.do?method=liebiao",
			type : "POST",
			asyn : true,
			success : function(response) {
				if (message != response) {
					var msg = $.parseJSON(response);
					var html = addMsg(response, msg);
					$("#friend").html(html);
					if($("#xiaoxione").css("display") == "block"){
						for(var i = 0; i < $(".xiangqing").length; i++){
							if($(".xiangqing:eq("+i+")").find(".uuid").val() == $("#xiaoxione").find(".uid").val() ){
								$(".xiangqing:eq("+i+")").css("backgroundColor","rgba(41, 43, 46, 1.00)");
								$(".xiangqing:eq("+i+")").css("borderLeft","3px  solid orangered");
							}
						}
					}
					friendJs();
				}
			}
		})
	}
	function addMessage(msg) {
		var html = "";
		for (var i = 0; i < msg.length; i++) {
			if(msg[i].fuid == ${user.uid}){
				html += '<div class="sendxiaoxi xiaoxixiaoxi" ><input type="hidden"  class="mid" value="'+msg[i].mid+'"><div class="sendtouxiang"><img src="${pageContext.request.contextPath}/img/${user.uname }/${info.ulogo} " />'
				+'</div><div class="sendneirong">'+msg[i].mcontent+'</div><div style="clear: both;"></div></div>';
			}else{
				html+='<div class="getxiaoxi xiaoxixiaoxi"><input type="hidden" class="mid" value="'+msg[i].mid+'"><div class="gettouxiang"><img src="'
				+ '${pageContext.request.contextPath}/img/' + msg[i].uname + '/' + msg[i].ulogo + '" /></div>'
				+'<span class="getneirong">'+msg[i].mcontent+'</span><div style="clear: both;"></div>	</div>';
			}
		}
		return html;
	}
	var first = 0;
	function addMsg(response, msg) {
		first++;
		message = response;
		var html = "";
		for (var i = 0; i < msg.length; i++) {
			if(msg[i].fuid == ${user.uid}){
				html += '	<div class="xiangqing"  onclick="getMessage(this)"';
				if(i == 0 && first > 1){
					html+='style="background-color:rgba(41, 43, 46, 1.00);border-left:3px  solid orangered"';
				}
				html+='><div class="touxiang"><img src="'
					+ '${pageContext.request.contextPath}/img/' + msg[i].uname2 + '/' + msg[i].ulogo2 + '" /></div><div class="liaotianxinxi">'
					+ '<input type="hidden" class="uuid" value="' + msg[i].uid2 + '"><div class="liaotianname">' + msg[i].urealname2 + '</div>	<div class="liaotiantime">' + msg[i].time + '</div>'
					+ '<div class="liaotianneirong">' + msg[i].mcontent + '</div></div></div></div>'
			}else{
				html += '	<div class="xiangqing" onclick="getMessage(this)"><div class="touxiang"><img src="'
					+ '${pageContext.request.contextPath}/img/' + msg[i].uname + '/' + msg[i].ulogo + '" /></div><div class="liaotianxinxi">'
					+ '<input type="hidden" class="uuid" value="' + msg[i].fuid + '"><div class="liaotianname">' + msg[i].urealname + '</div>	<div class="liaotiantime">' + msg[i].time + '</div>'
					+ '<div class="liaotianneirong">' + msg[i].mcontent + '</div>';
				if(msg[i].mread == 0){
					html+='<div class="newmsg"></div>';				
				}
				html+='</div></div></div>';
			}
		}
		return html;
	}
</script>
</html>