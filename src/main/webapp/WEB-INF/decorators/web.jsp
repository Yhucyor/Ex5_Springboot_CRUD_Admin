<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="sitemesh" uri="http://www.sitemesh.org/decorator" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">

    <title>
        <sitemesh:write property="title"/>
    </title>

    <sitemesh:write property="head"/>
</head>

<body>

<%@ include file="/WEB-INF/commons/web/header.jsp" %>

<main>

    <sitemesh:write property="body"/>

</main>

<%@ include file="/WEB-INF/commons/web/footer.jsp" %>

</body>

</html>
