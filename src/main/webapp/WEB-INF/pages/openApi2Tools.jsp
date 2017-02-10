<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head> 
    <%--<%@include file="include.inc.jsp" %>--%>
    <script>
        $(function () {
            //调用OpenApi接口按钮事件
            $("#callOpenApiBtn").click(function () {
                if (console) {
                    console.log("调用OpenApi接口按钮事件")
                }

                var requestUrl = $("#requestUrlInput").val();
                var openApiUrl = $("#openApiUrlInput").val();
                var token = $("#tokenInput").val();
                var openApiRequest = $("#openApiRequestTextArea").val();

                if (requestUrl == null || requestUrl.trim() == "") {
                    alert("请求地址不能为空！");
                    $("#requestUrlInput").focus();
                    return;
                }

               if (openApiUrl == null || openApiUrl == "") {
                   alert("openapi地址不能为空！");
                   $("#openApiUrlInput").focus();
                   return;
               }

                if (token == null || token.trim() == "") {
                    alert("token不能为空！");
                    $("#tokenInput").focus();
                    return;
                }

                var url = requestUrl + "/" + openApiUrl;
                var data = new Object();
                data.token = token;
                if (openApiRequest != null && openApiRequest.trim() != "") {
                    var parameter = JSON.parse(openApiRequest);
                    for (var key in parameter) {
                        data[key] = parameter[key];
                    }
                }

                //发送具体OpenApi请求
                if (console) {
                    console.log(data);
                }

                $.post(url, data, function (result) {
                    if (console) {
                        console.log(result);
                    }

                    $("#callOpenApiResultDiv").html(JSON.stringify(result));

                    if (result.success) {
                        console.log(result.data);
                        var dataHtml = "";
                        for (var key in result.data) {
                            dataHtml = dataHtml + "<p>" + key + ": " + result.data[key] + "</p>";
                        }
                        $("#callOpenApiParserResultDiv").html(dataHtml);
                    } else {
                        console.log(result.errCode + "-----------" + result.errMsg)
                        var dataHtml = "";
                        dataHtml = dataHtml + "<p>" + "errCode" + ": " + result.errCode + "</p>";
                        dataHtml = dataHtml + "<p>" + "errMsg" + ": " + result.errMsg + "</p>";
                        $("#callOpenApiParserResultDiv").html(dataHtml);
                    }
                }, 'json');

            });
        });
    </script>
</head>
<body>
<div style="width: 800px;">
    <h1>OpenApi接口调用</h1>
    <br/>
    <form class="form-horizontal" role="form">
        <div class="form-group">
            <label for="requestUrlInput" class="col-sm-2 control-label">请求地址</label>
            <div class="col-sm-7">
                <input type="text" class="form-control" id="requestUrlInput" value="${requestUrl}"/>
            </div>
            <div class="col-sm-3">

            </div>
        </div>
        <div class="form-group">
            <label for="openApiUrlInput" class="col-sm-2 control-label">openApiUrl</label>
            <div class="col-sm-7">
                <input type="text" class="form-control" id="openApiUrlInput" value="${openApiUrl}"/>
            </div>
            <div>
                {route}/{addr}/{ver}/{method}
            </div>
        </div>
        <div class="form-group">
            <label for="tokenInput" class="col-sm-2 control-label">token</label>
            <div class="col-sm-7">
                <input type="text" class="form-control" id="tokenInput" value="${accessToken}"/>
            </div>
            <div class="col-sm-3">

            </div>
        </div>
        <div class="form-group">
            <label for="openApiRequestTextArea" class="col-sm-2 control-label">业务参数</label>
            <div class="col-sm-7">
                <textarea id="openApiRequestTextArea" rows="10" cols="68">${params}</textarea>
            </div>
            <div class="col-sm-3">
                JSON字符串，具体调用时将解析成具体参数名=参数值形式，和token并列提交
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-4">

            </div>
            <div class="col-sm-4">
                <button type="button" id="callOpenApiBtn" class="btn btn-primary">调用OpenApi接口</button>
            </div>
            <div class="col-sm-4">

            </div>
        </div>
    </form>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">
                返回结果实际如下：
            </h3>
        </div>
        <div class="panel-body" id="callOpenApiResultDiv" style="word-wrap:break-word; word-break:break-all; ">
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">
                返回结果解析如下：
            </h3>
        </div>
        <div class="panel-body" id="callOpenApiParserResultDiv" style="word-wrap:break-word; word-break:break-all; ">
        </div>
    </div>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
</div>
</body>
</html>