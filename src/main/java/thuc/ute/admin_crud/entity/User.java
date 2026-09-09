package thuc.ute.admin_crud.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "Users")
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(
            name = "avatar",
            columnDefinition = "nvarchar(500)"
    )
    private String avatar;

    @Column(name = "createdDate")
    private LocalDate createdDate;

    @NotEmpty(message = "Email không được phép rỗng")
    @Email(message = "Email không đúng định dạng")
    @Column(
            name = "email",
            columnDefinition = "nvarchar(255)",
            nullable = false
    )
    private String email;

    @NotEmpty(message = "Họ tên không được phép rỗng")
    @Column(
            name = "fullname",
            columnDefinition = "nvarchar(255)",
            nullable = false
    )
    private String fullname;

    @NotEmpty(message = "Password không được phép rỗng")
    @Column(
            name = "password",
            columnDefinition = "nvarchar(255)",
            nullable = false
    )
    private String password;

    @Column(
            name = "phone",
            columnDefinition = "nvarchar(20)"
    )
    private String phone;

    @Column(name = "roleid")
    private Integer roleId;

    @Column(
            name = "username",
            columnDefinition = "nvarchar(100)"
    )
    private String username;

    @Column(name = "active")
    private Boolean active;

    @Column(
            name = "otp",
            columnDefinition = "nvarchar(10)"
    )
    private String otp;

    @Column(name = "otpExpiry")
    private LocalDateTime otpExpiry;
}