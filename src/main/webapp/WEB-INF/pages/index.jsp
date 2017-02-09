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
        .posts>li {
            margin-bottom: 50px;
        }
        .footer {
            padding: 20px;
            border-top: 1px solid #ddd;
        }
    </style>
    <script>
        $(function () {
           $("#mainContainer").load("getToken.htm");

           //菜单单击事件
           $("#openPlatformDemoMenu").delegate(".list-group-item", "click", function () {
                $(this).siblings().removeClass("active");
                $(this).addClass("active");
                var menuId = $(this).attr("id");
                $("#mainContainer").load(menuId.replace("Menu",".htm"));
           });


        });
    </script>
</head>
<body>
<div class="jumbotron" style="padding-top: 5px;padding-bottom: 5px;">
    <div class="container">
        <h1>OpenApi在线测试</h1>
    </div>
</div>
<div class="container">

    <div class="row">

        <div class="col-md-3" id="openPlatformDemoMenu">
            <div class="module">
                <div class="list-group">
                    <a href="javascript:void(0);" class="list-group-item active" id="getTokenMenu">
                        <h4 class="list-group-item-heading">1.获取token</h4>
                        <p class="list-group-item-text"></p>
                    </a>
                    <a href="javascript:void(0);" class="list-group-item" id="openApiMenu">
                        <h4 class="list-group-item-heading">2.OpenApi接口调用</h4>
                        <p class="list-group-item-text"></p>
                    </a>
                    <a href="javascript:void(0);" class="list-group-item" id="qiniuUploadMenu">
                        <h4 class="list-group-item-heading">3.七牛上传示例</h4>
                        <p class="list-group-item-text"></p>
                    </a>
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