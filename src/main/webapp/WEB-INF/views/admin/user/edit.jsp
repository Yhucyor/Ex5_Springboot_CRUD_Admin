<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Edit User</title>
</head>
<body>

<div class="admin-layout">
<%@ include file="/WEB-INF/commons/admin/sidebar.jsp" %>
<main class="admin-content">

<h1>Edit User</h1>

<form method="post"
      action="${pageContext.request.contextPath}/admin/users/edit"
      enctype="multipart/form-data">

    <input type="hidden"
           name="id"
           value="${user.id}">

    <div>
        <label>Username:</label>

        <input type="text"
               name="username"
               value="${user.username}"
               required>
    </div>

    <br>

    <div>
        <label>Fullname:</label>

        <input type="text"
               name="fullname"
               value="${user.fullname}"
               required>
    </div>

    <br>

    <div>
        <label>Email:</label>

        <input type="email"
               name="email"
               value="${user.email}"
               required>
    </div>

    <br>

    <div>
        <label>Password:</label>

        <input type="password"
               name="password"
               value="${user.password}"
               required>
    </div>

    <br>

    <div>
        <label>Phone:</label>

        <input type="text"
               name="phone"
               value="${user.phone}">
    </div>

    <br>

    <div>
        <label>Avatar:</label>

        <c:if test="${not empty user.avatar}">
            <img src="${pageContext.request.contextPath}${user.avatar}"
                 alt="${user.username}"
                 width="100"
                 height="100">
            <br>
        </c:if>
        <input type="file"
               name="avatarFile"
               accept="image/*">
        <small>Để trống nếu không muốn đổi avatar.</small>
    </div>

    <br>

    <div>
        <label>Role:</label>

        <select name="roleId">

            <option value="1"
                    ${user.roleId == 1 ? 'selected' : ''}>
                ADMIN
            </option>

            <option value="2"
                    ${user.roleId == 2 ? 'selected' : ''}>
                USER
            </option>

        </select>
    </div>

    <br>

    <div>
        <label>Active:</label>

        <select name="active">

            <option value="true"
                    ${user.active ? 'selected' : ''}>
                Active
            </option>

            <option value="false"
                    ${!user.active ? 'selected' : ''}>
                Inactive
            </option>

        </select>
    </div>

    <br>

    <button type="submit">
        Update
    </button>

    <a href="${pageContext.request.contextPath}/admin/users">
        Cancel
    </a>

</form>

</main>
</div>
</body>
</html>
