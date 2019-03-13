
var onlineNum = 0;
$(function() {
    $(document).ready(function() {
        Highcharts.setOptions({
            global : {
                useUTC : false
            }
        });

        var chart;
        $('#message').highcharts({
            chart : {
                type : 'spline',
                animation : Highcharts.svg, // don't animate in old IE               
                marginRight : 10,
                events : {
                    load : function() {

                        // set up the updating of the chart each second             
                        var series = this.series[0];
                        setInterval(function() {
                            var x = (new Date()).getTime(), // current time         
                                y = onlineNum * 1;
                            series.addPoint([ x, y ], true, true);
                        }, 1000);
                    }
                }
            },
            title : {
                text : '实时在线人数'
            },
            xAxis : {
                type : 'datetime',
                tickPixelInterval : 100
            },
            yAxis : {
                title : {
                    text : '在线人数'
                },
                plotLines : [ {
                    value : 0,
                    width : 1,
                    color : '#808080'
                } ]
            },
            tooltip : {
                formatter : function() {
                    return '<b>' + this.series.name + '</b><br/>' +
                        Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' +
                        Highcharts.numberFormat(this.y, 2);
                }
            },
            legend : {
                enabled : false
            },
            exporting : {
                enabled : false
            },
            series : [ {
                name : '即时在线人数',
                data : (function() {
                    // generate an array of random data                             
                    var data = [],
                        time = (new Date()).getTime(),
                        i;

                    for (i = -19; i <= 0; i++) {
                        data.push({
                            x : time + i * 1000,
                            y : onlineNum * 1
                        });
                    }
                    return data;
                })()
            } ]
        });
    });

});
function catnum() {
    $.ajax({
        url : '/mytwitter/admin.do?method=catnum',
        type : 'POST',
        success : function(response, status) {
            var str = response.split("-");
            $(".counter:eq(0)").html(str[0]);
            $(".counter:eq(1)").html(str[3]);
            $(".counter:eq(2)").html(str[1]);
            $(".counter:eq(3)").html(str[2]);
            onlineNum = str[0];
        }
    });
}
$(function() {
    catnum();
})
window.setInterval(function() {
    catnum();
}, 2000);


var color = "royalblue";
$('.counter').countUp("1000");

$("#big").on({
    click : function() {
        var width = $("#cebian").css("width");
        if (width == '150px') {
            $("#cebian").css("width", "60px");
            $("#body").css("marginLeft", "60px");
            $(".kapian").css("width", "287.5px");
            $(".zi").css("display", "none");
            $("#message").css("left", "130px");
            $("#detail").css("width", "1300px");
        } else {
            $("#cebian").css("width", "150px");
            $("#body").css("marginLeft", "150px");
            $(".kapian").css("width", "265px");
            $(".zi").css("display", "");
            $("#message").css("left", "180px");
            $("#detail").css("width", "1200px");
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
$("#list ul li:eq(0)").css("background", color);
$("#list ul li").on({
    mouseover : function() {
        $(this).css("background", "gray");
    },
    mouseout : function() {
        $(this).css("background", "");
        $("#list ul li:eq(0)").css("background", color);
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
        $("#loadetial ul li:eq(0)").css("background", "white");
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
                $("#list ul li:eq(0)").css("background", color);
            }
        });
    }
});
function getTime() {
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var day = date.getDate();
    var hour = date.getHours();
    var min = date.getMinutes();
    if (min < 10)
        min = "0" + min;
    var second = date.getSeconds();
    if (second < 10)
        second = "0" + second;
    var weekday = new Array(7)
    weekday[0] = "星期日"
    weekday[1] = "星期一"
    weekday[2] = "星期二"
    weekday[3] = "星期三"
    weekday[4] = "星期四"
    weekday[5] = "星期五"
    weekday[6] = "星期六"
    var week = weekday[date.getDay()];

    $("#xingqi").html(week);
    $("#year").html(year);
    $("#month").html("年" + month + "月" + day + "日");
    $("#hours").html(hour);
    $("#min").html(min + ":" + second);

    if (hour >= 5 && hour < 12)
        $("#username").html("上午好，");

    if (hour >= 12 && hour < 14)
        $("#username").html("中午好，");

    if (hour >= 14 && hour < 19)
        $("#username").html("下午好，");

    if (hour >= 19 || hour < 5)
        $("#username").html("晚上好，");
}
window.onload = function() {
    getTime();
}
window.setInterval("getTime()", 1000);

$(".kapian").on({
    mouseover : function() {
        $(this).css("boxShadow", "0 0 5px #657786");
    },
    mouseout : function() {
        $(this).css("boxShadow", "0 0 .5px #657786");
    }
});
