<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<!DOCTYPE HTML>
<html>
<head>
    <%--<%@include file="include.inc.jsp" %>--%>
    <script>
        $(function () {
            var timestamp = Date.parse(new Date());
            $("#currentTimeInput").val(timestamp);

            //生成时间戳按钮事件
            $("#generateCurrentTimeBtn").click(function () {
                if (console) {
                    console.log("生成时间戳时间触发");
                    $("#currentTimeInput").val(Date.parse(new Date()));
                }
            });
            //生成signMsg按钮事件
            $("#generateSignMsgBtn").click(function () {
                if (console) {
                    console.log("生成signMsg按钮事件触发")
                }

                var appKeyInput = $("#appKeyInput").val();
                var appSecretInput = $("#appSecretInput").val();
                var currentTimeInput = $("#currentTimeInput").val();
                if (appKeyInput == null || appKeyInput.trim() == "") {
                    alert("appKey不能为空！");
                    $("#appKeyInput").focus();
                    return;
                }

                if (appSecretInput == null || appSecretInput.trim() == "") {
                    alert("appSecret不能为空！");
                    $("#appSecretInput").focus();
                    return;
                }

                if (currentTimeInput == null || currentTimeInput.trim() == "") {
                    alert("currentTimeInput不能为空！");
                    $("#currentTimeInput").focus();
                    return;
                }

                $("#signMsgInput").val(md5(appKeyInput + currentTimeInput + appSecretInput));
                globalOpenAppKey = appKeyInput;
                globalOpenAppSecret =appSecretInput;
            });

            //获取token按钮触发
            $("#getTokenBtn").click(function () {
                if (console) {
                    console.log("获取token按钮事件触发")
                }

                var requestUrlInput = $("#requestUrlInput").val();
                var appKeyInput = $("#appKeyInput").val();
                var currentTimeInput = $("#currentTimeInput").val();
                var signMsgInput = $("#signMsgInput").val();
                if (requestUrlInput == null || requestUrlInput.trim() == "") {
                    alert("请求地址不能为空！");
                    $("#requestUrlInput").focus();
                    return;
                }

                if (appKeyInput == null || appKeyInput.trim() == "") {
                    alert("appKey不能为空！");
                    $("#appKeyInput").focus();
                    return;
                }

                if (currentTimeInput == null || currentTimeInput.trim() == "") {
                    alert("currentTime不能为空！");
                    $("#currentTimeInput").focus();
                    return;
                }

                if (signMsgInput == null || signMsgInput.trim() == "") {
                    alert("signMsg不能为空！");
                    $("#signMsgInput").focus();
                    return;
                }

                //具体获取token发送请求
                $.post(requestUrlInput + "/token/getToken", {
                    "appKey": appKeyInput,
                    "currentTime": currentTimeInput,
                    "signMsg": signMsgInput
                }, function (result) {
                    if (console) {
                        console.log(result);
                    }

                    $("#getTokenResultDiv").html(JSON.stringify(result));

                    if (result.success) {
                        console.log(result.data);
                        var dataHtml = "";
                        for (var key in result.data) {
                            dataHtml = dataHtml + "<p>" + key + ": " + result.data[key] + "</p>";
                        }
                        $("#getTokenParserResultDiv").html(dataHtml);
                    } else {
                        console.log(result.errCode + "-----------" + result.errMsg)
                        var dataHtml = "";
                        dataHtml = dataHtml + "<p>" + "errCode" + ": " + result.errCode + "</p>";
                        dataHtml = dataHtml + "<p>" + "errMsg" + ": " + result.errMsg + "</p>";
                        $("#getTokenParserResultDiv").html(dataHtml);
                    }
                    globalRequestUrl = requestUrlInput;

                }, 'json');

            });
        });
    </script>
</head>
<body>
<div style="width: 800px;">
    <h1>获取token</h1>
    <br/>
    <div>
        <form class="form-horizontal" role="form">
            <div class="form-group">
                <label for="requestUrlInput" class="col-sm-2 control-label">
                    请求地址
                </label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="requestUrlInput" value="${requestUrl}">
                </div>
                <div class="col-sm-2">
                    /token/getToken
                </div>
            </div>
            <div class="form-group">
                <label for="appKeyInput" class="col-sm-2 control-label">
                    appKey
                </label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="appKeyInput"
                           value="${appKey}">
                </div>
                <div class="col-sm-2">

                </div>
            </div>
            <div class="form-group">
                <label for="appSecretInput" class="col-sm-2 control-label">
                    appSecret
                </label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="appSecretInput"
                           value="${appSecret}">
                </div>
                <div class="col-sm-2">

                </div>
            </div>
            <div class="form-group">
                <label for="currentTimeInput" class="col-sm-2 control-label">
                    currentTime
                </label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="currentTimeInput">
                </div>
                <div class="col-sm-2">
                    <button type="button" class="btn btn-primary" id="generateCurrentTimeBtn">生成时间戳</button>
                </div>
            </div>
            <div class="form-group">
                <label for="signMsgInput" class="col-sm-2 control-label">
                    signMsg
                </label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" readonly="readonly" id="signMsgInput">
                </div>
                <div class="col-sm-2">
                    <button type="button" class="btn btn-primary" id="generateSignMsgBtn">生成signMsg</button>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-4">

                </div>
                <div class="col-sm-4">
                    <button type="button" id="getTokenBtn" class="btn btn-primary">获取token</button>
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
            <div class="panel-body" id="getTokenResultDiv" style="word-wrap:break-word; word-break:break-all; ">
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">
                    返回结果解析如下：
                </h3>
            </div>
            <div class="panel-body" id="getTokenParserResultDiv">
            </div>
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
