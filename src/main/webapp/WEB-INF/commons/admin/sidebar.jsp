<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>


<aside class="sidebar">
    <div class="brand">
        <div class="brand-mark">A</div>
        <div>
            <h3>Admin Panel</h3>
            <small>Management system</small>
        </div>
    </div>

    <p class="menu-label">Management</p>

    <a class="active" href="${pageContext.request.contextPath}/admin/categories">
        <span class="menu-icon">▦</span>
        Category Management
    </a>

    <a href="${pageContext.request.contextPath}/admin/users">
        <span class="menu-icon">♙</span>
        User Management
    </a>

    <div class="sidebar-footer">© Admin CRUD</div>
</aside>
