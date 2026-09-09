package thuc.ute.admin_crud.services.impl;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import thuc.ute.admin_crud.entity.Category;
import thuc.ute.admin_crud.repository.ICategoryRepository;
import thuc.ute.admin_crud.services.ICategoryService;

import java.util.List;
import java.util.Optional;

@Service
public class CategoryServiceImpl implements ICategoryService {

    private final ICategoryRepository categoryRepository;

    public CategoryServiceImpl(
            ICategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @Override
    public Category save(Category category) {
        return categoryRepository.save(category);
    }

    @Override
    public List<Category> findAll() {
        return categoryRepository.findAll();
    }

    @Override
    public Optional<Category> findById(Integer id) {
        return categoryRepository.findById(id);
    }

    @Override
    public void deleteById(Integer id) {
        categoryRepository.deleteById(id);
    }

    @Override
    public long count() {
        return categoryRepository.count();
    }

    @Override
    public List<Category> findByCategoryNameContaining(
            String keyword) {

        return categoryRepository
                .findByCategoryNameContaining(keyword);
    }

    @Override
    public Page<Category> findAll(Pageable pageable) {
        return categoryRepository.findAll(pageable);
    }

    @Override
    public Page<Category> findByCategoryNameContaining(
            String keyword,
            Pageable pageable) {

        return categoryRepository
                .findByCategoryNameContaining(keyword, pageable);
    }


}