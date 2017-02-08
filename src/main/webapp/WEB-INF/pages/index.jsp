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
        });
    </script>
</head>
<body>
<div class="jumbotron">
    <div class="container">
        <h1>开发平台测试DEMO运行说明</h1>
    </div>
</div>
<div class="container">

    <div class="row">

        <div class="col-md-3">
            <div class="module">
                <div class="list-group">
                    <a href="#" class="list-group-item active" id="getTokenMenu">
                        <h4 class="list-group-item-heading">获取token</h4>
                        <p class="list-group-item-text"></p>
                    </a>
                    <a href="#" class="list-group-item" id="callOpenApiMenu">
                        <h4 class="list-group-item-heading">OpenApi接口调用</h4>
                        <p class="list-group-item-text"></p>
                    </a>
                    <a href="#" class="list-group-item" id="qiniuUploadMenu">
                        <h4 class="list-group-item-heading">七牛上传</h4>
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