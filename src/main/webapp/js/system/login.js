$(".txt").val("");
$(".txt").on({
    focus : function() {
        $(this).css("border", "1px solid rgba(29,141,242,1.00)");
    },
    blur : function() {
        $(this).css("border", "1px solid gray");
    }
});

$(".zhuye li").on({
    mouseover : function() {
        $(this).css("borderBottom", "3px solid rgba(29,161,241,1.00)");
    },

    mouseout : function() {
        $(this).css("borderBottom", "");
    }
});

$("#zhuce").on({
    mouseover : function() {
        $(this).css("borderBottom", "1px solid rgba(29,161,241,1.00)");
    },
    mouseout : function() {
        $(this).css("borderBottom", "");
    },
    click : function() {
        location = "register.jsp";
    }
});

$(".cha").on({
    mouseover : function() {
        $(this).css("color", "black");
    },
    mouseout : function() {
        $(this).css("color", "gray");
    },
    click : function() {
        $("#tixing").fadeOut();
    }
});

$("#btn").on({
    mouseover : function() {
        $(this).css("backgroundColor", "rgb(0, 109, 191 ,1.00)");
    },
    mouseout : function() {
        $(this).css("backgroundColor", " rgba(29, 161, 241, 1.00)");
    }
});