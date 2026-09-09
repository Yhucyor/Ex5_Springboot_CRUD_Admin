<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="sitemesh" uri="http://www.sitemesh.org/decorator" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title><sitemesh:write property="title"/></title>
    <sitemesh:write property="head"/>
    <style>
        body { margin: 0; font-family: Arial, sans-serif; }
        .admin-layout { display: flex; min-height: 100vh; }
        .sidebar {
            width: 230px; background: #212529; color: white;
            padding: 20px; box-sizing: border-box;
        }
        .sidebar h3 { margin-top: 0; }
        .sidebar a {
            display: block; color: white; text-decoration: none;
            padding: 12px 10px; margin-bottom: 6px; border-radius: 5px;
        }
        .sidebar a:hover { background: #343a40; }
        .admin-content { flex: 1; padding: 25px; background: #f5f6f8; }
    </style>
</head>
<body>
<div class="admin-layout">
    <%@ include file="/WEB-INF/commons/admin/sidebar.jsp" %>
    <main class="admin-content">
        <sitemesh:write property="body"/>
    </main>
</div>
</body>
</html>
