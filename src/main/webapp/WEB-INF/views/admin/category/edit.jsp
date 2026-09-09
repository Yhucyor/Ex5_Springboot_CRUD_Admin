<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Edit Category</title>
</head>
<body>

<div class="admin-layout">
<%@ include file="/WEB-INF/commons/admin/sidebar.jsp" %>
<main class="admin-content">

<h1>Edit Category</h1>

<form method="post"
      action="${pageContext.request.contextPath}/admin/categories/edit"
      enctype="multipart/form-data">

    <input type="hidden"
           name="categoryId"
           value="${category.categoryId}">

    <div>
        <label>Category Name:</label>

        <input type="text"
               name="categoryName"
               value="${category.categoryName}"
               required>
    </div>

    <br>

    <div>
        <label>Images:</label>

        <c:if test="${not empty category.images}">
            <img src="${pageContext.request.contextPath}${category.images}"
                 alt="${category.categoryName}"
                 width="100">
            <br>
        </c:if>

        <input type="file"
               name="imageFile"
               accept="image/*">
        <small>Để trống nếu không muốn đổi ảnh.</small>
    </div>

    <br>

    <div>
        <label>Status:</label>

        <select name="status">

            <option value="1"
                    ${category.status == 1 ? 'selected' : ''}>
                Active
            </option>

            <option value="0"
                    ${category.status == 0 ? 'selected' : ''}>
                Inactive
            </option>

        </select>
    </div>

    <br>

    <button type="submit">
        Update
    </button>

    <a href="${pageContext.request.contextPath}/admin/categories">
        Cancel
    </a>

</form>

</main>
</div>
</body>
</html>
