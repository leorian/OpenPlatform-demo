<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
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
    <h1>OpenApi接口调用</h1>
    <br/>

    <h2>2.1地址</h2>
    <p>
        ${requestUrl}/{route}/{addr}/{ver}/{method}
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
            <td>token</td>
            <td>varchar(64)</td>
            <td>必填</td>
            <td>开放平台token</td>
        </tr>
        <tr>
            <td>业务请求参数</td>
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

    <h2>2.5获取七牛上传凭证token成功示意图</h2>
    <div>
        <img src="img/getqiniuUpTokenSuccess2.png"/>
    </div>
    <br/>

    <h2>2.6获取七牛上传凭证token失败示意图</h2>
    <div>
        <img src="img/getqiniuUpTokenFail2.png"/>
    </div>
    <br/>

</div>
</body>
</html>