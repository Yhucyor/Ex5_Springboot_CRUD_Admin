package thuc.ute.admin_crud.entity;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "categories")
public class Category implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "CategoryId")
    private Integer categoryId;

    @NotEmpty(message = "Tên danh mục không được phép rỗng")
    @Column(
            name = "CategoryName",
            columnDefinition = "nvarchar(50) not null"
    )
    private String categoryName;

    @Column(
            name = "Images",
            columnDefinition = "nvarchar(500) null"
    )
    private String images;

    @Column(name = "Status")
    private Integer status;
}