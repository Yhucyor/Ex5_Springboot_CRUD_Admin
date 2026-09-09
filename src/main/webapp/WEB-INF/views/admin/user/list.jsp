<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>User Management</title>
</head>
<body>

<div class="admin-layout">
<%@ include file="/WEB-INF/commons/admin/sidebar.jsp" %>
<main class="admin-content">

<h1>User Management</h1>

<a href="${pageContext.request.contextPath}/admin/users/add">
    Add User
</a>

<hr>

<form method="get"
      action="${pageContext.request.contextPath}/admin/users"
      style="display: flex; align-items: center; gap: 8px;">

    <input type="text"
           name="keyword"
           value="${keyword}"
           placeholder="Nhập username hoặc fullname">

    <button type="submit">
        Search
    </button>

    <label for="size">
        Page size:
    </label>

    <select name="size"
            id="size"
            onchange="this.form.submit()">

        <option value="3"
                ${userPage.size == 3 ? 'selected' : ''}>
            3
        </option>

        <option value="5"
                ${userPage.size == 5 ? 'selected' : ''}>
            5
        </option>

        <option value="10"
                ${userPage.size == 10 ? 'selected' : ''}>
            10
        </option>

        <option value="15"
                ${userPage.size == 15 ? 'selected' : ''}>
            15
        </option>

        <option value="20"
                ${userPage.size == 20 ? 'selected' : ''}>
            20
        </option>

    </select>

    <a href="${pageContext.request.contextPath}/admin/users">
        Reset
    </a>
</form>

<br>

<c:if test="${!userPage.hasContent()}">
    <p>No User</p>
</c:if>

<c:if test="${userPage.hasContent()}">

    <table border="1"
           cellpadding="8"
           cellspacing="0">

        <thead>
        <tr>
            <th>STT</th>
            <th>ID</th>
            <th>Avatar</th>
            <th>Username</th>
            <th>Fullname</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Role</th>
            <th>Created Date</th>
            <th>Active</th>
            <th>Action</th>
        </tr>
        </thead>

        <tbody>

        <c:forEach items="${userPage.content}"
                   var="user"
                   varStatus="stt">

            <tr>

                <td>
                    ${(userPage.number * userPage.size)
                    + stt.index + 1}
                </td>

                <td>
                    ${user.id}
                </td>

                <td>
                    <c:if test="${not empty user.avatar}">
                        <img src="${pageContext.request.contextPath}${user.avatar}"
                             alt="${user.username}"
                             width="60"
                             height="60">
                    </c:if>
                </td>

                <td>
                    ${user.username}
                </td>

                <td>
                    ${user.fullname}
                </td>

                <td>
                    ${user.email}
                </td>

                <td>
                    ${user.phone}
                </td>

                <td>
                    <c:choose>
                        <c:when test="${user.roleId == 1}">
                            ADMIN
                        </c:when>

                        <c:otherwise>
                            USER
                        </c:otherwise>
                    </c:choose>
                </td>

                <td>
                    ${user.createdDate}
                </td>

                <td>
                    <c:choose>
                        <c:when test="${user.active}">
                            Active
                        </c:when>

                        <c:otherwise>
                            Inactive
                        </c:otherwise>
                    </c:choose>
                </td>

                <td>

                    <a href="${pageContext.request.contextPath}/admin/users/edit/${user.id}">
                        Edit
                    </a>

                    |

                    <a href="${pageContext.request.contextPath}/admin/users/delete/${user.id}"
                       onclick="return confirm('Bạn có chắc muốn xóa User này không?');">
                        Delete
                    </a>

                </td>

            </tr>

        </c:forEach>

        </tbody>
    </table>

</c:if>

<br>

<c:if test="${userPage.totalPages > 1}">

    <c:forEach items="${pageNumbers}"
               var="pageNumber">

        <span style="margin-right: 6px;">

            <c:choose>

                <c:when test="${pageNumber == userPage.number + 1}">
                    <strong>
                        [${pageNumber}]
                    </strong>
                </c:when>

                <c:otherwise>

                    <a href="${pageContext.request.contextPath}/admin/users?keyword=${keyword}&size=${userPage.size}&page=${pageNumber}">
                        ${pageNumber}
                    </a>

                </c:otherwise>

            </c:choose>

        </span>

    </c:forEach>

</c:if>

</main>
</div>
</body>
</html>
