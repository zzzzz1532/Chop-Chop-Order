$(() => {
    $(".back-end-openButton").click(function () {
        if (($(".back-end-menuBox").mouseover) != 0) {
            $(".back-end-menuBox").stop().slideDown(300);
        }
    })
    $(".back-end-closeButton").click(function () {
        $(".back-end-menuBox").stop().slideUp(300);
    })

    let click1 = false
    let click2 = false
    let click3 = false
    $(".click1").click(function () {
        // $(this) jQuery 当前元素  this不要加引号
        // show() 显示元素  hide() 隐藏元素
        if (click1) {
            $(this).siblings("ul").stop().hide(300);
            click1 = false
            console.log("click1=false")
        } else {
            $(this).siblings("ul").stop().show(300);
            console.log("click1=true")
            click1 = true
        }
    });

    $(".click2").click(function () {
        // $(this) jQuery 当前元素  this不要加引号
        // show() 显示元素  hide() 隐藏元素
        if (click2) {
            $(this).siblings("ul").stop().hide(300);
            click2 = false
            console.log("click2=false")
        } else {
            $(this).siblings("ul").stop().show(300);
            console.log("click2=true")
            click2 = true
        }
    });

    $(".click3").click(function () {
        // $(this) jQuery 当前元素  this不要加引号
        // show() 显示元素  hide() 隐藏元素
        if (click3) {
            $(this).siblings("ul").stop().hide(300);
            click3 = false
            console.log("click3=false")
        } else {
            $(this).siblings("ul").stop().show(300);
            console.log("click3=true")
            click3 = true
        }
    });
    // let rotated1 = false;
    // let rotated2 = false;
    // $("#click1-buutton").click(function () {
    //     if (rotated1) {
    //         $(this).removeClass("click1-buutton180").addClass("click1-buutton0");
    //     } else {
    //         $(this).removeClass("click1-buutton0").addClass("click1-buutton180");
    //     }

    //     rotated1 = !rotated1;
    // });
    
    // $("#click2-buutton").click(function () {
    //     if (rotated1) {
    //         $(this).removeClass("click2-buutton180").addClass("click2-buutton0");
    //     } else {
    //         $(this).removeClass("click2-buutton0").addClass("click2-buutton180");
    //     }

    //     rotated2 = !rotated2;
    // });
})