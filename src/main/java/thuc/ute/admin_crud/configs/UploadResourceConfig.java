package thuc.ute.admin_crud.configs;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.nio.file.Path;

@Configuration
public class UploadResourceConfig implements WebMvcConfigurer {

    private static final Path UPLOAD_DIRECTORY =
            Path.of("uploads", "categories").toAbsolutePath().normalize();

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/uploads/categories/**")
                .addResourceLocations(UPLOAD_DIRECTORY.toUri().toString());
    }
}
