package thuc.ute.admin_crud.configs;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.nio.file.Path;

@Configuration
public class UploadResourceConfig implements WebMvcConfigurer {

    private static final Path CATEGORY_UPLOAD_DIRECTORY =
            Path.of("uploads", "categories").toAbsolutePath().normalize();
    private static final Path USER_UPLOAD_DIRECTORY =
            Path.of("uploads", "users").toAbsolutePath().normalize();

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/uploads/categories/**")
                .addResourceLocations(CATEGORY_UPLOAD_DIRECTORY.toUri().toString());
        registry.addResourceHandler("/uploads/users/**")
                .addResourceLocations(USER_UPLOAD_DIRECTORY.toUri().toString());
    }
}
