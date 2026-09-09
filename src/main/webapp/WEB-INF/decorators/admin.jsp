<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản trị - <sitemesh:write property="title"/></title>
    <sitemesh:write property="head"/>
</head>
<body>
    <%@ include file="/WEB-INF/commons/admin/header.jsp" %>
    <main class="admin-layout">
        <sitemesh:write property="body"/>
    </main>
    <%@ include file="/WEB-INF/commons/admin/footer.jsp" %>
</body>
</html>
