<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Add Category</title>
</head>
<body>
<div class="page-container">
    <div class="page-heading">
        <div>
            <h1 class="page-title">Add Category</h1>
            <p class="page-subtitle">Create a new category for your management system</p>
        </div>
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/categories">
            <span aria-hidden="true">←</span> Back to List
        </a>
    </div>

    <section class="card form-card form-card-wide">
        <form method="post" action="${pageContext.request.contextPath}/admin/categories/add"
              enctype="multipart/form-data">
            <div class="form-grid">
                <div class="form-group full-width">
                    <label class="form-label" for="categoryName">Category Name</label>
                    <input class="form-control" id="categoryName" type="text" name="categoryName"
                           placeholder="Enter category name" required>
                </div>
                <div class="form-group">
                    <label class="form-label" for="imageFile">Category Image</label>
                    <label class="upload-zone upload-zone-stacked" data-upload-zone>
                        <span class="upload-symbol" aria-hidden="true">⇧</span>
                        <span class="upload-copy">
                            <strong data-file-label>Click to upload category image</strong>
                            <small>PNG, JPG, JPEG, WEBP (Max 2MB)</small>
                        </span>
                        <input class="visually-hidden" id="imageFile" type="file" name="imageFile"
                               accept="image/png,image/jpeg,image/webp" data-file-input data-max-size="2097152">
                    </label>
                </div>
                <div class="form-group">
                    <label class="form-label" for="status">Status</label>
                    <select class="form-select" id="status" name="status">
                        <option value="1">Active</option>
                        <option value="0">Inactive</option>
                    </select>
                </div>
            </div>
            <div class="form-actions">
                <button class="btn btn-primary" type="submit">Save Category</button>
                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/categories">Cancel</a>
            </div>
        </form>
    </section>
</div>
</body>
</html>
