<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><sitemesh:write property="title"/></title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/admin/css/admin.css">
    <sitemesh:write property="head"/>
</head>
<body>
<div class="admin-shell">
    <%@ include file="/WEB-INF/commons/admin/sidebar.jsp" %>
    <div class="main-area">
        <header class="topbar">
            <div class="admin-profile">
                <span class="profile-avatar admin-avatar" aria-hidden="true"></span>
                <span>Admin</span>
                <span aria-hidden="true">v</span>
            </div>
        </header>
        <main class="admin-content">
            <sitemesh:write property="body"/>
        </main>
    </div>
</div>
<script defer src="${pageContext.request.contextPath}/static/admin/js/admin.js"></script>
</body>
</html>
