/*
    Database setup for Admin CRUD (Spring Boot + JSP/JSTL)
    SQL Server

    Run this script in SQL Server Management Studio before starting the app.
    The application.properties file is configured to use database: jpa_crud.
*/

USE master;
GO

IF DB_ID(N'jpa_crud') IS NULL
BEGIN
    CREATE DATABASE jpa_crud;
END;
GO

USE jpa_crud;
GO

/* Category entity: thuc.ute.admin_crud.entity.Category */
IF OBJECT_ID(N'dbo.categories', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.categories (
        CategoryId   INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        CategoryName NVARCHAR(50) NOT NULL,
        Images       NVARCHAR(500) NULL,
        Status       INT NOT NULL CONSTRAINT DF_categories_Status DEFAULT (1)
    );
END;
GO

/* User entity: thuc.ute.admin_crud.entity.User */
IF OBJECT_ID(N'dbo.Users', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Users (
        id          INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        avatar      NVARCHAR(500) NULL,
        createdDate DATE NULL,
        email       NVARCHAR(255) NOT NULL,
        fullname    NVARCHAR(255) NOT NULL,
        password    NVARCHAR(255) NOT NULL,
        phone       NVARCHAR(20) NULL,
        roleid      INT NULL,
        username    NVARCHAR(100) NULL,
        active      BIT NULL,
        otp         NVARCHAR(10) NULL,
        otpExpiry   DATETIME2 NULL
    );
END;
GO

/* Indexes support the name/user search and list sorting in the admin pages. */
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'IX_categories_CategoryName'
               AND object_id = OBJECT_ID(N'dbo.categories'))
    CREATE INDEX IX_categories_CategoryName ON dbo.categories(CategoryName);
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'IX_Users_username'
               AND object_id = OBJECT_ID(N'dbo.Users'))
    CREATE INDEX IX_Users_username ON dbo.Users(username);
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'IX_Users_roleid_active'
               AND object_id = OBJECT_ID(N'dbo.Users'))
    CREATE INDEX IX_Users_roleid_active ON dbo.Users(roleid, active);
GO

/* Sample categories. Images can be uploaded from the admin page after startup. */
IF NOT EXISTS (SELECT 1 FROM dbo.categories)
BEGIN
    INSERT INTO dbo.categories (CategoryName, Images, Status) VALUES
        (N'Phụ kiện', NULL, 1),
        (N'Bàn phím', NULL, 1),
        (N'Điện thoại', NULL, 1),
        (N'Đồng hồ thông minh', NULL, 1),
        (N'Gaming Gear', NULL, 1),
        (N'Laptop', NULL, 1),
        (N'Màn hình', NULL, 1),
        (N'Máy tính bảng', NULL, 0),
        (N'Phần mềm', NULL, 1),
        (N'Thiết bị mạng', NULL, 1),
        (N'Chuột máy tính', NULL, 1),
        (N'Ổ cứng', NULL, 0);
END;
GO

/*
    roleid convention used by the UI:
    1 = Admin, 2 = Staff, 3 = User
    Passwords below are demo values only. Change them before deploying publicly.
*/
IF NOT EXISTS (SELECT 1 FROM dbo.Users)
BEGIN
    INSERT INTO dbo.Users
        (avatar, createdDate, email, fullname, password, phone, roleid, username, active, otp, otpExpiry)
    VALUES
        (NULL, '2026-08-01', N'admin@techstore.vn', N'Quản trị viên', N'admin123', N'0901234567', 1, N'admin', 1, NULL, NULL),
        (NULL, '2026-08-05', N'lan.nguyen@techstore.vn', N'Nguyễn Thị Lan', N'user123', N'0902345678', 2, N'staff01', 1, NULL, NULL),
        (NULL, '2026-08-10', N'minh.tran@student.ute.edu.vn', N'Trần Minh Hoàng', N'user123', N'0903456789', 3, N'student01', 1, N'123456', '2026-12-31T23:59:59'),
        (NULL, '2026-08-14', N'anh.le@student.ute.edu.vn', N'Lê Ngọc Anh', N'user123', N'0904567890', 3, N'student02', 0, NULL, NULL),
        (NULL, '2026-08-18', N'hung.pham@techstore.vn', N'Phạm Văn Hùng', N'user123', N'0905678901', 2, N'staff02', 1, NULL, NULL),
        (NULL, '2026-08-22', N'thao.nguyen@gmail.com', N'Nguyễn Thảo My', N'user123', N'0906789012', 3, N'user01', 1, N'654321', '2026-12-31T23:59:59'),
        (NULL, '2026-08-25', N'nam.vo@gmail.com', N'Võ Thành Nam', N'user123', N'0907890123', 3, N'user02', 1, NULL, NULL),
        (NULL, '2026-08-28', N'mai.do@techstore.vn', N'Đỗ Thanh Mai', N'user123', N'0908901234', 2, N'staff03', 0, NULL, NULL);
END;
GO

/* Quick verification */
SELECT * FROM dbo.categories ORDER BY CategoryName;
SELECT * FROM dbo.Users ORDER BY username;
GO
