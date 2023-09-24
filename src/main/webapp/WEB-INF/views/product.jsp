<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <title>CCO</title>
    <style>
        html,
        body {
            height: 100%;
        }

        .cardheader {
            border-bottom: 2px solid #39c0ed;
        }

        .divsticky {
            position: -webkit-sticky;
            position: sticky;
            top: 0;
            background-color: white;
            padding: 10px;
            font-size: 20px;
            z-index: 1000;
        }

        .footer1 {
            left: 0;
            bottom: 0;
            width: 100%;
            height: 50px;
            margin: 5px 0;
            padding: 10px;
            color: white;
            border: 0;
            background-color: #1d1e20;
            color: #fff;
            border-radius: 10px;
            cursor: pointer;
            display: flex;
            justify-content: center;
            align-items: center;


        }

        .footer1 div {
            flex: 1;
            text-align: center;
        }

        .footer1 span {
            margin-left: auto;
        }

        #radio input[type="radio"] {
            display: none;
        }

        #radio input:checked+.button {
            background: #5e7380;
            color: #fff;
            cursor: default;
        }

        #radio .button {
            display: inline-block;
            margin: 0 5px 10px 0;
            padding: 5px 10px;
            background: #f7f7f7;
            color: #333;
            cursor: pointer;
        }

        #radio .button:hover {
            background: #bbb;
            color: #fff;
        }

        #radio .round {
            border-radius: 5px;
        }

        #radio input[type="checkbox"] {
            display: none;
        }

        #checkbox input:checked+.button {
            background: #5e7380;
            color: #fff;
        }

        #checkbox .button {
            display: inline-block;
            margin: 0 5px 10px 0;
            padding: 5px 10px;
            background: #f7f7f7;
            color: #333;
            cursor: pointer;
        }

        #checkbox .button:hover {
            background: #bbb;
            color: #fff;
        }

        #checkbox .round {
            border-radius: 5px;
        }

        .divflex {
            display: flex;

        }

        .footersticky {
            position: -webkit-sticky;
            position: sticky;
            top: 0;
            z-index: 1000;

        }

        #remark input {
            width: 100%;
            height: 50px;
            margin: 5px 0;

        }

        #itemcount {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        #itemcount input {
            width: 50px;
            height: 50px;
            margin: 20px;
            border: 0px;
            border-radius: 50%;
            background-color: #e2dfdf;
        }

        #itemcount input[value="-"]:hover {
            border: 5px;
            background-color: #bbb;
        }

        #itemcount input[value="+"] {
            background-color: #bbb;
        }

        #itemcount input[value="+"]:hover {
            background-color: #e2dfdf;

        }

        h2,
        h4 {
            font-weight: bold;
        }

        @media (max-width:600px) {}
    </style>
</head>
<script>
    $(document).ready(function () {
        $('.fa-angle-left').click(function () {
            window.location.href = 'main.html';
        });
        $('.footer1').click(function () {
            window.location.href = 'main.html';
        });
        var spanElement = $("#itemcount span");
        var interval;

        $("#itemcount input[value='+']").on('mousedown touchstart', function () {
            interval = setInterval(function () {
                var currentValue = parseInt(spanElement.text(), 10);
                if (currentValue < 99) {
                    spanElement.text(currentValue + 1);
                }
            }, 100);
        }).on('mouseup touchend', function () {
            clearInterval(interval);
        });

        $("#itemcount input[value='-']").on('mousedown touchstart', function () {
            interval = setInterval(function () {
                var currentValue = parseInt(spanElement.text(), 10);
                if (currentValue > 1) {
                    spanElement.text(currentValue - 1);
                }
            }, 100);
        }).on('mouseup touchend', function () {
            clearInterval(interval);
        });

        // 点击加号按钮时增加数字
        $("#itemcount input[value='+']").click(function () {
            var currentValue = parseInt(spanElement.text(), 10);
            if (currentValue < 99) {
                spanElement.text(currentValue + 1);
            }
        });

        // 点击减号按钮时减少数字
        $("#itemcount input[value='-']").click(function () {
            var currentValue = parseInt(spanElement.text(), 10);
            if (currentValue > 1) {
                spanElement.text(currentValue - 1);
            }
        });
    });


</script>

<body>

    <div class="container">
        <div class="row">
            <div class="col-sm-10 col-lg-8 col-xl-7 mx-auto">
                <nav class="divsticky" style="margin: 10px 2px;"><i class="fa-solid fa-angle-left fa-xl"
                        style="cursor: pointer;"></i></nav>
                <img src="./img/Bacon Bagels.png" style="width: 100%;">
                <div class="divflex" style="justify-content: space-between;">
                    <div>
                        <h4>培根蛋貝果</h4>
                    </div>
                    <div><span>NT$80</span></div>
                </div>

                <div>
                    <p>煎至金黃的培根、蓬鬆柔軟的厚煎蛋，搭配生菜及漢堡醬，是吃不膩的經典口味</p>
                    <p>內容物：培根、厚煎蛋、美生菜、漢堡醬、貝果</p>
                    <p> ※ 圖片僅供參考，依門市實際提供為主</p>

                </div>
                <hr>
                <div style="margin: 10px 0px;">
                    <h4>客製化</h4>
                </div>
                <form>
                    <div id="radio">
                        <label><input type="radio" name="label" value="正常" checked><span
                                class="round button">正常</span></label>
                        <label><input type="radio" name="label" value="少醬"><span class="round button">少醬</span></label>
                        <label><input type="radio" name="label" value="不要醬"><span
                                class="round button">不要醬</span></label>

                        <div style="margin: 10px 0px;">
                            <h4>加料區</h4>
                        </div>
                        <label><input type="checkbox" name="label1" value="加蛋"><span
                                class="round button">加蛋+NT$10</span></label>
                        <label><input type="checkbox" name="label1" value="加起司"><span
                                class="round button">加起司+NT$10</span></label>
                        <label><input type="checkbox" name="label1" value="加培根"><span
                                class="round button">加培根+NT$10</span></label>
                    </div>
                    <hr>
                    <div style="margin: 10px 0px;">
                        <h4>備註：</h4>
                        <div id="remark">
                            <input type="text" placeholder="新增備註" style="padding: 10px;">
                        </div>
                    </div>
                    <div id="itemcount">
                        <input type="button" value="-">
                        <span>1</span>
                        <input type="button" value="+">
                    </div>

                </form>
                <div class="footer1 footersticky">
                    <div>加入購物車</div>
                    <span>NT$100</span>
                </div>

            </div>
        </div>

    </div>

    </div>

    </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
        integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/ed6fd4cc97.js" crossorigin="anonymous"></script>
</body>

</html>