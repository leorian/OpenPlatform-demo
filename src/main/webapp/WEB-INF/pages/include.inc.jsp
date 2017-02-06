<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" value="${pageContext.request.scheme}://${pageContext.request.serverName }:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<meta charset=UTF-8>
<title>开放平台测试用例Demo</title>
<link rel="stylesheet" href="${base}/webFrame/bootstrap-3.3.5/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${base}/webFrame/bootstrap-3.3.5/bootstrap/css/bootstrap-theme.min.css">
<script src="${base}/webFrame/bootstrap-3.3.5/jquery-1.11.3.min.js"></script>
<script src="${base}/webFrame/bootstrap-3.3.5/bootstrap/js/bootstrap.min.js"></script>
