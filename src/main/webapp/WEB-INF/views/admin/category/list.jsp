<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Category Management</title>
</head>
<body>
<div class="page-container">
    <div class="page-heading">
        <div>
            <h1 class="page-title">Category Management</h1>
            <p class="page-subtitle">Manage categories, images, status, and pagination</p>
        </div>
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/categories/add">
            <span class="button-icon add-icon" aria-hidden="true">+</span> Add Category
        </a>
    </div>

    <section class="card">
        <form class="toolbar" method="get" action="${pageContext.request.contextPath}/admin/categories">
            <div class="search-group">
                <span class="search-icon" aria-hidden="true"></span>
                <input class="form-control" type="text" name="keyword"
                       value="${keyword}" placeholder="Nh&#7853;p tên category">
            </div>
            <button class="btn btn-primary" type="submit">Search</button>
            <div class="page-size">
                <label for="size">Page size:</label>
                <select class="form-select" name="size" id="size" onchange="this.form.submit()">
                    <option value="3" ${categoryPage.size == 3 ? 'selected' : ''}>3</option>
                    <option value="5" ${categoryPage.size == 5 ? 'selected' : ''}>5</option>
                    <option value="10" ${categoryPage.size == 10 ? 'selected' : ''}>10</option>
                    <option value="15" ${categoryPage.size == 15 ? 'selected' : ''}>15</option>
                    <option value="20" ${categoryPage.size == 20 ? 'selected' : ''}>20</option>
                </select>
            </div>
            <a class="reset-link" href="${pageContext.request.contextPath}/admin/categories">Reset</a>
        </form>

        <c:choose>
            <c:when test="${categoryPage.hasContent()}">
                <div class="table-responsive">
                    <table class="data-table category-table">
                        <thead>
                        <tr>
                            <th>STT</th>
                            <th>Image</th>
                            <th>Category Name</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${categoryPage.content}" var="category" varStatus="stt">
                            <tr>
                                <td>${(categoryPage.number * categoryPage.size) + stt.index + 1}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty category.images}">
                                            <img class="table-image"
                                                 src="${pageContext.request.contextPath}${category.images}"
                                                 alt="${category.categoryName}">
                                        </c:when>
                                        <c:otherwise><span class="image-placeholder" aria-label="No image"><span class="placeholder-icon" aria-hidden="true">▧</span></span></c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${category.categoryName}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${category.status == 1}">
                                            <span class="badge badge-success status-badge"><span class="status-dot"></span>Active</span>
                                        </c:when>
                                        <c:otherwise><span class="badge badge-danger status-badge"><span class="status-dot"></span>Inactive</span></c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <div class="actions">
                                        <a class="btn btn-sm btn-outline-primary"
                                           href="${pageContext.request.contextPath}/admin/categories/edit/${category.categoryId}">
                                            <span aria-hidden="true">&#9998;</span> Edit
                                        </a>
                                        <a class="btn btn-sm btn-outline-danger"
                                           href="${pageContext.request.contextPath}/admin/categories/delete/${category.categoryId}"
                                           onclick="return confirm('B&#7841;n có ch&#7855;c mu&#7889;n xóa category này không?');">
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
            <c:otherwise><div class="empty-state">Không có category nào phù h&#7907;p.</div></c:otherwise>
        </c:choose>

        <div class="table-footer">
            <c:choose>
                <c:when test="${categoryPage.hasContent()}">
                    <p class="entries-info">
                        Showing ${categoryPage.number * categoryPage.size + 1}
                        to ${categoryPage.number * categoryPage.size + categoryPage.numberOfElements}
                        of ${categoryPage.totalElements} entries
                    </p>
                </c:when>
                <c:otherwise><p class="entries-info">Showing 0 entries</p></c:otherwise>
            </c:choose>
            <c:if test="${categoryPage.totalPages > 1}">
                <nav class="pagination" aria-label="Category pagination">
                    <c:url var="firstPageUrl" value="/admin/categories">
                        <c:param name="keyword" value="${keyword}"/>
                        <c:param name="size" value="${categoryPage.size}"/>
                        <c:param name="page" value="1"/>
                    </c:url>
                    <c:url var="previousPageUrl" value="/admin/categories">
                        <c:param name="keyword" value="${keyword}"/>
                        <c:param name="size" value="${categoryPage.size}"/>
                        <c:param name="page" value="${categoryPage.number}"/>
                    </c:url>
                    <a class="page-link ${categoryPage.first ? 'disabled' : ''}"
                       href="${firstPageUrl}" aria-label="First page">«</a>
                    <a class="page-link ${categoryPage.first ? 'disabled' : ''}"
                       href="${previousPageUrl}" aria-label="Previous page">‹</a>
                    <c:forEach items="${pageNumbers}" var="pageNumber">
                        <c:url var="numberedPageUrl" value="/admin/categories">
                            <c:param name="keyword" value="${keyword}"/>
                            <c:param name="size" value="${categoryPage.size}"/>
                            <c:param name="page" value="${pageNumber}"/>
                        </c:url>
                        <a class="page-link ${pageNumber == categoryPage.number + 1 ? 'active' : ''}"
                           href="${numberedPageUrl}">${pageNumber}</a>
                    </c:forEach>
                    <c:url var="nextPageUrl" value="/admin/categories">
                        <c:param name="keyword" value="${keyword}"/>
                        <c:param name="size" value="${categoryPage.size}"/>
                        <c:param name="page" value="${categoryPage.number + 2}"/>
                    </c:url>
                    <a class="page-link ${categoryPage.last ? 'disabled' : ''}"
                       href="${nextPageUrl}" aria-label="Next page">›</a>
                    <c:url var="lastPageUrl" value="/admin/categories">
                        <c:param name="keyword" value="${keyword}"/>
                        <c:param name="size" value="${categoryPage.size}"/>
                        <c:param name="page" value="${categoryPage.totalPages}"/>
                    </c:url>
                    <a class="page-link ${categoryPage.last ? 'disabled' : ''}"
                       href="${lastPageUrl}" aria-label="Last page">»</a>
                </nav>
            </c:if>
        </div>
    </section>
</div>
</body>
</html>
