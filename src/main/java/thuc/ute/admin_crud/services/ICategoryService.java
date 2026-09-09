package thuc.ute.admin_crud.services;

import thuc.ute.admin_crud.entity.Category;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface ICategoryService {

    // Thêm mới hoặc cập nhật
    Category save(Category category);

    // Lấy tất cả category
    List<Category> findAll();

    // Tìm category theo id
    Optional<Category> findById(Integer id);

    // Xóa category theo id
    void deleteById(Integer id);

    // Đếm số lượng category
    long count();

    // Tìm kiếm theo tên
    List<Category> findByCategoryNameContaining(String keyword);

    Page<Category> findAll(Pageable pageable);

    Page<Category> findByCategoryNameContaining(
            String keyword,
            Pageable pageable
    );
}