<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" value="${pageContext.request.scheme}://${pageContext.request.serverName }:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<meta charset=UTF-8>
<title>OpenAPI在线测试</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="${base}/webFrame/bootstrap-3.3.5/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${base}/webFrame/bootstrap-3.3.5/bootstrap/css/bootstrap-theme.min.css">

<script src="${base}/webFrame/bootstrap-3.3.5/jquery-1.11.3.min.js"></script>
<script src="${base}/webFrame/bootstrap-3.3.5/bootstrap/js/bootstrap.min.js"></script>
<script src="http://cdn.bootcss.com/blueimp-md5/1.1.0/js/md5.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
