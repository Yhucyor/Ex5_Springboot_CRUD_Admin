<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>User Management</title>
</head>
<body>
<div class="page-container user-page">
    <div class="page-heading">
        <div>
            <h1 class="page-title">User Management</h1>
            <p class="page-subtitle">Manage users, roles, and account information</p>
        </div>
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/users/add">
            <span aria-hidden="true">+</span> Add User
        </a>
    </div>

    <section class="card">
        <form class="toolbar user-toolbar" method="get" action="${pageContext.request.contextPath}/admin/users">
            <div class="search-group">
                <span class="search-icon" aria-hidden="true"></span>
                <input class="form-control" type="text" name="keyword"
                       value="${keyword}" placeholder="Search by username, email or fullname...">
            </div>
            <select class="form-select filter-select" name="roleId" aria-label="Filter by role">
                <option value="">All Roles</option>
                <option value="1" ${roleId == 1 ? 'selected' : ''}>ADMIN</option>
                <option value="2" ${roleId == 2 ? 'selected' : ''}>USER</option>
                <option value="3" ${roleId == 3 ? 'selected' : ''}>STUDENT</option>
            </select>
            <select class="form-select filter-select" name="active" aria-label="Filter by status">
                <option value="">All Status</option>
                <option value="true" ${active ne null and active ? 'selected' : ''}>Active</option>
                <option value="false" ${active ne null and not active ? 'selected' : ''}>Inactive</option>
            </select>
            <button class="btn btn-primary" type="submit">Search</button>
            <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/users">Reset</a>
        </form>

        <c:choose>
            <c:when test="${userPage.hasContent()}">
                <div class="table-responsive">
                    <table class="data-table user-table">
                        <thead>
                        <tr>
                            <th>STT</th>
                            <th>Avatar</th>
                            <th>Username</th>
                            <th>Full Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Role ID</th>
                            <th>Status</th>
                            <th>Created Date</th>
                            <th>OTP</th>
                            <th>OTP Expiry</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${userPage.content}" var="user" varStatus="stt">
                            <tr>
                                <td>${(userPage.number * userPage.size) + stt.index + 1}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty user.avatar}">
                                            <img class="avatar-image" src="${pageContext.request.contextPath}${user.avatar}"
                                                 alt="${user.username}">
                                        </c:when>
                                        <c:otherwise><span class="profile-avatar" aria-hidden="true">●</span></c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${user.username}</td>
                                <td>${user.fullname}</td>
                                <td>${user.email}</td>
                                <td>${user.phone}</td>
                                <td>${user.roleId}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${user.active}"><span class="badge badge-success">Active</span></c:when>
                                        <c:otherwise><span class="badge badge-danger">Inactive</span></c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${user.createdDate}</td>
                                <td>${empty user.otp ? '-' : user.otp}</td>
                                <td>${empty user.otpExpiry ? '-' : user.otpExpiry}</td>
                                <td>
                                    <div class="actions">
                                        <a class="btn btn-sm btn-outline-primary"
                                           href="${pageContext.request.contextPath}/admin/users/edit/${user.id}">
                                            <span aria-hidden="true">&#9998;</span> Edit
                                        </a>
                                        <a class="btn btn-sm btn-outline-danger"
                                           href="${pageContext.request.contextPath}/admin/users/delete/${user.id}"
                                           onclick="return confirm('B&#7841;n có ch&#7855;c mu&#7889;n xóa User này không?');">
                                            <span aria-hidden="true">&#128465;</span> Delete
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:when>
            <c:otherwise><div class="empty-state">Không có user nào phù h&#7907;p.</div></c:otherwise>
        </c:choose>

        <div class="table-footer">
            <c:choose>
                <c:when test="${userPage.hasContent()}">
                    <p class="entries-info">
                        Showing ${userPage.number * userPage.size + 1}
                        to ${userPage.number * userPage.size + userPage.numberOfElements}
                        of ${userPage.totalElements} entries
                    </p>
                </c:when>
                <c:otherwise><p class="entries-info">Showing 0 entries</p></c:otherwise>
            </c:choose>
            <c:if test="${userPage.totalPages > 1}">
                <nav class="pagination" aria-label="User pagination">
                    <c:url var="firstPageUrl" value="/admin/users">
                        <c:param name="keyword" value="${keyword}"/>
                        <c:param name="roleId" value="${roleId}"/>
                        <c:param name="active" value="${active}"/>
                        <c:param name="size" value="${userPage.size}"/>
                        <c:param name="page" value="1"/>
                    </c:url>
                    <c:url var="previousPageUrl" value="/admin/users">
                        <c:param name="keyword" value="${keyword}"/>
                        <c:param name="roleId" value="${roleId}"/>
                        <c:param name="active" value="${active}"/>
                        <c:param name="size" value="${userPage.size}"/>
                        <c:param name="page" value="${userPage.number}"/>
                    </c:url>
                    <a class="page-link ${userPage.first ? 'disabled' : ''}"
                       href="${firstPageUrl}" aria-label="First page">«</a>
                    <a class="page-link ${userPage.first ? 'disabled' : ''}"
                       href="${previousPageUrl}" aria-label="Previous page">‹</a>
                    <c:forEach items="${pageNumbers}" var="pageNumber">
                        <c:url var="numberedPageUrl" value="/admin/users">
                            <c:param name="keyword" value="${keyword}"/>
                            <c:param name="roleId" value="${roleId}"/>
                            <c:param name="active" value="${active}"/>
                            <c:param name="size" value="${userPage.size}"/>
                            <c:param name="page" value="${pageNumber}"/>
                        </c:url>
                        <a class="page-link ${pageNumber == userPage.number + 1 ? 'active' : ''}"
                           href="${numberedPageUrl}">${pageNumber}</a>
                    </c:forEach>
                    <c:url var="nextPageUrl" value="/admin/users">
                        <c:param name="keyword" value="${keyword}"/>
                        <c:param name="roleId" value="${roleId}"/>
                        <c:param name="active" value="${active}"/>
                        <c:param name="size" value="${userPage.size}"/>
                        <c:param name="page" value="${userPage.number + 2}"/>
                    </c:url>
                    <a class="page-link ${userPage.last ? 'disabled' : ''}"
                       href="${nextPageUrl}" aria-label="Next page">›</a>
                    <c:url var="lastPageUrl" value="/admin/users">
                        <c:param name="keyword" value="${keyword}"/>
                        <c:param name="roleId" value="${roleId}"/>
                        <c:param name="active" value="${active}"/>
                        <c:param name="size" value="${userPage.size}"/>
                        <c:param name="page" value="${userPage.totalPages}"/>
                    </c:url>
                    <a class="page-link ${userPage.last ? 'disabled' : ''}"
                       href="${lastPageUrl}" aria-label="Last page">»</a>
                </nav>
            </c:if>
        </div>
    </section>
</div>
</body>
</html>
