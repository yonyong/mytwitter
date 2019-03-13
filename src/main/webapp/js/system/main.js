window.setInterval(function() {
        siliao();
    }, 10000);
function siliao() {
    var url =  '/mytwitter/message.do?method=hasnew';
    $.ajax({
        url : url,
        type : 'POST',
        success : function(response, status) {
            if (response > 0) {
                $(".tishidian:eq(2)").show();
            }else{
                $(".tishidian:eq(2)").hide();
            }
        }
    });
};

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
shishitongzhi();
window.setInterval(function() {
    shishitongzhi();
}, 10000);
var tongzhishu = 0;
function shishitongzhi() {
    $.ajax({
        url : '/mytwitter/notify.do?method=noread',
        type : 'POST',
        success : function(response, status) {
            if (response > 0 && tongzhishu!=response) {
                tongzhishu = response;
                $("#tongzhigeshu").html(response);
                $("#notification").show();
                if (response * 1 > 9) {
                    var tongzhichang = $("#tongzhigeshu").css("width");
                    $("#notification").css("width", tongzhichang.substring(0, tongzhichang.indexOf("p")) * 1 + 8 + "px");
                }
            }
        }
    });
}


$("#chakangerenziliao").click(function(){
    location="selfdetail.jsp";
});

$("#tianjiazhaopian").click(function() {
    $("#user_tou_xiang").click();
});
$(function() {
    $("#date").selectDate();
    $("#days").focusout(function() {
        var year = $("#year option:selected").html()
        var month = $("#month option:selected").html()
        var day = $("#days option:selected").html()
        console.log(year + month + day)
    })
})
$("#shangchuanshengri").click(function() {
    var year = $("#year option:selected").html()
    var month = $("#month option:selected").html()
    var day = $("#days option:selected").html()
    if (year == "年") {
        $("#tongzhi").html("请选择年份！").fadeIn(300).delay(500).fadeOut(300);
        return;
    }
    if (month == "月") {
        $("#tongzhi").html("请选择月份！").fadeIn(300).delay(500).fadeOut(300);
        return;
    }
    if (day == "日") {
        $("#tongzhi").html("请选择日期！").fadeIn(300).delay(500).fadeOut(300);
        return;
    }
    if (year != "年" && month != "月" && day != "日") {
        xiugaishengri(year + month + day);
    }
});

function xiugaishengri(data) {
    $.ajax({
        url : '/mytwitter/user.do?method=updatebrithday',
        type : 'POST',
        data : {
            date : data
        },
        success : function(response, status) {
            if(response =="ok"){
                $(".buchongziliao:eq(2)").hide();
                $("#tongzhi").html("修改信息成功！").fadeIn(300).delay(500).fadeOut(300);
                gengxininfo("two");
            }
        }
    });
}

function gengxininfo(data) {
    $.ajax({
        url : '/mytwitter/user.do?method=gengxininfo&neirong='+data,
        type : 'POST',
        success : function(response, status) {
            if(response == 'ok'){
                $(".buchongziliao:eq(3)").show();
            }
        }
    });
}

$("#baocunjianjie").click(function() {
    var jianjie = $("#shangchuanabout").val().trim();
    if(jianjie == ""){
        $("#tongzhi").html("请输入介绍！").fadeIn(300).delay(500).fadeOut(300);
        return;
    }
    xiugaijianjie(jianjie);
});

$("#guanbiwancheng").click(function(){
    $(".buchongziliao:eq(3)").hide();
})


$("#kuaijiejian").click(function(){
    alert("\n\n按Ctrl+Enter发推文\n\n");
});
$("#tweet1").keyup(function(event){
    if (event.ctrlKey && event.keyCode == 13) {
        if($(this).val().trim() > 0){
            $("#submit").click();
        }else{
            $("#tongzhi").html("推文内容为空！").fadeIn(300).delay(500).fadeOut(300);
        }
    }
});
$("#tweet2").keyup(function(event){
    if (event.ctrlKey && event.keyCode == 13) {
        if($(this).val().trim() > 0){
            $("#submittwo").click();
        }else{
            $("#tongzhi").html("推文内容为空！").fadeIn(300).delay(500).fadeOut(300);
        }
    }
});
$(document).keyup(function(event){
    switch(event.keyCode) {
        /*  case 84:
             $("#fatui").click();
             return; */
        case 27:
            $("#guanguanguan").click();
            return;
    }
});
$("#user_tou_xiang").click(function(){
    $("#xiugaitouxiang").show();
    $("#xiugaishang").show();
});
$("#xiugaitouxiang div").on({
    mouseover:function(){
        $(this).css("backgroundColor",color);
        $(this).css("color","white");
    },
    mouseout:function(){
        $(this).css("backgroundColor","white");
        $(this).css("color","black");
    }
});
$("#quxiaoxiugai").click(function(){
    $("#xiugaitouxiang").hide();
    $("#xiugaishang").hide();
});
var touxiang = "${pageContext.request.contextPath}/img/${user.uname }/${info.ulogo}";
var mytwitter  =' ${pageContext.request.contextPath}';
$(".tuijian_touxiang").css("background","url('"+touxiang+"')");
$(".tuijian_touxiang").css("backgroundSize","50px 50px");
var number = ${info.utweet}+"";
var one = "1";
var zero = "0";
var tuiwenshu = 0;

function hasNew() {
    $.ajax({
        url : '/mytwitter/tweettwo.do?method=gettweets&pagenum=0',
        type : 'POST',
        success : function(response, status) {
            var length = response.length;
            if( length < 5){
                var html ='<div class="tuiwen" id="kongkong"><div class="meiyou">啥？一条推文都没有？</div>'
                    +'<div class="kongkong">这条空空的时间线不能就这么搁着。开始关注用户吧，然后你就会在此看到推文。</div>'
                    +'	<input class=" btn btn-info" id="seluser" type="button"	value="寻找值得关注的用户" /></div>';
                $("#content").append(html);
                tweetsJs();
                return;
            }else{
                var tweets =$.parseJSON( response.substring(response.indexOf("["), response.length) );
                var html = addTweet(tweets);
                $("#content").append(html);
            }
            tweetsJs();
        }
    });
};

function jiaZai() {
    if( $("#back").css("display") == "none"){
        $('#jiazai img').fadeIn();
        var url = '/mytwitter/tweettwo.do?method=gettweets&pagenum='+$(".tuiwen").length;
        $.ajax({
            url : url,
            type : 'POST',
            success : function(response, status) {
                var num = response.length;
                $("#jiazai img").fadeOut();
                if(num <10){
                    tuiwenshu =  $(".tuiwen").length;
                    $("#jiazai img").hide();
                    $("#back").show();
                    return;
                }
                var tweets =$.parseJSON( response.substring(response.indexOf("["), response.length) );
                var html = addTweet(tweets);
                $("#content").append(html);
                tweetsJs();
            }
        });
    }
};

var jian = 403;
$(window).scroll(function(event) {

    if($("#lasttubiao").offset().top - $(window).scrollTop()<250 && $("#myModal").css("visibility")!="hidden"){

    }
    if($("#tixing").css("display") == "block" && $("#jiazai").css("display")== "none"){
        jian = 363;
    }else if($("#tixing").css("display") == "block" && $("#jiazai").css("display") == "block"){
        jian = 352;
    }else  if($("#tixing").css("display") == "none" && $("#jiazai").css("display") == "block"){
        jian = 392;
    }else{
        jian = 403;
    }
    var winPos = $(window).scrollTop();
    var viewH = $(this).height();
    var contentH = $("#content").get(0).scrollHeight;
    if (winPos == contentH-jian/* $(document).scrollTop() + $(window).height()  > $(document).height() + 5 */) {
        if ($(document).scrollTop() > 400) {
            $("#jiazai").show();
            page = $(".tuiwen").length;
            jiaZai();
        }
    }
    if( $("#back").css("display") == "block"){
        $("#jiazai img").hide();
        $("#jiazai").html("<p style='color:#657786;margin-left:-10px'>没有更多了哦！</p>");
    }
});
function gengXin() {
    var url =  '/mytwitter/tweettwo.do?method=getnewtweets&td=top&nowid='+$(".tuiwen:eq(0)").find(".idid").val();
    $.ajax({
        url : url,
        type : 'POST',
        success : function(response, status) {
            if (response > 0) {
                $("#tixing").fadeIn();
                $("#tixing").html("<span  style='color:" + color + ";position:relative;left:240px;top:10px;font-size:14px'>" + "查看 " + response + "条推文</span>");
                window.document.title = "(" + response + ")Twitter";
                $(".tishidian:eq(0)").show();
            }
        }
    });
};
function tianJia() {
    var url =  '/mytwitter/tweettwo.do?method=getnewtweets&td=down&nowid='+$(".tuiwen:eq(0)").find(".idid").val();
    $.ajax({
        url : url,
        type : 'POST',
        success : function(response, status) {
            var tweets =$.parseJSON(response);
            var html = addTweet(tweets);
            $("#content").prepend(html);
            tweetsJs();
            $("#tixing").hide();
            window.document.title = "Twitter";
            $(".tishidian:eq(0)").hide();
        }
    });
};
window.setInterval(function() {
    if($("#kongkong").length <1){
        gengXin();
    }
}, 15000);
$("#tixing").on({
    click:function(){
        tianJia();
    }
});


function getAllContent(button){
    var sender_name = $(button).parent().find(".sender_name").html();
    var sender_aite = $(button).parent().find(".sender_aite").html();
    var sender_time = $(button).parent().find(".sender_time").html();
    var neirong = $(button).html();
    var tid = $(button).parent().find(".idid").val();
    var uid = $(button).parent().find(".uuid").val();
    var dianzanCount = $(button).parent().find(".dianzanCount").html();
    var zhuanfaCount = $(button).parent().find(".zhuanfaCount").html();
    var huifuCount = $(button).parent().find(".huifuCount").html();
    var dianzanyanse = $(button).parent().find(".zan").css("color");
    var zhuanfayanse = $(button).parent().find(".zhuanfa").css("color");
    var sender_tou_xiang = $(button).parent().parent().find(".sender_tou_xiang").css("background-image");
    var touxiang = sender_tou_xiang.substring(sender_tou_xiang.indexOf('"')*1+1,find(sender_tou_xiang,'"',1));
    if($(button).parent().find(".sender_pic").html()!=null){
        var sender_pic = $(button).parent().find(".sender_pic").html();
        var pic = sender_pic.substring(sender_pic.indexOf('"')*1+1,find(sender_pic,'"',1));
        $("#tanchu_neirong").html(neirong+"<a href='"+pic+"' target='view_window' style='font-size:18px;margin-left:10px'>图片</a>");
    }else{
        $("#tanchu_neirong").html(neirong);
    }
    $("#tanchu_touxiang img").attr("src",touxiang);
    $("#tanchu_name").html(sender_name);
    $("#huifumingzi").html(sender_aite);
    $("#tanchu_aite").html(sender_aite);
    $("#tanchu_time").html(sender_time);
    $("#myModal").find(".idid").val(tid);
    $("#myModal").find(".uuid").val(uid);
    $("#myModal").find(".zan").css("color",dianzanyanse);
    $("#myModal").find(".zhuanfa").css("color",zhuanfayanse);
    $("#myModal").find(".dianzanCount").html(dianzanCount);
    $("#myModal").find(".zhuanfaCount").html(zhuanfaCount);
    $("#myModal").find(".huifuCount").html(huifuCount);
    $("#myModal").find("#huifu_neirong").html("");
    var page = $("#myModal").find(".replys").length;
    getreply(tid, page,sender_aite);
    tzhuan();
    $("#huifuanniu").attr("disabled", "true");
}
function replysJs(){
    $(".replys").on({
        mouseover : function() {
            $(this).css("backgroundColor", "rgba(245,248,250,1.00)");
        },
        mouseout : function() {
            $(this).css("backgroundColor", " white");
        }
    });
}
function getreply(tid,page,aite){
    $.ajax({
        url : '/mytwitter/reply.do?tid='+tid+'&page='+page,
        type : 'POST',
        success : function(response, status) {
            var replys =$.parseJSON(response);
            var html = addReply(replys, aite);
            $("#huifu_neirong").append(html);
            replysJs();
        }
    });
}
function addReply(replys,aite){
    var html="";
    for(var i = 0; i < replys.length; i++){
        html+='<div style="height: auto;width:100%;background-color: white;margin-top: 1px;cursor: pointer;" class="replys"><div style="padding-top: 8px;padding-left: 40px">'
            +'<div style="width: 60px;height: 100%;float:left;"><img style="width:48px;height:48px;border-radius: 50px" src="'
            + mytwitter+'/img/'+replys[i].uname+'/'+replys[i].ulogo+'" /></div><div><div class="huifudename">'
            +replys[i].urealname+'</div><div class="huifudeaite">@'+replys[i].uaite+'</div><div style="color:#657786;float: left;height: 30px;line-height: 30px;margin-right: 5px">·</div><div class="huifudeshijian">'
            +replys[i].time+'</div><div class="huifudeduixiang">回复<a style="margin-left: 5px;" href="">'
            +aite+'</a></div><div class="huifudexiaoxi">'+replys[i].rcontent+'</div></div></div></div>';
    }
    return html;
}
function guanzhuta(button){
    var uid = $(button).parent().next().next().next().next().val();
    if ( $(button).html() == '关注') {
        updateFollow(uid,"add");
        $(button).css("backgroundColor", color);
        $(button).html("正在关注");
        $(button).css("color", "white");
        $(button).css("border", "0px solid red");
        return;
    }
    if ( $(button).html() == '取消关注') {
        updateFollow(uid,"del");
        $(button).css("backgroundColor","white");
        $(button).html("关注");
        $(button).css("color", color);
        $(button).css("border", "1px solid " + color);
        return;
    }
}
function find(str,cha,num){
    var x=str.indexOf(cha);
    for(var i=0;i<num;i++){
        x=str.indexOf(cha,x+1);
    }
    return x;
}

window.onload = function() {
    hasNew();
}

function tzhuan(){
    $(".tzhuan").on({
        mouseover : function() {
            $(this).css("border", "1px solid #657786")
        },
        mouseout : function() {
            $(this).css("border", "1px solid lightgray")
        }
    });

}
var color = "${info.ucolor}";
var touxiang = "${pageContext.request.contextPath}/img/${user.uname }/${info.ulogo}";
var bg = "${pageContext.request.contextPath}/img/${user.uname }/${info.ubg}";

$(".touxiang").css("background", "url(" + touxiang + ")");
$(".touxiang").css("backgroundSize", "31px 31px");
$("#user_tou_xiang").css("backgroundSize", "80px 80px");
if($("#user_tou_xiang img").css("display") == "inline"){
    $("#user_tou_xiang").css("background", color);
}
$(".sender_tou_xiang").css("backgroundSize", "60px 60px");
$("#bg").css("background", "url(" + bg + ")");
$("#bg").css("backgroundSize", "300px 100px");
$("#bg").css("backgroundColor", color);
$("#touxiang").css("backgroundColor", color);
$("#seluser").css("backgroundColor", color);

$(".button").css("backgroundColor", color);
$("#daohang li:eq(0)").css("borderBottom", "5px solid " + color);
$("#daohang li:eq(0)").css("color",  color);
$(".wen").css("border", "0px solid lightsalmon");
$(".wen").css("color", color);
$(".tweet").css("border", "2px solid rgb(164, 217, 249)");

$(".addThing").css("color", color);
$(".xinxian").focus();
$(".dt").css("color", color);

$(".search").on({
    focus : function() {
        $(".search").css("backgroundColor", "rgba(255,255,255,1.00)");
        $(".sear").css("backgroundColor", "rgba(255,255,255,1.00)");
        $("#chaxun").css("backgroundColor","white");
    },
    blur : function() {
        $(".search").css("backgroundColor", "rgba(245,248,250,1.00)");
        $(".sear").css("backgroundColor", "rgba(245,248,250,1.00)");
        $("#chaxun").css("backgroundColor","rgba(245,248,250,1.00)");
    }
});
$(".zliao:eq(0), .dt:eq(0)").on({
    click:function(){
        location="selfdetail.jsp";
    }
});
$(".zliao:eq(1), .dt:eq(1)").on({
    click:function(){
        location = "search.jsp";
    }
});
$(".zliao:eq(2), .dt:eq(2)").on({
    click:function(){
        location = "search.jsp";
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

$("#back").on({
    mouseover : function() {
        $(this).css("color", color);
    },
    mouseout : function() {
        $(this).css("color", "");
    },
    click : function(e) {
        e.preventDefault();
        $(document.documentElement).animate({
            scrollTop : 0
        }, 500);
        //支持chrome
        $(document.body).animate({
            scrollTop : 0
        }, 500);
    }
});

$("#daohang li").on({
    mouseover : function() {
        $(this).css("borderBottom", "5px solid " + color);
        $(this).css("color", color);
    },
    mouseout : function() {
        $(this).css("borderBottom", "");
        $(this).css("color", "rgba(102,107,117,1.00)");
        $("#daohang li:eq(0)").css("borderBottom", "5px solid " + color);
        $("#daohang li:eq(0)").css("color",  color);
    }
});

$("#daohang li:eq(0)").click(function() {
    location = "main.jsp";
});
$("#daohang li:eq(1)").click(function() {
    location = "notify.jsp";
});
$("#daohang li:eq(2)").click(function() {
    $(".tishidian:eq(2)").hide();
    window.open("message.do?method=m");
});
$(".button").on({
    mouseover : function() {
        $(this).css("backgroundColor", "rgb(0, 109, 191 ,1.00)");
    },
    mouseout : function() {
        $(this).css("backgroundColor", " rgba(29, 161, 241, 1.00)");
    }
});

$("#seluser").on({
    mouseover : function() {
        $(this).css("webkitFilter", " opacity(.8)");
    },
    mouseout : function() {
        $(this).css("webkitFilter", " opacity(1)");
    }
});

$("#touxiang").click(function() {
    $("#list").fadeToggle(10);
});

$("#tixing").click(function() {
    bigdata = 0;
});

$(document).click(function(e) {
    e = window.event || e; // 兼容IE7
    obj = $(e.srcElement || e.target);
    if ($(obj).is("#touxiang") || ((e.pageX >= 970 && e.pageX <= 1165) && (e.pageY >= 50 && e.pageY <= 401))) {

    } else {
        $("#list").fadeOut(10);
    }
});

$("#lianjie li").on({
    mouseover : function() {
        $(this).css("color", color);
        $(this).css("borderBottom", "1px solid " + color);
    },
    mouseout : function() {
        $(this).css("color", "gray");
        $(this).css("borderBottom", "0px solid " + color);
    }
});

$("#username").on({
    mouseover : function() {
        $(this).css("color", color);
    },
    mouseout : function() {
        $(this).css("color", "black");
    },
    click:function(){
        location="selfdetail.jsp";
    }
});

$(".aite").on({
    mouseover : function() {
        $(this).css("color", color);
    },
    mouseout : function() {
        $(this).css("color", "#657786");
    },
    click:function(){
        location="selfdetail.jsp";
    }
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
    location="selfdetail.jsp";
});

$("#self").click(function() {
    location="selfdetail.jsp";
});

$(".listd:last").click(function() {
    location = "user.do?method=exit";
});

$(".wen").on({
    focus : function() {
        if ($(this).trim().val() == "" || $(this).val() == null) {
            $(".wen").css("color", "black");
            $(".but").attr("disabled", "true");
        } else {
            $(".but").removeAttr("disabled");
        }
        $(".tweet").css("border", "1px solid " + color);

    },
    blur : function() {
        if ($(this).val() == "" || $(this).val() == null) {
            $(".wen").css("color", color);
            $(".but").attr("disabled", "true");
        } else {
            $(".but").removeAttr("disabled");
        }
        $(".tweet").css("border", "2px solid rgb(164, 217, 249)");
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

$(".zliao").on({
    mouseover : function() {
        $(this).css("color", color);
    },
    mouseout : function() {
        $(this).css("color", "#657786");

    }
});

autosize(document.querySelectorAll('textarea'));

if ($(".wen").val() == "") {
    $(".but").attr("disabled", "true");
}

$("#tuiwen1").bind('input oninput', function() {
    $("#send").css("height", $(this).height() + 80 + "px");
});
$("#send").css("height", "180px");

$("#tuiwen2").bind('input oninput change',function(){
    $(".cont").css("height",$(this).height()+100+"px");
});
$(".cont").css("height","200px");
$(".wen").bind('input oninput change', function() {
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
$("#tuichukuang2").bind('input oninput change', function() {
    var zishu = 140 - $(this).val().length;
    $("#huifuzishu").html(zishu);
    if (zishu < 0) {
        $("#huifuhuifu").attr("disabled", "true");
    }else{
        $("#huifuhuifu").removeAttr("disabled");
        if ($(this).val() == "") {
            $("#huifuhuifu").attr("disabled", "true");
        } else {
            $("#huifuhuifu").removeAttr("disabled");
        }
    }
});
$("#tuichukuang3").bind('input oninput change', function() {
    var zishu = 140 - $(this).val().length;
    $("#zhuantuizishu").html(zishu);

    if (zishu<0) {
        $("#zhuantui").attr("disabled", "true");
    } else {
        $("#zhuantui").removeAttr("disabled");
        if ($(this).val() == "") {
            $("#zhuantui").attr("disabled", "true");
        } else {
            $("#zhuantui").removeAttr("disabled");
        }
    }

});
$("#huifushuru").bind('input oninput change', function() {
    var zishu = 140 - $(this).val().length;
    $("#dahuifuzishu").html(zishu);

    if (zishu<0) {
        $("#huifuanniu").attr("disabled", "true");
    } else {
        $("#huifuanniu").removeAttr("disabled");
        if ($(this).val() == "") {
            $("#huifuanniu").attr("disabled", "true");
        } else {
            $("#huifuanniu").removeAttr("disabled");
        }
    }

});

$(".wen").on({
    blur:function(){
        if ($(this).val() == "" || $(this).val().length>140) {
            $(".but").attr("disabled", "true");
        } else {
            $(".but").removeAttr("disabled");
        }
    }
});

$("#pic").bind('input oninput change', function() {
    if ($(this).val() != null) {
        var srcs = getObjectURL(this.files[0]);
        $("#pics").fadeIn();
        $("#picha").fadeIn();
        $("#ts1").fadeIn();
        $("#pics img").attr("src", srcs);
    }
});

$("#picha").on({
    mouseover : function() {
        $(this).css("color", "red");
    },
    mouseout : function() {
        $(this).css("color", "#657786");

    },
    click : function() {
        $("#pics").fadeOut();
        $("#picha").fadeOut();
        $("#ts1").fadeOut();
        $("#pic").val("");
    }
});

function getObjectURL(file) {
    var url = null;
    if (window.createObjectURL != undefined) { // basic
        url = window.createObjectURL(file);
    } else if (window.URL != undefined) { // mozilla(firefox)
        url = window.URL.createObjectURL(file);
    } else if (window.webkitURL != undefined) { // webkit or chrome
        url = window.webkitURL.createObjectURL(file);
    }
    return url;
}

$("#addpic").click(function() {
    return $("#pic").click();
});
$("#addpictwo").click(function() {
    return $("#pictwo").click();
});
$(".but").click(function() {
    $("#logo").attr("src", "img/spinner-rosetta-blue-26x26.gif");
});

$("#search_two").bind('input propertychange ', function() {
    if ($(this).val().trim() != "") {
        $(this).css("color", "black");
    } else {
        $(this).css("color", "#657786");
    }
});

$("#pics").on({
    mouseover : function() {
        $("#pics img").stop().animate({
            opacity : 0.5
        }, 1000);
    },
    mouseout : function() {
        $("#pics img").stop().animate({
            opacity : 1
        }, 1000);

    }
});

$("#changepic").click(function() {
    return $("#pic").click();
});

var dtNum = "${info.utweet}"*1;
$("#submit").click(function(){
    if($(".meiyou").css("display") == "block"){
        var url =  '/mytwitter/tweettwo.do?method=getnewtweets&td=down&nowid=';
    }else{
        var url =  '/mytwitter/tweettwo.do?method=getnewtweets&td=down&nowid='+$(".tuiwen:eq(0)").find(".idid").val();
    }
    $.ajax({
        url : url,
        type : 'POST',
        success : function(response, status) {
            if(response.length > 1 ){
                var tweets =$.parseJSON(response);
                var html = addTweet(tweets);
                $("#content").prepend(html);
                tweetsJs();
                $("#tixing").fadeOut();
                window.document.title = "Twitter";
                $(".tishidian:eq(0)").hide();
            }
            var formData = new FormData($( "#mytweet" )[0]);
            tijiao(formData);
        },
        error : function(XMLHttpRequest, textStatus, errorThrown) {
            alert(errorThrown);
        }
    });

});
function tijiao(formData){

    $.ajax({
        type: "POST",
        url:"tweettwo.do?method=newt",
        type: 'POST',
        data: formData,
        async: false,
        cache: false,
        contentType: false,
        processData: false,
        error: function(request) {
            alert("Connection error");
        },
        success: function(data) {
            $("#logo").attr("src", "img/index.ico");
            $("#tweet1").val("");
            $("#pics").fadeOut();
            $("#picha").fadeOut();
            $("#ts1").fadeOut();
            $("#pic").val("");
            $(".zishu").html(140);
            $("#tweet2").val("");
            if($(".meiyou").css("display") == "block"){
                $("#content").html("");
            }
            dtNum += 1;
            $(".dt:eq(0)").html(dtNum);
            var tweets =$.parseJSON(data);
            var html = addTweet(tweets);
            $("#content").prepend(html);
            $("#tongzhi").html("发布推文成功！").fadeIn(300).delay(2000).fadeOut(300);
            $("#submit").attr("disabled", "true");
            $("#submittwo").attr("disabled", "true");
            tweetsJs();
        }
    });
}
$("#submittwo").click(function(){
    var url =  '/mytwitter/tweettwo.do?method=getnewtweets&td=down&nowid='+$(".tuiwen:eq(0)").find(".idid").val();
    $.ajax({
        url : url,
        type : 'POST',
        success : function(response, status) {
            if(response.length > 1 ){
                var tweets =$.parseJSON(response);
                var html = addTweet(tweets);
                $("#content").prepend(html);
                tweetsJs();
                $("#tixing").fadeOut();
                window.document.title = "Twitter";
                $(".tishidian:eq(0)").hide();
            }
            var formData = new FormData($( "#mytweettwo" )[0]);
            tijiao(formData);
        },
        error : function(XMLHttpRequest, textStatus, errorThrown) {
            alert(errorThrown);
        }
    });""
});

$(function () {
    $('#popup').popup({ifDrag: true, dragLimit: true});
});

$("#chaxun").on({
    click:function(){
        $("#logo").attr("src", "img/spinner-rosetta-blue-26x26.gif");
        var word = $(".search").val().trim();
        location = "search.jsp?word="+word;

    }
});

$("#search_two").val("");
$('#search_two').bind('keypress',function(event){
    if(event.keyCode == 13)   {
        $("#logo").attr("src", "img/spinner-rosetta-blue-26x26.gif");
        var word = $(".search").val().trim();
        location = "search.jsp?word="+word;
    }
});




shuaXinTuiJian();
function shuaXinTuiJian() {
    $.ajax({
        url : '/mytwitter/user.do?method=shuaxintuijian&suiji=' + Math.random(),
        type : 'POST',
        success : function(response, status) {
            var length = response.length;
            var users = $.parseJSON(response.substring(response.indexOf("["), response.length));
            var html = changeTuiJian(users);
            $("#addtuijian").append(html);
            tweetsJs();
            $(" .tuijian_name").on({
                mouseover : function() {
                    $(this).css("color", color);
                },
                mouseout : function() {
                    $(this).css("color", "black");
                }
            });
        }
    });
}

function guanzhuname(button){
    var uid = $(button).parent().find(".uid").val().trim();
    var name = $(button).html().trim();
    location = "user.do?method=iswho&who="+name+"&id="+uid;
}
$("#shuaxintj").on({
    click : function() {
        $("#addtuijian").html('');
        shuaXinTuiJian();
    }
});



$("#zhuantui").on({
    click : function() {
        $("#logo").attr("src", "img/spinner-rosetta-blue-26x26.gif");
        var formData = new FormData($("#zhuantuiform")[0]);
        $.ajax({
            type : "POST",
            url : "tweettwo.do?method=zhuantui",
            type : 'POST',
            data : formData,
            async : false,
            contentType : false,
            cache : false,
            processData : false,
            error : function(request) {
                alert("Connection error");
            },
            success : function(data) {
                if (data == "ok") {
                    $("#logo").attr("src", "img/index.ico");
                    $("#zhuanfa").find(".close-reveal-modal").click();
                    $("#tongzhi").html("转发推文成功！").fadeIn(300).delay(1000).fadeOut(300);
                    dtNum += 1;
                    $(".dt:eq(0)").html(dtNum);
                    tianJia();
                }
            }
        });
    }
});
$("#huifu").find(".close-reveal-modal").click(function(){
    $("#huifu").find(".zhuanfashuru").val("");
    $("#huifu").find("#huifuzishu").html("140");
})
$("#huifuhuifu").on({
    click : function() {
        var huifuneirong = $("#huifu").find(".zhuanfashuru").val().trim();
        var uid = $("#huifu").find(".uuid").val();
        var tid = $("#huifu").find(".idid").val()
        $("#logo").attr("src", "img/spinner-rosetta-blue-26x26.gif");
        $.ajax({
            type : "POST",
            url : "tweettwo.do?method=huifu",
            type : 'POST',
            data : {
                huifuneirong:huifuneirong,
                tid:tid,
                uid:uid
            },
            error : function(request) {
                alert("Connection error");
            },
            success : function(data) {
                if (data == "ok") {
                    $("#logo").attr("src", "img/index.ico");
                    $("#huifu").find(".close-reveal-modal").click();
                    $("#tongzhi").html("回复成功！").fadeIn(300).delay(1000).fadeOut(300);
                }
            }
        });
    }
});
$("#huifuanniu").on({
    click : function() {
        var huifuneirong = $("#huifushuru").val().trim();
        var uid = $("#myModal").find(".uuid").val();
        var tid = $("#myModal").find(".idid").val()
        $("#logo").attr("src", "img/spinner-rosetta-blue-26x26.gif");
        $.ajax({
            type : "POST",
            url : "tweettwo.do?method=huifu",
            type : 'POST',
            data : {
                huifuneirong:huifuneirong,
                tid:tid,
                uid:uid
            },
            error : function(request) {
                alert("Connection error");
            },
            success : function(data) {
                if (data == "ok") {
                    $("#huifushuru").val("");
                    $("#logo").attr("src", "img/index.ico");
                    $("#tongzhi").html("回复成功！").fadeIn(300).delay(1000).fadeOut(300);
                    var html='<div style="height: auto;width:100%;background-color: white;margin-top: 1px;;cursor: pointer;" class="replys"><div style="padding-top: 10px;padding-left: 40px">'
                        +'<div style="width: 60px;height: 100%;float:left;"><img style="width:48px;height:48px;border-radius: 50px" src="'
                        + mytwitter+'/img/'+"${user.uname}"+'/'+"${info.ulogo}"+'" /></div><div><div class="huifudename">'
                        +"${user.urealname}"+'</div><div class="huifudeaite">@'+"${user.uaite}"+'</div><div style="color:#657786;float: left;height: 30px;line-height: 30px;margin-right: 5px">·</div><div class="huifudeshijian">'
                        +'现在'+'</div><div class="huifudeduixiang">回复<a style="margin-left: 5px;" href="">'
                        +$("#tanchu_aite").html()+'</a></div><div class="huifudexiaoxi">'+huifuneirong+'</div></div></div></div>';
                    $("#huifu_neirong").prepend(html);
                    replysJs();
                }
            }
        });
    }
});
function updateFollow(uid, method) {
    $.ajax({
        type : "POST",
        url : "concern.do?method=" + method + "&suid=" + uid,
        async : false,
        success : function(data) {
            //Ok
        }
    });
}
function dianzanla(button) {
    var tid = $(button).parent().parent().parent().parent().find(".idid").val();
    var uid = $(button).parent().parent().parent().parent().find(".uuid").val();
    if ($(button).css("color") == "rgb(226, 38, 77)") {
        updateLikes(tid,uid, "del");
        $(button).css("color", "#657786");
        $(button).find(".dianzanCount").css("color", "#657786");
        zanCount = $(button).find(".dianzanCount").html();
        if (zanCount < 2) {
            $(button).find(".dianzanCount").html("");
        } else {
            $(button).find(".dianzanCount").html(zanCount * 1 - 1);
        }
        return;
    }
    if ($(button).css("color") != "rgb(226, 38, 77)") {
        updateLikes(tid,uid, "add");
        zanCount = $(button).find(".dianzanCount").html();
        if (zanCount == "") {
            $(button).find(".dianzanCount").html(1);
        } else {
            $(button).find(".dianzanCount").html(zanCount * 1 + 1);
        }
        $(button).animate({
            color : 'rgb(226, 38, 77)'
        }, 500);
        $(button).find(".dianzanCount").animate({
            color : 'rgb(226, 38, 77)'
        }, 500);
        return;
    }
}

function updateLikes(tid, uid,method) {
    $.ajax({
        type : "POST",
        url : "like.do?method=" + method + "&tid=" + tid+"&uid="+uid,
        async : false,
        success : function(data) {
            //Ok
        }
    });
}
function removeZiLiaoKa(user) {
    /*  $(user).parent().prev().mouseover(function(){
             $(this).show();
        }).mouseout(function(){
            $(this).remove();
        });  */
    $(user).parent().prev().remove();
}
function removeZiLiaoKatwo(user) {
    /*  $(user).parent().parent().prev().mouseover(function(){
             $(this).show();
        }).mouseout(function(){
            $(this).remove();
        });  */
    $(user).parent().parent().prev().remove();
}
function nameTianZiLiao(user) {
    var url = '/mytwitter/user.do?method=getziliaoka&uid=' + $(user).parent().parent().find(".uuid").val() + '&suiji=' + Math.random();
    if($(".usersinfo").length < 1){
        $.ajax({
            url : url,
            type : 'POST',
            success : function(response, status) {
                $(".usersinfo").css("marginTop", "30px");
                $(".usersinfo").css("marginLeft", "-40px");
                var tweets = $.parseJSON(response);
                var html = addZiLiaoKa(tweets, "name");
                $(user).parent().parent().before(html);
                tweetsJs();
            }
        });
    }
}
function tianZiLiaoKa(user) {
    var url = '/mytwitter/user.do?method=getziliaoka&uid=' + $(user).parent().find(".uuid").val() + '&suiji=' + Math.random();
    if($(".usersinfo").length < 1){
        $.ajax({
            url : url,
            type : 'POST',
            success : function(response, status) {
                var tweets = $.parseJSON(response);
                var html = addZiLiaoKa(tweets, "touxiang");
                $(user).parent().before(html);
                tweetsJs();
            }
        });
    }
}


$("#shangchuantouxiang").click(function() {
    $("#xiugaitouxiang").hide();
    $("#xiugaishang").hide();
});


$("#xiugailogo").find(".close-reveal-modal").click(function() {
    $('#upload-file').val("");
    $(".imageBox").css("backgroundImage", "url('')");
    $(".spinner").show();
});
$("#search_two").bind("input change", function() {

    var name = $(this).val().trim();
    if ($(this).val().trim() == "") {
        $("#souxianshi").hide();
        $("#souxianshishang").hide();
    }
    var url = '/mytwitter/user.do?method=chayonghu';
    if ($(this).val().trim() != "") {
        $.ajax({
            url : url,
            data : {
                "name" : name
            },
            type : 'POST',
            success : function(response, status) {
                $("#souxianshi").html("");
                $("#souxianshi").show();
                $("#souxianshishang").show();
                if (response == "kong") {
                    var html = '<div class="souneirong"><span style="margin-left:20px;font-size:15px;">没有与<b><span style="margin:0 3px;">' + name + '</span></b>相关用户！</span></div>';
                    $("#souxianshi").append(html);
                    return;
                }
                var length = response.length;
                var users = $.parseJSON(response.substring(response.indexOf("["), response.length));
                var html = "";
                for (var i = 0; i < users.length; i++) {
                    html += '<div class="souneirong" onclick="chaxunuser(0,this)"><div class="soutouxiang"><img src="'
                        + mytwitter + '/img/' + users[i].uname + "/" + users[i].ulogo + '" /></div><div class="soumingzi">'
                        + users[i].urealname + '</div><div class="sousouaite">@' + users[i].uaite + '</div><input class="uid" type="hidden" value="'
                        + users[i].uid + '"/></div>';
                }
                html += '<div class="souneirong" onclick="chaxunuser(1,this)"><span style="margin-left:20px;font-size:15px">搜索与<span style="margin:0 3px"><b>' + name + '</b></span>相关的所有用户</span></div>';
                $("#souxianshi").append(html);
                $(".souneirong").on({
                    mouseover : function() {
                        $(this).css("backgroundColor", color);
                    },
                    mouseout : function() {
                        $(this).css("backgroundColor", "white");
                    }
                });
            }
        });
    }
});

$("#tixing").on({
    mouseover:function(){
        $(this).css("backgroundColor","rgb(230,236,240)");
    },
    mouseout:function(){
        $(this).css("backgroundColor","rgb(245,248,250)");
    }
});


(function(factory) {
    if (typeof define === 'function' && define.amd) {
        define([ 'jquery' ], factory);
    } else {
        factory(jQuery);
    }
}(function($) {
    var cropbox = function(options, el) {
        var el = el || $(options.imageBox),
            obj = {
                state : {},
                ratio : 1,
                options : options,
                imageBox : el,
                thumbBox : el.find(options.thumbBox),
                spinner : el.find(options.spinner),
                image : new Image(),
                getDataURL : function() {
                    var width = this.thumbBox.width(),
                        height = this.thumbBox.height(),
                        canvas = document.createElement("canvas"),
                        dim = el.css('background-position').split(' '),
                        size = el.css('background-size').split(' '),
                        dx = parseInt(dim[0]) - el.width() / 2 + width / 2,
                        dy = parseInt(dim[1]) - el.height() / 2 + height / 2,
                        dw = parseInt(size[0]),
                        dh = parseInt(size[1]),
                        sh = parseInt(this.image.height),
                        sw = parseInt(this.image.width);

                    canvas.width = width;
                    canvas.height = height;
                    var context = canvas.getContext("2d");
                    context.drawImage(this.image, 0, 0, sw, sh, dx, dy, dw, dh);
                    var imageData = canvas.toDataURL('image/png');
                    return imageData;
                },
                getBlob : function() {
                    var imageData = this.getDataURL();
                    var b64 = imageData.replace('data:image/png;base64,', '');
                    var binary = atob(b64);
                    var array = [];
                    for (var i = 0; i < binary.length; i++) {
                        array.push(binary.charCodeAt(i));
                    }
                    return new Blob([ new Uint8Array(array) ], {
                        type : 'image/png'
                    });
                },
                zoomIn : function() {
                    this.ratio *= 1.1;
                    setBackground();
                },
                zoomOut : function() {
                    this.ratio *= 0.9;
                    setBackground();
                }
            },
            setBackground = function() {
                var w = parseInt(obj.image.width) * obj.ratio;
                var h = parseInt(obj.image.height) * obj.ratio;

                var pw = (el.width() - w) / 2;
                var ph = (el.height() - h) / 2;

                el.css({
                    'background-image' : 'url(' + obj.image.src + ')',
                    'background-size' : w + 'px ' + h + 'px',
                    'background-position' : pw + 'px ' + ph + 'px',
                    'background-repeat' : 'no-repeat'
                });
            },
            imgMouseDown = function(e) {
                e.stopImmediatePropagation();

                obj.state.dragable = true;
                obj.state.mouseX = e.clientX;
                obj.state.mouseY = e.clientY;
            },
            imgMouseMove = function(e) {
                e.stopImmediatePropagation();

                if (obj.state.dragable) {
                    var x = e.clientX - obj.state.mouseX;
                    var y = e.clientY - obj.state.mouseY;

                    var bg = el.css('background-position').split(' ');

                    var bgX = x + parseInt(bg[0]);
                    var bgY = y + parseInt(bg[1]);

                    el.css('background-position', bgX + 'px ' + bgY + 'px');

                    obj.state.mouseX = e.clientX;
                    obj.state.mouseY = e.clientY;
                }
            },
            imgMouseUp = function(e) {
                e.stopImmediatePropagation();
                obj.state.dragable = false;
            },
            zoomImage = function(e) {
                e.originalEvent.wheelDelta > 0 || e.originalEvent.detail < 0 ? obj.ratio *= 1.1 : obj.ratio *= 0.9;
                setBackground();
            }

        obj.spinner.show();
        obj.image.onload = function() {
            obj.spinner.hide();
            setBackground();

            el.bind('mousedown', imgMouseDown);
            el.bind('mousemove', imgMouseMove);
            $(window).bind('mouseup', imgMouseUp);
            el.bind('mousewheel DOMMouseScroll', zoomImage);
        };
        obj.image.src = options.imgSrc;
        el.on('remove', function() {
            $(window).unbind('mouseup', imgMouseUp)
        });

        return obj;
    };

    jQuery.fn.cropbox = function(options) {
        return new cropbox(options, this);
    };
}));