<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head> 
    <%@include file="include.inc.jsp" %>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <style>
        .module {
            margin-bottom: 30px;
        }

        .tags {
            line-height: 30px;
        }

        .posts > li {
            margin-bottom: 50px;
        }

        .footer {
            padding: 20px;
            border-top: 1px solid #ddd;
        }
    </style>
    <style>
        .panel-group {
            max-height: 770px;
            overflow: auto;
        }

        .leftMenu {
            margin-top: 5px;
        }

        .leftMenu .panel-heading {
            font-size: 14px;
            padding-left: 20px;
            height: 50px;
            line-height: 36px;
            color: white;
            position: relative;
            cursor: pointer;
        }

        /*转成手形图标*/
        .leftMenu .panel-heading span {
            position: absolute;
            right: 10px;
            top: 12px;
        }

        .leftMenu .menu-item-left {
            padding: 2px;
            background: transparent;
            border: 1px solid transparent;
            border-radius: 6px;
        }

        .leftMenu .menu-item-left:hover {
            background: #C4E3F3;
            border: 1px solid #1E90FF;
        }
    </style>
    <script>
        var globalRequestUrl = "";
        var globalOpenApiUrl = "";
        var globalOpenAppKey = "";
        var globalOpenAppSecret = "";

        $(function () {
            //菜单单击事件
            $("#openPlatformDemoMenu").delegate("ul>li.list-group-item", "click", function () {
                $("ul>li.list-group-item").removeClass("active");
                $(this).addClass("active");
                var menuId = $(this).attr("id");
                $("#mainContainer").load(menuId.replace("Menu", ".htm") + "?globalRequestUrl=" + globalRequestUrl + "&globalOpenApiUrl="
                    + globalOpenApiUrl + "&globalOpenAppKey=" + globalOpenAppKey + "&globalOpenAppSecret=" + globalOpenAppSecret);
            });
            $("#getTokenToolsMenu").trigger("click");
        });
    </script>
    <script>
        $(function () {
            $(".panel-heading").click(function (e) {
                /*切换折叠指示图标*/
                $(this).find("span").toggleClass("glyphicon-chevron-down");
                $(this).find("span").toggleClass("glyphicon-chevron-up");
            });
        });
    </script>
</head>
<body>
<div class="jumbotron" style="padding-top: 5px;padding-bottom: 5px;">
    <div class="container">
        <h1>OpenAPI在线测试</h1>
    </div>
</div>
<div class="container">

    <div class="row">

        <div class="col-md-3" id="openPlatformDemoMenu">

            <div class="panel panel-primary leftMenu">
                <!-- 利用data-target指定要折叠的分组列表 -->
                <div class="panel-heading list-group-item" id="getTokenMenu" data-toggle="collapse"
                     data-target="#getTokenChildMenu" role="tab">
                    <h4 class="panel-title">
                        1.获取token
                        <span class="glyphicon glyphicon-chevron-up right"></span>
                    </h4>
                </div>
                <!-- .panel-collapse和.collapse标明折叠元素 .in表示要显示出来 -->
                <div id="getTokenChildMenu" class="panel-collapse collapse in" role="tabpanel"
                     aria-labelledby="getTokenMenu">
                    <ul class="list-group">
                        <li class="list-group-item" id="getTokenToolsMenu">
                            <!-- 利用data-target指定URL -->
                            <button class="menu-item-left">
                                <span class="glyphicon glyphicon-triangle-right"></span>测试工具
                            </button>
                        </li>
                        <li class="list-group-item" id="getTokenDocumentMenu">
                            <button class="menu-item-left">
                                <span class="glyphicon glyphicon-triangle-right"></span>开发文档
                            </button>
                        </li>
                    </ul>
                </div>
            </div><!--panel end-->

            <div class="panel panel-primary leftMenu">
                <div class="panel-heading list-group-item" id="openApi2Menu" data-toggle="collapse"
                     data-target="#openApi2ChildMenu" role="tab">
                    <h4 class="panel-title">
                        2.OpenApi接口调用
                        <span class="glyphicon glyphicon-chevron-down right"></span>
                    </h4>
                </div>
                <div id="openApi2ChildMenu" class="panel-collapse collapse" role="tabpanel"
                     aria-labelledby="openApi2Menu">
                    <ul class="list-group">
                        <li class="list-group-item" id="openApi2ToolsMenu">
                            <button class="menu-item-left">
                                <span class="glyphicon glyphicon-triangle-right"></span>测试工具
                            </button>
                        </li>
                        <li class="list-group-item" id="openApi2DocumentMenu">
                            <button class="menu-item-left">
                                <span class="glyphicon glyphicon-triangle-right"></span>开发文档
                            </button>
                        </li>
                    </ul>
                </div>
            </div><!--panel end-->


            <div class="panel panel-primary leftMenu">
                <div class="panel-heading list-group-item" id="qiniuUploadMenu" data-toggle="collapse"
                     data-target="#qiniuUploadChildMenu" role="tab">
                    <h4 class="panel-title">
                        3.七牛上传示例
                        <span class="glyphicon glyphicon-chevron-down right"></span>
                    </h4>
                </div>
                <div id="qiniuUploadChildMenu" class="panel-collapse collapse" role="tabpanel"
                     aria-labelledby="qiniuUploadMenu">
                    <ul class="list-group">
                        <li class="list-group-item" id="qiniuUploadToolsMenu">
                            <button class="menu-item-left">
                                <span class="glyphicon glyphicon-triangle-right"></span>测试工具
                            </button>
                        </li>
                        <li class="list-group-item" id="qiniuUploadDocumentMenu">
                            <button class="menu-item-left">
                                <span class="glyphicon glyphicon-triangle-right"></span>开发文档
                            </button>
                        </li>
                    </ul>
                </div>
            </div>


        </div>

        <div class="col-md-9" id="mainContainer">

        </div>
    </div>

</div>
<div class="footer list-inline">

</div>
</body>
</html>