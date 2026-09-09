<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Add Category</title>
</head>
<body>

<div class="admin-layout">
<%@ include file="/WEB-INF/commons/admin/sidebar.jsp" %>
<main class="admin-content">

<h1>Add Category</h1>

<form method="post"
      action="${pageContext.request.contextPath}/admin/categories/add"
      enctype="multipart/form-data">

    <div>
        <label>Category Name:</label>

        <input type="text"
               name="categoryName"
               required>
    </div>

    <br>

    <div>
        <label>Images:</label>

        <input type="file"
               name="imageFile"
               accept="image/*">
    </div>

    <br>

    <div>
        <label>Status:</label>

        <select name="status">
            <option value="1">
                Active
            </option>

            <option value="0">
                Inactive
            </option>
        </select>
    </div>

    <br>

    <button type="submit">
        Save
    </button>

    <a href="${pageContext.request.contextPath}/admin/categories">
        Cancel
    </a>

</form>

</main>
</div>
</body>
</html>
