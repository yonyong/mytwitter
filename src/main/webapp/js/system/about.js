var color = "royalblue";
$("#big").on({
    click : function() {
        var width = $("#cebian").css("width");
        if (width == '150px') {
            $("#cebian").css("width", "60px");
            $("#body").css("marginLeft", "60px");
            $(".zi").css("display", "none");
        } else {
            $("#cebian").css("width", "150px");
            $("#body").css("marginLeft", "150px");
            $(".zi").css("display", "");
        }

    }
});
$("#list ul li:eq(0)").click(function() {
    location = 'page.jsp';
});
$("#list ul li:eq(1)").click(function() {
    location = 'admin.do?method=getinfo';
});
$("#list ul li:eq(2)").click(function() {
    location = 'admin.do?method=gettweet';
});
$("#list ul li:eq(3)").click(function() {
    location = 'about.jsp';
});
$("#list ul li:eq(3)").css("background", color);
$("#list ul li").on({
    mouseover : function() {
        $(this).css("background", "gray");
    },
    mouseout : function() {
        $(this).css("background", "");
        $("#list ul li:eq(3)").css("background", color);
    }
});

$("#loadetial ul li").on({
    mouseover : function() {
        $(this).css("background", "white");
    },
    mouseout : function() {
        $(this).css("background", "");
    }
});

$("#loadetial ul li:eq(0)").on({
    mouseover : function() {
        $("#exit").show();
    },
    mouseout : function() {
        $("#exit").hover(function() {
                $(this).show();
            },
            function() {
                $(this).hide();
            });
        $("#exit").hide();
    }
});

$("#exit").on({
    mouseover : function() {
        $(this).css("background", "#ea6f5a");
        $(this).css("color", "white");
        $("#loadetial ul li:eq(3)").css("background", "white");
    },
    mouseout : function() {
        $(this).css("background", "");
        $("#loadetial ul li:eq(0)").css("background", "");
        $(this).css("color", "black");
        $(this).hide();
    },
    click : function() {
        location = "admin.do?method=exit";
    }
});
$("#loadetial ul li:eq(1)").on({
    mouseover : function() {
        $(this).css("background", "white");
        $("#color").show();
    },
    mouseout : function() {
        $("#color").hover(function() {
                $("#loadetial ul li:eq(1)").css("background", "white");
                $(this).show();
            },
            function() {
                $("#loadetial ul li:eq(1)").css("background", "");
                $(this).hide();
            });
        $(this).css("background", "");
        $("#color").hide();
    }
});
$(".colornext").on({
    mouseover : function() {
        $(this).css("color", "white");
    },
    mouseout : function() {
        $(this).css("color", "black");
    },
    click : function() {
        color = $(this).css("backgroundColor");
        $("#loader").css("backgroundColor", color);
        $("#list ul li:eq(0)").css("background", color);
        $("#list ul li").on({
            mouseover : function() {
                $(this).css("background", "gray");
            },
            mouseout : function() {
                $(this).css("background", "");
                $("#list ul li:eq(3)").css("background", color);
            }
        });
    }
});