<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Edit Category</title>
</head>
<body>
<div class="page-container">
    <div class="page-heading">
        <div>
            <h1 class="page-title">Edit Category</h1>
            <p class="page-subtitle">Update category information, image, and status</p>
        </div>
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/categories">
            <span aria-hidden="true">←</span> Back to List
        </a>
    </div>

    <section class="card form-card form-card-wide">
        <form method="post" action="${pageContext.request.contextPath}/admin/categories/edit"
              enctype="multipart/form-data">
            <input type="hidden" name="categoryId" value="${category.categoryId}">
            <div class="detail-form">
                <div class="detail-row">
                    <div>
                        <label class="form-label" for="categoryIdView">Category ID</label>
                    </div>
                    <div>
                        <input class="form-control" id="categoryIdView" value="${category.categoryId}" disabled>
                        <p class="form-hint">This ID cannot be changed.</p>
                    </div>
                </div>
                <div class="detail-row">
                    <label class="form-label" for="categoryName">Category Name <span class="required">*</span></label>
                    <input class="form-control" id="categoryName" type="text" name="categoryName"
                           value="${category.categoryName}" required>
                </div>
                <div class="detail-row">
                    <span class="form-label">Current Image</span>
                    <div class="preview-box category-preview-box">
                        <c:choose>
                            <c:when test="${not empty category.images}">
                                <img class="image-preview" data-image-preview
                                     src="${pageContext.request.contextPath}${category.images}"
                                     alt="${category.categoryName}">
                            </c:when>
                            <c:otherwise>
                                <span class="placeholder-icon" data-preview-fallback aria-hidden="true">▧</span>
                                <img class="image-preview" data-image-preview alt="Image preview" hidden>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="detail-row">
                    <label class="form-label" for="imageFile">Change Image</label>
                    <div>
                        <label class="upload-zone" data-upload-zone>
                            <span class="upload-symbol" aria-hidden="true">⇧</span>
                            <span class="upload-copy">
                                <strong data-file-label>Click to upload a new image</strong>
                                <small>PNG, JPG, JPEG, WEBP (Max 2MB)</small>
                            </span>
                            <span class="btn btn-secondary upload-button">Choose File</span>
                            <input class="visually-hidden" id="imageFile" type="file" name="imageFile"
                                   accept="image/png,image/jpeg,image/webp" data-file-input data-max-size="2097152">
                        </label>
                        <p class="form-hint">Leave empty to keep the current image.</p>
                    </div>
                </div>
                <div class="detail-row">
                    <label class="form-label" for="status">Status</label>
                    <select class="form-select" id="status" name="status">
                        <option value="1" ${category.status == 1 ? 'selected' : ''}>Active</option>
                        <option value="0" ${category.status == 0 ? 'selected' : ''}>Inactive</option>
                    </select>
                </div>
            </div>
            <div class="form-actions">
                <button class="btn btn-primary" type="submit">Update Category</button>
                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/categories">Cancel</a>
            </div>
        </form>
    </section>
</div>
</body>
</html>
