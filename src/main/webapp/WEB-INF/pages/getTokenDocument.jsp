<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<!DOCTYPE HTML>
<html>
<head>
    <%--<%@include file="include.inc.jsp" %>--%>
    <script>
        $(function () {
        });
    </script>
</head>
<body>
<div style="width: 800px;">
    <h1>获取token</h1>
    <br/>

    <h2>1.1地址</h2>
    <p>${requestUrl}/token/getToken</p>
    <br/>

    <h2>1.2请求方式</h2>
    <p>HTTP POST</p>
    <br/>

    <h2>1.3请求参数</h2>
    <p>
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
            <td>appKey</td>
            <td>varchar(64)</td>
            <td>是</td>
            <td>应用Key</td>
        </tr>
        <tr>
            <td>currentTime</td>
            <td>Long</td>
            <td>是</td>
            <td>当前时间的毫秒数</td>
        </tr>
        <tr>
            <td>signMsg</td>
            <td>varchar(32)</td>
            <td>是</td>
            <td>Md5加密后的字符串</td>
        </tr>
        </tbody>
    </table>
    </p>
    <br/>

    <h2>1.4加密方式</h2>
    <p>
        signMsg的值:参数appKey,currentTime的值字符串拼接,再加上appSecret进行Md5加密
    </p>
    <br/>

    <h2>1.5返回参数</h2>
    <p>
    <table class="table">
        <thead>
        <tr>
            <th>参数名称</th>
            <th>类型(长度)</th>
            <th>必返</th>
            <th>备注</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>token</td>
            <td>varchar(64)</td>
            <td>是</td>
            <td>&nbsp;</td>
        </tr>
        </tbody>
    </table>
    </p>
    <br/>

    <h2>1.6获取token成功示意图</h2>
    <div>
        <img src="img/getTokenSuccess.png"/>
    </div>
    <h2>1.7获取token失败示意图</h2>
    <div>
        <img src="img/getTokenFail.png"/>
    </div>
    <br/>

</div>
</body>
</html>
