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

import thuc.ute.admin_crud.entity.User;
import thuc.ute.admin_crud.services.IUserService;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.IntStream;

@Controller
@RequestMapping("/admin/users")
public class UserController {

    private static final Path AVATAR_UPLOAD_DIRECTORY =
            Path.of("uploads", "users").toAbsolutePath().normalize();

    private final IUserService userService;

    public UserController(IUserService userService) {
        this.userService = userService;
    }

    // =========================
    // LIST + SEARCH + PAGINATION
    // =========================
    @GetMapping
    public String list(
            Model model,

            @RequestParam(
                    name = "keyword",
                    required = false
            ) String keyword,

            @RequestParam(
                    name = "page"
            ) Optional<Integer> page,

            @RequestParam(
                    name = "size"
            ) Optional<Integer> size,

            @RequestParam(name = "roleId", required = false)
            Optional<Integer> roleId,

            @RequestParam(name = "active", required = false)
            Optional<Boolean> active) {

        int currentPage = Math.max(1, page.orElse(1));
        int pageSize = sanitizePageSize(size.orElse(5));
        String searchKeyword = keyword == null ? "" : keyword.trim();
        Integer selectedRoleId = roleId.filter(value -> value >= 1 && value <= 3).orElse(null);
        Boolean selectedActive = active.orElse(null);

        Pageable pageable = PageRequest.of(
                currentPage - 1,
                pageSize,
                Sort.by("username").ascending()
        );

        Page<User> resultPage = userService.search(
                searchKeyword,
                selectedRoleId,
                selectedActive,
                pageable
        );

        int totalPages =
                resultPage.getTotalPages();

        if (totalPages > 0) {

            int start =
                    Math.max(
                            1,
                            currentPage - 2
                    );

            int end =
                    Math.min(
                            currentPage + 2,
                            totalPages
                    );

            List<Integer> pageNumbers =
                    IntStream
                            .rangeClosed(start, end)
                            .boxed()
                            .toList();

            model.addAttribute(
                    "pageNumbers",
                    pageNumbers
            );
        }

        model.addAttribute(
                "userPage",
                resultPage
        );
        model.addAttribute("keyword", searchKeyword);
        model.addAttribute("roleId", selectedRoleId);
        model.addAttribute("active", selectedActive);

        return "admin/user/list";
    }


    // =========================
    // SHOW ADD FORM
    // =========================
    @GetMapping("/add")
    public String addForm(Model model) {

        User user = new User();

        user.setActive(true);
        user.setRoleId(2);

        model.addAttribute(
                "user",
                user
        );

        return "admin/user/add";
    }


    // =========================
    // SAVE NEW USER
    // =========================
    @PostMapping("/add")
    public String add(
            @ModelAttribute User user,
            @RequestParam("avatarFile") MultipartFile avatarFile)
            throws IOException {

        if (user.getCreatedDate() == null) {
            user.setCreatedDate(
                    LocalDate.now()
            );
        }

        user.setAvatar(saveAvatar(avatarFile));

        userService.save(user);

        return "redirect:/admin/users";
    }


    // =========================
    // SHOW EDIT FORM
    // =========================
    @GetMapping("/edit/{id}")
    public String editForm(
            @PathVariable Integer id,
            Model model) {

        Optional<User> user =
                userService.findById(id);

        if (user.isEmpty()) {
            return "redirect:/admin/users";
        }

        model.addAttribute(
                "user",
                user.get()
        );

        return "admin/user/edit";
    }


    // =========================
    // UPDATE USER
    // =========================
    @PostMapping("/edit")
    public String edit(
            @ModelAttribute User user,
            @RequestParam("avatarFile") MultipartFile avatarFile)
            throws IOException {

        Optional<User> oldUserOpt =
                userService.findById(
                        user.getId()
                );

        if (oldUserOpt.isEmpty()) {
            return "redirect:/admin/users";
        }

        User oldUser =
                oldUserOpt.get();

        // Giữ lại những field chưa chỉnh trong form
        if (user.getCreatedDate() == null) {
            user.setCreatedDate(
                    oldUser.getCreatedDate()
            );
        }

        if (user.getOtp() == null) {
            user.setOtp(
                    oldUser.getOtp()
            );
        }

        if (user.getOtpExpiry() == null) {
            user.setOtpExpiry(
                    oldUser.getOtpExpiry()
            );
        }

        String avatarPath = saveAvatar(avatarFile);
        user.setAvatar(avatarPath != null ? avatarPath : oldUser.getAvatar());

        userService.save(user);

        return "redirect:/admin/users";
    }


    // =========================
    // DELETE USER
    // =========================
    @GetMapping("/delete/{id}")
    public String delete(
            @PathVariable Integer id) {

        userService.deleteById(id);

        return "redirect:/admin/users";
    }

    private String saveAvatar(MultipartFile avatarFile) throws IOException {
        if (avatarFile.isEmpty()) {
            return null;
        }

        String contentType = avatarFile.getContentType();
        if (contentType == null || !contentType.startsWith("image/")) {
            throw new IllegalArgumentException("Chỉ cho phép tải lên file ảnh.");
        }

        String originalFilename = StringUtils.cleanPath(
                avatarFile.getOriginalFilename() == null
                        ? "avatar"
                        : avatarFile.getOriginalFilename()
        );
        if (originalFilename.contains("..")) {
            throw new IllegalArgumentException("Tên file không hợp lệ.");
        }

        Files.createDirectories(AVATAR_UPLOAD_DIRECTORY);
        String filename = UUID.randomUUID() + "_" + originalFilename;
        Path destination = AVATAR_UPLOAD_DIRECTORY.resolve(filename).normalize();
        Files.copy(avatarFile.getInputStream(), destination,
                StandardCopyOption.REPLACE_EXISTING);

        return "/uploads/users/" + filename;
    }

    private int sanitizePageSize(int requestedSize) {
        return List.of(3, 5, 10, 15, 20).contains(requestedSize)
                ? requestedSize
                : 5;
    }
}
