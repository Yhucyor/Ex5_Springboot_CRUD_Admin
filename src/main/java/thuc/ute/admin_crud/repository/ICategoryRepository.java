package thuc.ute.admin_crud.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import thuc.ute.admin_crud.entity.Category;

@Repository
public interface ICategoryRepository
        extends JpaRepository<Category, Integer> {

    List<Category> findByCategoryNameContaining(String keyword);
    Page<Category> findByCategoryNameContaining(
            String keyword,
            Pageable pageable
    );


}