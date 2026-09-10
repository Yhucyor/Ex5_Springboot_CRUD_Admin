<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Add User</title>
</head>
<body>
<div class="page-container">
    <div class="page-heading">
        <div>
            <h1 class="page-title">Add User</h1>
            <p class="page-subtitle">Create a new user account and assign role information</p>
        </div>
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/users">
            <span aria-hidden="true">←</span> Back to List
        </a>
    </div>

    <section class="card form-card form-card-wide">
        <form method="post" action="${pageContext.request.contextPath}/admin/users/add"
              enctype="multipart/form-data">
            <div class="form-grid user-form-grid">
                <div class="form-group">
                    <label class="form-label" for="username">Username</label>
                    <div class="input-shell"><span class="field-icon" aria-hidden="true">♙</span>
                        <input class="form-control" id="username" type="text" name="username"
                               placeholder="Enter username" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="form-label" for="fullname">Fullname</label>
                    <div class="input-shell"><span class="field-icon" aria-hidden="true">♙</span>
                        <input class="form-control" id="fullname" type="text" name="fullname"
                               placeholder="Enter full name" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="form-label" for="email">Email</label>
                    <div class="input-shell"><span class="field-icon" aria-hidden="true">✉</span>
                        <input class="form-control" id="email" type="email" name="email"
                               placeholder="Enter email address" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="form-label" for="password">Password</label>
                    <div class="input-shell"><span class="field-icon" aria-hidden="true">▣</span>
                        <input class="form-control field-with-trailing" id="password" type="password" name="password"
                               placeholder="Enter password" required>
                        <button class="field-action" type="button" data-password-toggle aria-label="Show password">◉</button>
                    </div>
                </div>
                <div class="form-group">
                    <label class="form-label" for="phone">Phone</label>
                    <div class="input-shell"><span class="field-icon" aria-hidden="true">⌕</span>
                        <input class="form-control" id="phone" type="tel" name="phone"
                               placeholder="Enter phone number">
                    </div>
                </div>
                <div class="form-group">
                    <label class="form-label" for="roleId">Role ID</label>
                    <select class="form-select" id="roleId" name="roleId" required>
                        <option value="" disabled>Select role</option>
                        <option value="1">ADMIN</option>
                        <option value="2" selected>USER</option>
                        <option value="3">STUDENT</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label" for="createdDate">Created Date</label>
                    <input class="form-control" id="createdDate" type="date" name="createdDate">
                </div>
                <div class="form-group">
                    <span class="form-label">Active</span>
                    <label class="switch-control">
                        <input type="hidden" name="_active" value="on">
                        <input id="active" type="checkbox" name="active" value="true" checked>
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
                                <strong data-file-label>Click to upload avatar</strong>
                                <small>PNG, JPG, JPEG, WEBP (Max 2MB)</small>
                            </span>
                            <input class="visually-hidden" id="avatarFile" type="file" name="avatarFile"
                                   accept="image/png,image/jpeg,image/webp" data-file-input data-max-size="2097152">
                        </label>
                        <div>
                            <span class="form-label preview-label">Preview</span>
                            <div class="preview-box avatar-preview-box">
                                <span class="avatar-fallback" data-preview-fallback aria-hidden="true"></span>
                                <img class="image-preview avatar-preview" data-image-preview alt="Avatar preview" hidden>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="form-label" for="otp">OTP</label>
                    <input class="form-control" id="otp" type="text" name="otp" maxlength="10"
                           placeholder="Enter OTP code">
                </div>
                <div class="form-group otp-expiry-group">
                    <label class="form-label" for="otpExpiry">OTP Expiry</label>
                    <input class="form-control" id="otpExpiry" type="datetime-local" name="otpExpiry" step="1">
                </div>
            </div>
            <div class="form-actions">
                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/users">Cancel</a>
                <button class="btn btn-primary" type="submit">Save User</button>
            </div>
        </form>
    </section>
</div>
</body>
</html>
