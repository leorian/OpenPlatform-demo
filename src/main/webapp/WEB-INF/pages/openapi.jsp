<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head> 
    <%@include file="include.inc.jsp" %>
    <script>
        $(function () {
            //调用OpenApi接口按钮事件
            $("#callOpenApiBtn").click(function () {
                if (console) {
                    console.log("调用OpenApi接口按钮事件")
                }

                var requestUrl = $("#requestUrlInput").val();
                var route = $("#routeInput").val();
                var addr = $("#addrInput").val();
                var ver = $("#verInput").val();
                var method = $("#methodInput").val();
                var token = $("#tokenInput").val();
                var openApiRequest = $("#openApiRequestTextArea").val();

                if (requestUrl == null || requestUrl.trim() == "") {
                    alert("请求地址不能为空！");
                    $("#requestUrlInput").focus();
                    return;
                }

                if (route == null || route.trim() == "") {
                    alert("路由不能为空！");
                    $("#routeInput").focus();
                    return;
                }

                if (addr == null || addr.trim() == "") {
                    alert("接口类路径/http地址不能为空！");
                    $("#addrInput").focus();
                    return;
                }

                if (ver == null || ver.trim() == "") {
                    alert("版本不能为空！");
                    $("#verInput").focus();
                    return;
                }

                if (method == null || method.trim() == "") {
                    alert("接口方法不能为空！");
                    $("#methodInput").focus();
                    return;
                }

                if (token == null || token.trim() == "") {
                    alert("token不能为空！");
                    $("#tokenInput").focus();
                    return;
                }

                var url = requestUrl + "/" + route + "/" + addr + "/" + ver + "/" + method;
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
    <h2>2.1地址</h2>
    <p>
        /{route}/{addr}/{ver}/{method}
    </p>
    <br/>

    <h2>2.2请求方式</h2>
    <p>
        HTTP POST
    </p>
    <br/>

    <h2>2.3请求参数</h2>
    <table class="table">
        <thead>
        <tr>
            <th>参数名称</th>
            <th>类型（长度）</th>
            <th>必填</th>
            <th>备注</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>route</td>
            <td>varchar(32)</td>
            <td>必填</td>
            <td>路由</td>
        </tr>
        <tr>
            <td>addr</td>
            <td>varchar(512)</td>
            <td>必填</td>
            <td>接口类路径/http地址</td>
        </tr>
        <tr>
            <td>ver</td>
            <td>varchar(8)</td>
            <td>必填</td>
            <td>环境</td>
        </tr>
        <tr>
            <td>method</td>
            <td>varchar(128)</td>
            <td>必填</td>
            <td>接口方法</td>
        </tr>
        <tr>
            <td>token</td>
            <td>varchar(64)</td>
            <td>必填</td>
            <td>开放平台token</td>
        </tr>
        <tr>
            <td>接口请求参数</td>
            <td>不限</td>
            <td>非必填</td>
            <td>具体接口调用所需参数</td>
        </tr>
        </tbody>
    </table>
    <br/>

    <h2>2.4返回参数</h2>
    <p>JSON格式，具体接口调用返回值</p>
    <br/>

    <h2>2.5OpenApi接口调用测试用例Demo运行环境</h2>
    <form class="form-horizontal" role="form">
        <div class="form-group">
            <label for="requestUrlInput" class="col-sm-2 control-label">请求地址</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="requestUrlInput"/>
            </div>
            <label class="col-sm-2 control-label">
                /{route}/{addr}/{ver}/{method}
            </label>
        </div>
        <div class="form-group">
            <label for="routeInput" class="col-sm-2 control-label">route</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="routeInput"/>
            </div>
            <div class="col-sm-2">

            </div>
        </div>
        <div class="form-group">
            <label for="addrInput" class="col-sm-2 control-label">addr</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="addrInput"/>
            </div>
            <div class="col-sm-2">

            </div>
        </div>
        <div class="form-group">
            <label for="verInput" class="col-sm-2 control-label">ver</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="verInput"/>
            </div>
            <div class="col-sm-2">

            </div>
        </div>
        <div class="form-group">
            <label for="methodInput" class="col-sm-2 control-label">method</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="methodInput"/>
            </div>
            <div class="col-sm-2">

            </div>
        </div>
        <div class="form-group">
            <label for="tokenInput" class="col-sm-2 control-label">token</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="tokenInput"/>
            </div>
            <div class="col-sm-2">

            </div>
        </div>
        <div class="form-group">
            <label for="openApiRequestTextArea" class="col-sm-2 control-label">接口参数</label>
            <div class="col-sm-8">
                <textarea id="openApiRequestTextArea" rows="10" cols="70"></textarea>
            </div>
            <div class="col-sm-2">
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

    <h2>2.6获取七牛上传凭证token成功示意图</h2>
    <div>
        <img src="${base}/img/getqiniuTokenSuccess.png" />
    </div>
    <br/>

    <h2>2.6获取七牛上传凭证token失败示意图</h2>
    <div>
        <img src="${base}/img/getqiniuTokenFail.png" />
    </div>
    <br/>

</div>
</body>
</html>