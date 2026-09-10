<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<aside class="sidebar">
    <div class="brand">
        <span class="brand-mark" aria-hidden="true"></span>
        <h1>Admin Panel</h1>
    </div>

    <p class="menu-label">Management</p>

    <nav class="sidebar-nav" aria-label="Admin navigation">
        <a class="sidebar-link ${fn:contains(pageContext.request.requestURI, '/admin/categories') ? 'active' : ''}"
           href="${pageContext.request.contextPath}/admin/categories">
            <span class="menu-icon icon-category" aria-hidden="true"></span>
            <span>Category Management</span>
        </a>

        <a class="sidebar-link ${fn:contains(pageContext.request.requestURI, '/admin/users') ? 'active' : ''}"
           href="${pageContext.request.contextPath}/admin/users">
            <span class="menu-icon icon-user" aria-hidden="true"></span>
            <span>User Management</span>
        </a>
    </nav>

    <div class="sidebar-footer">
        <a class="sidebar-link" href="${pageContext.request.contextPath}/">
            <span class="menu-icon icon-back" aria-hidden="true">↪</span>
            <span>Back to website</span>
        </a>
    </div>
</aside>
