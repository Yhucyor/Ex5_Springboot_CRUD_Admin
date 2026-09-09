<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Add User</title>
</head>
<body>

<div class="admin-layout">
<%@ include file="/WEB-INF/commons/admin/sidebar.jsp" %>
<main class="admin-content">

<h1>Add User</h1>

<form method="post"
      action="${pageContext.request.contextPath}/admin/users/add"
      enctype="multipart/form-data">

    <div>
        <label>Username:</label>
        <input type="text"
               name="username"
               required>
    </div>

    <br>

    <div>
        <label>Fullname:</label>
        <input type="text"
               name="fullname"
               required>
    </div>

    <br>

    <div>
        <label>Email:</label>
        <input type="email"
               name="email"
               required>
    </div>

    <br>

    <div>
        <label>Password:</label>
        <input type="password"
               name="password"
               required>
    </div>

    <br>

    <div>
        <label>Phone:</label>
        <input type="text"
               name="phone">
    </div>

    <br>

    <div>
        <label>Avatar:</label>
        <input type="file"
               name="avatarFile"
               accept="image/*">
    </div>

    <br>

    <div>
        <label>Role:</label>

        <select name="roleId">
            <option value="1">
                ADMIN
            </option>

            <option value="2">
                USER
            </option>
        </select>
    </div>

    <br>

    <div>
        <label>Active:</label>

        <select name="active">
            <option value="true">
                Active
            </option>

            <option value="false">
                Inactive
            </option>
        </select>
    </div>

    <br>

    <button type="submit">
        Save
    </button>

    <a href="${pageContext.request.contextPath}/admin/users">
        Cancel
    </a>

</form>

</main>
</div>
</body>
</html>
