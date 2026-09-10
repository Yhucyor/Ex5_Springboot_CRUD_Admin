<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Edit User</title>
</head>
<body>
<div class="page-container">
    <div class="page-heading">
        <div>
            <h1 class="page-title">Edit User</h1>
            <p class="page-subtitle">Update account information, role, and status</p>
        </div>
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/users">
            <span aria-hidden="true">←</span> Back to List
        </a>
    </div>

    <section class="card form-card form-card-wide">
        <form method="post" action="${pageContext.request.contextPath}/admin/users/edit"
              enctype="multipart/form-data">
            <input type="hidden" name="id" value="${user.id}">
            <div class="form-grid user-form-grid">
                <div class="form-group">
                    <label class="form-label" for="username">Username</label>
                    <div class="input-shell"><span class="field-icon" aria-hidden="true">♙</span>
                        <input class="form-control" id="username" type="text" name="username"
                               value="${user.username}" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="form-label" for="fullname">Fullname</label>
                    <div class="input-shell"><span class="field-icon" aria-hidden="true">♙</span>
                        <input class="form-control" id="fullname" type="text" name="fullname"
                               value="${user.fullname}" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="form-label" for="email">Email</label>
                    <div class="input-shell"><span class="field-icon" aria-hidden="true">✉</span>
                        <input class="form-control" id="email" type="email" name="email"
                               value="${user.email}" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="form-label" for="password">Password</label>
                    <div class="input-shell"><span class="field-icon" aria-hidden="true">▣</span>
                        <input class="form-control field-with-trailing" id="password" type="password" name="password"
                               value="${user.password}" required>
                        <button class="field-action" type="button" data-password-toggle aria-label="Show password">◉</button>
                    </div>
                </div>
                <div class="form-group">
                    <label class="form-label" for="phone">Phone</label>
                    <div class="input-shell"><span class="field-icon" aria-hidden="true">⌕</span>
                        <input class="form-control" id="phone" type="tel" name="phone" value="${user.phone}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="form-label" for="roleId">Role ID</label>
                    <select class="form-select" id="roleId" name="roleId" required>
                        <option value="1" ${user.roleId == 1 ? 'selected' : ''}>ADMIN</option>
                        <option value="2" ${user.roleId == 2 ? 'selected' : ''}>USER</option>
                        <option value="3" ${user.roleId == 3 ? 'selected' : ''}>STUDENT</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label" for="createdDate">Created Date</label>
                    <input class="form-control" id="createdDate" type="date" name="createdDate"
                           value="${user.createdDate}">
                </div>
                <div class="form-group">
                    <span class="form-label">Active</span>
                    <label class="switch-control">
                        <input type="hidden" name="_active" value="on">
                        <input id="active" type="checkbox" name="active" value="true" ${user.active ? 'checked' : ''}>
                        <span class="switch-track" aria-hidden="true"></span>
                        <span>Active</span>
                    </label>
                </div>
                <div class="form-group avatar-upload-group">
                    <label class="form-label" for="avatarFile">Avatar</label>
                    <div class="avatar-upload-layout">
                        <label class="upload-zone upload-zone-stacked" data-upload-zone>
                            <span class="upload-symbol" aria-hidden="true">⇧</span>
                            <span class="upload-copy">
                                <strong data-file-label>Click to change avatar</strong>
                                <small>PNG, JPG, JPEG, WEBP (Max 2MB)</small>
                            </span>
                            <input class="visually-hidden" id="avatarFile" type="file" name="avatarFile"
                                   accept="image/png,image/jpeg,image/webp" data-file-input data-max-size="2097152">
                        </label>
                        <div>
                            <span class="form-label preview-label">Preview</span>
                            <div class="preview-box avatar-preview-box">
                                <c:choose>
                                    <c:when test="${not empty user.avatar}">
                                        <img class="image-preview avatar-preview" data-image-preview
                                             src="${pageContext.request.contextPath}${user.avatar}" alt="${user.username}">
                                    </c:when>
                                    <c:otherwise>
                                        <span class="avatar-fallback" data-preview-fallback aria-hidden="true"></span>
                                        <img class="image-preview avatar-preview" data-image-preview alt="Avatar preview" hidden>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                    <p class="form-hint">Leave empty to keep the current avatar.</p>
                </div>
                <div class="form-group">
                    <label class="form-label" for="otp">OTP</label>
                    <input class="form-control" id="otp" type="text" name="otp" maxlength="10"
                           value="${user.otp}" placeholder="Enter OTP code">
                </div>
                <div class="form-group otp-expiry-group">
                    <label class="form-label" for="otpExpiry">OTP Expiry</label>
                    <input class="form-control" id="otpExpiry" type="datetime-local" name="otpExpiry"
                           value="${user.otpExpiry}" step="1">
                </div>
            </div>
            <div class="form-actions">
                <button class="btn btn-primary" type="submit">Update User</button>
                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/users">Cancel</a>
            </div>
        </form>
    </section>
</div>
</body>
</html>
