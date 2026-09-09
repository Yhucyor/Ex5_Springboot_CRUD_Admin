package thuc.ute.admin_crud.controller.admin;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import thuc.ute.admin_crud.entity.Category;
import thuc.ute.admin_crud.services.ICategoryService;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.IntStream;

@Controller
@RequestMapping("/admin/categories")
public class CategoryController {

    private static final Path UPLOAD_DIRECTORY =
            Path.of("uploads", "categories").toAbsolutePath().normalize();

    private final ICategoryService categoryService;

    public CategoryController(ICategoryService categoryService) {
        this.categoryService = categoryService;
    }

    // =========================
    // LIST + SEARCH
    // =========================
    @GetMapping
    public String list(
            Model model,
            @RequestParam(
                    name = "keyword",
                    required = false
            ) String keyword,
            @RequestParam(name = "page", required = false)
            Optional<Integer> page,
            @RequestParam(name = "size", required = false)
            Optional<Integer> size) {

        int currentPage = Math.max(1, page.orElse(1));
        int pageSize = sanitizePageSize(size.orElse(5));

        Pageable pageable = PageRequest.of(
                currentPage - 1,
                pageSize,
                Sort.by("categoryName").ascending()
        );

        Page<Category> resultPage;

        if (StringUtils.hasText(keyword)) {

            resultPage =
                    categoryService
                            .findByCategoryNameContaining(keyword, pageable);

            model.addAttribute("keyword", keyword);

        } else {

            resultPage = categoryService.findAll(pageable);
        }

        int totalPages = resultPage.getTotalPages();
        if (totalPages > 0) {
            int start = Math.max(1, currentPage - 2);
            int end = Math.min(currentPage + 2, totalPages);

            List<Integer> pageNumbers = IntStream
                    .rangeClosed(start, end)
                    .boxed()
                    .toList();

            model.addAttribute("pageNumbers", pageNumbers);
        }

        model.addAttribute("categoryPage", resultPage);

        return "admin/category/list";
    }


    // =========================
    // SHOW ADD FORM
    // =========================
    @GetMapping("/add")
    public String addForm(Model model) {

        model.addAttribute(
                "category",
                new Category()
        );

        return "admin/category/add";
    }


    // =========================
    // SAVE NEW CATEGORY
    // =========================
    @PostMapping("/add")
    public String add(@ModelAttribute Category category,
                      @RequestParam("imageFile") MultipartFile imageFile)
            throws IOException {

        category.setImages(saveImage(imageFile));

        categoryService.save(category);

        return "redirect:/admin/categories";
    }


    // =========================
    // SHOW EDIT FORM
    // =========================
    @GetMapping("/edit/{id}")
    public String editForm(
            @PathVariable Integer id,
            Model model) {

        Optional<Category> category =
                categoryService.findById(id);

        if (category.isEmpty()) {
            return "redirect:/admin/categories";
        }

        model.addAttribute(
                "category",
                category.get()
        );

        return "admin/category/edit";
    }


    // =========================
    // UPDATE CATEGORY
    // =========================
    @PostMapping("/edit")
    public String edit(@ModelAttribute Category category,
                       @RequestParam("imageFile") MultipartFile imageFile)
            throws IOException {

        Optional<Category> existingCategory =
                categoryService.findById(category.getCategoryId());

        if (existingCategory.isEmpty()) {
            return "redirect:/admin/categories";
        }

        Category categoryToUpdate = existingCategory.get();
        categoryToUpdate.setCategoryName(category.getCategoryName());
        categoryToUpdate.setStatus(category.getStatus());

        String imagePath = saveImage(imageFile);
        if (imagePath != null) {
            categoryToUpdate.setImages(imagePath);
        }

        categoryService.save(categoryToUpdate);

        return "redirect:/admin/categories";
    }


    // =========================
    // DELETE CATEGORY
    // =========================
    @GetMapping("/delete/{id}")
    public String delete(
            @PathVariable Integer id) {

        categoryService.deleteById(id);

        return "redirect:/admin/categories";
    }

    private String saveImage(MultipartFile imageFile) throws IOException {
        if (imageFile.isEmpty()) {
            return null;
        }

        String contentType = imageFile.getContentType();
        if (contentType == null || !contentType.startsWith("image/")) {
            throw new IllegalArgumentException("Chỉ cho phép tải lên file ảnh.");
        }

        String originalFilename = StringUtils.cleanPath(
                imageFile.getOriginalFilename() == null
                        ? "image"
                        : imageFile.getOriginalFilename()
        );

        if (originalFilename.contains("..")) {
            throw new IllegalArgumentException("Tên file không hợp lệ.");
        }

        Files.createDirectories(UPLOAD_DIRECTORY);

        String filename = UUID.randomUUID() + "_" + originalFilename;
        Path destination = UPLOAD_DIRECTORY.resolve(filename).normalize();
        Files.copy(imageFile.getInputStream(), destination,
                StandardCopyOption.REPLACE_EXISTING);

        return "/uploads/categories/" + filename;
    }

    private int sanitizePageSize(int requestedSize) {
        return List.of(3, 5, 10, 15, 20).contains(requestedSize)
                ? requestedSize
                : 5;
    }
}
