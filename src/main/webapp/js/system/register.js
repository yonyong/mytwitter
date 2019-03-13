window.onload = function() {
    $(".txt").val("");
    $(".tex").val("");

    $("#name").val("${name }");
    $("#username").val("${uname }");
    $("#password").val("${pwd }");
    $("#name").focus();
    if ($("#name").val() != "")
        checkname();
    if ($("#username").val() != "")
        checkusername();
    if ($("#password").val() != "")
        checkpwd();
}

function checkname() {
    if ($("#name").val().trim() == "" || $("#name").val() == null) {
        $("#name").css("color", "gray");
        $(".check:eq(0)").html("<img src='img/error.png'/><span style='color:tomato;font-size:14px'>你的名字是什么？</span>");
    } else {
        $("#name").css("color", "black");
        $(".check:eq(0)").html("<img src='img/icon_tick_blue.png'/>");
    }
}

function checkusername() {
    var username = $("#username").val();
    var xmlHttp = new XMLHttpRequest();

    if ($("#username").val() == "") {
        $("#username").css("color", "gray");
    } else {
        $("#username").css("color", "black");
    }

    xmlHttp.onreadystatechange = function() {
        if (xmlHttp.readyState == 4) { //如果等于4，说明服务器响应成功了
            //这里的代码在服务器响应成功时执行！
            if (xmlHttp.status == 200) { //如果服务器响应码是200时
                var regex = new RegExp("^[A-Za-z0-9]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$", "g");

                if (username.trim() != "" && username != null && regex.test(username)) {
                    $(".check:eq(1)").html("<img src='img/spinner-rosetta-gray-14x14.gif'/><span style='color:black;font-size:13px;position:relative;top:-2px'>正在验证...</span>");
                    var data = xmlHttp.responseText;
                    if (data == "yes") {
                        $(".check:eq(1)").html("<img src='img/icon_tick_blue.png'/>");
                    } else if (data == "no") {
                        $(".check:eq(1)").html("<img src='img/error.png'/><span style='color:tomato;font-size:14px'>该邮件地址已被注册。想要<a href='login.jsp' class='link'>登录</a>或<a href='' class='link'>恢复密码</a>吗?</span>");
                    }
                } else {
                    $(".check:eq(1)").html("<img src='img/error.png'/><span style='color:tomato;font-size:14px'>请输入正确的邮箱格式</span>");
                }
            }
        }
    }

    xmlHttp.open("GET", "/mytwitter/user.do?method=checkuser&username=" + username, false);
    xmlHttp.send(null);
}

function checkpwd() {
    var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
    var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
    var enoughRegex = new RegExp("(?=.{6,}).*", "g");

    if ($("#password").val() == "") {
        $("#password").css("color", "gray");
    } else {
        $("#password").css("color", "black");
    }
    if (false == enoughRegex.test($("#password").val())) {
        $('#level').removeClass('pw-weak');
        $('#level').removeClass('pw-medium');
        $('#level').removeClass('pw-strong');
        $('#level').addClass(' pw-defule');
        $(".check:eq(2)").html("<img src='img/error.png'/><span style='color:tomato;font-size:14px'>密码长度应在6~18位之间</span>");

        //密码小于六位的时候，密码强度图片都为灰色
    } else if (strongRegex.test($("#password").val())) {
        $('#level').removeClass('pw-weak');
        $('#level').removeClass('pw-medium');
        $('#level').removeClass('pw-strong');
        $('#level').addClass(' pw-strong');
        $(".check:eq(2)").html("<img src='img/icon_tick_blue.png'/>");

        //密码为八位及以上并且字母数字特殊字符三项都包括,强度最强
    } else if (mediumRegex.test($("#password").val())) {
        $('#level').removeClass('pw-weak');
        $('#level').removeClass('pw-medium');
        $('#level').removeClass('pw-strong');
        $('#level').addClass(' pw-medium');
        $(".check:eq(2)").html("<img src='img/icon_tick_blue.png'/>");

        //密码为七位及以上并且字母、数字、特殊字符三项中有两项，强度是中等
    } else {
        $('#level').removeClass('pw-weak');
        $('#level').removeClass('pw-medium');
        $('#level').removeClass('pw-strong');
        $('#level').addClass('pw-weak');
        $(".check:eq(2)").html("<img src='img/icon_tick_blue.png'/>");

        //如果密码为6位及以下，就算字母、数字、特殊字符三项都包括，强度也是弱的
    }
    return true;
}
$(".btn").on({
    mouseover : function() {
        $(this).css("backgroundColor", "rgb(0, 109, 191 ,1.00)");
    },
    mouseout : function() {
        $(this).css("backgroundColor", " rgba(29, 161, 241, 1.00)");
    },
    click : function() {
        if ($("#name").val() == "" || $(".check:eq(0)").html().indexOf("img/icon_tick_blue.png") < 0) {
            $(this).animate({
                marginLeft : "-4px"
            }, 50);
            $(this).animate({
                marginLeft : "8px"
            }, 50);
            $(this).animate({
                marginLeft : "4px"
            }, 50)
            $("#name").focus();
            return false;
        }
        if ($("#username").val() == "" || $(".check:eq(1)").html().indexOf("img/icon_tick_blue.png") < 0) {
            $(this).animate({
                marginLeft : "-4px"
            }, 50);
            $(this).animate({
                marginLeft : "8px"
            }, 50);
            $(this).animate({
                marginLeft : "4px"
            }, 50)
            $("#username").focus();
            return false;
        }
        if ($("#password").val() == "" || $(".check:eq(2)").html().indexOf("img/icon_tick_blue.png") < 0) {
            $(this).animate({
                marginLeft : "-3px"
            }, 50);
            $(this).animate({
                marginLeft : "6px"
            }, 50);
            $(this).animate({
                marginLeft : "3px"
            }, 50)
            $("#password").focus();
            return false;
        }
    }
});

$(".bb").on({
    mouseover : function() {
        $(this).css("backgroundColor", "rgb(0, 109, 191 ,1.00)");
    },
    mouseout : function() {
        $(this).css("backgroundColor", " rgba(29, 161, 241, 1.00)");
    }
});

$("#header img").on({
    click : function() {
        location = "index.jsp";
    }
});

$("#login").on({
    mouseover : function() {
        $(this).css("borderBottom", "1px solid rgba(29,141,242,1.00)");
        $(this).css("color", "rgba(29,141,242,1.00)");
    },
    mouseout : function() {
        $(this).css("borderBottom", "");
        $(this).css("color", "aliceblue");
    }
});

$(".a").on({
    mouseover : function() {
        $(this).css("textDecoration", "underline");
    },
    mouseout : function() {
        $(this).css("textDecoration", "none");
    }
});

$(".xuan").click(function() {
    $("#xi").fadeToggle(10);
});

$("#login").click(function() {
    $("#sign").fadeToggle(10);
    $(".tex:eq(0)").focus();
});

$(".txt").on({
    focus : function() {
        $(this).css("border", "1px solid rgba(29,141,242,1.00)");
    },
    blur : function() {
        $(this).css("border", "1px solid  #ccc");
    }
});

$(".tex").on({
    focus : function() {
        $(this).css("border", "1px solid rgba(29,141,242,1.00)");
    },
    blur : function() {
        $(this).css("border", "1px solid  #ccc");
    }
});


$(document).click(function(e) {
    e = window.event || e; // 兼容IE7
    obj = $(e.srcElement || e.target);
    if ($(obj).is("#login") || ((e.pageX >= 970 && e.pageX <= 1210) && (e.pageY >= 50 && e.pageY <= 251))) {

    } else {
        $("#sign").fadeOut(10);
    }
});

$("#name").bind('input propertychange change', function() {
    checkname();
});
$("#username").bind('input propertychange change', function() {
    checkusername();
});

$('#password').bind('input propertychange change', function() {
    checkpwd();
});
$("#uname").bind('input propertychange change', function() {
    if ($(this).val().trim() != "") {
        $(this).css("color", "black");
    } else {
        $(this).css("color", "gray");
    }
});
$("#pwd").bind('input propertychange change', function() {
    if ($(this).val().trim() != "") {
        $(this).css("color", "black");
    } else {
        $(this).css("color", "gray");
    }
});