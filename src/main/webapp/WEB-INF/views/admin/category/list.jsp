<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Category Management</title>
    <style>
        .search-form {
            display: flex;
            align-items: center;
            gap: 8px;
        }
    </style>
</head>
<body>

<div class="admin-layout">
<%@ include file="/WEB-INF/commons/admin/sidebar.jsp" %>
<main class="admin-content">

<h1>Category Management</h1>

<a href="${pageContext.request.contextPath}/admin/categories/add">Add Category</a>

<hr>

<form class="search-form" method="get" action="${pageContext.request.contextPath}/admin/categories">
    <input type="text" name="keyword" value="${keyword}" placeholder="Nhập tên category">
    <button type="submit">Search</button>

    <label for="size">Page size:</label>
    <select name="size" id="size" onchange="this.form.submit()">
        <option value="3" ${categoryPage.size == 3 ? 'selected' : ''}>3</option>
        <option value="5" ${categoryPage.size == 5 ? 'selected' : ''}>5</option>
        <option value="10" ${categoryPage.size == 10 ? 'selected' : ''}>10</option>
        <option value="15" ${categoryPage.size == 15 ? 'selected' : ''}>15</option>
        <option value="20" ${categoryPage.size == 20 ? 'selected' : ''}>20</option>
    </select>
    <a href="${pageContext.request.contextPath}/admin/categories">Reset</a>
</form>

<c:if test="${!categoryPage.hasContent()}">
    <p>Không có category nào.</p>
</c:if>

<c:if test="${categoryPage.hasContent()}">
    <table border="1" cellpadding="8" cellspacing="0">
        <thead>
        <tr>
            <th>STT</th>
            <th>ID</th>
            <th>Category Name</th>
            <th>Image</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${categoryPage.content}" var="category" varStatus="stt">
            <tr>
                <td>${(categoryPage.number * categoryPage.size) + stt.index + 1}</td>
                <td>${category.categoryId}</td>
                <td>${category.categoryName}</td>
                <td>
                    <c:if test="${not empty category.images}">
                        <img src="${pageContext.request.contextPath}${category.images}"
                             alt="${category.categoryName}" width="70" height="70">
                    </c:if>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${category.status == 1}">Active</c:when>
                        <c:otherwise>Inactive</c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin/categories/edit/${category.categoryId}">Edit</a>
                    |
                    <a href="${pageContext.request.contextPath}/admin/categories/delete/${category.categoryId}"
                       onclick="return confirm('Bạn có chắc muốn xóa category này không?');">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>

<c:if test="${categoryPage.totalPages > 1}">
    <p>
        <c:forEach items="${pageNumbers}" var="pageNumber">
            <c:choose>
                <c:when test="${pageNumber == categoryPage.number + 1}">
                    <strong>[${pageNumber}]</strong>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/admin/categories?keyword=${keyword}&size=${categoryPage.size}&page=${pageNumber}">${pageNumber}</a>
                </c:otherwise>
            </c:choose>
            &nbsp;
        </c:forEach>
    </p>
</c:if>

</main>
</div>
</body>
</html>
